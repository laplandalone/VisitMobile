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
//			JSONObject obj = patientVisitService.qryPatientVisitById(visitId);
//			log.error(obj);
			JSONObject object = new JSONObject();
			object.put("visits", array);
			out.println(object);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=qryCheckResult")
	public void qryCheckResult(String patientId, HttpServletResponse response)
	{
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
			String sql="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where patient_id='PID000251940' order by check_type";
			String retVal = HisHttpUtil.http(sql);
			JSONArray array = JSONArray.fromObject(retVal);
			JSONObject object = new JSONObject();
			object.put("results", array);
			out.println(object);
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
