<template>
  <ul class="video-shell">
      <li class="video-template" v-for="fordata in form" :key="fordata.title">
        <div class="picture-video"></div>
        <p class="title-video">{{ fordata.title }}</p>
        <p class="up-person">上传人：{{ fordata.uploader }}</p>
      </li>
  </ul>
</template>

<script>
export default {
  data(){
    return {
      form: [
        {
          title: '视频1',
          uploader: '上传人A'
        },
        {
          title: '视频2',
          uploader: '上传人B'
        },
        {
          title: '视频3',
          uploader: '上传人C'
        },
        {
          title: '视频4',
          uploader: '上传人D'
        },
        {
          title: '视频5',
          uploader: '上传人F'
        },
        {
          title: '视频6',
          uploader: '上传人G'
        },
        {
          title: '视频7',
          uploader: '上传人H'
        },
        {
          title: '视频8',
          uploader: '上传人I'
        }
      ]
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
  margin-top: 10px;
  display: inline-block;
  height: 240px;
  width: 340px;
  margin-right: 20px;
  background-color: #ffffff;  
  border-radius: 10px;
  box-shadow: 1px 1px 3px;
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
  padding-left: 10px;
  height: 20px;
  font-size:24px;
  font-weight:800;
  line-height:20px;
}
.up-person{
  padding-left: 10px;
  height: 15px;
  font-size:16px;
  font-weight:400;
  line-height:15px;
}
</style>