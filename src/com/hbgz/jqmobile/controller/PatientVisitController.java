package com.hbgz.jqmobile.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hbgz.jqmobile.service.PatientVisitService;

@Controller
@RequestMapping("/patientVisit.do")
public class PatientVisitController 
{
	private static Log log = LogFactory.getLog(PatientVisitController.class);
	
	@Autowired
	private PatientVisitService patientVisitService;
	
	@RequestMapping(params = "method=submitMvr")
	public void submitMvr(String param, HttpServletResponse response)
	{
		log.error(param);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
			String retVal = patientVisitService.submitMvr(param);
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
}
