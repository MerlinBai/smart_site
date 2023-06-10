<template>
  <div class="train-video-shell">
    <div class="identity-TV">
      <el-menu :default-active="activeIndex" class="el-menu-demo El-menu" mode="horizontal" @select="handleSelect">
        <el-menu-item index="1">我学的课</el-menu-item>
        <el-menu-item index="2">我上传的课</el-menu-item>
        <div class="finding-TV">
          <el-input class="finding-input"></el-input>
          <p class="text-TV">
            查找
          </p>
        </div>
      </el-menu>
    </div>
    <div class="operating-TV">
      <el-button type="primary" class="operating-btn">上传视频</el-button>
    </div>
    <div class="show-TV">
      <!-- <video-up-com></video-up-com> -->
      <video-up-com></video-up-com>
    </div>
  </div>
</template>

<script>
import VideoUpCom from '@/components/VideoUp/VideoUpCom.vue'
// import App from '@/App.vue'
// import VideoUpCom from '@/components/VideoUp/VideoUpCom.vue'
export default {
  components: { VideoUpCom },
  // components: { App, VideoUpCom },

}
</script>

<style>
.train-video-shell{
  height: calc(100vh - 80px);
  padding: 20px;
  background-color: #d7d7d7;
  /* border-radius: 10px; */

}
.identity-TV{
  padding-left: 50px;
  padding-right: 50px;
  background-color: #fff;
  border-radius: 10px 10px 0 0;
}
.finding-TV{
  float: right;
  margin-top: 10px;
  margin-right: 10px;
  position: relative;
}
.finding-input{
  width: 300px;
  top: 0;
  right: 60px;
  position:absolute;
}
.text-TV{
  width: 50px;
  top: 50%;
  right: 0;
  transform: translate(0,-50%);
  position:absolute;
}
.operating-TV{
  height: 60px;
  background-color: #ffffff;
  position:relative;
}
.operating-btn{
  position:absolute;
  top: 50%;
  left: 60px;
  transform: translate(0,-50%);
}
.show-TV{
  padding-top: 20px;
  padding-left: 40px;
  height: calc(80% - 20px);
  background-color: #ffffff;
  border-radius: 0 0 20px 20px;
}
</style>