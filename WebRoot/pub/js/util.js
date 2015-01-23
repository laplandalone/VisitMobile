//��ʾ��Ϣ
function showPopupMessage(val)
{
	$.mobile.showPageLoadingMsg("a", val, true);
	setTimeout(function () {$.mobile.hidePageLoadingMsg()}, 1500 );
}

function isNumber(obj)
{
	var flag = true;
	var val = obj.value;
	val = val.replace(/(^\s*)|(\s*$)/g, "");
	if(val != "" && val != null && val != "null" && val != undefined)
	{
		var isNum = /^([1-9][\d]{0,7}|0)(\.[\d]{1})?$/;
		flag = isNum.test(val);
	}
	if(!flag)
	{
		window.javatojs.alert("请输入数字！");
		obj.value = "";
	}
}