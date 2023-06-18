<template>
  <div class="show-user-inform-shell">
    <div class="box-inform-user" v-for="form in informData" :key="form.data">
      <div class="text-inform">
        <div class="left-text-inform">{{form.topic}}</div>
        <div class="right-text-inform">{{form.state}}</div>
      </div>
      <hr style="border-top:1px solid rgb(0, 0, 0);">
      <div class="text-box-inform">
        <p class="text-title-inform">{{ form.title }}</p>
        <p class="text-details-inform">{{ form.details }}</p>
        <p class="time-inform">{{ form.time }}</p>
      </div>
      
    </div>
  </div>
</template>
<style>
.show-user-inform-shell{
  width: 100%;
  height: 100%;
  /* background-color: #eee; */
  display: flex;
  flex-wrap: wrap;
}
.box-inform-user{
  height: 160px;
  margin: 20px;
  width: 260px;
  /* width: 20%; */
  background-color: #f5fffe;
  border-radius: 10px;
  border:1px solid rgb(0, 0, 0);
  box-shadow: 0px 0px 2px;
}
.text-inform{
  height: 20%;
  background-color: #ffffff;
  /* line-height: 20%; */
  position: relative;
  border-radius: 10px;
}
.left-text-inform{
  color: #2f9aff;
  font-weight: 800;
  position: absolute;
  left: 5px;
  top: 5px;
}
.right-text-inform{
  position: absolute;
  right: 5px;
  top: 5px;
}
.text-box-inform{
  height: calc(80% - 12px);
  padding: 5px;
  overflow: auto;
  /* border:1px blue solid; */
}
.text-title-inform{
  color: #858585;
  margin-bottom: 5px;
  white-space: nowrap; 
  overflow: hidden; 
  text-overflow: ellipsis; 
}
.text-details-inform{
  font-size: 16px;
  margin-bottom: 10px;
  white-space: nowrap; 
  overflow: hidden; 
  text-overflow: ellipsis; 
}
</style>
<script>
export default {
  data() {
    return {
      informData: [
        {
          "title": "关于2023年春季课程的通知",
          "details": "各位同学：\n\n根据学校安排，2023年春季课程将于下月开始，请大家注意以下几点...",
          "time": "2023-05-26 14:30",
          "topic": "学术教育",
          "state": "已读"
        },
        {
          "title": "关于图书馆开放时间调整的通知",
          "details": "各位读者：\n\n为了更好地服务广大读者，图书馆将于近期进行开放时间调整...",
          "time": "2023-05-18 09:15",
          "topic": "文化活动",
          "state": "未读"
        },
        {
          "title": "关于2023年春季课程的通知",
          "details": "各位同学：\n\n根据学校安排，2023年春季课程将于下月开始，请大家注意以下几点...",
          "time": "2023-05-26 14:30",
          "topic": "学术教育",
          "state": "已读"
        },
        {
          "title": "关于图书馆开放时间调整的通知",
          "details": "各位读者：\n\n为了更好地服务广大读者，图书馆将于近期进行开放时间调整...",
          "time": "2023-05-18 09:15",
          "topic": "文化活动",
          "state": "未读"
        },
        // {
        //   "title": "关于2023年春季课程的通知",
        //   "details": "各位同学：\n\n根据学校安排，2023年春季课程将于下月开始，请大家注意以下几点...",
        //   "time": "2023-05-26 14:30",
        //   "topic": "学术教育",
        //   "state": "已读"
        // },
        // {
        //   "title": "关于图书馆开放时间调整的通知",
        //   "details": "各位读者：\n\n为了更好地服务广大读者，图书馆将于近期进行开放时间调整...",
        //   "time": "2023-05-18 09:15",
        //   "topic": "文化活动",
        //   "state": "未读"
        // },
        // 其他通知信息...
      ]
    }
  }
}
</script>

