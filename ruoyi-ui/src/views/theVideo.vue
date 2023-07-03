<!--
<template>
  <div class="body">

    <div>
      <div>
        <span>{{name}}</span>
      </div>
&lt;!&ndash;      <video :src="theVideo" autoplay='autoplay' loop controls style="width: 80%;margin-left: 10%;height: 70vh;margin-top: 10vh;" id="demo-video" ></video>
      观看时长：
      <input type="text" ref="aa" value="0" id="aa"> 当前时间：
      <input type="text" ref="bb" value="0" id="bb">&ndash;&gt;

      <video-player

        class="video-player vjs-custom-skin"

        ref="videoPlayer"

        :playsinline="true"

        :options="playerOptions"

        @timeupdate="onPlayerTimeupdate($event)"

        @ready="playerReadied"

      ></video-player>

    </div>



  </div>
</template>
-->



<!--<script>
import axios from 'axios'

export default {
  name: "Video2",

  props:['url'],
  data() {

    return {

      playerOptions: {

        playbackRates: [0.7, 1.0, 1.5, 2.0], //播放速度

        currentTime: "00:00",

        autoplay: false, //如果true,浏览器准备好时开始回放。

        muted: false, // 默认情况下将会消除任何音频。

        loop: false, // 导致视频一结束就重新开始。

        preload: "auto", // 建议浏览器在<video>加载元素后是否应该开始下载视频数据。auto浏览器选择最佳行为,立即开始加载视频（如果浏览器支持）

        language: "zh-CN",

        aspectRatio: "16:9", // 将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）

        fluid: true, // 当true时，Video.js player将拥有流体大小。换句话说，它将按比例缩放以适应其容器。

        sources: [

          {

            type: "video/mp4", //这里的种类支持很多种：基本视频格式、直播、流媒体等，具体可以参看git网址项目

            // src:require("../../../assets/vd.mp4"), //本地视频使用方式，本地图片引入亦如此

            src: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4",//视频地址

          },

        ],

        poster:this.url, //你的封面地址

        // width: document.documentElement.clientWidth, //播放器宽度

        notSupportedMessage: "此视频暂无法播放，请稍后再试", //允许覆盖Video.js无法播放媒体源时显示的默认信息。

        controlBar: {

          timeDivider: true,

          durationDisplay: true,

          remainingTimeDisplay: false,

          fullscreenToggle: true, //全屏按钮

        },

      },

      //一开始视频观看时长，可用于记录视频播放的时间，下一次直接从这个时间开始播放

      gklog: '',

    };

  },

  methods: {

    //视频快进

    goFast() {

      this.gklog += 5;

      // console.log(" 快进", this.gklog,this.$refs.videoPlayer);

      this.$refs.videoPlayer.player.currentTime(this.gklog)

    },

    //视频后退

    goBack() {

      this.gklog -= 5;

      // console.log(" 后退", this.gklog,this.$refs.videoPlayer);

      this.$refs.videoPlayer.player.currentTime(this.gklog);

    },

    /* 设置视频进度 */

    playerReadied(player) {
      console.log(player)

      player.currentTime(this.gklog);
      console.log('视频时长：', this.gklog);

    },

    onPlayerTimeupdate(player) {

      this.gklog = player.cache_.currentTime;//获取当前播放时间

      console.log(" onPlayerTimeupdate!", this.gklog);

    },

  },

  watch:{

    gklog:function(){

    }

  }

};
</script>-->

<style >

.video-js .vjs-icon-placeholder {

  width: 100%;

  height: 100%;

  display: block;

}

.video-player {
  position: absolute;

  top: 10%;

  left: 15%;

  width: 70%;

  height: 76%;

  box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
}

.bodyv {
  height: 100vh;
  width: 100vw;
  background-image: linear-gradient(60deg, #d1ebfd, #ffffff, #d1ebfd);
}

/*.vjs-custom-skin > .video-js .vjs-control-bar {
  display: none ;
}*/

/*.vjs-has-started.vjs-user-inactive.vjs-playing .vjs-control-bar {
  visibility: visible;
  opacity: 0;
  display: none ;
  pointer-events: none;
  -webkit-transition: visibility 1s, opacity 1s;
  transition: visibility 1s, opacity 1s;
}*/

.vjs-custom-skin > .video-js .vjs-progress-control {
  display: none;
}
</style>

<template>
 <div class="bodyv">

   <div>
     <div>
       <span style="position: absolute;left: 15%;font-family: YouYuan;font-weight: 600;font-size: 2.5vh;top: 5%;">{{name}}</span>
       <span style="position: absolute;right: 15%;font-family: YouYuan;font-weight: 600;font-size: 2.5vh;top: 5%;">发布时间:{{createtime}} <span style="color: #00afff">||</span> 发布人:{{createby}}</span>
     </div>



   <video-player  class="video-player vjs-custom-skin"
                  ref="videoPlayer"
                  :playsinline="true"
                  :options="playerOptions"
                  @canplay="canplay($event)"
                  @play="play($event)"
                  @pause="pause($event)"
                  @ended="ended"
                  @timeupdate="timeupdate($event)"
                  @seeking="seeked"
   >

   </video-player>
   </div>
 </div>
</template>

<script>
import axios from 'axios'


export default {

  data() {
    return {
      id:1,
      lasttime: '',
      createby:'admin',
      createtime: '2000-1212',
      name:'',
      theVideo: '',
      videoDetial: {},
      duration: 0,  // 视频总长
      player:null,
      playerOptions: {
        autoplay: false,  //是否自动播放
        muted: false,   //默认音量为静音
        language: 'zh-CN',
        playbackRates: [1.0], //倍数
        sources: [{  //视频data
          type: "",
          src: this.theVideo,

        }],
        fluid: true, // 当true时，Video.js player将拥有流体大小。换句话说，它将按比例缩放以适应其容器。
        loop: false, // 导致视频一结束就重新开始。
        preload: 'auto', // 建议浏览器在<video>加载元素后是否应该开始下载视频数据。auto浏览器选择最佳行为,立即开始加载视频（如果浏览器支持）
        aspectRatio: '16:9', // 将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）
        poster: "", //你的封面地址
        notSupportedMessage:"浏览器不支持使用video标签/此视频暂无法播放，请稍后再试",
        controlBar:{
          timeDivider: false,
          durationDisplay:true,
          remainingTimeDisplay:true,
        }
      },

      gklog:''
    };
  },
  watch: {
    duration(){

      this.continuePlay();
    }
  },
  methods: {
    async loop(currentTime){  // 视频轮询以计算播放时间
      var current = currentTime;
      //可以在这里加入请求，时刻向后端请求，通知服务器，目前视频播放的时长，以便下次播放视频，直接跳转
      this.last = current;
      await axios.post('http://localhost/dev-api/systevideom/detail/lasttime',{
          userId: localStorage.getItem('id'),
          videoId: this.id,
          lastTime: this.gklog
      })
      console.log(this.gklog)
    },
    //默认加载之后，就会执行该函数
    canplay(player){
      this.player = player;
      this.duration = player.duration();
      console.log(this.duration)
    },
    //点击视频播放
    play(player){
      clearInterval(this.timeid);
      this.interval(this.player.duration);
    },
    //点击暂停时触发
    pause(){
      clearInterval(this.timeid);
      this.loop(this.player.duration);
    },
    ended(){
      clearInterval(this.timeid);
    },
    timeupdate(player){   // 元素的currentTime发生变化时触发
      this.curr = player.currentTime;

      this.gklog = player.cache_.currentTime;//获取当前播放时间

      console.log(" 当前时间：", this.gklog);

      // 限制快进
      if(this.curr - this.oldTime > 2) {
        this.player.currentTime(this.oldTime);
        console.log("666");
      } else {
        this.oldTime = this.curr;
      }


    },
    seeked(){  // 跳跃操作完成时触发
      clearInterval(this.timeid)
    },
    interval(currentTime){
      this.timeid = setInterval(() => {
        this.loop(currentTime);
      }, 10000);
    },

    // 续播
    continuePlay(){
      let lastTime  = this.lasttime;

      if(lastTime > 0) {
        this.player.currentTime(lastTime)
        this.player.play()
      }

    }
  },
  async created() {
    this.id = localStorage.getItem('videoId');
    console.log(this.id);
    localStorage.removeItem('videoId');
    //this.$refs.videoPlayer.$el.firstChild.getElementsByClassName('vjs-custom-skin')[0].getElementsByClassName('vjs-progress-control')[0].style.pointerEvents = 'none'
    const resp = await axios.get('http://localhost:81/dev-api/systevideom/detail/' + this.id);
    const res = await axios.get('http://localhost:81/dev-api/systevideom/detail/gl', {
      params: {
        userId: localStorage.getItem('id'),
        videoId: this.id
      }
    });

    if(resp.data.code === 200 && res.data.code === 200) {
      this.theVideo = resp.data.data.videoLink;
      this.name = resp.data.data.name;
      this.createby = resp.data.data.createBy;
      this.createtime = resp.data.data.createTime;
      this.lasttime = res.data.data;
      console.log(this.lasttime)
      console.log(this.theVideo)
    } else {
      this.$message({
        type: 'error',
        message: res.data.msg
      })
    }

    this.playerOptions.sources[0].src = this.theVideo;
    this.videoDetial = JSON.parse(sessionStorage.getItem('videoData'));
  }, mounted() {
      // 获取 vue-video-player 的 DOM 元素
      const videoPlayer = this.$refs.videoPlayer.$el.firstChild;
      // 禁用进度条的点击和拖动事件
      videoPlayer.getElementsByClassName('vjs-progress-control')[0].style.display = 'none';
    }


}
</script>
