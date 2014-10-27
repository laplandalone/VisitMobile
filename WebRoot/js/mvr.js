var complicationsTypeArray = new Array();

$(document).ready(function() {
	$("#submit").click(function(){
		if(!checkParam())
		{
			return;
		}
		else
		{
			var obj = new Object();
			obj.patient_recover = $("[name='patient_recover']:checked").val();
			obj.activity_level = $("[name='activity_level']:checked").val();
			obj.is_complications = $("#is_complications").val();
			obj.complicationsTypeArray = complicationsTypeArray;
			var param = JSON.stringify(obj);
			$.ajax({
				type:"POST",
				url:"/visit/patientVisit.do?method=submitMvr",
				data:"param="+param,
				dataType:"json",
				success:function(data)
				{
					if(data)
					{
						showPopupMessage("成功");
					}
					else
					{
						showPopupMessage("失败");
					}
				},
				error:function(data)
				{
					showPopupMessage(data.statusText);
				}
			});
		}
	});
});

function checkParam()
{
	var patient_recover = $("[name='patient_recover']:checked").val();
	if(patient_recover == "" || patient_recover == null || patient_recover == undefined)
	{
		showPopupMessage("请选择患者目前的恢复情况!");
		return false;
	}
	var activity_level = $("[name='activity_level']:checked").val();
	if(activity_level == "" || activity_level == null || activity_level == undefined)
	{
		showPopupMessage("请选择患者的活动情况!");
		return false;
	}
	var is_complications = $("#is_complications").val();
	if(is_complications == "on")
	{
		var count = 0
		$("[name='complications_type']:checked").each(function(){
			count++;
			var obj = new Object();
			obj.complications_type = $(this).val()
			complicationsTypeArray.push(obj);
		});
		if(count == 0)
		{
			showPopupMessage("请选择患者的并发症类型!");
			return false;
		}
	}
	return true;
}