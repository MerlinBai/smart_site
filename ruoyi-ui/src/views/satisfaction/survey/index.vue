<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="调查范围" prop="surveyScope">
        <el-select v-model="queryParams.surveyScope" placeholder="请选择调查范围" clearable>
          <el-option
            v-for="dict in dict.type.survey"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="调查等级" prop="surveyResult">
        <el-select v-model="queryParams.surveyResult" placeholder="请选择调查等级" clearable>
          <el-option
            v-for="dict in dict.type.grade"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['satisfaction:survey:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['satisfaction:survey:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['satisfaction:survey:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['satisfaction:survey:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="surveyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="主键id" align="center" prop="surveyId" /> -->
      <el-table-column label="调查范围" align="center" prop="surveyScope">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.survey" :value="scope.row.surveyScope"/>
        </template>
      </el-table-column>
      <el-table-column label="调查对象" align="center" prop="surveyObject" />
      <el-table-column label="调查人" align="center" prop="surveyBy" />
      <el-table-column label="调查等级" align="center" prop="surveyResult">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.grade" :value="scope.row.surveyResult"/>
        </template>
      </el-table-column>
      <el-table-column label="调查时间" align="center" prop="surveyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.surveyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['satisfaction:survey:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['satisfaction:survey:remove']"
          >删除</el-button>
        </template>
      </el-table-column> -->
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改满意度检查对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="调查范围" prop="surveyScope">
          <el-select v-model="form.surveyScope" placeholder="请选择调查范围">
            <el-option
              v-for="dict in dict.type.survey"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="调查对象" prop="surveyObject">
          <el-input v-model="form.surveyObject" placeholder="请输入调查对象" />
        </el-form-item>
        <el-form-item label="调查人" prop="surveyBy">
          <el-input v-model="form.surveyBy" placeholder="请输入调查人" />
        </el-form-item>
        <el-form-item label="调查等级" prop="surveyResult">
          <el-select v-model="form.surveyResult" placeholder="请选择调查等级">
            <el-option
              v-for="dict in dict.type.grade"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="调查时间" prop="surveyTime">
          <el-date-picker clearable
            v-model="form.surveyTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择调查时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSurvey, getSurvey, delSurvey, addSurvey, updateSurvey } from "@/api/satisfaction/survey";

export default {
  name: "Survey",
  dicts: ['survey', 'grade'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 满意度检查表格数据
      surveyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        surveyScope: null,
        surveyResult: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        surveyScope: [
          { required: true, message: "调查范围不能为空", trigger: "change" }
        ],
        surveyObject: [
          { required: true, message: "调查对象不能为空", trigger: "blur" }
        ],
        surveyBy: [
          { required: true, message: "调查人不能为空", trigger: "blur" }
        ],
        surveyResult: [
          { required: true, message: "调查等级不能为空", trigger: "change" }
        ],
        surveyTime: [
          { required: true, message: "调查时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询满意度检查列表 */
    getList() {
      this.loading = true;
      listSurvey(this.queryParams).then(response => {
        this.surveyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        surveyId: null,
        surveyScope: null,
        surveyObject: null,
        surveyBy: null,
        surveyResult: null,
        surveyTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.surveyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加满意度检查";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const surveyId = row.surveyId || this.ids
      getSurvey(surveyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改满意度检查";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.surveyId != null) {
            updateSurvey(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSurvey(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const surveyIds = row.surveyId || this.ids;
      this.$modal.confirm('是否确认删除满意度检查编号为"' + surveyIds + '"的数据项？').then(function() {
        return delSurvey(surveyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('satisfaction/survey/export', {
        ...this.queryParams
      }, `survey_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
