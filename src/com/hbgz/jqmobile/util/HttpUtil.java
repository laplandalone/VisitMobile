package com.hbgz.jqmobile.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import net.sf.json.JSONArray;
public class HttpUtil 
{
//	private static final String url = "http://hiseemedical.com:10821/mobile.htm?method=axis";
	
	private static final String url = "http://123.57.78.38:10841/mobile.htm?method=axis";
	
//	private static final String url = "http://localhost:7001/mobile.htm?method=axis";
	
	public static String http(String param) throws Exception
	{
		URL u = null;
		HttpURLConnection con = null;
		try
		{
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
			osw.write(param);
			osw.flush();
			osw.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			if (con != null)
			{
				con.disconnect();
			}
		}

		// ∂¡»°∑µªÿƒ⁄»›
		StringBuffer buffer = new StringBuffer();
		BufferedReader br = null;
		try
		{
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String temp;
			while ((temp = br.readLine()) != null)
			{
				buffer.append(temp);
				buffer.append("\n");
			}
		} 
		catch (Exception e)
		{	 
			e.printStackTrace();
		}
		finally
		{
			if(br != null)
			{
				br.close();
			}
		}
		String sss=buffer.toString();
		return sss;
	}
	
	public static void main(String[] args) throws Exception 
	{
//		String param = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20030\",securityCode:\"0000000000\",params:{pushUserId:\"1078586329118986050\",pushChannelId:\"\"},rtnDataFormatType:\"user-defined\"}";
		String param = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS3002\",securityCode:\"0000000000\",params:{visitId:\"28931\"},rtnDataFormatType:\"user-defined\"}";
		String retVal = HttpUtil.http(param);
		JSONArray array = JSONArray.fromObject(retVal);
		System.err.println(array);
	}
}
