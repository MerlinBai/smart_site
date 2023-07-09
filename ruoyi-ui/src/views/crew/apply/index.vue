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
      <el-form-item label="应聘工种" prop="workerRequire">
        <el-input
          v-model="queryParams.workerRequire"
          placeholder="请输入应聘工种"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应聘时间">
        <el-date-picker
          v-model="daterangeApplyTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['apply:apply:add']"
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
          v-hasPermi="['apply:apply:edit']"
        >修改</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['apply:apply:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['apply:apply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="应聘id" align="center" prop="applyId" /> -->
      <el-table-column label="项目名称" align="center" prop="itemName" />
      <el-table-column label="应聘工种" align="center" prop="workerRequire" />
      <el-table-column label="应聘人" align="center" prop="applyUser" />
      <el-table-column label="应聘人联系方式" align="center" prop="applyPhone" />
      <el-table-column label="应聘时间" align="center" prop="applyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审核结果" align="center" prop="applyAudit">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.audit" :value="scope.row.applyAudit"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <!-- <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['apply:apply:edit']"
          >修改</el-button>
        </template> -->
         <template slot-scope="scope">
          <el-button
            type="success"
            round
            size="small"
            @click="handleUpdate(scope.row,'0')"
          >审核通过</el-button>
          <el-button
            type="info"
            round
            size="small"
            @click="handleUpdate(scope.row,'2')"
          >审核未通过</el-button>
        </template>
        <!-- <el-row>
          <el-button type="success" round>审核通过</el-button>
          <el-button type="info" round>审核未通过</el-button>
        </el-row> -->
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改应聘人信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listApply, getApply, delApply, addApply, updateApply } from "@/api/crew/apply";

export default {
  name: "Apply",
  dicts: ['audit'],
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
      // 应聘人信息表格数据
      applyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 审核结果时间范围
      daterangeApplyTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        itemName: null,
        workerRequire: null,
        applyTime: null,
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
    // async getMessageList(){
    //     const {data :res } = await axios.get('http://localhost:81/dev-api/inform/inform/list?pageNum=1&pageSize=10',)
    //     if(res.code != 200) console.log('数据获取失败！')
    //     this.InformList=res.rows
    //  },

    /** 查询应聘人信息列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeApplyTime && '' != this.daterangeApplyTime) {
        this.queryParams.params["beginApplyTime"] = this.daterangeApplyTime[0];
        this.queryParams.params["endApplyTime"] = this.daterangeApplyTime[1];
      }
      listApply(this.queryParams).then(response => {
        this.applyList = response.rows;
        this.total = response.total;
        this.loading = false;
        // console.log(this.applyList);
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
        applyId: null,
        itemId: null,
        itemName: null,
        workerRequire: null,
        applyUser: null,
        applyPhone: null,
        applyTime: null,
        applyAudit: null
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
      this.daterangeApplyTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.applyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加应聘人信息";
    },
    /** 修改按钮操作 */
    // handleUpdate(row) {
    //   this.reset();
    //   const applyId = row.applyId || this.ids
    //   getApply(applyId).then(response => {
    //     this.form = response.data;
    //     this.open = true;
    //     this.title = "修改应聘人信息";
    //   });
    // },

    /** 修改按钮操作 */
    handleUpdate(row,is) {
      const applyId = row.applyId || this.ids
      getApply(applyId).then(response => {
        this.form = response.data;
        this.form.applyAudit = is;
        // console.log(this.form);
        updateApply(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              // this.open = false;
              this.getList();
            });
        // this.open = true;
        // this.title = "修改应聘人信息";
      });
    },


    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.applyId != null) {
            updateApply(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addApply(this.form).then(response => {
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
      const applyIds = row.applyId || this.ids;
      this.$modal.confirm('是否确认删除应聘人信息编号为"' + applyIds + '"的数据项？').then(function() {
        return delApply(applyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('apply/apply/export', {
        ...this.queryParams
      }, `apply_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
