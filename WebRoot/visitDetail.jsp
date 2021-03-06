<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title> </title>
<meta name="description" content=""/> 
<meta name="keywords" content=""/>
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" /> 
<link href="css/indexnew.css" rel="stylesheet" type="text/css">
<link href="css/shouye.css" rel="stylesheet" type="text/css">
<link rel="icon" href="http://cdn.120askimages.com/ask/m/images/bitbug_favicon.ico" type="image/x-icon" />
<script src="http://cdn.120askimages.com/ask/m/js/think.js" type="text/javascript"></script>
<link rel="apple-touch-icon-precomposed" href="http://cdn.120askimages.com/ask/m/images/57.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://cdn.120askimages.com/ask/m/images/114.png">


</head>
<body>
<!-- 头部 -->
<div id="main_body">
<section class="s_m517">
<div class="h">
	<b><c:choose>
		<c:when test="${obj.visitType == 'asd' }">
			<c:out value="先心手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'mvr' }">
			<c:out value="房颤手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'gxb' }">
			<c:out value="冠心病手术随访"></c:out>
		</c:when>
	</c:choose></b>|<span>${obj.visitName }</span>  
</div>
   
      <ul class="box01_list">
	      <li class="li_list">
		    	<div>
		    		<c:forEach items="${array }" var="lst" varStatus="i">
		  					<a href="#">${lst.codeFlagVal }&nbsp;&nbsp; <b>${lst.codeValFlag }</b> </a>
		  			</c:forEach>
		    	</div>
			</li>
	 	</ul>
</section>

<div style="padding: 15px 15px 0 15px; border-top: 1px solid #CFCFCF;">合作伙伴:益健康</div>
</br>
<div id="ui-input-mask" class="ui-input-mask"><div class="ui-input-body"><div id="ui-ul-div" class="ui-ul-div"><div id="scroller"><ul class="ui-suggestion-content" id="ui-suggestion-content"></ul></div></div><div class="ui-input-footer"><div class="ui-close-but" id="close-input-mask">关闭</div></div></div></div>
</div>

<script src="http://cdn.120askimages.com/ask/m/js/touchScroll_min.js" type="text/javascript"></script>

<script type="text/javascript">
(function() {
	var ms = 0;
	var tip_opacity = 1;
	var InterHide = setInterval(function() {
		if (ms > 10000 && tip_opacity > 0) {
			tip_opacity -= 0.1;
			document.querySelector("#s_alert").style.opacity = tip_opacity;
			if (tip_opacity < 0.1) {
				document.querySelector("#s_alert").style.display = 'none';
				var inputMask = document.getElementById("ui-input-mask");
				if(typeof inputMask!='undefined')
				{       
					inputMask.style.top = parseInt(inputMask.style.top)+'px';
				}
				clearInterval(InterHide);
			}
		};
		ms += 100
	},
	100);
        t1 = new TouchScroll({id:'ui-ul-div','width':5,'opacity':0.7,color:'#555',minLength:20});
        new think('.s-kw_box',58);
	window.scrollTo(0, 1);
})();
var kw_box = document.getElementsByTagName('input')[1];
kw_box.addEventListener('focus',function(){setTimeout(function(){document.querySelector("#s_alert").style.display = 'none';window.scrollTo(0,55);},100)},false);

try{
	var dom=document.getElementsByClassName('s-kw_box');
	for(var i in dom){(function(){
		var KwInput=dom[i];
		var clearBut=KwInput.parentNode.parentNode.getElementsByTagName('span')[0];
		clearBut.addEventListener('click',function(e){KwInput.value='';clearBut.style.display='none'},false);
		if(KwInput.value==''){clearBut.style.display='none'}else{clearBut.style.display=''};
		KwInput.addEventListener('keyup',function(e){if(this.value==''){clearBut.style.display='none'}else{clearBut.style.display=''}},false)})()}
		var ScrollTop = 0;
}catch(e){}
</script>
<script src="http://pp.120askimages.com/web/public/js/zepto_min.js"></script>
<script src="http://pp.120askimages.com/web/public/js/touchslider_min.js"></script>
<script>

var total=$(".box_css").length+1;
for(n=1;n<total;n++){
	var page='pagenavi'+n;
	var mslide='slider'+n;
	var mtitle='emtitle'+n;
	arrdiv = 'arrdiv' + n;
	if(n == 1)
	{
		var as = document.getElementById(page).getElementsByTagName('b');
		var tt=new TouchSlider({id:mslide,'auto':'-1',fx:'ease-out',direction:'left',speed:300,timeout:2000,'before':function(index){
			var as = document.getElementById(this.page).getElementsByTagName('b');			
			if(as[index].id=='prev')
			{
				document.getElementById('span_prev').className = 'sel' ;
				document.getElementById('span_next').className = '' ;
			}
			if(as[index].id=='next')
			{
				document.getElementById('span_prev').className = '' ;
				document.getElementById('span_next').className = 'sel' ;
			}
			this.p=index;		
		}});
	}
	if(n == 2)
	{
		as = document.getElementById(page).getElementsByTagName('a');
		var tt=new TouchSlider({id:mslide,'auto':'-1',fx:'ease-out',direction:'left',speed:300,timeout:2000,'before':function(index){
			var as=document.getElementById(this.page).getElementsByTagName('a');
			as[this.p].className='';
			as[index].className='active';
			this.p=index;
		}});
	}
	tt.page = page;
	tt.p = 0;
	for(var i=0;i<as.length;i++){
		(function(){
			var j=i;
			as[j].tt = tt;
			as[j].onclick=function(){
				this.tt.slide(j);
				return false;
			}
		})();
	}
}
</script>

<script type="text/javascript">
	logolistFun=null;
	var logolist = document.getElementById('logolist');
	logolist_status=0;
	opacity= 0;
	slide_speed = 1;
	
	var down_slide=function(){
		logolist_status =0;
		var marginTop = parseInt(logolist.style.marginTop);
		opacity-=0.1;
		if(opacity<0)
		{
			opacity = 0;
		}
		logolist.style.opacity = opacity;
		if(marginTop<0)
		{
			marginTop+=slide_speed;
			slide_speed-=2;
			if(marginTop > 0){  
				marginTop = 0;
			}
			logolist.style.marginTop = marginTop+'px';
			if(marginTop>=0)
			{
				clearInterval(logolistFun);
			}
		}
	}
	var e_fun = function()
	{
		if(logolist_status==0)
		{
			clearInterval(logolistFun);
			logolist.style.display='inline-block';
			logolistFun=setInterval(function(){
				logolist_status =1;
				var marginTop = parseInt(logolist.style.marginTop);
				opacity+=0.1;
				if(opacity>1)
				{
					opacity = 1;
				}
				logolist.style.opacity = opacity;
				if(marginTop>-310)
				{
					marginTop-=slide_speed;
					slide_speed+=2;
					
					if(marginTop < -310){  
						marginTop = -310;
					}
					logolist.style.marginTop = marginTop+'px';
					if(marginTop<=-310)
					{
						clearInterval(logolistFun);
					}
				}
			}, 5);
		}
		else
		{
			clearInterval(logolistFun);
			logolistFun=setInterval(down_slide, 5);
		}
	}
document.getElementById('logobg').onclick= e_fun;
document.getElementById('main_body').addEventListener('touchstart',function(){clearInterval(logolistFun);logolistFun=setInterval(down_slide, 5);},false);
</script>
<style>
	.footer{display:-webkit-box;-webkit-box-pack:center;box-pack:center;padding:17px 0;background-color: #fff;border-top:1px solid #CFCFCF;margin-top:15px;}
	.footer div:first-child{width:36px;height:36px;text-indent:-9990px;overflow:hidden;-webkit-background-size:36px 36px;background-size:36px 36px;margin-right:25px;font-size:0.7rem;}
	.footer div a{color:#4b4b4b;margin:0 6px;font-weight:bold;}
	.footer div a:first-child{margin-left:2px;}
	.footer div p:nth-of-type(1){padding-bottom:10px;color:#dcdcdc;}
	.footer div p:nth-of-type(2){font-size:0.7rem;color:#999;}
	.footer div p:nth-of-type(2) span{margin-left:15px;}
	.footer div p:nth-of-type(3){text-align:center;padding-top:5px;font-size:10px;color:#666;}
	/*.footer div p:nth-of-type(3) i{}*/
	.footer div p:nth-of-type(3) span{vertical-align:middle;}
</style>
 
</body>
</html>
