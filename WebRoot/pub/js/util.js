//��ʾ��Ϣ
function showPopupMessage(val)
{
	$.mobile.showPageLoadingMsg("a", val, true);
	setTimeout(function () {$.mobile.hidePageLoadingMsg()}, 1500 );
}