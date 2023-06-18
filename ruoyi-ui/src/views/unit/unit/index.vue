<template>
  <div class="unit-shell">
    <nav class="nav-unit">
      单位档案信息
    </nav>
    <hr>
    <div class="body-unit">
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
            prop="name"
            label="施工单位名称"
            width="180">
          </el-table-column>
          <el-table-column
            prop="address"
            label="负责人">
          </el-table-column>
          <el-table-column
            prop="address"
            label="电话">
          </el-table-column>
          <el-table-column
            prop="address"
            label="地址">
          </el-table-column>
          <el-table-column
            prop="address"
            label="资质">
          </el-table-column>
          <el-table-column
            prop="address"
            label="已完成项目">
          </el-table-column>
          <el-table-column
            prop="address"
            label="未完成项目">
          </el-table-column>
          <el-table-column
            prop="address"
            label="员工数量">
          </el-table-column>
          <el-table-column
            prop="address"
            label="成立时间">
          </el-table-column>
          <el-table-column
            label="">
            <span>修改 </span>
            <span>删除</span>
          </el-table-column>
        </el-table>
    </div>
  </div>
</template>

<script>
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
.unit-shell{
  height: 100%;
  padding: 30px;
  padding-bottom: 0;
}
.nav-unit{
  height: 50px;
  line-height: 50px;
  font-size: 24px;
}
.body-unit{
  height: calc(100% - 129px);
  background-color: #64bcff;
  padding: 40px 20px;
  padding-top: 15px;
  border-radius: 20px 20px 10px 10px;
}
li{
  list-style: none;
}
</style>