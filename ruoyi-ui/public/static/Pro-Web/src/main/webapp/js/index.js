let baseurl = "http://localhost:80/dev-api";

// 1.入驻企业饼图
( () => {
    function getCompanyReport(){
        $.ajax({
            type: "POST",
            url: baseurl + "/company/getcompanyreport",
            success: function(data){
                option.series[0].data = data;
            },
             async:false  //false表示同步请求，true表示异步请求
        });
    };
    // 1.初始化echarts实例对象
    var myChart = echarts.init(document.getElementById("settle-in"));

    // 2.指定配置项与数据
    let option = {
        tooltip: {
            trigger: 'item'
        },
        series: [
            {
                name: '入住企业',
                type: 'pie',
                radius: '50%',
                data: [
                    { value: 1048, name: 'Search Engine' },
                    { value: 735, name: 'Direct' },
                    { value: 580, name: 'Email' },
                    { value: 484, name: 'Union Ads' },
                    { value: 300, name: 'Video Ads' }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 1)'
                    }
                }
            }
        ]
    };

    getCompanyReport();

    // 3.将配置项设置给echarts实例对象
    myChart.setOption(option);

    // 4. 让图表跟随屏幕自动的去适应
    window.addEventListener("resize", function () {
        myChart.resize();
    });



})();

// 2.天气情况
(function () {
    // 1. 实例化对象
    var myChart = echarts.init(document.getElementById("temperature"));
    // 2.指定配置
    var option = {
        // 通过这个color修改两条线的颜色
        color: ["#00f2f1", "#ed3f35"],
        tooltip: {
            trigger: "axis"
        },
        legend: {
            // 如果series 对象有name 值，则 legend可以不用写data
            // 修改图例组件 文字颜色
            textStyle: {
                color: "#4c9bfd"
            },
            // 这个10% 必须加引号
            right: "10%"
        },
        grid: {
            top: "20%",
            left: "3%",
            right: "4%",
            bottom: "3%",
            show: true, // 显示边框
            borderColor: "#012f4a", // 边框颜色
            containLabel: true // 包含刻度文字在内
        },

        xAxis: {
            type: "category",
            boundaryGap: false,
            data: [
                "1月",
                "2月",
                "3月",
                "4月",
                "5月",
                "6月",
                "7月",
                "8月",
                "9月",
                "10月",
                "11月",
                "12月"
            ],
            axisTick: {
                show: false // 去除刻度线
            },
            axisLabel: {
                color: "#4c9bfd" // 文本颜色
            },
            axisLine: {
                show: false // 去除轴线
            }
        },
        yAxis: {
            type: "value",
            axisTick: {
                show: false // 去除刻度线
            },
            axisLabel: {
                color: "#4c9bfd" // 文本颜色
            },
            axisLine: {
                show: false // 去除轴线
            },
            splitLine: {
                lineStyle: {
                    color: "#012f4a" // 分割线颜色
                }
            }
        },
        series: [
            {
                name: "最高气温",
                type: "line",
                // true 可以让我们的折线显示带有弧度
                smooth: true,
                data: [30, 31, 35, 32, 37, 38, 40, 41, 38, 36, 32, 27]
            },
            {
                name: "最低气温",
                type: "line",
                smooth: true,
                data: [25, 25, 27, 20, 32, 33, 35, 32, 32, 30, 28, 23]
            }
        ]
    };

    // 3. 把配置给实例对象
    myChart.setOption(option);
    // 4. 让图表跟随屏幕自动的去适应
    window.addEventListener("resize", function () {
        myChart.resize();
    });

})();

// 3.岗位人员统计
(function () {
    var myColor = ["#1089E7", "#F57474", "#56D0E3", "#F8B448", "#8B78F6"];
    // 1. 实例化对象
    var myChart = echarts.init(document.getElementById("engineering-vehicle"));
    // 2. 指定配置和数据
    var option = {
        grid: {
            top: "10%",
            left: "22%",
            bottom: "10%"
            // containLabel: true
        },
        // 不显示x轴的相关信息
        xAxis: {
            show: false
        },
        yAxis: [
            {
                type: "category",
                // 类目反转
                inverse: true,
                data: ["管理人员", "业务人员", "财务人员", "服务人员", "技术人员"],
                // 不显示y轴的线
                axisLine: {
                    show: false
                },
                // 不显示刻度
                axisTick: {
                    show: false
                },
                // 把刻度标签里面的文字颜色设置为白色
                axisLabel: {
                    color: "#fff"
                }
            },
            {
                data: [702, 350, 610, 793, 664],
                inverse: true,
                // 不显示y轴的线
                axisLine: {
                    show: false
                },
                // 不显示刻度
                axisTick: {
                    show: false
                },
                // 把刻度标签里面的文字颜色设置为白色
                axisLabel: {
                    color: "#fff"
                }
            }
        ],
        series: [
            {
                name: "条",
                type: "bar",
                data: [70, 34, 60, 78, 69],
                yAxisIndex: 0,
                // 修改第一组柱子的圆角
                itemStyle: {
                    borderRadius: 20,
                    // 此时的color 可以修改柱子的颜色
                    color: function (params) {
                        // params 传进来的是柱子对象
                        // console.log(params);
                        // dataIndex 是当前柱子的索引号
                        return myColor[params.dataIndex];
                    }
                },
                // 柱子之间的距离
                barCategoryGap: 50,
                //柱子的宽度
                barWidth: 10,
                // 显示柱子内的文字
                label: {
                    show: true,
                    position: "inside",
                    // {c} 会自动的解析为 数据  data里面的数据
                    formatter: "{c}%"
                }
            },
            {
                name: "框",
                type: "bar",
                barCategoryGap: 50,
                barWidth: 15,
                yAxisIndex: 1,
                data: [100, 100, 100, 100, 100],
                itemStyle: {
                    color: "none",
                    borderColor: "#00c1de",
                    borderWidth: 3,
                    barBorderRadius: 15
                }
            }
        ]
    };

    // 3. 把配置给实例对象
    myChart.setOption(option);
    // 4. 让图表跟随屏幕自动的去适应
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();

// 4.获取资产数据
(()=>{
    $.ajax({
        type: "POST",
        url: baseurl + "/assetstotal/findbyid?id=1",
        success: function(data){
            $("#totalAssets").html(data.totalAssets)
            $("#totalInvestment").html(data.totalInvestment)
            $("#totalNetProfit").html(data.totalNetProfit)
            $("#totalRevenue").html(data.totalRevenue)
        }
    });
})();

//5 获取工地概况
(()=>{
    $.ajax({
        type: "POST",
        url: baseurl + "/siteinfo/findbyid?id=1",
        success: function(data){
            $("#companyNumber").html(data.companyNumber)
            $("#dettledCompanyNumber").html(data.dettledCompanyNumber)
            $("#engagedPeopleNumber").html(data.engagedPeopleNumber)
            $("#coveredArea").html(data.coveredArea)
            $("#constructionErea").html(data.constructionErea)
            $("#constructionLandErea").html(data.constructionLandErea)

        }
    });
})();

//6 实时车位
(()=>{
    getparkinginfo();
    // setInterval(()=>{
    //     getparkinginfo();
    // },1000*60)

    function getparkinginfo(){
        $.ajax({
            type: "POST",
            url: baseurl + "/parking/getparkinginfo",
            success: function(data){
                console.dir(data)
                $("#parkingNumber").html(data.parkingNumber)
                $("#gatesNumber").html(data.gatesNumber)
                $("#parkingSpace").html(data.parkingSpace)
                $("#entryNumber").html(data.entryNumber)
                $("#outNumber").html(data.outNumber)
                $("#vehiclesNumber").html(data.vehiclesNumber)
            }
        });
    }
})();

//7 安防新闻、滚动新闻
(()=>{
    $.ajax({
        type: "POST",
        url: baseurl + "/news/getnews",
        async:false,
        success: function(data){
            data.map( item => {
                let str = item.createDate.slice(0,19).replace(/-/g,"/").replace(/T/g," ");
                let date = new Date(str);
                $(".marquee1").append(`<li style="display: flex;text-align: right">
                        <div className = "title" style="flex: 1"> ${item.title} </div>
                        <div className="times" style="flex: 1"> ${date.getMonth()+1}.${date.getDate()} </div>
                        <div className="status processed" style="flex: 1">${item.type==1?"<span style='color:green'>已处理</span>":"<span style='color:red'>待处理</span>"} </div>
                    </li>`)
                $(".marquee2").append(`<li style="display: flex;text-align: right">
                        <div className = "title" style="flex: 1"> ${item.content} </div>
                        <div className="times" style="flex: 1"> ${date.getMonth()+1}.${date.getDate()} </div>
                        <div className="status processed" style="flex: 1">${item.type==1?"<span style='color:green'>已处理</span>":"<span style='color:red'>待处理</span>"} </div>
                    </li>`)
            })
        }
    });
})();

//8 环境质量
(()=>{
        $.ajax({
        type: "POST",
        url: baseurl + "/environment/getenvironmentquality",
        async:false,
        success: function(data){
            data.map( item => {
                $(".marquee3").append(`  <li>
                    <div>${item.checkpoint.name}</div>
                    <div>${item.temperature}</div>
                    <div>${item.pm25}</div>
                    <div>${item.humidity}</div>
                    <div>${item.noise}</div>
                    <div>${item.windSpeed}</div>
                </li>`)
            })
        }
    });
})()
