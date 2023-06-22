<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="项目名称" prop="itemName">
        <el-input
          v-model="queryParams.itemName"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- <el-form-item label="招聘公司" prop="requireCorporation">
        <el-input
          v-model="queryParams.requireCorporation"
          placeholder="请输入招聘公司"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="项目所在地" prop="itemLocation" label-width="85px">
        <el-input
          v-model="queryParams.itemLocation"
          placeholder="请输入项目所在地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工种需求" prop="workerRequire">
        <el-input
          v-model="queryParams.workerRequire"
          placeholder="请输入工种需求"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目招聘状态" prop="itemStatus" label-width="100px">
        <el-select v-model="queryParams.itemStatus" placeholder="请选择项目招聘状态" clearable>
          <el-option
            v-for="dict in dict.type.recruitment"
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
          v-hasPermi="['recruitment:recruitment:add']"
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
          v-hasPermi="['recruitment:recruitment:edit']"
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
          v-hasPermi="['recruitment:recruitment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['recruitment:recruitment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recruitmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="项目id" align="center" prop="itemId" /> -->
      <el-table-column label="项目名称" align="center" prop="itemName" />
      <el-table-column label="招聘公司" align="center" prop="requireCorporation" />
      <el-table-column label="项目内容" align="center" prop="itemContent" />
      <el-table-column label="项目所在地" align="center" prop="itemLocation" />
      <el-table-column label="工种需求" align="center" prop="workerRequire" />
      <el-table-column label="招聘人数" align="center" prop="requireNum" />
      <el-table-column label="预计完成时间" align="center" prop="itemFinishTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.itemFinishTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="联系电话" align="center" prop="contactPhone" />
      <el-table-column label="项目招聘状态" align="center" prop="itemStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.recruitment" :value="scope.row.itemStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="发布时间" align="center" prop="releaseTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.releaseTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['recruitment:recruitment:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['recruitment:recruitment:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改招聘公告对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目名称" prop="itemName">
          <el-input v-model="form.itemName" placeholder="请输入项目名称" />
        </el-form-item>
        <el-form-item label="招聘公司" prop="requireCorporation">
          <el-input v-model="form.requireCorporation" placeholder="请输入招聘公司" />
        </el-form-item>
        <el-form-item label="项目内容" prop="itemContent">
          <el-input v-model="form.itemContent" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="项目所在地" prop="itemLocation">
          <el-input v-model="form.itemLocation" placeholder="请输入项目所在地" />
        </el-form-item>
        <el-form-item label="工种需求" prop="workerRequire">
          <el-input v-model="form.workerRequire" placeholder="请输入工种需求" />
        </el-form-item>
        <el-form-item label="招聘人数" prop="requireNum">
          <el-input v-model="form.requireNum" placeholder="请输入招聘人数" />
        </el-form-item>
        <el-form-item label="预计完成时间" prop="itemFinishTime">
          <el-date-picker clearable
            v-model="form.itemFinishTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择预计完成时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="联系电话" prop="contactPhone">
          <el-input v-model="form.contactPhone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="项目招聘状态" prop="itemStatus">
          <el-radio-group v-model="form.itemStatus">
            <el-radio
              v-for="dict in dict.type.recruitment"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
import { listRecruitment, getRecruitment, delRecruitment, addRecruitment, updateRecruitment } from "@/api/crew/recruitment";

export default {
  name: "Recruitment",
  dicts: ['recruitment'],
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
      // 招聘公告表格数据
      recruitmentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemName: null,
        requireCorporation: null,
        itemLocation: null,
        workerRequire: null,
        itemStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        itemName: [
          { required: true, message: "项目名称不能为空", trigger: "blur" }
        ],
        requireCorporation: [
          { required: true, message: "招聘公司不能为空", trigger: "blur" }
        ],
        itemContent: [
          { required: true, message: "项目内容不能为空", trigger: "blur" }
        ],
        itemLocation: [
          { required: true, message: "项目所在地不能为空", trigger: "blur" }
        ],
        workerRequire: [
          { required: true, message: "工种需求不能为空", trigger: "blur" }
        ],
        requireNum: [
          { required: true, message: "招聘人数不能为空", trigger: "blur" }
        ],
        itemFinishTime: [
          { required: true, message: "预计完成时间不能为空", trigger: "blur" }
        ],
        contactPhone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" }
        ],
        itemStatus: [
          { required: true, message: "项目招聘状态不能为空", trigger: "change" }
        ],
        releaseTime: [
          { required: true, message: "发布时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询招聘公告列表 */
    getList() {
      this.loading = true;
      listRecruitment(this.queryParams).then(response => {
        this.recruitmentList = response.rows;
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
        itemId: null,
        itemName: null,
        requireCorporation: null,
        itemContent: null,
        itemLocation: null,
        workerRequire: null,
        requireNum: null,
        itemFinishTime: null,
        contactPhone: null,
        itemStatus: null,
        releaseTime: null
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
      this.ids = selection.map(item => item.itemId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加招聘公告";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const itemId = row.itemId || this.ids
      getRecruitment(itemId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改招聘公告";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.itemId != null) {
            updateRecruitment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecruitment(this.form).then(response => {
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
      const itemIds = row.itemId || this.ids;
      this.$modal.confirm('是否确认删除招聘公告编号为"' + itemIds + '"的数据项？').then(function() {
        return delRecruitment(itemIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('recruitment/recruitment/export', {
        ...this.queryParams
      }, `recruitment_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
