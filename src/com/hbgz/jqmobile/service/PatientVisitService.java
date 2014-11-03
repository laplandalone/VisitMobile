package com.hbgz.jqmobile.service;

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
}
