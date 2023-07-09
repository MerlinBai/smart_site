<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="施工队名称" prop="crewName">
        <el-input
          v-model="queryParams.crewName"
          placeholder="请输入施工队名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审核结果" prop="applyAudit">
        <el-select v-model="queryParams.applyAudit" placeholder="请选择审核结果" clearable>
          <el-option
            v-for="dict in dict.type.audit"
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
        <!--        <el-button-->
        <!--          type="primary"-->
        <!--          plain-->
        <!--          icon="el-icon-plus"-->
        <!--          size="mini"-->
        <!--          @click="handleAdd"-->
        <!--          v-hasPermi="['crew:crew:add']"-->
        <!--        >新增</el-button>-->
        <!--      </el-col>-->
        <!--      <el-col :span="1.5">-->
        <!--        <el-button-->
        <!--          type="success"-->
        <!--          plain-->
        <!--          icon="el-icon-edit"-->
        <!--          size="mini"-->
        <!--          :disabled="single"-->
        <!--          @click="handleUpdate"-->
        <!--          v-hasPermi="['crew:crew:edit']"-->
        <!--        >修改</el-button>-->
        <!--      </el-col>-->
        <!--      <el-col :span="1.5">-->
        <!--        <el-button-->
        <!--          type="danger"-->
        <!--          plain-->
        <!--          icon="el-icon-delete"-->
        <!--          size="mini"-->
        <!--          :disabled="multiple"-->
        <!--          @click="handleDelete"-->
        <!--          v-hasPermi="['crew:crew:remove']"-->
        <!--        >删除</el-button>-->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['crew:crew:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="crewList" @selection-change="handleSelectionChange"  @row-click="display">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="施工单位名称" align="center" prop="name" />
      <el-table-column label="负责人" align="center" prop="resPerson" />
<!--      <el-table-column label="电话" align="center" prop="phone" />-->
      <!--      <el-table-column label="地址" align="center" prop="address" />-->
      <el-table-column label="资质" align="center" prop="qualification">
        <template slot-scope="scope">
          <span v-if="scope.row.qualification===1">一级</span>
          <span v-else-if="scope.row.qualification===2">二级</span>
          <span v-else-if="scope.row.qualification===0">特级</span>
        </template>
      </el-table-column>
      <!--      <el-table-column label="已完成项目" align="center" prop="finishProject" />-->
      <!--      <el-table-column label="未完成项目" align="center" prop="unfinishProject" />-->
      <el-table-column label="员工数量" align="center" prop="popualtion" />
<!--      <el-table-column label="成立时间" align="center" prop="buildTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.buildTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="审核结果" align="center" prop="applyAudit">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.audit" :value="scope.row.applyAudit"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            type="success"
            round
            size="small"
            @click="handleUpdate(scope.row,'0')"
            @click.native.stop
            v-hasPermi="['apply:apply:edit']"
          >审核通过</el-button>
          <el-button
            type="info"
            round
            size="small"
            @click="handleUpdate(scope.row,'2')"
            @click.native.stop
            v-hasPermi="['apply:apply:edit']"
          >审核未通过</el-button>
        </template>
      </el-table-column>
      <el-table-column label="原因" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            type="primary"
            round
            icon="el-icon-edit"
            size="mini"
            @click="handleUpdate1(scope.row)"
            @click.native.stop
            v-hasPermi="['system:crew:edit']"
          >未通过原因</el-button>
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

    <!-- 添加或修改施工队信息对话框 -->
    <!--    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>-->
    <!--      <el-form ref="form" :model="form" :rules="rules" label-width="80px">-->
    <!--        <el-form-item label="施工单位名称" prop="name">-->
    <!--          <el-input v-model="form.name" placeholder="请输入施工单位名称" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="负责人" prop="resPerson">-->
    <!--          <el-input v-model="form.resPerson" placeholder="请输入负责人" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="电话" prop="phone">-->
    <!--          <el-input v-model="form.phone" placeholder="请输入电话" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="地址" prop="address">-->
    <!--          <el-input v-model="form.address" placeholder="请输入地址" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="资质" prop="qualification">-->
    <!--          <el-input v-model="form.qualification" placeholder="请输入资质" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="已完成项目" prop="finishProject">-->
    <!--          <el-input v-model="form.finishProject" placeholder="请输入已完成项目" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="未完成项目" prop="unfinishProject">-->
    <!--          <el-input v-model="form.unfinishProject" placeholder="请输入未完成项目" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="员工数量" prop="popualtion">-->
    <!--          <el-input v-model="form.popualtion" placeholder="请输入员工数量" />-->
    <!--        </el-form-item>-->
    <!--        <el-form-item label="成立时间" prop="buildTime">-->
    <!--          <el-date-picker clearable-->
    <!--            v-model="form.buildTime"-->
    <!--            type="date"-->
    <!--            value-format="yyyy-MM-dd"-->
    <!--            placeholder="请选择成立时间">-->
    <!--          </el-date-picker>-->
    <!--        </el-form-item>-->
    <!--      </el-form>-->
    <!--      <div slot="footer" class="dialog-footer">-->
    <!--        <el-button type="primary" @click="submitForm">确 定</el-button>-->
    <!--        <el-button @click="cancel">取 消</el-button>-->
    <!--      </div>-->
    <!--    </el-dialog>-->
    <el-dialog
      title="详细信息"
      :visible.sync="dialogVisible"
      width="60%"
      class="dialog"
    >
      <el-descriptions title="详细信息" direction="vertical" :column="4" border>
        <el-descriptions-item label="已完成项目" >
          <template>
            {{row.finSumName }}
          </template>
        </el-descriptions-item>
        <el-descriptions-item label="未完成项目">
          {{row.unFinSumName }}
        </el-descriptions-item>
        <el-descriptions-item label="成立时间">
          {{row.buildTime }}
        </el-descriptions-item>
        <el-descriptions-item label="企业性质">
          {{row.crewNature}}
        </el-descriptions-item>
        <el-descriptions-item label="注册资金(万元)">
          {{row.registeredCapital}}
        </el-descriptions-item>
        <el-descriptions-item label="占地面积（平方千米）">
          {{row.area}}
        </el-descriptions-item>
        <el-descriptions-item label="经营范围">
          {{row.businessScope}}
        </el-descriptions-item>
        <el-descriptions-item label="经营期限">
          {{row.operatingTerm}}
        </el-descriptions-item>
        <el-descriptions-item label="年检情况">
          {{row.annualInspection}}
        </el-descriptions-item>
        <el-descriptions-item label="联系方式">
          {{row.phone}}
        </el-descriptions-item>
      </el-descriptions>

    </el-dialog>

    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="85px">
        <el-form-item label="未通过原因" prop="reason">
          <el-input v-model="form.reason" placeholder="请输入审核未通过原因" />
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
import { listCrew, getCrew, delCrew, addCrew, updateCrew } from "@/api/crew/crew";
import dict from '@/utils/dict'
import { updateApply } from '@/api/crew/apply'

export default {
  name: "Crew",
  dicts: ['audit'],
  data() {
    return {
      row: [],
      //表单的显示
      dialogVisible:false,
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
      // 施工队信息表格数据
      crewList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        CrewName: null,
        qualification: null,
        applyAudit: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    dict,
    display(row){
      console.log(row)
      this.dialogVisible=true
      this.row = row
    },
    /** 查询施工队信息列表 */
    getList() {
      this.loading = true;
      listCrew(this.queryParams).then(response => {
        this.crewList = response.rows;
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
        crewId: null,
        name: null,
        resPerson: null,
        phone: null,
        address: null,
        qualification: null,
        finishProject: null,
        unfinishProject: null,
        popualtion: null,
        buildTime: null,
        applyAudit:null
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
      this.ids = selection.map(item => item.crewId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加施工队信息";
    },
    /** 填写原因操作 */
    handleUpdate1(row) {
      const crewId = row.crewId || this.ids
      getCrew(crewId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "未通过原因";
      });
    },

    /** 修改按钮操作 */
    handleUpdate(row,is) {
      const crewId = row.crewId || this.ids
      getCrew(crewId).then(response => {
        this.form = response.data;
        this.form.applyAudit = is;
        // console.log(this.form);
        updateCrew(this.form).then(response => {
          this.$modal.msgSuccess("修改成功");
          // this.open = false;
          this.getList();
        });

      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.crewId != null) {
            updateCrew(this.form).then(response => {
              this.$modal.msgSuccess("填写成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCrew(this.form).then(response => {
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
      const crewIds = row.crewId || this.ids;
      this.$modal.confirm('是否确认删除施工队信息编号为"' + crewIds + '"的数据项？').then(function() {
        return delCrew(crewIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('crew/crew/export', {
        ...this.queryParams
      }, `crew_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
<style>

</style>
