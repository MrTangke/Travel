<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购票图形统计</title>
<script type="text/javascript" src="<%=basePath%>styles/laster/echarts/echarts.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/laster/echarts/jquery-1.8.3.js"></script>
</head>
<body>
<div style="height:410px;min-height:100px;margin:0 auto;" id="main"></div>	
</body>
<script type="text/javascript">
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    var option = {
        title: {	//图表标题
            text: '景点购票数据图表'
        },
        tooltip: {
            trigger: 'axis', //坐标轴触发提示框，多用于柱状、折线图中
            /* 控制提示框内容输出格式
            formatter: '{b0}<br/><font color=#FF3333>&nbsp;●&nbsp;</font>{a0} : {c0} ℃ ' + 
           				'<br/><font color=#53FF53>●&nbsp;</font>{a1} : {c1} % ' +          
           				'<br/><font color=#68CFE8>&nbsp;●&nbsp;</font>{a3} : {c3} mm ' +
           				'<br/><font color=#FFDC35>&nbsp;●&nbsp;</font>{a4} : {c4} m/s ' +
           				'<br/><font color=#B15BFF>&nbsp;&nbsp;&nbsp;&nbsp;●&nbsp;</font>{a2} : {c2} hPa ' 
            */
        },
        dataZoom: [
             {
                 type: 'slider',	//支持鼠标滚轮缩放
                 start: 0,			//默认数据初始缩放范围为10%到90%
                 end: 100
             },
             {
                 type: 'inside',	//支持单独的滑动条缩放
                 start: 0,			//默认数据初始缩放范围为10%到90%
                 end: 100
             }
        ],
        legend: {	//图表上方的类别显示           	
        	show:true,
        	data:['景点（个）','售票（票）']
        },
        color:[
               '#FF3333',	
               '#53FF53',	
               '#B15BFF',	
               '#68CFE8',	
               '#FFDC35'	
               ],
       toolbox: {
           feature: {
             dataView: {show: true, readOnly: false},
             magicType: {show: true, type: ['line', 'bar']},
             restore: {show: true},
             saveAsImage: {show: true}
           }
         },
        xAxis:  {	//X轴 
        	name : '景点',
            type : 'category',
            data : []	//先设置数据值为空，后面用Ajax获取动态数据填入
        },
        yAxis : [	//Y轴（这里我设置了两个Y轴，左右各一个）
					{
        				//第一个（左边）Y轴，yAxisIndex为0
                         type : 'value',
                         name : '购票',
                         axisLabel : {
                             formatter: '{value} 票'	//控制输出格式
                         }
                     },
                     {
                    	//第二个（右边）Y轴，yAxisIndex为1
                         type : 'value',
                         name : '',
                         scale: true,
                         axisLabel : {
                             formatter: '{value} 个'
                         }
                     }
                 
        ],
        series : [	//系列（内容）列表                      
					{
	                    name:'景点（个）',
	                    type:'line',	//折线图表示（生成温度曲线）
	                    symbol:'emptycircle',	//设置折线图中表示每个坐标点的符号；emptycircle：空心圆；emptyrect：空心矩形；circle：实心圆；emptydiamond：菱形	                    
	                    data:[]		//数据值通过Ajax动态获取
	                },        
		        ]
		    };
    
     myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画 
    
     var sceneNames=[];		//景点数组
	 var sceneShounums=[];		//购票数量数组
	 
     $.ajax({	//使用JQuery内置的Ajax方法
         type : "post",		//post请求方式
         async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         url : "<%=basePath%>ltourist/touristShounum",	//请求发送到ShowInfoIndexServlet处
         data : {},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
         dataType : "json",		//返回数据形式为json
         success : function(result) {
        	 
        	 //请求成功时执行该函数内容，result即为服务器返回的json对象
	         if (result != null && result.listshou.length > 0) {
	                for(var i=0;i<result.listshou.length;i++){ 
	                   sceneNames.push(result.listshou[i].sceneName);		//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组
	                   sceneShounums.push(result.listshou[i].sceneShounum);
	                }
	                myChart.hideLoading();	//隐藏加载动画
	                
	                myChart.setOption({		//载入数据
	   		         xAxis: {
	   		             data: sceneNames	//填入X轴数据
	   		         },
	   		         series: [	//填入系列（内容）数据
	   		               		{
			   		             // 根据名字对应到相应的系列
			   		             name: '票',
			   		             data: sceneShounums
	   		         		}
	   		          
	   		        ]
	   		     });
	                
	         }
	         else {
	        	 //返回的数据为空时显示提示信息
	        	 alert("图表请求数据为空，您可以稍后再试！");
	          	 myChart.hideLoading();
	         }
         
		},
     	error : function(errorMsg) {
     		//请求失败时执行该函数
         	alert("图表请求数据失败，可能是服务器开小差了");
         	myChart.hideLoading();    	
     	}
    })
    
     myChart.setOption(option);	//载入图表
	 
</script>
</html>