<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String patientId = request.getParameter("patientId");
	String name = request.getParameter("name");
	String operType = request.getParameter("operType");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet"  href="jqm/css/themes/default/jquery.mobile-1.3.2.min.css">
		<script src="jqm/js/jquery.js"></script>
		<script src="jqm/js/jquery.mobile-1.3.2.min.js"></script>
 		<script type="text/javascript" src="pub/js/util.js"></script>
 		<script type="text/javascript" src="pub/js/json.js"></script>
 		<script type="text/javascript" src="pub/js/json2.js"></script>
 		<link rel="stylesheet" type="text/css" href="/visit/css/css.css" />
		<style type="text/css">
		.overlay{position:fixed;top:0;right:0;bottom:0;left:0;z-index:998;width:100%;height:100%;_padding:0 20px 0 0;display:none;}
		.showbox{position:fixed;top:0;left:50%;z-index:9999;opacity:0;filter:alpha(opacity=0);margin-left:-80px;}
		*html .showbox,*html .overlay{position:absolute;top:expression(eval(document.documentElement.scrollTop));}
		#AjaxLoading div.loadingWord{width:180px;height:50px;line-height:50px;}
		</style>

  	</head>
  
  	<body>
  		<div data-role="page">
  			<form action="">
  				<ul data-role="listview" data-inset="true">
	  				<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<table width="100%">
								<tr>
									<td width="50%"><label for="red">姓名：<%=name %></label></td>
									<td width="50%"><label for="red">病案号：<%=patientId %></label></td>
								</tr>
								<tr>
									<td colspan="2"><label for="red">手术类型：<%=operType %></label></td>
								</tr>
							</table>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="blue">一、现阶段身体状况：</label>
							<table>
								<tr>
									<td><label for="red">体重：</label></td>
									<td><input type="text" name="weight" id="weight" onblur="isNumber(this)"></td>
									<td><label for="red">kg</label></td>
								</tr>
								<tr>
									<td><label for="red">身高：</label></td>
									<td><input type="text" name="height" id="height" onblur="isNumber(this)"></td>
									<td><label for="red">cm</label></td>
								</tr>
							</table>
							<fieldset data-role="controlgroup">
								<legend>精神状态：</legend>
								<label for="mental_state0">很好</label><input onclick='controlfocus(id)' type="radio" name="mental_state" id="mental_state0" value="0">
			          			<label for="mental_state1">一般</label><input onclick='controlfocus(id)' type="radio" name="mental_state" id="mental_state1" value="1">
			          			<label for="mental_state2">差</label><input  onclick='controlfocus(id)' type="radio" name="mental_state" id="mental_state2" value="2">
							</fieldset>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>二、患者目前恢复情况：</legend>
								<label for="patient_recover3">好</label><input onclick='controlfocus(id)' type="radio" name="patient_recover" id="patient_recover3" value="3">	
		          				<label for="patient_recover1">一般</label><input onclick='controlfocus(id)' type="radio" name="patient_recover" id="patient_recover1" value="1">
		           				<label for="patient_recover4">差</label><input onclick='controlfocus(id)' type="radio" name="patient_recover" id="patient_recover4" value="4">	
		           				<label for="patient_recover5">有问题</label><input onclick='controlfocus(id)' type="radio" name="patient_recover" id="patient_recover5" value="5">
							</fieldset>
							<div data-role="fieldcontain" style="display: none;" id="questionDescDiv">
								<label for="blue">问题描述：</label><input type="text" name="question_desc" id="question_desc">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="ascites">三、活动时是否出现乏力、憋气或呼吸困难：</label>
							<select name="activities" id="activities" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off" selected="selected">否</option>
							</select>
							<div data-role="fieldcontain" style="display: none;" id="activitiesSituationDiv">
								<fieldset data-role="controlgroup">
									<label for="black">剧烈活动时</label><input onclick='controlfocus(id)'  type="radio" name="activities_situation" id="black" value="1">
			          				<label for="green">中等量活动时</label><input onclick='controlfocus(id)' type="radio" name="activities_situation" id="green" value="2">
			          				<label for="blue">轻微活动如穿衣时</label><input onclick='controlfocus(id)' type="radio" name="activities_situation" id="blue" value="3">	
									<label for="gary">卧床休息时</label><input onclick='controlfocus(id)' type="radio" name="activities_situation" id="gary" value="5">	
								</fieldset>
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="ascites">四、是否有口唇发紫的情况：</label>
							<select name="oral" id="oral" data-role="slider">
								<option value="on">有</option>
	     				 		<option value="off" selected="selected">无</option>
							</select>
							<div data-role="fieldcontain" style="display: none;" id="oralPurpleDiv">
								<fieldset data-role="controlgroup">
			          				<label for="green">有，同术前</label><input onclick='controlfocus(id)' type="radio" name="oral_purple" id="green" value="1">
			          				<label for="blue">有，较术前重</label><input onclick='controlfocus(id)' type="radio" name="oral_purple" id="blue" value="2">	
								</fieldset>
							</div>
							<table style="width: 100%">
								<tr>
									<td width="36%"><label for="pericardial_effusion">有无心包积液：</label></td>
									<td width="64%">
										<select name="pericardial_effusion" id="pericardial_effusion" data-role="slider">
											<option value="on">有</option>
				     				 		<option value="off" selected="selected">无</option>
										</select>
									</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="36%"><label for="pleural_effusion">有无胸腔积液：</label></td>
									<td width="64%">
										<select name="pleural_effusion" id="pleural_effusion" data-role="slider">
											<option value="on">有</option>
				     				 		<option value="off" selected="selected">无</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<legend>五、是否使用下列药物：</legend>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="sample_rehmannia">洋地黄类：</label></td>
									<td width="70%">
										<select name="sample_rehmannia" id="sample_rehmannia" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off" selected="selected">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（地高辛）</td>
								</tr>
							</table>
							<div data-role="fieldcontain" style="display: none;" id="sampleRehmanniaDiv">
								<label for="extremity_edema">症状：是否有黄视（视物有黄色阴影）</label>
								<select name="yellow_shadow_flag" id="yellow_shadow_flag" data-role="slider">
									<option value="on">是</option>
		     				 		<option value="off" selected="selected">否</option>
								</select>
							</div>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="anticoagulants">抗凝药：</label></td>
									<td width="70%">
										<select name="anticoagulants" id="anticoagulants" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off" selected="selected">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（华法令，阿司匹林）</td>
								</tr>
							</table>
							<div data-role="fieldcontain" style="display: none;" id="anticoagulantsDiv">
								<label for="extremity_edema">症状：是否牙龈出血</label>
								<select name="bleeding_gums_flag" id="bleeding_gums_flag" data-role="slider">
									<option value="on">是</option>
		     				 		<option value="off" selected="selected">否</option>
								</select>
							</div>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="diuretics">利尿剂：</label></td>
									<td width="70%">
										<select name="diuretics" id="diuretics" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off" selected="selected">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（速尿，安体舒通，双氢克尿噻）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="potassium_supplement_pills">补钾药：</label></td>
									<td width="70%">
										<select name="potassium_supplement_pills" id="potassium_supplement_pills" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off" selected="selected">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（氯化钾缓释片，果味钾）</td>
								</tr>
							</table>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>六、每日小便量：</legend>
								<label for="urine_daily_amount0">少</label><input onclick='controlfocus(id)' type="radio" name="urine_daily_amount" id="urine_daily_amount0" value="0">
			          			<label for="urine_daily_amount1">多</label><input onclick='controlfocus(id)' type="radio" name="urine_daily_amount" id="urine_daily_amount1" value="1">
			          			<label for="urine_daily_amount2">一般</label> <input  onclick='controlfocus(id)' type="radio" name="urine_daily_amount" id="urine_daily_amount2" value="2">
							</fieldset>
							<label for="extremity_edema">双下肢是否有水肿：</label>
							<select name="extremity_edema" id="extremity_edema" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off" selected="selected">否</option>
							</select>
							<label for="eyelid_edema">眼睑是否有水肿：</label>
							<select name="eyelid_edema" id="eyelid_edema" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off" selected="selected">否</option>
							</select>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="red">七、儿童每日奶量：</label>
							<table>
								<tr>
									<td><input type="text" name="daily_milk" id="daily_milk" onblur="isNumber(this)"></td>
									<td><label for="red">毫升</label></td>
								</tr>
							</table>
							<label for="interrupt_flag">吃奶是否容易中断：</label>
							<select name="interrupt_flag" id="interrupt_flag" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off" selected="selected">否</option>
							</select>
							<label for="interrupt_flag">是否容易肺炎：</label>
							<select name="pneumonia_flag" id="pneumonia_flag" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off" selected="selected">否</option>
							</select>
							<div data-role="fieldcontain" style="display: none;" id="pneumoniaDiv">
								<table>
									<tr>
										<td><label for="red">一年患肺炎</label></td>
										<td><input type="text" name="pneumonia_number" id="pneumonia_number" onblur="isNumber(this)"></td>
										<td><label for="red">次</label></td>
									</tr>
								</table>
							</div>
							<fieldset data-role="controlgroup">
								<legend>儿童学习成绩如何：</legend>
								<label for="study_result0">好</label><input onclick='controlfocus(id)'     type="radio" name="study_result" id="study_result0" value="0">
								<label for=study_result1>一般</label><input onclick='controlfocus(id)'   type="radio" name="study_result" id="study_result1" value="1">
		          				<label for="study_result2">差</label><input onclick='controlfocus(id)'   type="radio" name="study_result" id="study_result2" value="2">
							</fieldset>
						</div>
					</li>
					<li data-role="fieldcontain">
							<label for="colour_ecg_check">八、上传彩超和心电图检查图：</label>
					</li>
					
  				</ul>
  			</form>
  			<style>
				.ui-btn-down-c,.ui-btn-hover-c {
					border: 1px solid 		#ccc /*{c-bup-border}*/;
					background: 			#eee /*{c-bup-background-color}*/;
					font-weight: bold;
					color: 					#222 /*{c-bup-color}*/;
					text-shadow: 0 /*{c-bup-shadow-x}*/ 1px /*{c-bup-shadow-y}*/ 0 /*{c-bup-shadow-radius}*/ #fff /*{c-bup-shadow-color}*/;
					background-image: -webkit-gradient(linear, left top, left bottom, from( #fff /*{c-bup-background-start}*/), to( #f1f1f1 /*{c-bup-background-end}*/)); /* Saf4+, Chrome */
					background-image: -webkit-linear-gradient( #fff /*{c-bup-background-start}*/, #f1f1f1 /*{c-bup-background-end}*/); /* Chrome 10+, Saf5.1+ */
					background-image:    -moz-linear-gradient( #fff /*{c-bup-background-start}*/, #f1f1f1 /*{c-bup-background-end}*/); /* FF3.6 */
					background-image:     -ms-linear-gradient( #fff /*{c-bup-background-start}*/, #f1f1f1 /*{c-bup-background-end}*/); /* IE10 */
					background-image:      -o-linear-gradient( #fff /*{c-bup-background-start}*/, #f1f1f1 /*{c-bup-background-end}*/); /* Opera 11.10+ */
					background-image:         linear-gradient( #fff /*{c-bup-background-start}*/, #f1f1f1 /*{c-bup-background-end}*/);
				}
			</style>
  		</div>
  		 <div class="overlay">&nbsp;</div>
<div class="showbox" id="AjaxLoading">
<div class="loadingWord" style="overflow:hidden;zoom:1"  align="center"><img src="/visit//images/loadingx.gif" alt="" style="padding-top:6px;"/></div>
</div>
  	</body>
</html>
<script type="text/javascript">
function controlfocus(id)
{
	var oInput = document.getElementById(id);	
	oInput.focus();
}
$(document).ready(function(){
	$("input[name='patient_recover']").click(function(){
		if("5" == $(this).val())
		{
			$("#questionDescDiv").css("display", "block");
		}
		else
		{
			$("#questionDescDiv").css("display", "none");
		}
	});
	
	$("#colour_ecg_check").change(function(){
		if("on" == $(this).val())
		{
			$("#colourEcgCheckDiv").css("display", "block");
		}
		else
		{
			$("#colourEcgCheckDiv").css("display", "none");
		}
	});
	
	$("#activities").change(function(){
		if("on" == $(this).val())
		{
			$("#activitiesSituationDiv").css("display", "block");
		}
		else
		{
			$("#activitiesSituationDiv").css("display", "none");
		}
	});
	
	$("#oral").change(function(){
		if("on" == $(this).val())
		{
			$("#oralPurpleDiv").css("display", "block");
		}
		else
		{
			$("#oralPurpleDiv").css("display", "none");
		}
	});
	
	$("#sample_rehmannia").change(function(){
		if("on" == $(this).val())
		{
			$("#sampleRehmanniaDiv").css("display", "block");
		}
		else
		{
			$("#sampleRehmanniaDiv").css("display", "none");
		}
	});
	
	$("#anticoagulants").change(function(){
		if("on" == $(this).val())
		{
			$("#anticoagulantsDiv").css("display", "block");
		}
		else
		{
			$("#anticoagulantsDiv").css("display", "none");
		}
	});
	
	$("#pneumonia_flag").change(function(){
		if("on" == $(this).val())
		{
			$("#pneumoniaDiv").css("display", "block");
		}
		else
		{
			$("#pneumoniaDiv").css("display", "none");
		}
	});
});
document.documentElement.style.webkitUserSelect='none';
document.documentElement.style.webkitTouchCallout='none';
function cancel()
{
	window.javatojs.cancel();	
}
function addAsd()
{
	
	if(!checkParam())
	{
		return;
	}
	else
	{
		var obj = $("select, input").serializeObject();
		var activities_situation = "";
		var activities = obj.activities;
		if("off" == activities)
		{
			activities_situation = "0";
		}
		obj.activities = undefined;
		obj.activities_situation = activities_situation;
		var oral_purple = "";
		var oral = obj.oral;
		if("off" == oral)
		{
			oral_purple = "0";
		}
		obj.oral = undefined;
		obj.oral_purple = oral_purple;
		var param = JSON.stringify(obj);
		 $(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
		 window.javatojs.addVisit(param,'asdChild');	
	}
}

function checkParam()
{
	var weight = $("#weight").val();
	if(weight == "" || weight == null || weight == "null" || weight == undefined)
	{
		window.javatojs.alert("请输入患者的体重！");
		return false;
	}
	var height = $("#height").val();
	if(height == "" || height == null || height == "null" || height == undefined)
	{
		window.javatojs.alert("请输入患者的身高！");
		return false;
	}
	var mental_state = $("input[name='mental_state']:checked").val();  
	if(mental_state == "" || mental_state == null || mental_state == "null" || mental_state == undefined)
	{
		window.javatojs.alert("请选择患者的精神状态！");
		return false;
	}
	var patient_recover = $("input[name='patient_recover']:checked").val();  
	if(patient_recover == "" || patient_recover == null || patient_recover == "null" || patient_recover == undefined)
	{
		window.javatojs.alert("请选择患者目前的恢复情况！");
		return false;
	}
	else
	{
		var question_desc = $("#question_desc").val();
		if("5" == patient_recover && (question_desc == "" || question_desc == null || question_desc == "null" || question_desc == undefined))
		{
			window.javatojs.alert("请描述患者的恢复过程中出现问题的具体情况！");
			return false;
		}
	}
	var activities = $("#activities").val();
	var activities_situation = $("input[name='activities_situation']:checked").val();  
	if("on" == activities && (activities_situation == "" || activities_situation == null || activities_situation == "null" || activities_situation == undefined))
	{
		window.javatojs.alert("请选择患者出现乏力、憋气或呼吸困难的场景！");
		return false;
	}
	var oral = $("#oral").val();
	var oral_purple = $("input[name='oral_purple']:checked").val();  
	if("on" == oral && (oral_purple == "" || oral_purple == null || oral_purple == "null" || oral_purple == undefined))
	{
		window.javatojs.alert("请选择患者出现口唇发紫的具体情况！");
		return false;
	}
	var sample_rehmannia = $("#sample_rehmannia").val();
	var yellow_shadow_flag = $("#yellow_shadow_flag").val();
	if("on" == sample_rehmannia && (yellow_shadow_flag == "" || yellow_shadow_flag == null || yellow_shadow_flag == "null" || yellow_shadow_flag == undefined))
	{
		window.javatojs.alert("请选择是否有黄视即视物有黄色阴影的症状！");
		return false;
	}
	var anticoagulants = $("#anticoagulants").val();
	var bleeding_gums_flag = $("#bleeding_gums_flag").val();
	if("on" == anticoagulants && (bleeding_gums_flag == "" || bleeding_gums_flag == null || bleeding_gums_flag == "null" || bleeding_gums_flag == undefined))
	{
		window.javatojs.alert("请选择是否出现牙龈出血的症状！");
		return false;
	}
	var urine_daily_amount = $("input[name='urine_daily_amount']:checked").val();
	if(urine_daily_amount == "" || urine_daily_amount == null || urine_daily_amount == "null" || urine_daily_amount == undefined)
	{
		window.javatojs.alert("请选择每日小便量！");
		return false;
	}
	var daily_milk = $("#daily_milk").val();
	if(daily_milk == "" || daily_milk == null || daily_milk == "null" || daily_milk == undefined)
	{
		window.javatojs.alert("请输入儿童每日的牛奶摄入量！");
		return false;
	}
	var interrupt_flag = $("#interrupt_flag").val();
	if(interrupt_flag == "" || interrupt_flag == null || interrupt_flag == "null" || interrupt_flag == undefined)
	{
		window.javatojs.alert("请选择儿童的牛奶是否容易中断！");
		return false;
	}
	var pneumonia_flag = $("#pneumonia_flag").val();
	var pneumonia_number = $("#pneumonia_number").val();
	if("on" == pneumonia_flag && (pneumonia_number == "" || pneumonia_number == null || pneumonia_number == "null" || pneumonia_number == undefined))
	{
		window.javatojs.alert("请输入一年患肺炎的次数！");
		return false;
	}
	var study_result = $("input[name='study_result']:checked").val();
	if(study_result == "" || study_result == null || study_result == "null" || study_result == undefined)
	{
		window.javatojs.alert("请选择儿童的学习成绩情况！");
		return false;
	}
	return true;
}
</script>