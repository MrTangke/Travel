<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款页面</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/book.css">
</head>
<body>
	<div class="paybox_main">
        <div class="titlebox">
            <span class="fr">支付金额：${tsopr.orderCount}<em>元</em></span>
            <h2>订单编号：<font id="orderId">${tsopr.orderUuid}</font></h2>
            <h2>产品名称：${tsopr.sceneName}门票</h2>
        </div>
        
        <ul class="tabbox" id="tabbox">
            <li class="on">银行卡</li>
        </ul>
        <div class="conbox" id="payConbox">
            <!--储蓄卡-->
            <div class="con  active">
                <ul class="paylist fix">
                	<li class="banks BOCB2C"><input type="hidden" name="pd_FrpId" value="BOC-NET-B2C"></li>
                	<li class="banks POSTGC"><input type="hidden" name="pd_FrpId" value="POST-NET-B2C"></li>
                    <li class="banks CMB"><input type="hidden" name="pd_FrpId" value="CCB-NET"></li>
                    <li class="banks ICBCB2C"><input type="hidden" name="pd_FrpId" value="ICBC-NET"></li>
                    <li class="banks CCB"><input type="hidden" name="pd_FrpId" value="CMBCHINA-NET"></li>
                    <li class="banks ABC"><input type="hidden" name="pd_FrpId" value="ABC-NET"></li>
                    <li class="banks COMM"><input type="hidden" name="pd_FrpId" value="BOCO-NET"></li>
                    <li class="banks SPDB"><input type="hidden" name="pd_FrpId" value="SPDB-NET"></li>
                	<li class="banks CMBC"><input type="hidden" name="pd_FrpId" value="CMBC-NET-B2C"></li>
                </ul>
            </div>
        </div>
        <!--button-->
        <div class="paybtn fix" id="paybtn">
            <a href="javascript:;" onclick="Buy();" class="btn">立即支付</a>
            <a href="javascript:;" onclick="cancel()" class="btn">取消支付</a>
            <span class="error"></span>
        </div>
        <!--常见问题-->
        <div class="ansBox">
            <h4><a href="#" target="_blank">咨询客服</a>常见问题</h4>
            <ol>
                <li>
                    <p>什么时候可以使用信用卡分期付款？</p>
                    当需支付金额满500元时，您可以选择信用卡分期付款，小于500元的不可使用。
                </li>
                <li>
                    <p>信用卡分期付相比其他支付方式有什么优点？</p>
                    无论您选择分3期、6期、还是12期，所支付的总额都是应付款金额，不需要支付手续费。
                </li>
                <li>
                    <p>信用卡分期付款支持哪些银行？</p>
                    暂时仅支持中国建设银行，其他银行的信用卡分期付也在积极对接中，为用户提供更多优惠和便利。敬请期待！
                </li>
                <li>
                    <p>我使用了信用卡分期支付，为什么一次性扣除了所有的费用？</p>
                    采用信用卡分期支付，会根据订单金额一次性扣除您信用卡中的信用额度，根据您的还款期数分期恢复相应还款金额的信用额度。
                </li>
                <li>
                    <p>购买不同的旅游产品可以合并订单进行分期付款吗？</p>
                    不可以。分期付款只对应一张订单中的一份旅游产品。
                </li>
                <li>
                    <p>使用信用卡分期付款后申请退保，资金退还到哪里？多久能退还？</p>
                    申请退保后的资金仍按原渠道退还到您的信用卡中，在您提交退保要求后，我们会在1个工作日内处理完成（节假日顺延）并提交给银行，一般情况下会在5个工作日内到账，但由于退款交易中涉及商户、银行以及信用卡组织处理环节较多，各环节的处理速度都会对到账时间造成影响，请您谅解。

                </li>
            </ol>
        </div>
    </div>
</body>
<script src="<%=basePath %>styles/before/Js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>styles/lasterTwo/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="<%=basePath%>styles/lasterTwo/assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
    var $tabBox=$("#tabbox");
    var $payBox=$("#payConbox");
    var $payList=$payBox.find("ul.paylist");
    $tabBox.find("li").click(function(){
        index=$(this).index();
        $(this).addClass("on").siblings().removeClass("on");
        $payBox.find("div.con").eq(index).addClass("active").siblings().removeClass("active");
    });
    $payList.find("li").click(function(){
        $(this).addClass("on").siblings().removeClass("on");
    });
});

function cancel(){
	layer.confirm('确认取消支付么？',function(index){
		window.history.go(-1);  //返回上一页
		layer.msg('非常遗憾!',{icon:1,time:1000});
	});
}

function Buy(){
	var payType = $("li[class$='on']>input").val();
	var orderUuid = document.getElementById("orderId").innerText;
	var orderPrices = 0.01;
	if(payType==null || payType==""){
		$("span[class='error']").text("选择支付银行");
		return false;
	}else{
		$("span[class='error']").empty();
		location = "<%=basePath%>tourist/touristSceneOrderPay?pd_FrpId="+payType+"&orderUuid="+orderUuid+"&orderPrices="+orderPrices;
	}
}
</script>
</html>