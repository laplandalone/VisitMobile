var complicationsTypes = "";
$(document).ready(function() {
	$("#submit").click(function(){
		if(!checkParam())
		{
			return;
		}
		else
		{
			var obj = $("select, input").serializeObject();
//			obj.patient_recover = $("[name='patient_recover']:checked").val();
//			obj.activity_level = $("[name='activity']:checked").val();
			obj.is_complications = $("#is_complications").val();
			if(obj.is_complications == "on")
			{
				obj.complications_type = complicationsTypes;
			}
			var param = JSON.stringify(obj);
			$.ajax({
				type:"POST",
				url:"/visit/patientVisit.do?method=submitMvr",
				data:"param="+param+"&userId="+userId+"&visitType="+visitType,
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
//	var activity_level = $("[name='activity']:checked").val();
//	if(activity_level == "" || activity_level == null || activity_level == undefined)
//	{
//		showPopupMessage("请选择患者的活动情况!");
//		return false;
//	}
	var is_complications = $("#is_complications").val();
	if(is_complications == "on")
	{
		var count = 0
		$("[name='complications_type']:checked").each(function(){
			count++;
			complicationsTypes += $(this).val() + ",";
		});
		if(count == 0)
		{
			showPopupMessage("请选择患者的并发症类型!");
			return false;
		}
		else
		{
			complicationsTypes = complicationsTypes.substring(0, complicationsTypes.length - 1);
		}
//		var complications_site = $("#complications_site").val();
//		if(complications_site == "" || complications_site == null || complications_site == undefined)
//		{
//			showPopupMessage("请填写出现并发症的具体部位!");
//			return false;
//		}
//		var complications_time = $("#complications_time").val();
//		if(complications_time == "" || complications_time == null || complications_time == undefined)
//		{
//			showPopupMessage("请填写出现并发症的具体时间!");
//			return false;
//		}
//		var current_situation = $("#current_situation").val();
//		if(current_situation == "" || current_situation == null || current_situation == undefined)
//		{
//			showPopupMessage("请填写并发症的目前情况!");
//			return false;
//		}
//	}
//	var renal_insufficiency = $("[name='renal_insufficiency']:checked").val();
//	if(renal_insufficiency == "" || renal_insufficiency == null || renal_insufficiency == undefined)
//	{
//		showPopupMessage("请选择患者是否出现肾功能不全的症状!");
//		return false;
//	}
//	else
//	{
//		if(renal_insufficiency == "2")
//		{
//			var blood_liver_anhydride_value = $("#blood_liver_anhydride_value").val();
//			if(blood_liver_anhydride_value == "" || blood_liver_anhydride_value == null || blood_liver_anhydride_value == undefined)
//			{
//				showPopupMessage("请选择患者的最近血肝酐值!");
//				return false;
//			}
//		}
//	}
//	var is_readmission = $("[name='is_readmission']:checked").val();
//	if(is_readmission == "" || is_readmission == null || is_readmission == undefined)
//	{
//		showPopupMessage("请选择患者出院后有无因心脏原因再次入院!");
//		return false;
//	}
//	else
//	{
//		var admission_time = $("#admission_time").val();
//		if(admission_time == "" || admission_time == null || admission_time == undefined)
//		{
//			showPopupMessage("请输入患者的入院时间!");
//			return false;
//		}
//		var admission_reason = $("#admission_time").val();
//		if(admission_reason == "" || admission_reason == null || admission_reason == undefined)
//		{
//			showPopupMessage("请输入患者的入院原因!");
//			return false;
//		}
//	}
//	var colour_ultrasound_check = $("#colour_ultrasound_check").val();
//	if(colour_ultrasound_check == "on")
//	{
//		var check_time = $("#check_time").val();
//		if(check_time == "" || check_time == null || check_time == undefined)
//		{
//			showPopupMessage("请输入患者最近进行彩超检查时间!");
//			return false;
//		}
//		var lvd_lvs = $("#lvd_lvs").val();
//		if(lvd_lvs == "" || lvd_lvs == null || lvd_lvs == undefined)
//		{
//			showPopupMessage("请输入患者彩超检查的LVD/LVS值!");
//			return false;
//		}
//		var residual_leakage = $("#residual_leakage").val();
//		if(residual_leakage == "on")
//		{
//			var residual_leakage_desc = $("#residual_leakage_desc").val();
//			if(residual_leakage_desc == "" || residual_leakage_desc == null || residual_leakage_desc == undefined)
//			{
//				showPopupMessage("请输入患者残余漏的具体描述!");
//				return false;
//			}
//		}
//		var artificial_leak_valve = $("#artificial_leak_valve").val();
//		if(artificial_leak_valve == "on")
//		{
//			var bypass_surgery = $("#bypass_surgery").val();
//			if(bypass_surgery == "" || bypass_surgery == null || bypass_surgery == undefined)
//			{
//				showPopupMessage("请输入分流束的值!");
//				return false;
//			}
//		}
//		var aortic_stenosis = $("#aortic_stenosis").val();
//		if(aortic_stenosis == "on")
//		{
//			
//		}
	}
	return true;
}