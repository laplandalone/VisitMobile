package com.hbgz.jqmobile.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.hbgz.jqmobile.util.HttpUtil;

@Service
public class PatientVisitService 
{
	public String submitMvr(String param,String userId,String visitType) throws Exception 
	{
		String params = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20035\",securityCode:\"0000000000\",params:{param:"+param+",userId:'"+userId+"',visitType:'"+visitType+"'},rtnDataFormatType:\"user-defined\"}";
		return HttpUtil.http(params);
	}
	
	public JSONArray qryVisitDetail(String visitId) throws Exception
	{
		String params = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS3002\",securityCode:\"0000000000\",params:{visitId:\""+visitId+"\"},rtnDataFormatType:\"user-defined\"}";
		String retVal = HttpUtil.http(params);
		return JSONArray.fromObject(retVal);
	}
	
	public JSONArray getUserWakeById(String visitId) throws Exception
	{
		String params = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20051\",securityCode:\"0000000000\",params:{visitId:\""+visitId+"\"},rtnDataFormatType:\"user-defined\"}";
		String retVal = HttpUtil.http(params);
		return JSONArray.fromObject(retVal);
	}
	
	public JSONObject qryPatientVisitById(String visitId) throws Exception
	{
		String params = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS3003\",securityCode:\"0000000000\",params:{visitId:\""+visitId+"\"},rtnDataFormatType:\"user-defined\"}";
		String retVal = HttpUtil.http(params);
		return JSONObject.fromObject(retVal);
	}
}
