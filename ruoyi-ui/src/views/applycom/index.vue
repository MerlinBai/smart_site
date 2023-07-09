<template>
  <div class="app-container1">
    <el-row :gutter="10" class="mb8">
      <el-dialog title="收货地址" :visible.sync="dialogTableVisible">
        <el-table :data="crewList">
          <el-table-column
            property="reason"
            label="日期"
            width="150"
          ></el-table-column>
          <el-table-column
            property="name"
            label="姓名"
            width="200"
          ></el-table-column>
          <el-table-column property="address" label="地址"></el-table-column>
        </el-table>
      </el-dialog>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="big"
          @click="handleAdd"
          class="button"
        >提交企业申请书</el-button
        >
        <el-button
          class="look"
          type="info"
          plain
          icon="el-icon-s-comment"
          size="big"
          @click="dialogTableVisible = true"
        >
          查看审查结果
        </el-button>
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>
    <!-- 添加或修改crew对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="施工单位名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入施工单位名称" />
        </el-form-item>
        <el-form-item label="负责人" prop="resPerson">
          <el-input v-model="form.resPerson" placeholder="请输入负责人" />
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入地址" />
        </el-form-item>
        <el-form-item label="资质" prop="qualification">
          <el-input v-model="form.qualification" placeholder="请输入资质" />
        </el-form-item>
        <el-form-item label="员工数量" prop="InitialEmployee">
          <el-input v-model="form.initialEmployee" placeholder="请输入员工数量" />
        </el-form-item>
        <el-form-item label="成立时间" prop="buildTime">
          <el-date-picker
            clearable
            v-model="form.buildTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择成立时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="企业性质" prop="crewNature">
          <el-input v-model="form.crewNature" placeholder="请输入企业性质" />
        </el-form-item>
        <el-form-item label="占地面积" prop="area">
          <el-input v-model="form.area" placeholder="请输入占地面积" />
        </el-form-item>
        <el-form-item label="注册资金" prop="registeredCapital">
          <el-input
            v-model="form.registeredCapital"
            placeholder="请输入注册资金"
          />
        </el-form-item>
        <el-form-item label="经营范围" prop="businessScope">
          <el-input v-model="form.businessScope" placeholder="请输入经营范围" />
        </el-form-item>
        <el-form-item label="经营期限" prop="operatingTerm">
          <el-input v-model="form.operatingTerm" placeholder="请输入经营期限" />
        </el-form-item>
        <el-form-item label="年检情况" prop="annualInspection">
          <el-input
            v-model="form.annualInspection"
            placeholder="请输入年检情况"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <div class="white">
      <div class="text">
        <p>请先进行企业注册（施工队）</p>
        <p>点击右侧“提交企业申请书”，填写真实有效完整信息后，点击确定即可</p>
        <p>
          点击右侧“查询审查结果”，可看到工作进度，通常在3个工作日内完成审批。
        </p>
        <p>当申请通过后，您才将拥有公司（施工队）的所有权限。</p>
      </div>
    </div>
  </div>
</template>

<script>
import {
  listCrew,
  getCrew,
  delCrew,
  addCrew,
  updateCrew,
} from "@/api/crew/crew";

export default {
  name: "Crew",
  data() {
    return {
      dialogTableVisible: false,
      formLabelWidth: "120px",
      dialogFormVisible: false,
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
      // crew表格数据
      crewList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        resPerson: null,
        phone: null,
        address: null,
        qualification: null,
        finishProject: null,
        unfinishProject: null,
        popualtion: null,
        buildTime: null,
        applyAudit: null,
        crewNature: null,
        area: null,
        registeredCapital: null,
        reason: null,
        businessScope: null,
        operatingTerm: null,
        annualInspection: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "施工单位名称不能为空", trigger: "blur" },
        ],
        resPerson: [
          { required: true, message: "负责人不能为空", trigger: "blur" },
        ],
        phone: [{ required: true, message: "电话不能为空", trigger: "blur" }],
        address: [{ required: true, message: "地址不能为空", trigger: "blur" }],
        popualtion: [
          { required: true, message: "员工数量不能为空", trigger: "blur" },
        ],
        buildTime: [
          { required: true, message: "成立时间不能为空", trigger: "blur" },
        ],
        crewNature: [
          { required: true, message: "企业性质不能为空", trigger: "blur" },
        ],
        businessScope: [
          { required: true, message: "经营范围不能为空", trigger: "blur" },
        ],
        operatingTerm: [
          { required: true, message: "经营期限不能为空", trigger: "blur" },
        ],
        annualInspection: [
          { required: true, message: "年检情况不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询crew列表 */
    getList() {
      this.loading = true;
      listCrew(this.queryParams).then((response) => {
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
        applyAudit: null,
        crewNature: null,
        area: null,
        registeredCapital: null,
        reason: null,
        businessScope: null,
        operatingTerm: null,
        annualInspection: null,
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
      this.ids = selection.map((item) => item.crewId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "企业申请书";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const crewId = row.crewId || this.ids;
      getCrew(crewId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改crew";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.crewId != null) {
            updateCrew(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCrew(this.form).then((response) => {
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
      this.$modal
        .confirm('是否确认删除crew编号为"' + crewIds + '"的数据项？')
        .then(function () {
          return delCrew(crewIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/crew/export",
        {
          ...this.queryParams,
        },
        `crew_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
<style>
.app-container1 {
  width: 100vw;
  height: 90vh;
  /* background: no-repeat;
  background-size: cover; */
  background: white;
  background-image: linear-gradient(
    90deg,
    rgba(0, 0, 160, 0.5) 50%,
    transparent 0
  ),
  linear-gradient(rgba(0, 0, 200, 0.5) 50%, transparent 0);
  background-size: 30px 30px;
}
.look {
  position: absolute;
  top: 350px;
  right: 25%;
  width: 300px;
  height: 200px;
}
.button {
  position: absolute;
  top: 50px;
  right: 25%;
  width: 300px;
  height: 200px;
  font-size: 1.3vw;
}

.white {
  position: absolute;
  width: 50%;
  top: -1vh;
  height: 92vh;
  background: rgb(253, 251, 255);
  left: 0px;
  opacity: 0.85;
  color: black;
}
.text {
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB",
  "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
  position: absolute;
  width: 40vw;
  top: 10%;
  left: 25%;
  transform: translate(-25%, 0);
  height: 72vh;
  font-size: 1.6vw;
}
.text > p {
  color: #000;
  font-weight: 800;
  text-align: center;
}
</style>
