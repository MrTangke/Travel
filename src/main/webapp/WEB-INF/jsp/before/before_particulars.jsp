<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>景点详情</title>
</head>
<%@ include file="/styles/before/common/before_common_css.jsp" %>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=YnGGbpNOhG2BB4VOlYjHcqG5MVvnbOSF"></script>
<body>

<!-- begin center 景点内容上 三级联动 -->
<div class="center">
	<div class="index_body_about">
		    <div class="index_top">
			    <div class="top_logo">
			        <h3>定制您的人生体验</h3>
			        <a href="<%=basePath %>index/index">
			        <img src="<%=basePath %>styles/before/webimages/index_02.png" width="117" height="121" alt="" /></a>
		    	</div>
			    <div class="top_menu">
			        <div class="login">
			            <em style="display:none;">分享</em> 
		            	<c:if test="${sessionScope.tourist == null }"><a href="<%=basePath %>login/login">登录</a>|<a href="<%=basePath %>login/register">注册</a></c:if>
		            	<c:if test="${sessionScope.tourist != null }">欢迎登录：${sessionScope.tourist.touristRealname }</c:if>
		                 <span><a href="javascript:void(0)">招聘信息</a></span>
                   </div>
			        
			        
			      <div class="c-block">
            <!-- begin search-wrap -->
            <div class="search-wrap">
                <div class="search" id="search">
                	<!-- 搜索表单 -->
                    <form action="#" class="search__form" id="search_form" name="searchform" data-range="state" method="GET" style="width: 420px;">
                        <span></span>
                        <input type="text"  id="search_input" name="q" placeholder="找北京吃喝玩乐" >
                        <a class="search__btn" href="javascript:void(0);">搜索</a>
                        <!-- javascript:document.getElementById('search_form').submit(); -->
                    </form>
                </div>
            </div>
           <!-- end search-wrap -->
        </div> 
		    </div>
		    <div class="clear">
		    </div>
		</div>
		</div>


    <!-- begin grid -->
    <div class="w1160 grid">
        <!-- begin main -->
        <div class="seo-main">
                        <div class="crumb">
                <div class="crumb__sub__con">
                    <div class="crumb__list">
                        <a href="//www.mxtrip.cn/destination/">目的地</a>
                    </div>
                    <ul class="text__list" style="display: none;">
                   </ul>
                </div>
                <!-- 内容地区 -->
                <div class="crumb__sub__con">
                    <div class="crumb__list">
                       <a href="//www.mxtrip.cn/mdd_zhongguo/">中国旅游</a>
                    </div>
                    <ul class="text__list" style="display: none;">
                    </ul>
                </div>
                <!-- 澳门地区 -->
                <div class="crumb__sub__con">
                <div class="crumb__list">
                    <a href="//www.mxtrip.cn/mdd_aomen/">${area2.areaName}</a>
                </div>
                    <ul class="text__list" style="display: none;">
                    	<!-- 循环市下面的区域地址 -->
			             <c:forEach items="${listArea}" var="s">
			             	<c:if test="${s.areaPid==area2.areaId}">
			             		<li><a href="" target="_blank">${s.areaName}</a></li>
			             	</c:if>
			             </c:forEach>
                    </ul>
                </div>
                
                <div class="crumb__sub__con">
                   <div class="crumb__list">
                       <a href="//www.mxtrip.cn/jingdian/mdd_aomen/">${area.areaName}</a>
                   </div>
                    <ul class="text__list" style="display: none;">
                       <!-- 循环区下面的景点地址 -->
                       <c:forEach items="${listScene}" var="s">
                       		<c:if test="${s.areaId==area.areaId}">
                       			<li><a href="" target="_blank">${s.sceneName}</a></li>
                       		</c:if>
                       </c:forEach>
                    </ul>
                </div>
                <!-- 最后一级别 -->
                <div class="crumb__list">
                    <em style="color: #8957a1;font-size: 23px;">${scene.sceneName}</em>
                </div>
            </div>
            <!-- begin poiDetail  图片轮播图片 -->
            <div class="POIDETAIL--col2-row2 poiDetail">
                <div class="poiDetail__above clearfix">
                    <div id="slider" class="poiDetail__pic">
                        <ul class="pic__list slides">
                          <c:forEach items="${listImg}" var="s">
                           <li><a href=""><img style="height:159px" src="<%=basePath%>${s.imgUrl}" alt="故宫博物馆"></a></li>
                          </c:forEach>
                        </ul>
                        <ul class="ctrl__list">
                            <li class="text"><a href="//www.mxtrip.cn/album/kWZ4gFXUgUg/">查看全部图集</a></li>
                        </ul>
                    </div>
					<!-- 景点标题  -->
                    <div class="poiDetail__con">
                        <h1 class="poiDetail__title"><a href="">${scene.sceneName}</a></h1>
                        <div class="poiDetail__subTitle" style="height: 25px;">Travelers focus on travel 
                        <span style="margin-left:50px">待售票数&nbsp;&nbsp;:&nbsp;&nbsp;${scene.sceneNums-scene.sceneShounum}&nbsp;&nbsp;张  </span>
                        </div>
                        <div class="poiDetail__assess">
                            <!-- begin rating -->
                            <div class="RATING-w98-h18 rating">
                                <!-- 星星评级 -->
	                        	<font>
	                        		<span>推荐指数:</span>
	                        		<c:forEach begin="1" end="${scene.sceneLevel}">
										<img alt="#" style="width: 15px;padding-top: 3px;" src="<%=basePath%>upload/imgs/xingxing/xingxing.png">
									</c:forEach>
	                        	</font>
                               
                            </div>
                            <!-- end rating 显示用户评论-->
                            <div class="poiDetail__comment" style="margin-top: 3px;">${record}评论</div>
                            <div class="poiDetail__rank" style="margin-top: 3px;">${area2.areaName}景点排名<em>NO.<c:if test="${count==0}">未排名</c:if><c:if test="${count != 0}">${count}</c:if></em> </div>
                       </div>
						<!-- 景点标签 -->
                       <ul class="poiDetail__tag">
	                        <li>
	                        	<input type="hidden" id="sceneTypeId" value="${sceneType.typeId}"/>
	                        	<a href="">${sceneType.typeName }</a>
	                        </li>
	                        <li style="background: #8957a1;margin-left: 100px;">
	                        	<a href="javascript:void(0)" onclick="toOrder('${scene.sceneId }')" style="color: #fff;">确认预约</a>
	                        </li>
	                        &nbsp;&nbsp;
	                        <li style="background: #8957a1;">

	                        	<a href="javascript:void(0)" style="color: #fff;" onclick="collect('${scene.sceneId }')">收藏景点</a>

	                        </li>
                       </ul>
                  </div>
                </div>
                
     <!-- 景点介绍 -->   
     <div class="poiDetail__below">
     <div class="flow-block">
        ${scene.sceneName}简介&nbsp;&nbsp;:&nbsp;&nbsp;${scene.sceneContent} 
       	<br/> <br/> 
       	景区电话&nbsp;&nbsp;:&nbsp;&nbsp;${scene.scenePhone }         
     </div>
     </div>
 </div>
        <!-- end main -->
        
        
        <!-- begin sub 右侧地图-->
        <div class="sub">
            <!-- begin sub-practical -->
            <div class="map-practical mod">
                <div class="mod__hd">
                    <div class="mod__hd__line"></div>
                    <h2 class="mod__title" title="大三巴牌坊实用信息">实用信息</h2>
                </div>
                <div class="mod__bd">
				    <!-- 地图定位 -->
                  <!--   <div class="map-practical__map"> -->
                       	<div id="allmap" class="map-practical__map"></div>
                   <!--  </div> -->
                    <div class="map-practical__info">
                        <dl>
                            <dt>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</dt>
                            <dd>${scene.sceneAddress}</dd>
                        </dl>
                        <dl>
                            <dt>交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通</dt>
                            <dd>${scene.sceneLine}</dd>
                        </dl>
                	</div>
                </div>
            </div>
            <!-- end sub-practical 截止地图--交通 -->
            
            <!-- begin delicacy -->
            <!-- end delicacy -->
            <!-- begin adv -->
                        
            <!-- begin nearFood 美食推荐 -->
            <div class="nearFood mod">
                <div class="mod__hd">
                    <i class="mod__hd__line"></i>
                    <h3 class="mod__title" title="${scene.sceneName}附近美食">附近美食</h3>
                </div>
                <c:forEach items="${listCate}" var="s">
                   <div class="mod__bd">
                    <div class="nearFood__list">
                        <!-- begin nearFood__item -->
                        <div class="nearFood__item">
                            <div class="nearFood__pic">
                                <a href="//www.mxtrip.cn/poi/kWk5gWw3hFoF/" target="_blank" title="${s.cateShopname }"><img data-echo="<%=basePath%>${s.cateLogo}" src="<%=basePath%>${s.cateLogo}" width="120" height="80" alt="${s.cateShopname }" /></a>                            </div>
                            <div class="nearFood__text">
                                <div class="nearFood__item__title">
                                    <a href="">${s.cateAddress}</a>
                                </div>
                                <div class="nearFood__distance">
                                    <!-- begin rating -->
                                    <div class="RATING-w84-h16 rating">
                                        <div class="rating__bg"></div>
                                        <div class="rating__show" style=" width: 130px;">
                                        	<c:forEach begin="1" end="${s.levelId}">
												<img alt="#" style="width: 11px;padding-top: 4px;" src="<%=basePath%>upload/imgs/xingxing/xingxing.png">
											</c:forEach>
                                        </div>
                                        <input class="rating__value hide" type="text" value="4.40">
                                    </div>
                                    <!-- end rating -->
                                    <div class="text">距离659m</div>
                                </div>
                                <div class="nearFood__item__info">
                                    <div class="nearFood__item__mdd">
                                        <a>${s.cateMessage}</a>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end nearFood__item -->
                    </div>
                </div>
                </c:forEach>
                 
            </div>
            <!-- end nearFood 美食推荐结束-->
            
            
           <!-- 酒店推荐-->
            <div class="nearFood mod">
                <div class="mod__hd">
                    <i class="mod__hd__line"></i>
                    <h3 class="mod__title" title="${scene.sceneName}附近酒店">附近酒店</h3>
                </div>
                <c:forEach items="${listHotel}" var="s">
                 <div class="mod__bd">
                    <div class="nearFood__list">
                        <!-- begin nearFood__item -->
                        <div class="nearFood__item">
                            <div class="nearFood__pic">
                                <a href="//www.mxtrip.cn/poi/kWXUgFGSgUg/" target="_blank" title="${s.hotelHotelname}"><img data-echo="<%=basePath%>${s.hotelLogo}" src="<%=basePath%>${s.hotelLogo}" width="120" height="80" alt="${s.hotelHotelname}" /></a>                            </div>
                            <div class="nearFood__text">
                                <div class="nearFood__item__title">
                                    <a href="//www.mxtrip.cn/poi/kWXUgFGSgUg/">${s.hotelHotelname}</a>
                                </div>
                                <div class="nearFood__distance">
                                    <!-- begin rating -->
                                    <div class="RATING-w84-h16 rating">
                                        <div class="rating__bg"></div>
                                        <div class="rating__show" style=" width: 130px;">
                                        	<c:forEach begin="1" end="${s.levelId}">
												<img alt="#" style="width: 11px;padding-top: 4px;" src="<%=basePath%>upload/imgs/xingxing/xingxing.png">
											</c:forEach>
                                        </div>
                                        <input class="rating__value hide" type="text" value="4.40">
                                    </div>
                                    <!-- end rating -->
                                    <div class="text">距离675m</div>
                                </div>
                                <div class="nearFood__item__info">
                                    <div class="nearFood__item__mdd">
                                        <a>${s.hotelMessage}</a>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end nearFood__item -->
                    </div>
                </div>
                </c:forEach>
         </div>
            <!-- 酒店推荐结束 -->
       </div>
        <!-- end sub -->
        
        
        <!-- 2018年4月19日10:57:52  待完成功能评论，订单模块完成后再实现 -->
        <!-- 网友景点评论 -->
        <div class="main">
            <!-- begin correlation-info -->
            <div class="mt10 correlation-info mod">
                <div class="mod__hd">
                    <div class="mod__hd__line"></div>
                    <h2 class="mod__title" title="${scene.sceneName}网友点评 （${record}点评）">网友点评 （${record}点评）</h2>
                </div>
                <div class="mod__bd">
                </div>
            </div>
            <!-- end 以上评论标题 -->

            <!-- begin 评论分类标签 -->
            <div id="poiCommentTag" class="REMARK--tag tagRemark clearfix">
                <ul>
                    <li class="tagRemark__positive" data-url="/place-kWZ4gFXUgUg-tid-0/">全部</li>
                    <li class="tagRemark__positive" data-url="/place-kWZ4gFXUgUg-tid-1/">好评(0)</li>
                    <li class="tagRemark__positive tagRemark__passive" data-url="/place-kWZ4gFXUgUg-tid-2/">差评(0)</li>
                    <li class="tagRemark__positive" data-url="/place-kWZ4gFXUgUg-tid-3/">有图(0)</li>
                    <li class="tagRemark__positive " data-url="/place-kWZ4gFXUgUg-tid-3898772206/">环境不错(0)</li>
                    <li class="tagRemark__positive " data-url="/place-kWZ4gFXUgUg-tid-1153523456/">游客多(0)</li>
                    <li class="tagRemark__positive " data-url="/place-kWZ4gFXUgUg-tid-4274677315/">人气旺(0)</li>
                    <li class="tagRemark__positive " data-url="/place-kWZ4gFXUgUg-tid-3793383985/">视野不错(0)</li>
                    <li class="tagRemark__positive  tagRemark__passive" data-url="/place-kWZ4gFXUgUg-tid-253050788/">人气冷清(0)</li>
                </ul>
            </div>
            <!-- end tagRemark -->


        <!-- begin 评论区 -->
        <div id="poiCommentList">
           <div class="REMARK--list remarkList clearfix">
           	<!-- 第一个评论用户头像 -->
  			<div class="remarkList__touxiang">
              <img src="https://img.mxtrip.cn/543b1ce7c8dcb190c61afb9c6f4254dc.jpeg@100Q_80w_80h_1pr_1c_1e" alt="">
          	</div>
        <div class="remarkList__con">
        <!-- 第一个评论用户名称日期 -->
        <dl class="remarkList__userName">
            <dt>嘉澍_Payne</dt>
            <dd>2018-04-11</dd>
        </dl>
        
        <!-- end 评论内容 -->
        <div class="remarkList__summary">
            <div class="poi-comment">
                <em>旅途劳累，当时兴致不是很高，朋友一致推荐这里，没想到来了之后，整个身心都舒爽了，蛮值得的，游客很多，一条街景色不错。</em>
                <p></p>
            </div>
        </div>
        <!-- 评论图片 -->
        <div class="remarkList__picContainer">
              <div class="remarkList__pic">
                <img data-echo="https://n3-q.mxtrip.net/1d5643b5e300d540c836d5c00b794fa7.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="嘉澍_Payne" />            
              </div>
              <div class="remarkList__pic">
                <img data-echo="https://n2-q.mxtrip.net/ec5740b27bd3d71333683f906e3cc8a8.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="嘉澍_Payne" />            
              </div>
              <div class="remarkList__pic">
                <img data-echo="https://n1-q.mxtrip.net/edbefe53631cbd44f5f448fb2a7899ae.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="嘉澍_Payne" />            
              </div>
        </div>
    </div>
</div>

<!-- 第二个评论 -->
<div class="REMARK--list remarkList clearfix">
	<!-- 用户评论头像 -->
    <div class="remarkList__touxiang">
        <img src="https://img.mxtrip.cn/6d09e3dc865940805463cb4b81a8e57b.jpeg@100Q_80w_80h_1pr_1c_1e" alt="">
    </div>
    <div class="remarkList__con">
    	<!-- 评论用户姓名 -->
        <dl class="remarkList__userName">
            <dt>震博_訾</dt>
            <dd>2018-04-10</dd>
        </dl>
        <!-- 评论内容 -->
        <div class="remarkList__summary">
            <div class="poi-comment">
                <em>大三巴牌坊是澳门最有名的的遗迹遗址，这里挺适合和朋友一起去，多值得国人思考的一个地方，来大三巴的游客真的超级多，风景好，之前在网上看过相关的介绍，觉得不错，所以决定亲身感受一下。</em>
                <p></p>
            </div>
        </div>
        <!-- 评论图片 -->
        <div class="remarkList__picContainer">
          <div class="remarkList__pic">
         	<img data-echo="https://n1-q.mxtrip.net/e78c67213ddd382594590593bbdd8468.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="震博_訾" />            
          </div>
          <div class="remarkList__pic">
         	<img data-echo="https://n1-q.mxtrip.net/b8081eaf63d7da6b6e3465cf92ed6ce8.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="震博_訾" />           
          </div>
          <div class="remarkList__pic">
         	<img data-echo="https://n1-q.mxtrip.net/9cb62c9b90fb1d693b890c8cb5758280.jpg@100Q_360w_240h_1pr_1c_1e" src="//static.mxtrip.cn/resource/img/mobile/app/mxtrip_app/share_v1.0/placeholderDetail.png" alt="震博_訾" />           
          </div>
        </div>
     </div>
</div>

<!-- 第三个评论用户 -->
<div class="REMARK--list remarkList clearfix">
    <div class="remarkList__touxiang">
       <img src="https://img.mxtrip.cn/4d70eec971ab97ed962d0f9c537bbc38.jpg@100Q_80w_80h_1pr_1c_1e" alt="">
    </div>
    
    <div class="remarkList__con">
        <dl class="remarkList__userName">
            <dt>天罡_Truman</dt>
            <dd>2018-04-14</dd>
        </dl>
        <div class="remarkList__summary">
            <div class="poi-comment">
                <em>这里是澳门的标志物。这是澳门的标志景区了吧，旅客络绎不绝，去过两回牌坊，了解历史后就没那么多的感觉了，到是非常喜欢通往大三巴牌坊的那条长长的商业街，很多店铺很多手信，很有澳门味道，很值得看看，总的来说，环境一般般。</em>
                <p></p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/styles/before/common/before_common_js.jsp" flush="true"></jsp:include>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<div style="display:none">
    <script type="text/javascript">
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-69293874-1', 'auto');
        ga('send', 'pageview');
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?cb4013d0c558e0db021523775c2a3b59";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script>
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https'){
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else{
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
</div>
<div class="index_footer">
        <div class="footer_list">
            <p>
            <p>
                		北京办公地址：北京国贸CDB广场1幢1号 <span>咨询电话：0755-82029695；0755-82934944</span> <span style="display:none;">商务合作咨询电话：0755-12345678</span>
                <span></span></p>
            <p>重庆办公地址：重庆市渝北区金开大道355号万科万悦汇2幢14-16号<span> 咨询电话：023-63424884；13618331099 </span>
			</p>
            <p>
                	电子邮件：info@zoubei.com 出境旅游经营许可证：L-CQ-CJ00035</p>
            <ul class="clearfix">
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150923/2015092319103984.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511592197.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511591008.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511585791.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511584205.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511583107.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150115/2015011511581715.png"  height="60px" width="100px" /></a></li>
				<li><a href="#"><img src="<%=basePath %>styles/before/UpLoadFiles/20150923/2015092319240614.png"  height="60px" width="100px" /></a></li>
            </ul>
        </div>
        <div class="footer_copy" style="width:1200px;">
            <p>
                2013-2015©&nbsp;&nbsp;&nbsp;'走呗'&nbsp;&nbsp;&nbsp;旅行-高端品质旅行专家™ <span><a href="#" target="_blank"></a>
                <a href="http://www.smallseashell.com" target="_blank"></a></span><em></em></p>
        </div>
    </div>
</body>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    window.pm_lpvt = 'd12c9bef2fcd546b6f93c8841487fdba';
    window.c_rcv = 'www.mxtrip.cn/c.html';

    var map = new BMap.Map("allmap");

    var point = new BMap.Point("${sceneMap.mapx}","${sceneMap.mapy}");
	
	map.centerAndZoom(point, 12);
	
	var marker = new BMap.Marker(point);  // 创建标注
	
	map.addOverlay(marker);              // 将标注添加到地图中
	
	marker.addEventListener("click",getAttr);
	
	function getAttr(){
	
	var p = marker.getPosition();       //获取marker的位置
	
	layer.msg("您目前浏览的位置是 : "+"${scene.sceneName}",{icon:1,time:1000});
	
	}
</script>

<script type="text/javascript">
	
	// 定制服务      先判断是否登录在进行定制
	function toOrder(sceneId){
		var t = "${sessionScope.tourist }";
		if(t == null || t == ""){
			layer.msg('请进行登录！',{icon:1,time:1000});
		}else{
			location.href = "<%=basePath %>other/toDingzhi?sceneId="+sceneId;
		}
	}
	
	// 收藏按钮    先判断是否登录在进行收藏
	function collect(sceneId){
		var t = "${sessionScope.tourist }";
		if(t == null || t == ""){
			layer.msg('请进行登录！',{icon:1,time:1000});
		}else{
			$.post(
				"<%=basePath %>other/touristSceneCollect",
				{"sceneId":sceneId},
				function(obj){
					if("1" == obj){
						layer.msg('已收藏!   可在个人详情查看！',{icon:1,time:1000});
					}else{
						layer.msg('不可重复收藏！',{icon:1,time:1000});
					}
				},
				"text"
			)
		}
	}

</script>

</html>