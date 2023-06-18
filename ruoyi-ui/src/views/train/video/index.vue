<template>
  <div class="train-video-shell">
    <div class="identity-TV">
      <el-menu :default-active="activeIndex" class="el-menu-demo El-menu" mode="horizontal" @select="handleSelect">
        <el-menu-item index="2"  >我上传的课</el-menu-item>
        <div class="finding-TV">
          <el-input class="finding-input"></el-input>
          <p class="text-TV">
            查找
          </p>
        </div>
      </el-menu>
    </div>
    <div class="show-TV">
      <el-button type="primary" style="margin-left: 10px;" @click="DialogVisible=true">上传视频</el-button>
      <video-up-com ></video-up-com>
    </div>

<!--    <div class="upload-box" v-if="select">-->
    <el-dialog
      title="技能学习"
      :visible.sync="DialogVisible"
      width="30%"
      height="40%"
    >
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="视频标题">
          <el-input v-model="form.name" style="width: 40vh"></el-input>
        </el-form-item>
        <span style="font-family: YouYuan;font-weight: 600;margin-left: 1.5vh;">视频封面上传:</span>

          <el-upload
            :before-upload="beforeimg"
            class="upload"
            drag
            auto-upload
            show-file-list
            limit="1"
            action="#"
            name="video"
            accept=".jpg,.jpeg,.png"
            :http-request="uploadimg"
            headers="'Content-Type': 'multipart/form-data'" style="margin-left: 4vh;margin-top: 1vh;"
            >
            <i class="el-icon-folder" style="font-size: 8vh;margin-top: 6vh;"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          </el-upload>

          <span style="font-family: YouYuan;font-weight: 600;margin-left: 1.5vh;">视频上传:</span>
          <el-upload
            :befaor-upload="beforevideo"
            class="upload"
            drag
            show-file-list
            limit="1"
            auto-upload
            action="#"
            name="video"
            accept=".mp4"
            :http-request="upload"
            headers="'Content-Type': 'multipart/form-data'" style="margin-left: 4vh;margin-top: 1vh;"
            >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          </el-upload>


        <div style="margin-top: 5vh;">
          <el-button type="success" class="upvideo-btn" @click="addvideo">确认上传</el-button>
          <el-button type="info" class="info-btn" @click="DialogVisible=false">取消上传</el-button>
        </div>
      </el-form>
    </el-dialog>
<!--    </div>-->

  </div>
</template>

<script>
import VideoUpCom from '@/components/VideoUp/VideoUpCom.vue'
import axios from 'axios'
export default {
  components: { VideoUpCom  },
  data() {
    return {
      select:false,
      form: [],
      DialogVisible: false
    };
  }, created() {
    this.form.createBy = this.$store.state.user.name;
    this.form.userId = localStorage.getItem('id');


  },
  methods: {
    async upload(param) {
      console.log("666")
      const formData = new FormData()
      formData.append('file',param.file)

     /*  const token = Cookies.get("Admin-Token")
      console.log("666")
      console.log(token) */
      const resp = await axios({
        url: 'http://localhost/dev-api/common/upload',
        method: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ' + this.$store.state.user.token
        },
        data: formData
      })
      this.form.videoLink = resp.data.url;

    },async uploadimg(param) {
      console.log("666")
      const formData = new FormData()
      formData.append('file',param.file)

      /*  const token = Cookies.get("Admin-Token")
       console.log("666")
       console.log(token) */
      const resp = await axios({
        url: 'http://localhost/dev-api/common/upload',
        method: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ' + this.$store.state.user.token
        },
        data: formData
      })
      this.form.img = resp.data.url;

    },
    addvideo() {
      this.$confirm('请确认是否添加', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        const resp = await axios.post('http://localhost/dev-api/systevideom/detail', {
          userId: this.form.userId,
          createBy: this.form.createBy,
          videoLink: this.form.videoLink,
          name: this.form.name,
          img: this.form.img
        })

        if(resp.data.code === 200) {
          this.$message({
            type: 'success',
            message: '上传成功'
          })
          this.select = !this.select;
        } else {
          this.$message({
            type: 'error',
            message: resp.data.msg
          })
        }

        this.DialogVisible = false

      }).catch(() => {
        this.$message({
            type: 'info',
            message: '取消添加'
          },
          this.DialogVisible = false
        );
      });


    }, beforeimg(file) {
      var testmsg = file.name.substring(file.name.lastIndexOf(".") + 1);
      const extension = (testmsg === "jpg") || (testmsg === jpeg) || (testmsg === png);
      if (!extension ) {
        this.$message({
          message: "上传文件只能是jpg/png/jpeg格式!",
          type: "warning",
        });
      }
      return extension;
    },beforevideo(file) {
      var testmsg = file.name.substring(file.name.lastIndexOf(".") + 1);
      const extension = testmsg === "mp4";
      if (!extension ) {
        this.$message({
          message: "上传文件只能是mp4格式!",
          type: "warning",
        });
      }
      return extension;
    }
  }
}
</script>

<style>



.info-btn{
  position: absolute;
  bottom: 20px;
  left: 70%;
  transform: translate( -50%,0);
}
.upvideo-btn{
  position: absolute;
  bottom: 20px;
  left: 30%;
  transform: translate( -50%,0);
}
.upload-demo{
  padding: 20px;
  width: 188px;
  height: 300px;
  background-color: rgb(207, 239, 253);
  border-radius: 10px;
  margin: 0 auto;
}
.upload-box{
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%,-50%);
  width: 60vh;
  height: 80vh;
  background-color: rgb(245, 246, 246);
  border-radius: 20px;
  border: black 1px solid;
  margin: 0 auto;
  padding-top: 20px;
}
.desc{
  font-size: 24px;
}

.train-video-shell{
  position: relative;
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
