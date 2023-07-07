<template>
  <div class="shell">
    <div class="box">
      <form action="">
        <h1>施工队申请表</h1>
        <div class="cell-shell">
          <div class="cell" v-for="item in message" :key="item.id">
            <label class="label">{{ item.value }}</label>
            <input type="text" class="inpt" />
          </div>
        </div>
        <button class="btn">提交</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: [
        { id: 1, label: "teamName", value: "施工队队名" },
        { id: 2, label: "principal", value: "施工队负责人" },
        { id: 3, label: "phone", value: "电话" },
        { id: 4, label: "site", value: "地址" },
        { id: 5, label: "qualification", value: "资质" },
        { id: 6, label: "num", value: "员工数量" },
      ],
    };
  },
};
</script>

<style scoped>
.shell {
  background-color: #fff;

  height: 100vh;
  width: 100%;
  padding: 20px;
  position: relative;
}
.box {
  width: 500px;
  height: 600px;
  position: absolute;
  left: 50%;
  transform: translate(-50%, 0);
  border-radius: 20px;
  border: 5px #000000c4 solid;
}
h1 {
  position: absolute;
  top: 30px;
  left: 50%;
  transform: translate(-50%, 0);
  font-size: 36px;
}
.cell-shell {
  width: 360px;
  position: absolute;
  top: 160px;
  /* background-color: #6b01017f; */
  left: 50%;
  transform: translate(-50%, 0);
  display: flex;
  flex-wrap: wrap;
}
.cell {
  width: inherit;
  margin-top: 20px;
  /* background-color: rgba(6, 6, 6, 0.495); */
}
.label {
  display: inline-block;
  width: 130px;
  padding-right: 20px;
  /* background-color: #ffffff84; */
  text-align: right;
  font-size: 16px;
  font-weight: 400;
}
.inpt {
  height: 36px;
  border: solid 1px;
}
.btn {
  width: 70px;
  background-color: #38e7f4;
  border-radius: 10px;
  height: 30px;
  position: absolute;
  bottom: 40px;
  left: 50%;
  transform: translate(-50%, 0);
}
</style>
