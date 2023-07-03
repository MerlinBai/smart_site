<template>
  <div class="body">

<!--     <div style="background-color: white;height: 8vh;width: 76vw;left: 12vw;position: absolute;text-align: center;top: 3vh">-->
<!--         <span style="font-size: 5vh;font-family: 楷体;line-height: 8vh;">技术培训</span>-->
<!--     </div>-->

<!--  导航    -->
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
        <el-carousel :interval="3000" arrow="always" style="margin-left: 4vh;height: 40vh;border-radius: 10px" indicator-position="none">
            <el-carousel-item v-for="(item,index) in limitedNumbers" :key="index">
                <el-image
                        :class="swiper-img"
                        style="width:100%; height:100%;border-radius: 10px;"
                        :src="item.img"
                        fit="cover">
                </el-image>
            </el-carousel-item>
        </el-carousel>

        <div style="background-color: white;height: 6vh;width: 38vw;margin-left: 4vh;border-radius: 10px;
        text-align: center;font-size: 3vh;line-height: 6vh;">
          <span>技能学习</span>
        </div>
    </div>

<!--   右侧   -->
      <div class="right">
        <div class="img" :style="{backgroundImage: 'url('+img+')'}">
        </div>

        <div class="username">
            <span>
                用户名123
            </span>
        </div>
      </div>

<!--   优选   -->
      <div class="great">
          <div>
              <span style="font-size: 3vh;font-weight: bold;font-family: YouYuan;">优质课程推荐</span>
          </div>

          <div class="great-item" v-for="(item,index) in limitedNumbers" :key="index" @click="gotovideo(item.videoId)">
              <el-image style="height: 60%;width: 100%;border-radius: 5px;" :src="item.img" />
            <span style="margin-left: 1vh"> 发布人: <span style="color: #ff6600;font-family: 楷体;font-size: 2.5vh;">{{item.createBy}}</span></span>
            <br/>
            <br/>
            <br/>
            <span style="margin-left: 1vh;">发布时间: <span style="color: #ff6600;font-family: 楷体;font-size: 2.5vh;">{{item.createTime}}</span></span>
          </div>

      </div>
  </div>
</template>

<script>
import index from "vuex";
import axios from 'axios'

export default {
    computed: {
        index() {
            return index
        }, limitedNumbers() {
        
        return this.box.slice(0,5); // 限制循环次数为 5 次
      }
    },
    data() {
        return {
            box: [],
            img: 'https://img.zcool.cn/community/0167a75c0a2c23a801209252d0a271.jpg@1280w_1l_2o_100sh.jpg'
        }
    } , async mounted() {
      const res = await axios.get('http://localhost:81/dev-api/systevideom/detail/list');
      if(res.data.code === 200) {
        this.box = res.data.rows;

      } else {
        this.$message({
          type: 'error',
          message: res.data.msg
        })
      }

  }, methods: {
      gotovideo(videoId) {
        localStorage.setItem('videoId',videoId);
        console.log(videoId)
        this.$router.replace({path : '/video'});

      }
  }


}

</script>

<style scoped>

.great-item {
    height: 31vh;
    width: 13.6vw;
    background-color: white;
    margin-top: 4vh;
    margin-right: 2vw;
    float: left;
    border-radius: 5px;
    box-shadow: 5px 5px 5px rgba(0,0,0,.3);
}

.great {
    position: absolute;
    top: 57vh;
    left: 11vw;
    width: 80vw;
    height: 30vh;
}

.great-item:hover {
  transform: translate(0,-10px);
  transition: 0.6s ease-in-out;
}

.img {
    height: 8vw;
    width: 8vw;
    border-radius: 4vw;
    left: 5vw;
    top: 8vh;
    position: relative;
    background-color: lightskyblue;
    background-size: cover;
}

.username {
    position: relative;
    text-align: center;
    top: 15vh;
}

.right {
    background-color: white;
    height: 46vh;
    width: 18vw;
    top: 8vh;
    left: 68vw;
    position: absolute;
    margin-left: 2vh;
    border-radius: 10px;
}

.swiper {
    position: absolute;
    height: 40vh;
    width: 40vw;
    left: 28vw;
    top: 8vh;
}

.body {
    height: 100vh;
    width: 100%;
    background-color: #efefef;
    /* background-image: linear-gradient(60deg, #d1ebfd, #ffffff, #d1ebfd); */
}

.left {
    height: 46vh;
    width: 18vw;
    background-color: white;
    position: absolute;
    left: 11vw;
    top: 8vh;
    border-radius: 10px;
    text-align: left;
}

.temp {
    position: relative;
    top: 2vh;
}

.temp div {
    background-color: white;
    /* border-bottom: 1px silver solid; */
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
