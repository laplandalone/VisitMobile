package com.hbgz.jqmobile.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hbgz.jqmobile.service.PatientVisitService;
import com.hbgz.jqmobile.util.HisHttpUtil;
import com.hbgz.jqmobile.util.StringUtil;

@Controller
@RequestMapping("/patientVisit.do")
public class PatientVisitController 
{
	private static Log log = LogFactory.getLog(PatientVisitController.class);
	
	@Autowired
	private PatientVisitService patientVisitService;
	
	@RequestMapping(params = "method=submitMvr")
	public void submitMvr(String param,String userId,String visitType, HttpServletResponse response)
	{
		log.error(param);
		log.error(userId);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
			String retVal = patientVisitService.submitMvr(param,userId,visitType);
			log.error(retVal);
			out.println(retVal);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			out.println(e.getMessage());
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=qryVisitDetail")
	public void qryVisitDetail(String visitId, HttpServletResponse response)
	{
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
			JSONArray array = patientVisitService.qryVisitDetail(visitId);
			JSONObject object = new JSONObject();
			object.put("visits", array);
			
			 JSONArray arrays = patientVisitService.getUserWakeById(visitId);
			 if(arrays!=null && arrays.size()>0)
			 {
			 JSONObject obj = arrays.getJSONObject(0);
			 String content = obj.getString("wakeContent");
			 object.put("wakeContent", content);
			 }
			 out.println(object);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=qryCheckResult")
	public void qryCheckResult(String patientId,String checkTime,String checkTypeId, HttpServletResponse response)
	{
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
			String sql="select card_id,sample_type,patient_id,rtrim(check_scope)check_scope,check_unit,check_name,department,rtrim(check_result)check_result,check_type,convert(varchar(10),check_time,102) check_time from view_lis_result_app where check_type_id="+checkTypeId+" and  patient_id='"+patientId+"' and convert(varchar(10),check_time,102)='"+checkTime+"'";
			String retVal = HisHttpUtil.http(sql);
			JSONArray array = JSONArray.fromObject(retVal);
			if(array!=null && array.size()>0)
			{
				for(int i=0;i<array.size();i++)
				{
					JSONObject object= array.getJSONObject(i);
					String check_result=object.getString("check_result");
					String check_scope=object.getString("check_scope");
					double rst=0;
					double d1=0;
					double d2=0;
					if(StringUtil.checkStringIsNum(check_result))
					{
						rst=Double.parseDouble(check_result);
					}
					String[] scopes=check_scope.split("-");
					if(scopes!=null && scopes.length==2)
					{
							String s1=scopes[0];
							String s2=scopes[1];
							if(StringUtil.checkStringIsNum(s1) && StringUtil.checkStringIsNum(s2))
							{
								d1=Double.parseDouble(s1);
								d2=Double.parseDouble(s2);
							}
					}
					String rstFlag="0";/*0:是正常  1:低值  2：高值*/
					if(rst<d1)
					{
						rstFlag="1";
					}else
					if(rst>d2)
					{
						rstFlag="2";
					} 
					object.put("rst_flag", rstFlag);
				}
				JSONObject object = new JSONObject();
				object.put("results", array);
				out.println(object);
			} 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		System.out.println(URLDecoder.decode("\u70ed+++\u3002","UTF-8"));
	}
}
