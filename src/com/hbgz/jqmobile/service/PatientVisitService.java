package com.hbgz.jqmobile.service;

import org.springframework.stereotype.Service;

import com.hbgz.jqmobile.util.HttpUtil;

@Service
public class PatientVisitService 
{
	public String submitMvr(String param) throws Exception 
	{
		String params = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20035\",securityCode:\"0000000000\",params:{param:"+param+"},rtnDataFormatType:\"user-defined\"}";
		return HttpUtil.http(params);
	}
}
