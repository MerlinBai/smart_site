<template>
	<div class="main">
		<div id="satisfaction"></div>
	</div>
</template>

<script>
import * as echarts from 'echarts';
import { getUserProfile } from "@/api/system/user";
import { request } from 'http';
import { title } from 'process';

export default {
  data() {
    return {
      satisfaction_manyi:[13,12,11,10,9,8,7,6,5,4,3,2,1],
      satisfaction_jibenmanyi:[0,0,0,0,0,0,0,0,0,0,0,0,0],
      satisfaction_bumanyi:[0,0,0,0,0,0,0,0,0,0,0,0,0],

    }
  },

  mounted() {
    this.update();

	  this.echartsheart();

  },

  methods: {
    update() {


    },

    echartsheart() {

this.update()
var chartDom = document.getElementById('satisfaction');
var myChart = echarts.init(chartDom);
myChart.clear()

setTimeout(()=>{



// let yData2 = [ 10, 50, 20, 30]
  var option;
  option = {
  color: ['skyblue', 'yellow','red',],
  tooltip: {
    confine: true,
    trigger: 'axis',
    axisPointer: { // 坐标轴指示器，坐标轴触发有效
      type: 'shadow', // 默认为直线，可选为：'line' | 'shadow'
    },
  },
  grid: {
    left: '5%',
    right: '4%',
    bottom: '10%',
    top: '10%',
  },
  legend: {
    icon: 'rect',
    orient: 'horizontal',
    left: 'right',
    itemWidth: 12,
    itemHeight: 12,
    formatter: ['{a|{name}}'].join('\n'),
    textStyle: {
      fontSize: 12,
      color: '#6A93B9',
      height: 8,
      rich: {
        a: {
          verticalAlign: 'bottom',
        },
      },
    },
    data: ['满意', '基本满意','不满意'],
  },
  xAxis: {
    type: 'category',
    axisLine: {
      lineStyle: {
        color: 'rgba(255,255,255,0.45)',
      },
    },
    axisLabel: {
      // interval:0,
      fontSize: 12,
      color: '#6A93B9',
    },
    // axisTick: {
    //   show: false,
    // },
    data: ['前孙镇', '郑家寨镇', '徽王庄镇', '丁庄镇', '临齐街道', '边临镇','于集乡', '神头镇', '开发区','义渡口镇', '糜镇', '宋家镇', '滋镇'],
  },
  yAxis: {
    type: 'value',
    // min: 0,
    // minInterval: 1,
    nameTextStyle: {
      fontSize: 12,
      color: '#BAE7FF',
      align: 'center',
    },
    axisLine: { show: false },
    axisTick: { show: false },
    splitArea: { show: false },
    splitLine: {
      lineStyle: {
        color: 'rgba(255, 255, 255, 0.15)',
        // type: 'dashed', // dotted 虚线
      },
    },
    axisLabel: {
      fontSize: 12,
      color: '#6A93B9',
      fontFamily: 'Bebas',
    },
  },
  series: [
    // { name: '满意', type: 'bar', barWidth: 25, stack: 'total', data: [6, 8, 9, 3, 2, 5, 8,10] ,},
    { name: '满意', type: 'bar', barWidth: 25, stack: 'total', data: this.satisfaction_manyi ,},
    { name: '基本满意', type: 'bar', barWidth: 25, stack: 'total', data: this.satisfaction_jibenmanyi ,},
    { name: '不满意', type: 'bar', barWidth: 25, stack: 'total', data: this.satisfaction_bumanyi },
  ],
};


option && myChart.setOption(option);
},800)
},

      }
    };

    
</script>

<style scoped>
  /* .main {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-around;
  } */
	#satisfaction {
    margin: 0 auto;
    width: 70%;
		height: 600px;
		border: 0px solid grey;
    /* margin: 0 auto; */
	}

</style>