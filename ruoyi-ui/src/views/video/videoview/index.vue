<template>
  <div class="body">



    <!-- 导航 -->
   <div style="height: 100%;width: 80%;position: relative;left: 2%;">
     <div class="left">
       <div class="temp">
         <div>
           <span>技能导航1</span>
         </div>
         <div>
           <span>技能导航2</span>
         </div>
         <div>
           <span>技能导航3</span>
         </div>
         <div>
           <span>技能导航4</span>
         </div>
         <div>
           <span>技能导航5</span>
         </div>
         <div>
           <span>技能导航6</span>
         </div>
       </div>
     </div>

     <!--轮播图-->
     <div class="swiper">
       <el-carousel :interval="3000" arrow="always" style="margin-left: 4vh;" indicator-position="none">
         <el-carousel-item v-for="(item,index) in imgList" :key="index">
           <el-image
             :class="swiper-img"
             style="width:100%; height:100%;border-radius: 10px;"
             :src="item.img"
             fit="cover">
           </el-image>
         </el-carousel-item>
       </el-carousel>

<!--       <div style="background-color: white;height: 6vh;width: 38vw;margin-left: 4vh;border-radius: 10px;-->
<!--text-align: center;font-size: 3vh;line-height: 6vh;">-->
<!--         <span>技能学习</span>-->
<!--       </div>-->
     </div>

     <!-- 右侧 -->
     <div class="right">
       <div class="img" :style="{backgroundImage: 'url('+img+')'}">
       </div>

       <div class="username">
<span>
用户名123
</span>
       </div>
     </div>

     <!-- 优选 -->
     <div class="great">
       <div>
         <span style="font-size: 3vh;font-weight: bold;font-family: YouYuan;">优质课程推荐</span>
       </div>

       <div class="great-item" v-for="(item,index) in imgList" :key="index">
         <el-image style="height: 60%;width: 100%;border-radius: 3px;" :src="item.img" />
         <span>描述</span>
         <br>
         <br>
         <span> 课程名称</span>
         <!-- {{item}}-->
       </div>

     </div>
   </div>
  </div>
</template>

<script>
// import index from "vuex";
import { listVideoview, getVideoview, delVideoview, addVideoview, updateVideoview } from "@/api/video/videoview";
export default {
  data() {
    return {
      imgList: [
        {img: "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"},
        {img: "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"},
        {img: "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"},
        {img: "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"},
        {img: "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"}

      ],
      img: 'https://img.zcool.cn/community/0167a75c0a2c23a801209252d0a271.jpg@1280w_1l_2o_100sh.jpg'
    }
  }
}

</script>

<style scoped>

.great-item {
  height: 27vh;
  width: 13.6vw;
  background-color: white;
  margin-top: 2vh;
  margin-right: 2vw;
  float: left;
  border-radius: 3px;
  box-shadow: 5px 5px 5px rgba(0,0,0,.3);
}

.great-item:hover {
  transform: translate(0,-8px);
  transition: 0.5s ease-in-out;
}

.great {
  position: absolute;
  top: 54vh;
  left: 5vw;
  width: 80vw;
  height: 30vh;
}

.img {
  height: 8vw;
  width: 8vw;
  border-radius: 4vw;
  left: 5vw;
  top: 7vh;
  position: relative;
  background-color: lightskyblue;
  background-size: cover;
}

.username {
  position: relative;
  text-align: center;
  top: 16vh;
}

.right {
  background-color: white;
  height: 46vh;
  width: 18vw;
  top: 6vh;
  left: 62vw;
  position: absolute;
  margin-left: 2vh;
  border-radius: 10px;
}

.swiper {
  position: absolute;
  height: 40vh;
  width: 40vw;
  left: 22vw;
  top: 6vh;
}

.body {
  height: 87vh;
  width: 100%;
  background-color: #efefef;
//background-image: linear-gradient(60deg, #d1ebfd, #ffffff, #d1ebfd);
}

.left {
  height: 46vh;
  width: 18vw;
  background-color: white;
  position: absolute;
  left: 5vw;
  top: 6vh;
  border-radius: 10px;
  text-align: left;
}

.temp {
  position: relative;
  top: 2vh;
}

.temp div {
  background-color: white;
//border-bottom: 1px silver solid;
  height: 7vh;
  box-sizing: border-box;
}

.temp span {
  line-height: 7vh;
  margin-left: 2vh;
}

.temp div:hover {
  background-color: rgb(229, 249, 238);
  color: rgb(38, 241, 170);
  transition: 0.3s ease-out;
}


</style>
