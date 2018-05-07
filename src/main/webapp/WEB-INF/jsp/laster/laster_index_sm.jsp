<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>'走吧'旅游后台首页</title>
<%@ include file="/styles/lasterTwo/common/laster_common_css.jsp" %>

</head>
<body>
<!-- 顶部导航 -->
<div class="navbar navbar-default" id="navbar">
        <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left" style="padding-top:20px;">
					<a href="#" class="navbar-brand">
						<small>
						<h2>'走呗'旅游管理系统</h2>
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				<div class="navbar-header operating pull-left">
				
				</div>
			   <div class="navbar-header pull-right" role="navigation">
               <ul class="nav ace-nav">	
                <li class="light-blue">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				 <span  class="time"><em id="time"></em></span><span class="user-info">欢迎超管登录<br />
					<center><c:if test="${sessionScope.superManager != null }">${sessionScope.superManager.supNickname }</c:if><!-- 超管 --></center>
				 </span>
				 <i class="icon-caret-down"></i>
				</a>
				<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
				 <li><a href="javascript:void(0)" name="" title="超管中心" class="iframeurl"><i class="icon-cog"></i>超管中心</a></li>
				 <li><a href="javascript:void(0)" name="" title="系统设置" class="iframeurl"><i class="icon-user"></i>系统设置</a></li>
				 <li class="divider"></li>
				 <li><a href="javascript:void(0)" onclick="logout()" id="Exit_system"><i class="icon-off"></i>退出</a></li>
				</ul>
			   </li>
	           <li class="purple">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-bell-alt"></i><span class="badge badge-important">8</span></a>
							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                            <li class="dropdown-header"><i class="icon-warning-sign"></i>8条通知</li>
                            <li>
                              <a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comments-alt"></i>
												最新消息
											</span>
											<span class="pull-right badge badge-info">+12</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												新订单
											</span>
											<span class="pull-right badge badge-success">+8</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												用户消息
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										查看所有通知
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

					
					</ul>

               </div>
		</div>
</div>
		<div class="main-container" id="main-container">
        <script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
	<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<a class="btn btn-success">
								<i class="icon-signal"></i>
							</a>

							<a class="btn btn-info">
								<i class="icon-pencil"></i>
							</a>

							<a class="btn btn-warning">
								<i class="icon-group"></i>
							</a>

							<a class="btn btn-danger">
								<i class="icon-cogs"></i>
							</a>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->
					<div id="menu_style" class="menu_style">
					<ul class="nav nav-list" id="nav_list">
				     <li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toHome" class="iframeurl" title=""><i class="icon-home"></i><span class="menu-text"> 首页  </span></a></li>
                     <li><a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 管理员详情 </span><b class="arrow icon-angle-down"></b></a>
					   
					   <ul class="submenu">
						 <li class="home"><a  href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="个人资料"  class="iframeurl"><i class="icon-double-angle-right"></i>个人资料</a></li>
						 <li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="其他信息"  class="iframeurl"><i class="icon-double-angle-right"></i>其他信息</a></li>
						</ul>
					</li>
					<li>
						<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 游客详情  </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
	                    <c:if test="${sessionScope.superManager != null}">
		                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>ltourist/list" title="交易信息"  class="iframeurl"><i class="icon-double-angle-right"></i>游客管理</a></li>
							<!-- <li class="home"><a href="javascript:void(0)" name="Order_Chart.html" title="交易订单（图）"  class="iframeurl"><i class="icon-double-angle-right"></i>交易订单(图)</a></li>
		                    <li class="home"><a href="javascript:void(0)" name="Orderform.html" title="订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>订单管理</a></li>
		                    <li class="home"><a href="javascript:void(0)" name="Amounts.html" title="交易金额"  class="iframeurl"><i class="icon-double-angle-right"></i>交易金额</a></li>
		                    <li class="home"><a href="javascript:void(0)" name="Order_handling.html" title="订单处理"  class="iframeurl"><i class="icon-double-angle-right"></i>订单处理</a></li>
							<li class="home"><a href="javascript:void(0)" name="Refund.html" title="理赔管理"  class="iframeurl"><i class="icon-double-angle-right"></i>理赔管理</a></li> -->
						</c:if>
	                   </ul>
				  </li>
				  <li>
						<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 订单详情  </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
	                    	<!-- 超管 -->
	                    	<c:if test="${sessionScope.superManager != null}">
			                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderBySceneList" title="景点订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>景点订单管理</a></li>
								<li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderByHotelList" title="酒店订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>酒店订单管理</a></li>
			                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderByFoodList" title="美食订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>美食订单管理</a></li>
		                    </c:if>
		                    <!-- 景点 -->
		                    <c:if test="${sessionScope.sceneGroup != null}">
			                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderByGroupSceneList?sgpId=${sessionScope.sceneGroup.sgpId}" title="${sessionScope.sceneGroup.sgpUnitname}"  class="iframeurl"><i class="icon-double-angle-right"></i>景点订单管理</a></li>
		                    </c:if>
		                    <!-- 酒店 -->
		                    <c:if test="${sessionScope.hotelGroup != null}">
			                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderByGroupHotelList?hgpId=${sessionScope.hotelGroup.hgpId}" title="${sessionScope.hotelGroup.hgpNickname}"  class="iframeurl"><i class="icon-double-angle-right"></i>酒店订单管理</a></li>
		                    </c:if>
		                    <!-- 美食 -->
		                    <c:if test="${sessionScope.cateGroup != null}">
			                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterOrder/selectOrderByGroupFoodList?cgpId=${sessionScope.cateGroup.cgpId}" title="${sessionScope.cateGroup.cgpRealname}"  class="iframeurl"><i class="icon-double-angle-right"></i>美食订单管理</a></li>
		                    </c:if>
	                   </ul>
				  </li>
					<li>
						<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 景点详情  </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
	                    	<c:forEach items="${listSceneGroup }" var="sg">
	                    		<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toSceneBySceneId?sgpId=${sg.sgpId }" title="${sg.sgpUnitname }"  class="iframeurl"><i class="icon-double-angle-right"></i>${sg.sgpUnitname }</a></li>
	                    	</c:forEach>
							<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="敬请期待..."  class="iframeurl"><i class="icon-double-angle-right"></i>敬请期待...</a></li>
	                   </ul>
				  </li>
				  <!-- 判断登录信息  酒店 -->
				  <!--  -->
				  <c:if test="${sessionScope.superManager != null || sessionScope.hotelGroup != null }">
					<li>
						<a href="<%=basePath %>lastlogin/selectHotelClassify" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text">酒店详情 </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
	                    	<!--  -->
	                    	<c:if test="${sessionScope.superManager != null}">
		                    <c:forEach items="${list}" var="s">
		                    	<c:if test="${s.areaPid==0 }">
		                    		<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lasterHotel/selectHotelList?areaId=${s.areaId}" title="${s.areaName}酒店"  class="iframeurl"><i class="icon-double-angle-right"></i>${s.areaName}酒店</a></li>
								</c:if>
							</c:forEach>
							</c:if> 
							<c:if test="${sessionScope.hotelGroup != null}">
		                    	<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lasterHotel/selectHotelGroupList?hgpId=${sessionScope.hotelGroup.hgpId}" title="${hotelInfo}"  class="iframeurl"><i class="icon-double-angle-right"></i>${hotelInfo}</a></li>
							</c:if>
	                  		 <li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="敬请期待..."  class="iframeurl"><i class="icon-double-angle-right"></i>敬请期待...</a></li>
	                   </ul>
				  </li>
				  </c:if>
				  <!-- m美食商家 -->
					<c:if test="${sessionScope.superManager != null || sessionScope.cateGroup != null }">
					<li>
						<a href="<%=basePath %>lastlogin/selectHotelClassify" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text">美食详情 </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
	                    	<!--  -->
	                    	<c:if test="${sessionScope.superManager != null}">
		                    <c:forEach items="${list}" var="s">
		                    	<c:if test="${s.areaPid==0 }">
		                    		<li class="home"><a href="javascript:void(0)" name="<%=basePath%>lastercate/selectCateList?areaId=${s.areaId}" title="${s.areaName}美食"  class="iframeurl"><i class="icon-double-angle-right"></i>${s.areaName}美食店铺</a></li>
								</c:if>
							</c:forEach>
									<%-- <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lastercate/selectCateFoodList" title="美食"  class="iframeurl"><i class="icon-double-angle-right"></i>美食表</a></li> --%>
									<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="美食"  class="iframeurl"><i class="icon-double-angle-right"></i>美食表</a></li>
							</c:if> 
							<c:if test="${sessionScope.cateGroup != null}">
		                    	<li class="home"><a href="javascript:void(0)" name="<%=basePath%>lastercate/selectCateByGroup?cgpId=${sessionScope.cateGroup.cgpId}" title="${cateInfo}"  class="iframeurl"><i class="icon-double-angle-right"></i>${cateInfo}</a></li>
		                    	<li class="home"><a href="javascript:void(0)" name="<%=basePath%>lastercate/selectFoodByGroup?cgpId=${sessionScope.cateGroup.cgpId}" title="美食"  class="iframeurl"><i class="icon-double-angle-right"></i>美食表</a></li>
							</c:if>
	                  		 <li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="敬请期待..."  class="iframeurl"><i class="icon-double-angle-right"></i>敬请期待...</a></li>
	                   </ul>
				  </li>
				  </c:if>
				  <li>
						<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 地址管理  </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
		                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>lasterArea/toAreaList" title="市-区地址"  class="iframeurl"><i class="icon-double-angle-right"></i>市-区地址</a></li>
	                   </ul>
				  </li>
				   <li>
						<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 购票详情  </span><b class="arrow icon-angle-down"></b></a>
	                    <ul class="submenu">
		                    <li class="home"><a href="javascript:void(0)" name="<%=basePath%>ltourist/touristShou" title="图形展示"  class="iframeurl"><i class="icon-double-angle-right"></i>图形展示</a></li>
	                   </ul>
				  </li>
					<li>
					<a href="#" class="dropdown-toggle"><i class="icon-picture "></i><span class="menu-text"> 图片管理 </span><b class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)" name="<%=basePath%>ltourist/selectSceneByimg" title="景点图片详情" class="iframeurl"><i class="icon-double-angle-right"></i>图片详情</a></li>
							<!-- <li class="home"><a href="javascript:void(0)" name="Sort_ads.html" title="分类管理"  class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li> -->
						</ul>
					</li>
					<li><a href="#" class="dropdown-toggle"><i class="icon-bookmark"></i><span class="menu-text"> 更多页面 </span><b class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
							<li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="文章列表" class="iframeurl"><i class="icon-double-angle-right"></i>文章列表</a></li>
                               <li class="home"><a href="javascript:void(0)" name="<%=basePath %>lastlogin/toExpect" title="分类管理" class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li>
						</ul>
					</li>
					<li>
					   <a href="javascript:void(0)" class="dropdown-toggle"><i class="icon-magnet"></i><span class="menu-text"> 正在建设... </span></a>
					</li>
					</ul>
					</div>
					
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
                    <script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
                <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="index.html">后台首页</a>
							</li>
							<li class="active"><span class="Current_page iframeurl"></span></li>
                            <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
							<li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
						</ul>
					</div>
                    
                 <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;"name="iframe" frameborder="0" src="<%=basePath %>lastlogin/toHome"></iframe>
			
		</div>
         <!--底部样式-->
       
         <div class="footer_style" id="footerstyle">  
		 <script type="text/javascript">try{ace.settings.check('footerstyle' , 'fixed')}catch(e){}</script>
          <p class="l_f">版权所有：‘走呗’旅游管理平台</p>
          <p class="r_f">地址：北京上地之眼</p>
         </div>
        
</body>
<jsp:include page="/styles/lasterTwo/common/laster_common_js.jsp"></jsp:include>	
<script type="text/javascript">	
 $(function(){ 
 var cid = $('#nav_list> li>.submenu');
	  cid.each(function(i){ 
       $(this).attr('id',"Sort_link_"+i);
   
    })  
 })
 jQuery(document).ready(function(){ 	
    $.each($(".submenu"),function(){
	var $aobjs=$(this).children("li");
	var rowCount=$aobjs.size();
	var divHeigth=$(this).height();
    $aobjs.height(divHeigth/rowCount);	  	
  }); 
    //初始化宽度、高度

    $("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140); 
	 
	$(".sidebar").height($(window).height()-99); 
    var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
	
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140);
	$(".sidebar").height($(window).height()-99); 
	
	var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
  });
    $(document).on('click','.iframeurl',function(){
                var cid = $(this).attr("name");
				var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").html(''). css("display","none").ready();		
      });
	 
    
		
});
 /******/
  $(document).on('click','.link_cz > li',function(){
	$('.link_cz > li').removeClass('active');
	$(this).addClass('active');
});
/*******************/
//jQuery( document).ready(function(){
//	  $("#submit").click(function(){
//	// var num=0;
//     var str="";
//     $("input[type$='password']").each(function(n){
//          if($(this).val()=="")
//          {
//              // num++;
//			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
//                title: '提示框',				
//				icon:0,				
//          }); 
//             // layer.msg(str+=""+$(this).attr("name")+"不能为空！\r\n");
//             layer.close(index);
//          }		  
//     });    
//})		
//	});

/*********************点击事件*********************/
$( document).ready(function(){
  $('#nav_list,.link_cz').find('li.home').on('click',function(){
	$('#nav_list,.link_cz').find('li.home').removeClass('active');
	$(this).addClass('active');
  });												
//时间设置
  function currentTime(){ 
    var d=new Date(),str=''; 
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'; 
    return str; 
} 

setInterval(function(){$('#time').html(currentTime)},1000); 
//修改密码
$('.change_Password').on('click', function(){
    layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{			  
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
});
  $('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
    	location.href = "<%=basePath %>lastlogin/logout";
    });
});
});
function link_operating(name,title){
                var cid = $(this).name;
				var cname = $(this).title;
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").html(''). css("display","none").ready();		
      
    
}

</script>


</html>