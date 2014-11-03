<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userId= request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>ASD修补</title>
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
	var visitType='asd';
	</script>
	<body>
		<div data-role="page">
			<form>
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
								<label for="blue">问题描述：</label><input type="text" name="question_desc" id="question_desc">
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>二、活动时是否出现乏力、憋气或呼吸困难：</legend>
								<label for="red">无</label><input type="radio" name="activities_situation" id="red" value="0">
								<label for="black">剧烈活动时</label><input type="radio" name="activities_situation" id="black" value="1">
		          				<label for="green">中等量活动时</label><input type="radio" name="activities_situation" id="green" value="2">
		          				<label for="blue">轻微活动如穿衣时</label><input type="radio" name="activities_situation" id="blue" value="3">	
								<label for="gary">卧床休息时</label><input type="radio" name="activities_situation" id="gary" value="5">	
							</fieldset>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<fieldset data-role="controlgroup">
								<legend>三、是否有口唇发紫的情况：</legend>
								<label for="red">无</label><input type="radio" name="oral_purple" id="red" value="0">
		          				<label for="green">有，同术前</label><input type="radio" name="oral_purple" id="green" value="1">
		          				<label for="blue">有，较术前重</label><input type="radio" name="oral_purple" id="blue" value="2">	
							</fieldset>
							<label for="ascites">有无腹水：</label>
							<select name="ascites" id="ascites" data-role="slider">
								<option value="on">有</option>
	     				 		<option value="off">无</option>
							</select>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="new_reasons_readmission">四、出院后有无因新增原因再次入院：</label>
							<select name="new_reasons_readmission" id="new_reasons_readmission" data-role="slider">
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
							<label for="other_surgery">五、出院后有无接受其他手术：</label>
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
							<label for="colour_ultrasound_check">六、近期是否进行彩超检查：</label>
							<select name="colour_ultrasound_check" id="colour_ultrasound_check" data-role="slider">
								<option value="on">是</option>
	     				 		<option value="off">否</option>
							</select>
							<div data-role="fieldcontain">
								<label for="blue">最近检查时间：</label><input type="text" name="check_time" id="check_time">
								<table>
									<label for="blue">肺动脉收缩压：</label>
									<tr>
										<td><input type="text" name="pulmonary_systolic_pressure" id="pulmonary_systolic_pressure"></td>
										<td><label for="blue">mmHg</label></td>
									</tr>
								</table>
								<label for="blue">LVD/LVS</label><input type="text" name="lvd_lvs" id="lvd_lvs">
								<label for="residual_leakage">是否有残余漏：</label>
								<select name="residual_leakage" id="residual_leakage" data-role="slider">
									<option value="on">是</option>
		     						<option value="off">否</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">具体描述：</label><input type="text" name="residual_leakage_desc" id="residual_leakage_desc">
								</div>
								<label for="r/l_ventricular_stenosis">右/左室流出道狭窄：</label>
								<select name="r/l_ventricular_stenosis" id="r/l_ventricular_stenosis" data-role="slider">
									<option value="on">是</option>
			     				 	<option value="off">否</option>
								</select>
								<div data-role="fieldcontain">
									<table>
										<tr>
											<td>
												<select name="ROVT_LOVT" id="ROVT_LOVT" data-role="slider">
													<option value="on">ROVT</option>
			     				 					<option value="off">LOVT</option>
												</select>
											</td>
											<td><input type="text" name="ROVT/LOVT_value" id="ROVT/LOVT_value"></td>
											<td><label for="blue">cm</label></td>
										</tr>
									</table>
									<table>
										<tr>
											<td><label for="blue">压差</label></td>
											<td><input type="text" name="differential_pressure" id="differential_pressure"></td>
											<td><label for="blue">mmHg</label></td>
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
								<label for="artificial_pipe/shunt">人工管道/分流：</label>
								<select name="artificial_pipe/shunt" id="artificial_pipe/shunt" data-role="slider">
									<option value="on">通畅</option>
			     				 	<option value="off">异常</option>
								</select>
								<label for="A_narrow_Lord">降主A狭窄：</label>
								<select name="A_narrow_Lord" id="A_narrow_Lord" data-role="slider">
									<option value="on">有</option>
			     				 	<option value="off">无</option>
								</select>
								<label for="artery/atrioventricular">大动脉/房室联接一致：</label>
								<select name="artery/atrioventricular" id="artery/atrioventricular" data-role="slider">
									<option value="on">是</option>
			     				 	<option value="off">否</option>
								</select>
								<label for="ecg_flag">心电图检查：</label>
								<select name="ecg_flag" id="ecg_flag" data-role="slider">
									<option value="on">有</option>
				     				<option value="off">无</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">检查时间：</label><input type="text" name="ecg_time" id="ecg_time">
								</div>
								<label for="ecg_reslut">结果：</label>
								<select name="ecg_reslut" id="ecg_reslut" data-role="slider">
									<option value="on">正常</option>
				     				 <option value="off">异常</option>
								</select>
								<div data-role="fieldcontain">
									<label for="blue">具体描述：</label><input type="text" name="ecg_desc" id="ecg_desc">
								</div>
							</div>
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<legend>七、是否服用下列药物：</legend>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="sample_rehmannia">样地黄类：</label></td>
									<td width="70%">
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
									<td width="30%"><label for="diuretics">利尿剂：</label></td>
									<td width="70%">
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
									<td width="30%"><label for="aspirin">阿司匹林：</label></td>
									<td width="70%">
										<select name="aspirin" id="aspirin" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="anticoagulants">抗凝药：</label></td>
									<td width="70%">
										<select name="anticoagulants" id="anticoagulants" data-role="slider">
											<option value="on">是</option>
					     				 	<option value="off">否</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">（华法令，法安明，克赛，肝素等）</td>
								</tr>
							</table>
							<table style="width: 100%">
								<tr>
									<td width="30%"><label for="potassium_supplement_pills">补钾药：</label></td>
									<td width="70%">
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
						</div>
					</li>
					<li data-role="fieldcontain">
						<div data-role="fieldcontain">
							<label for="blue">八、您对我院服务有无意见和建议，请详细注明：</label>
       						<textarea cols="40" rows="8" name="advice" id="advice"></textarea>
       						<label for="blue">联系方式更改：</label><input type="text" name="change_contact_way" id="change_contact_way">
       						<label for="blue">请提供新的联系电话：</label><input type="text" name="new_phone_nbr" id="new_phone_nbr">
       						<label for="blue">建议下次随访时间：</label><input type="text" name="next_visit_time" id="next_visit_time">
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
