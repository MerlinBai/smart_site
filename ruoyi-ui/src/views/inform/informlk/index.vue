<template>
  <div class="inform-shell">
    <nav class="inform-unit">
      单位档案信息
    </nav>
    <div class="body-inform-unit">
        <el-table
          :data="tableData"
          height="100%"
          stripe
          style="width: 100%">
          <el-table-column
            prop="date"
            label="序号"
            width="180">
          </el-table-column>
          <el-table-column
            prop="informTitle"
            label="公告标题"
            width="180">
          </el-table-column>
          <el-table-column
            prop="address"
            label="公告类型">
          </el-table-column>
          <el-table-column
            prop="address"
            label="状态">
          </el-table-column>
          <el-table-column
            prop="address"
            label="创建者">
          </el-table-column>
          <el-table-column
            prop="address"
            label="创建时间">
          </el-table-column>
          <el-table-column
            label="操作">
            <span>修改 </span>
            <span>删除</span>
          </el-table-column>
        </el-table>
    </div>
  </div>
</template>

<script>
import { listInform, getInform, delInform, addInform, updateInform } from "@/api/inform/inform";

export default {
  name: "Inform",
  dicts: ['sys_notice_status', 'sys_notice_type'],
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
      // 通知表格数据
      informList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        informTitle: null,
        informType: null,
        status: null,
        informContent: null,
        infromFile: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        informTitle: [
          { required: true, message: "通知标题不能为空", trigger: "blur" }
        ],
        informType: [
          { required: true, message: "通知类型不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询通知列表 */
    getList() {
      this.loading = true;
      listInform(this.queryParams).then(response => {
        // for(var i=0;i<response.rows.length;i++) {
        //   // console.log(response.rows[i].infromFile);
        //   var informFileMsg = response.rows[i].infromFile;
        //   var split = informFileMsg.split("/");
        //   informFileMsg = "";
        //   for(var j = 6; j<split.length; j++) {
        //     informFileMsg = informFileMsg + split[j];
        //   }
        //   // console.log(informFileMsg);
        //   response.rows[i].infromFile = informFileMsg;
        // }
        this.informList = response.rows;
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
        informId: null,
        informTitle: null,
        informType: null,
        status: null,
        informContent: null,
        infromFile: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.ids = selection.map(item => item.informId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加通知";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const informId = row.informId || this.ids
      getInform(informId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改通知";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.informId != null) {
            updateInform(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInform(this.form).then(response => {
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
      const informIds = row.informId || this.ids;
      this.$modal.confirm('是否确认删除通知编号为"' + informIds + '"的数据项？').then(function() {
        return delInform(informIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('inform/inform/export', {
        ...this.queryParams
      }, `inform_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

export default {
  data() {
      return {
        tableData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄'
        }]
      }
    }
}
</script>

<style >
.inform-shell{
  height: calc(100vh - 30px);
  padding: 30px;
  padding-bottom: 0;
  background-color: #cad5d7;
}
.inform-unit{
  margin: 0 6%;
  margin-top: 10px;
  width: 88%;
  height: 60px;
  background-image: linear-gradient(to right,rgb(0, 162, 255),rgb(118, 205, 255),rgb(0, 162, 255));
  border-radius: 10px 10px 0 0 ;
  text-align: center;
  line-height: 60px;
  font-size:24px;
  font-weight: 400;
}
.body-inform-unit{
  height: calc(80% - 129px);
  background-color: #fff;
  margin: 0 6%;
  padding: 20px;
  border-radius: 0 0 20px 20px;
}
li{
  list-style: none;
}
</style>