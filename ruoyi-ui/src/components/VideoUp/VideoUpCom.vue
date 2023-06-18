<template>
  <ul class="video-shell">
    <li class="video-template" v-for="fordata in form" :key="fordata.title">
      <div class="picture-video"></div>
      <div class="title-video">
        {{ fordata.title }}
      </div>

      <p class="content-video">{{fordata.content}}</p>
      <p class="time-video">上传时间：{{ fordata.time }}</p>
    </li>
  </ul>
</template>

<script>
export default {
  data(){
    return {
      form : [
        {
          title: '土方工程',
          content: '土方工程是建筑工程的主要分部、分项工程之一。',
          time: '2023/6/11'
        },
        {
          title: '桩基础工程',
          content: '按桩上的荷载传递机理可分为：摩擦型桩和端承型桩',
          time: '2023/6/01'
        },
        {
          title: '混凝土工程',
          content: '混凝土是建筑工程中使用较多的材料之一，具有良好的抗压强度。',
          time: '2023/6/02'
        },
        {
          title: '钢结构工程',
          content: '钢结构工程具有自重轻、刚性好等优势，在建筑工程中应用广泛。',
          time: '2023/6/03'
        },
        {
          title: '地基与基础工程',
          content: '地基与基础是建筑工程的重要组成部分，可以分为浅基础和深基础两类。',
          time: '2023/6/04'
        },
        {
          title: '建筑防水工程',
          content: '建筑防水工程是保障建筑物长期使用的重要措施，包括屋面防水、墙体防水等方面。',
          time: '2023/6/05'
        },
        {
          title: '建筑施工工艺',
          content: '建筑施工工艺是建筑工程实施过程中的技术核心，是保证工程质量和进度的重要保障。',
          time: '2023/6/06'
        },
        {
          title: '建筑节能工程',
          content: '建筑节能工程是保护环境、推动可持续发展的重要手段，可以通过设计和建造来实现。',
          time: '2023/6/07'
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
