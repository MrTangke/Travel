<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>走呗</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/loginbackground/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/loginbackground/css/default.css">
<link href="<%=basePath%>styles/loginbackground/css/fullscreenDemo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/common/elastic_login.css"/>
</head>
<body>
    <div id="bg_wrap">
        <div><img src="images/1.jpg" width="100%" height="100%"></div>
        <div><img src="images/2.jpg" width="100%" height="100%"></div>
        <div><img src="images/3.jpg" width="100%" height="100%"></div>
    </div>
    <div id="Login">
        <h3 id="title" class="move" style="margin-top:-2px">User Login</h3>
        <form action="#" method="post" target="_blank">
            <input type="text" placeholder="UserName" name="username" id="username" class="text move">
            <input type="password" placeholder="PassWord" name="password" id="password" class="text move">
            <input type="submit" value="Sign in" class="btn move" id="submit">
        </form>
    </div>
</body>
<script src="<%=basePath%>styles/loginbackground/js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>styles/loginbackground/dist/vidbg.js"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
//动态北京mp4引入
jQuery(function($){
    $('body').vidbg({
        'mp4': '<%=basePath%>styles/loginbackground/media/mp4_video.mp4',
        'webm': '<%=basePath%>styles/loginbackground/media/webm_video.webm',
        'poster': '<%=basePath%>styles/loginbackground/media/fallback.jpg',
    }, {
      // Options
      muted: true,
      loop: true,
		overlay: true,
   	 });
	}); 
	
	//重力弹跳图
	/*背景渐变*/
    /*function(){}   匿名函数
      ()()           IIFE匿名函数立刻执行，函数自执行体*/
    (function() {
        var timer = null; //声明定时器
        var oImg = document.querySelectorAll('#bg_wrap div') //h5最新元素获取写法获取到的是一组元素
        //querySelector获取单个元素的   兼容ie8
        var len = oImg.length; //3
        var index = 0;
        timer = setInterval(function() {
            oImg[index].style.opacity = 0;
            index++;
            // if(index>=3){
            //  index=0;
            // }
            index %= len; //index=index%len求模取余 0%3=0; 1%3=1; 2%3=2; 3%3=0;
            oImg[index].style.opacity = 1;
        }, 2000);
    })();
    // 重力模拟弹跳系统
    (function() {
        /*
        改变定位元素的top值
        达到指定位置之后进行弹跳一次
        多个元素一次运动
        动画序列*/
        var oMove = document.querySelectorAll('.move');
        var oLen = oMove.length;
        var timer = null;
        var timeout = null;
        var speed = 3; //移动距离
        move(oLen - 1);
 
        function move(index) {
            if (index < 0) {
                clearInterval(timer); //清除循环定时器
                clearTimeout(timeout); //清除延时定时器
                return; //终止函数
            }
            var endTop = 150 + (index * 60); //根据下标计算endTop值
            timer = setInterval(function() {
                speed += 3;
                var T = oMove[index].offsetTop + speed; //设置每一次的top值
                if (T > endTop) {
                    T = endTop;
                    speed *= -1 //取反，让移动距离变为负数
                    speed *= 0.4;
                    //慢慢停下来
                }
                oMove[index].style.top = T + 'px';
            }, 20);
            timeout = setTimeout(function() {
                clearInterval(timer);
                index--;
                console.log(9);
                move(index);
                console.log(index);
            }, 900) //过900毫秒之后再执行方法里的代码
        }
    })()
</script>
</html>