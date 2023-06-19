<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />

      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['system:worker:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleImport"
          v-hasPermi="['system:worker:import']"
        >导入</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:worker:export']"
        >导出</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="workerList" @selection-change="handleSelectionChange" @row-click="showDetails">
      <el-table-column label="姓名" align="center" prop="name" />

      <el-table-column label="性别" align="center" prop="sex" >
        <template slot-scope="scope">
          <span v-if="scope.row.sex === 0">男</span>
          <span v-else-if="scope.row.sex === 1">女</span>
          <span v-else>其他</span>
        </template>
      </el-table-column>

      <el-table-column label="年龄" align="center" prop="age" />
<!--      <el-table-column label="电话号" align="center" prop="phone" />-->
<!--      <el-table-column label="现住址" align="center" prop="addressNow" />-->
      <el-table-column label="政治面貌" align="center" prop="polStatus">
        <template slot-scope="scope">
          <span v-if="scope.row.polStatus === 0">群众</span>
          <span v-else-if="scope.row.polStatus === 1">党员</span>
          <span v-else>其他</span>
        </template>
      </el-table-column>
      <el-table-column label="工种" align="center" prop="workerTypeName" >
        <template v-slot:header>
          <div>
            <span style="margin-right: 10px">工种</span>
            <el-popover
              placement="right"
              width="100"
              trigger="click">
              <template>
                <div>请选择工种</div>
                <br>
                <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
                <div style="margin: 15px 0;"></div>
                <el-checkbox-group v-model="queryParams.workerTypeNames" @change="handleCheckedTypeChange">
                  <el-checkbox v-for="tp in workerTypeNames" :label="tp" :key="tp" style="padding-bottom: 8px "> {{tp}} </el-checkbox>
                </el-checkbox-group>
                <el-button type="primary" @click="getList" size="mini">确定</el-button>
              </template>
              <i class="el-icon-caret-bottom" slot="reference" ></i>
            </el-popover>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="所属施工队" align="center" prop="crewName" />
      <el-table-column label="正在进行的项目" align="center" prop="projectNow" />

      <el-table-column label="是否认证" align="center" prop="authentication" >
        <template v-slot:header>
          <div>
            <span style="margin-right: 10px">是否认证</span>
            <el-popover
              placement="right"
              width="200"
              trigger="click"
              style="text-align: center"
              >
              <template>
                请选择是否已认证
                <el-checkbox-group v-model="queryParams.authenticationList" @change="handleCheckedTypeChange">
                  <el-checkbox v-for="aut in authenticationList" :label="aut" :key="aut" style="padding-bottom: 10px;padding-top: 10px;padding-right: 10px"> {{aut}} </el-checkbox>
                </el-checkbox-group>
                <el-button type="primary" @click="getList" size="mini">确定</el-button>
              </template>
              <i class="el-icon-caret-bottom" slot="reference" ></i>
            </el-popover>
          </div>
        </template>
        <template slot-scope="scope">
          <span v-if="scope.row.authentication === 0">否</span>
          <span v-else-if="scope.row.authentication === 1">是</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['system:worker:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdateAut(scope.row)"-->
<!--            v-hasPermi="['system:worker:remove']">-->

<!--            <span v-if="scope.row.authentication === 0">认证</span>-->
<!--            <span v-else-if="scope.row.authentication === 1">取消认证</span>-->

<!--          </el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改员工管理对话框 -->

    </el-dialog>
<!--     员工导入对话框-->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport" /> 是否更新已经存在的员工数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog
      title="详细信息"
      :visible.sync="openDetails"
      width="60%">
      <span><el-descriptions class="margin-top" :column="3"  border>

    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-user"></i>
        姓名
      </template>
      {{this.details.name}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-mobile-phone"></i>
        手机号
      </template>
      {{this.details.phone}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-location-outline"></i>
        现住址
      </template>
      {{this.details.addressNow}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-date"></i>
        年龄
      </template>
      {{this.details.age}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-s-custom"></i>
        政治面貌
      </template>
      <span v-if="details.polStatus === 1">党员</span>
      <span v-else-if="details.polStatus === 0">群众</span>
      <span v-else>其他</span>
    </el-descriptions-item>
        <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-office-building"></i>
        户籍住址
      </template>
      {{this.details.addressReg}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-truck"></i>
        所属工程队
      </template>
      {{this.details.crewName}}
    </el-descriptions-item>
    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-tickets"></i>
        正在进行的项目
      </template>
      {{this.details.projectName}}
    </el-descriptions-item>

    <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-tickets"></i>
        是否认证
      </template>
      <span v-if="details.authentication === 0">否</span>
      <span v-else>是</span>
    </el-descriptions-item>
        <el-descriptions-item>
      <template slot="label">
        <i class="el-icon-s-custom"></i>
        身份证号
      </template>
      {{this.details.idNumber}}
    </el-descriptions-item>

  </el-descriptions></span>
    </el-dialog>
  </div>
</template>

<script>
import { listWorker, getWorker, delWorker, addWorker, updateWorker, showWorkerDetails } from '@/api/worker/worker'
import { getToken } from '@/utils/auth'
import ScrollPane from '@/layout/components/TagsView/ScrollPane.vue'
import axios from 'axios'
import { listType } from '@/api/worker/type'
export default {
  name: "Worker",
  components: { ScrollPane },
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
      // 员工管理表格数据
      workerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 是否显示弹出层()
        detailsDis: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/worker/importData"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        workerTypeNames: ['钢筋工','水泥工','瓦工','水电工','壮工'],
        authenticationList: ['是','否'],
        name: null
      },
      //员工详细信息
      details:{},
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      workerTypeNames:['钢筋工','水泥工','瓦工','水电工','壮工'],
      authenticationList: ['是','否'],
      isIndeterminate: true,
      checkAll: true,
    };
  },
  created() {
    this.getList();
  },

  methods: {
    /** 查询员工管理列表 */
    getList() {
      this.loading = true;
      listWorker(this.queryParams).then(response => {
        this.workerList = response.rows;
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
        id: null,
        name: null,
        sex: null,
        age: null,
        phone: null,
        addressNow: null,
        polStatus: null,
        wokerTypeId: null,
        crewId: null,
        projectNow: null,
        authentication: null
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
      this.queryParams.crewName = null
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

    /** 新增按钮操作 */

    /** 修改按钮操作 */
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateWorker(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWorker(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/worker/export', {
        ...this.queryParams
      }, `worker_${new Date().getTime()}.xlsx`)
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('system/worker/importTemplate', {
      }, `worker_template_${new Date().getTime()}.xlsx`)
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    showDetails(row){
      showWorkerDetails(row.id).then(response => {
          this.details = response.data
        }
      )

      console.log(this.details.name)
      this.openDetails = true;
    }
    ,
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },

    //工种复选框相关方法
    handleCheckAllChange(val) {
      this.queryParams.workerTypeNames = val ? this.workerTypeNames : [];
      this.isIndeterminate = false;
    },
    handleCheckedTypeChange(value) {
      let checkedCount = value.length;
      this.checkAll = checkedCount === this.queryParams.workerTypeNames.length;
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.queryParams.workerTypeNames.length;
    },

    // getWorkerTypes(){
    //   this.loading = true;
    //   listType(this.queryParams).then(response => {
    //     this.loading = true;
    //     listType(this.queryParams).then(response => {
    //       for(let k = 0; k < response.rows.length ; k++){
    //         this.workerTypeNames[k] = response.rows[k].name;
    //       }
    //       this.loading = false;
    //     });
    //       this.queryParams.workerTypeNames = this.workerTypeNames;
    //     console.log(this.workerTypeNames);
    //     console.log(this.queryParams.workerTypeNames)
    //   })
    // }
  }
};
</script>
