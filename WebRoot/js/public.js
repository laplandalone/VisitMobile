//填充不能显示的图片
function ifImgNotExist()
{
	var img=event.srcElement;
	img.src="pub/img/default_loading_img.9.png";
	img.onerror=null; //取消它的onerror事件
}


//拼接评价图片
function getStar(val)
{
	if(val==""||val=="null")
	{
		val="0";
	}	
	var starStr ="<div data-role='controlgroup' data-type='horizontal'>";
	var starNum =parseInt(val);
	for(var i=0;i<5;i++)
	{
		if(i<starNum)
		{
			starStr +="<img src='pub/img/fullstar.png'/>";
		}	
		else
		{
			starStr +="<img src='pub/img/emptystar.png'/>";
		}	
	}
	starStr+="</div>";
	return starStr;
}


//拼接功能图片
function getIcon(val)
{
	var starStr ="<div data-role='controlgroup' data-type='horizontal'>";
	if(val.articleFlag!=null&&parseInt(val.articleFlag)>0)
	{
		starStr +="<img src='pub/img/main_list_estimate.png'>"
	}
	if(val.cardFlag!=null&&parseInt(val.cardFlag)>0)
	{
		starStr +="<img src='pub/img/main_list_vipcard.png'>"
	}
	if(val.queueFlag!=null&&val.queueFlag=="Y")
	{
		starStr +="<img src='pub/img/main_list_queueup.png'>"
	}
	if(val.commentFlag!=null&&parseInt(val.commentFlag)>0)
	{
		starStr +="<img src='pub/img/main_list_recommended.png'>"
	}
	if(val.onlinePayFlag!=null&&val.onlinePayFlag=="Y")
	{
		starStr +="<img src='pub/img/main_list_xianjinjuan.png'>"
	}
	if(val.discountFlag!=null&&parseInt(val.discountFlag)>0)
	{
		starStr +="<img src='pub/img/main_list_youhuijuan.png'>"
	}
	starStr +="</div>";
	return starStr;
}

//分转元
function getMoneyStr(val)
{
	val =val+"";
	if(val.length>2)
	{
		return val.substring(0,val.length-2)+"."+val.substring(val.length-2,val.length);
	}
	else if(val.length==2)
	{
		return "0."+val;
	}	
	else if(val.length==1)
	{
		return "0.0"+val;
	}	
	else
	{
		return "";
	}	
}


//显示加载器
function showLoader() { 
    $.mobile.loading('show', {  
        text: 'please wait...', //加载器中显示的文字  
        textVisible: true, //是否显示文字  
        theme: 'a',        //加载器主题样式a-e  
        textonly: false,   //是否只显示文字  
        html: ""           //要显示的html内容，如图片等  
    });  
}  
  
//隐藏加载器
function hideLoader()  
{  
    //隐藏加载器  
    $.mobile.loading('hide');  
} 

//提示信息
function showPopupMessage(val)
{
	$.mobile.showPageLoadingMsg( "a", val, true);
	setTimeout(function () {$.mobile.hidePageLoadingMsg()}, 1500 );
}