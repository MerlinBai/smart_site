<template>
  <div class="inform-shell">
    <nav v-if="!boo" class="inform-unit">查看通知详情</nav>
    <div v-if="!boo" class="body-inform-unit">
      <el-table
        :data="InformList"
        height="100%"
        row-class-name="table-row"
        stripe
        style="width: 100%"
      >
        <el-table-column label="序号" width="80px">
          <template slot-scope="scope">{{ scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column prop="informTitle" label="通知标题" width="390" />
        <el-table-column
          prop="informType"
          label="通知类型"
          :formatter="formatInformType"
          width="180"
        />
        <el-table-column prop="status" label="状态" :formatter="formatStatus" />
        <el-table-column prop="createBy" label="发送者" />
        <el-table-column prop="createTime" label="发送时间" width="" />
        <el-table-column label="查看详情">
          <template #default="{ $index }">
            <div>
              <button class="particulars-inform" @click="showInform($index)">
                详情
              </button>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div v-if="boo" class="particulars-show">
      <nav class="pts-nav">{{ this.InformListCopy.informTitle }}</nav>
      <div class="pts-content">{{ this.InformListCopy.informContent }}</div>
      <div class="pts-time">发送时间：{{ this.InformListCopy.createTime }}</div>
      <div class="pts-author">发送者：{{ this.InformListCopy.createBy }}</div>
      <button class="pts-btn" @click="boo = !boo">关闭通知</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      InformList: [],
      InformListCopy: [],
      boo: false,
    };
  },
  created() {
    this.getMessageList();
  },
  methods: {
    async getMessageList() {
      const { data: res } = await axios.get(
        "http://localhost/dev-api/inform/inform/list?pageNum=1&pageSize=10"
      );
      if (res.code != 200) console.log("数据获取失败！");
      this.InformList = res.rows;
    },
    formatInformType(row, column) {
      if (row.informType == 1) {
        return "通知";
      } else if (row.informType == 2) {
        return "公告";
      }
    },
    formatStatus(row, column) {
      if (row.status == 0) {
        return "已读";
      } else if (row.status == 1) {
        return "未读";
      }
    },
    showInform(id) {
      this.boo = true;
      this.InformListCopy = this.InformList[id];
      console.log(this.InformListCopy);
    },
  },
};
</script>

<style>
.particulars-show {
  position: absolute;
  top: 20px;
  left: 50%;
  transform: translate(-50%, 0);
  width: 70vw;
  height: 70vh;
  background-color: #ebfeff;
  border-radius: 10px;
  border: solid rgb(177, 177, 177) 3px;
}
.pts-nav {
  font-size: 36px;
  font-weight: 800;
  position: absolute;
  left: 50%;
  transform: translate(-50%, 0);
}
.pts-content {
  position: absolute;
  top: 70px;
  left: 50%;
  transform: translate(-50%, 0);
  font-size: 24px;
}
.pts-time {
  position: absolute;
  bottom: 80px;
  right: 20px;
}
.pts-author {
  position: absolute;
  bottom: 60px;
  right: 20px;
}
.pts-btn {
  position: absolute;
  transform: translate(-50%, 0);
  left: 50%;
  bottom: 50px;
  width: 160px;
  height: 60px;
  border-radius: 10px;
  background-color: #b1bdff;
  font-size: 24px;
}
.particulars-inform {
  background-color: initial;
  border: none;
}
.table-row {
  height: 60px;
}
.inform-shell {
  height: calc(100vh - 30px);
  padding: 30px;
  padding-bottom: 0;
  background-color: #cad5d7;
}
.inform-unit {
  margin: 0 6%;
  margin-top: 10px;
  width: 88%;
  height: 60px;
  background-image: linear-gradient(
    to right,
    rgb(0, 162, 255),
    rgb(118, 205, 255),
    rgb(0, 162, 255)
  );
  border-radius: 10px 10px 0 0;
  text-align: center;
  line-height: 60px;
  font-size: 24px;
  font-weight: 400;
}
.body-inform-unit {
  height: calc(80% - 129px);
  background-color: #fff;
  margin: 0 6%;
  padding: 20px;
  border-radius: 0 0 20px 20px;
}
li {
  list-style: none;
}
</style>
