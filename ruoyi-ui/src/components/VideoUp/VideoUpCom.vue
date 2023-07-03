<template>
  <ul class="video-shell">
    <li class="video-template" v-for="fordata in form" :key="fordata.title">
      <div class="picture-video">
        <img :src="fordata.img" style="height: 100%;width: 100%;border-radius: 10px;object-fit: cover">
      </div>
      <div class="title-video">
        <span style="font-family: YouYuan;font-weight: 700;">{{ fordata.name }}</span>
      </div>

      <p class="content-video">{{fordata.createBy}}</p>
      <p class="time-video">上传时间：{{ fordata.createTime }}</p>
    </li>
  </ul>
</template>

<script>
import axios from 'axios'
export default {
  data(){
    return {
      form : [
        
      ]
    }
  },async mounted() {
    const res = await axios.get('http://localhost:81/dev-api/systevideom/detail/list');
      if(res.data.code === 200) {
        this.form = res.data.rows;

      } else {
        this.$message({
          type: 'error',
          message: res.data.msg
        })
      }
  }
}
</script>

<style>
li{
  list-style: none;
}
.video-shell{
  height: 90%;
  background-color: #ffffff;
  padding: 0 5px;
  display: flex;
  flex-wrap: wrap;
  overflow: scroll;

}
.video-shell::-webkit-scrollbar{
  display: none;
}

.video-template{
  margin-top: 2%;
  display: inline-block;
  height: 280px;
  width: 20%;
  margin-right: 2%;
  /* background-color: #ffffff;   */
  /* background-color: #f21111;   */
  border-radius: 10px;
  box-shadow: 1px 1px 3px;
  position: relative;
}
.picture-video{
  width: 100%;
  height: 60%;
  border-radius: 10px;
  background-image: url('./videoPic.png');
  background-size: cover;
  background-color: #fff;
}
.title-video{
  position: absolute;
  left: 10px;
  font-size:24px;
  font-weight:800;
  /* background: #0000004b; */
}
.content-video{
  width: 98%;
  position: absolute;
  height: 18px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  left: 10px;
  bottom: 15%;
  font-size:16px;
  font-weight:300;
  line-height:18px;
  /* background: #0000004b; */
}
.time-video{
  position: absolute;
  left: 10px;
  bottom: 5%;
  font-size:16px;
  font-weight:400;
  line-height:16px;
  /* background: #0000004b; */
}
</style>
