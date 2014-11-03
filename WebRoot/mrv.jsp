<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userId= request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>微创MVR技术</title>
   		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> 
   		<link rel="stylesheet" href="pub/jquery.mobile-1.3.2/jquery.mobile-1.3.2.min.css" />
   		<script type="text/javascript" src="pub/jquery.mobile-1.3.2/jquery-1.8.3.min.js"></script>
   		<script type="text/javascript" src="pub/jquery.mobile-1.3.2/jquery.mobile-1.3.2.min.js"></script>
   		<script type="text/javascript" src="pub/js/util.js"></script>
   		<script type="text/javascript" src="pub/js/json.js"></script>
   		<script type="text/javascript" src="pub/js/json2.js"></script>
   		<script type="text/javascript" src="js/mvr.js"></script>
	</head>
	<script>
	var userId='<%=userId%>';
	var visitType='mvr';
	</script>
	<body>
		<div data-role="page">
			<form id="callAjaxForm">
				<ul data-role="listview" data-inset="true">
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>一、患者目前恢复情况：</legend>
								<label for="red">很好</label><input type="radio" name="patient_recover" id="red" value="0">
		          				<label for="green">一般</label><input type="radio" name="patient_recover" id="green" value="1">
		          				<label for="blue">ICU/CCU自动出院</label><input type="radio" name="patient_recover" id="blue" value="2">	
								<label for="gary">好</label><input type="radio" name="patient_recover" id="gary" value="3">	
		           				<label for="white">差</label><input type="radio" name="patient_recover" id="white" value="4">	
		           				<label for="yellow">有问题</label><input type="radio" name="patient_recover" id="yellow" value="5">
							</fieldset>
							<div data-role="fieldcontain">
								<label for="question_desc">问题描述：</label><input type="text" name="question_desc" id="question_desc">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>二、活动情况：</legend>
								<label for="red">正常工作及生活</label><input type="radio" name="activity" id="red" value="0">
		          				<label for="green">可胜任日常轻微活动</label><input type="radio" name="activity" id="green" value="1">
		          				<label for="blue">稍活动喘气，日常活动受限</label><input type="radio" name="activity" id="blue" value="2">	
								<label for="gary">卧床</label><input type="radio" name="activity" id="gary" value="3">	
							</fieldset>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="is_complications">三、出院后是否发生以下并发症：</label>
							<select name="is_complications" id="is_complications" data-role="slider">
								<option value="on">有</option>
	     				 		<option value="off">无</option>
							</select>
							<div data-role="fieldcontain">
								<fieldset data-role="controlgroup">
		          					<label for="red">出血</label><input type="checkbox" name="complications_type" id="red" value="0">
		          					<label for="green">栓塞</label><input type="checkbox" name="complications_type" id="green" value="1">
		          					<label for="blue">感染性心内膜炎</label><input type="checkbox" name="complications_type" id="blue" value="2">	
		           					<label for="gary">瓣膜损坏</label><input type="checkbox" name="complications_type" id="gary" value="3">	
		        				</fieldset>
		        				<label for="blue">具体部位：</label><input type="text" name="complications_site" id="complications_site">
		        				<label for="blue">具体时间：</label><input type="text" name="complications_time" id="complications_time">
		        				<label for="blue">目前情况：</label><input type="text" name="current_situation" id="current_situation">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>四、是否出现肾功能不全：</legend>
								<label for="red">未复查</label><input type="radio" name="renal_insufficiency" id="red" value="0">
	          					<label for="green">否</label><input type="radio" name="renal_insufficiency" id="green" value="1">
	          					<label for="blue">是</label><input type="radio" name="renal_insufficiency" id="blue" value="2">	
							</fieldset>
							<div data-role="fieldcontain">
								<label for="blue">最近血肝酐值：</label>
								<table>
									<tr>
										<td><input type="text" name="blood_liver_anhydride_value" id="blood_liver_anhydride_value"></td>
										<td><label for="blue">umol/l</label></td>
									</tr>
								</table>
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="readmission">五、出院后有无因心脏原因再次入院：</label>
							<select name="is_readmission" id="is_readmission" data-role="slider">
								<option value="on">有</option>
	     				 		<option value="off">无</option>
							</select>
							<div data-role="fieldcontain">
								<label for="blue">入院时间：</label><input type="text" name="admission_time" id="admission_time">
								<label for="blue">入院原因：</label><input type="text" name="admission_reason" id="admission_reason">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="colour_ultrasound_check">六、近期是否进行彩超检查：</label>
							<select name="colour_ultrasound_check" id="colour_ultrasound_check" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<div data-role="fieldcontain">
								<label for="blue">最近检查时间：</label><input type="text" name="check_time" id="check_time">
								<label for="blue">LVD/LVS：</label><input type="text" name="lvd_lvs" id="lvd_lvs">
								<label for="residual_leakage">是否有残余漏：</label>
								<select name="residual_leakage" id="residual_leakage" data-role="slider">
									<option value="on">有</option>
		     				 		<option value="off">无</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">具体描述：</label><input type="text" name="residual_leakage_desc" id="residual_leakage_desc">
								</div>
								<label for="artificial_leak_valve">人工瓣膜瓣周漏：</label>
								<select name="artificial_leak_valve" id="artificial_leak_valve" data-role="slider">
									<option value="on">是</option>
		     				 		<option value="off">否</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">分流束：</label>
									<table>
										<tr>
											<td><input type="text" name="bypass_surgery" id="bypass_surgery"></td>
											<td><label for="blue">mm</label></td>
										</tr>
									</table>
								</div>
								<label for="manual_valve_dysfunction">人工瓣膜功能异常：</label>
								<select name="manual_valve_dysfunction" id="manual_valve_dysfunction" data-role="slider">
									<option value="on">是</option>
		     				 		<option value="off">否</option>
								</select>
								<label for="aortic_stenosis">主动脉瓣狭窄：</label>
								<select name="aortic_stenosis" id="aortic_stenosis" data-role="slider">
									<option value="on">是</option>
		     				 		<option value="off">否</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">跨瓣压差：</label>
									<table>
										<tr>
											<td><input type="text" name="across_valve_pressure" id="across_valve_pressure"></td>
											<td>mmHg</td>
										</tr>
									</table>
								</div>
								<fieldset data-role="controlgroup">
									<legend>主动脉关闭不全：</legend>
									<label for="red">否</label><input type="radio" name="aortic_regurgitation" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="aortic_regurgitation" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="aortic_regurgitation" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="aortic_regurgitation" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>二尖瓣狭窄：</legend>
									<label for="red">否</label><input type="radio" name="mitral_stenosis" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="mitral_stenosis" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="mitral_stenosis" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="mitral_stenosis" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>二尖瓣关闭不全：</legend>
									<label for="red">否</label><input type="radio" name="mitral_insufficiency" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="mitral_insufficiency" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="mitral_insufficiency" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="mitral_insufficiency" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>三尖瓣狭窄：</legend>
									<label for="red">否</label><input type="radio" name="tricuspid_stenosis" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="tricuspid_stenosis" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="tricuspid_stenosis" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="tricuspid_stenosis" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>三尖瓣关闭不全：</legend>
									<label for="red">否</label><input type="radio" name="tricuspid_insufficiency" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="tricuspid_insufficiency" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="tricuspid_insufficiency" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="tricuspid_insufficiency" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>肺动脉瓣狭窄：</legend>
									<label for="red">否</label><input type="radio" name="pulmonary_stenosis" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="pulmonary_stenosis" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="pulmonary_stenosis" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="pulmonary_stenosis" id="gary" value="3">	
								</fieldset>
								<fieldset data-role="controlgroup">
									<legend>肺动脉瓣关闭不全：</legend>
									<label for="red">否</label><input type="radio" name="pulmonary_insufficiency" id="red" value="0">
									<label for="green">轻度</label><input type="radio" name="pulmonary_insufficiency" id="green" value="1">
		          					<label for="blue">中度</label><input type="radio" name="pulmonary_insufficiency" id="blue" value="2">	
		           					<label for="gary">重度</label><input type="radio" name="pulmonary_insufficiency" id="gary" value="3">	
								</fieldset>
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="other_surgery">七、出院后有无接受其他手术：</label>
							<select name="other_surgery" id="other_surgery" data-role="slider">
								<option value="on">有</option>
	     				 		<option value="off">无</option>
							</select>
							<div data-role="fieldcontain">
								<label for="blue">手术时间：</label><input type="text" name="surgery_time" id="surgery_time">
								<label for="blue">手术名称：</label><input type="text" name="surgery_name" id="surgery_name">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>八、有无房颤：</legend>
								<label for="red">未复查</label><input type="radio" name="atrial_fibrillation" id="red" value="0">
	          					<label for="green">无</label><input type="radio" name="atrial_fibrillation" id="green" value="1">
	          					<label for="blue">有</label><input type="radio" name="atrial_fibrillation" id="blue" value="2">	
							</fieldset>
							<div data-role="fieldcontain">
								<label for="blue">治疗药物及剂量：</label><input type="text" name="drugs_dosage" id="drugs_dosage">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="taking_warfarin">九、是否每日按时服用华法令：</label>
							<select name="taking_warfarin" id="taking_warfarin" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<label for="isKonw_side_effects">是否清楚华法令的副作用：</label>
							<select name="isKonw_side_effects" id="isKonw_side_effects" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<label for="check_INR">服华法令时是否定期查INR：</label>
							<select name="check_INR" id="check_INR" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<div data-role="fieldcontain">
								<table>
									<tr>
										<td><label for="blue">间隔时间每</label></td>
										<td><input type="text" name="interval_time" id="interval_time"></td>
										<td><label for="blue">一次</label></td>
									</tr>
								</table>
								
							</div>
							<label for="anticoagulation_INR_range">是否了解自己抗凝INR值范围：</label>
							<select name="anticoagulation_INR_range " id="anticoagulation_INR_range" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<div data-role="fieldcontain">
								<label for="blue">您最近检查日期：</label><input type="text" name="recent_inspection_date" id="recent_inspection_date">
								<label for="blue">INR值或PT值：</label><input type="text" name="INR_PT_value" id="INR_PT_value">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<legend>十、是否服用下列药物：</legend>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="sample_rehmannia">样地黄类：</label></td>
									<td width="60%">
										<select name="sample_rehmannia" id="sample_rehmannia" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（地高辛，西地兰等）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="diuretics">利尿剂：</label></td>
									<td width="60%">
										<select name="diuretics" id="diuretics" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（速尿，安体舒通，氨苯喋啶，拖拉噻咪，双氢克尿噻等）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="potassium_supplement_pills">补钾药：</label></td>
									<td width="60%">
										<select name="potassium_supplement_pills" id="potassium_supplement_pills" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（补达秀，果味钾）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="beta_blockers">β受体阻滞剂：</label></td>
									<td width="60%">
										<select name="beta_blockers" id="beta_blockers" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（心得安，倍他安克，康可，洛雅，达利全等）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="calcium_channel_blockers">钙通道阻滞剂：</label></td>
									<td width="60%">
										<select name="calcium_channel_blockers" id="calcium_channel_blockers" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（心痛定，合心爽，尼福达，拜新同，异博定，波依定，洛地平，络活喜）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="ACE_inhibitors">ACE抑制剂：</label></td>
									<td width="60%">
										<select name="ACE_inhibitors" id="ACE_inhibitors" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（开博通，雅施达，一平苏，蒙诺，达爽，依那普利，瑞泰等）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="40%"><label for="ARB_drugs">ARB类药：</label></td>
									<td width="60%">
										<select name="ARB_drugs" id="ARB_drugs" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（安博维，安博诺，利素亚，海捷亚，代文等）</td>
								</tr>
							</table>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="blue">十一、您对我院服务有无意见和建议，请详细注明：</label>
       						<textarea cols="40" rows="8" name="advice" id="advice"></textarea>
       						<label for="blue">联系方式更改：</label><input type="text" name="change_contact_way" id="change_contact_way">
       						<label for="blue">请提供新的联系电话：</label><input type="text" name="new_phone_nbr" id="new_phone_nbr">
						</div>
					</li>
					<li class="ui-body ui-body-b">
		            	<fieldset class="ui-grid-a">
		                    <div class="ui-block-a"><a href="#" data-role="button" data-rel="back" data-theme="c">返回</a></div>
		                    <div class="ui-block-b"><a href="#" data-role="button" data-theme="b" id="submit">提交</a></div>
		            	</fieldset>
		        	</li>
				</ul>
			</form>
		</div>
	</body>
</html>