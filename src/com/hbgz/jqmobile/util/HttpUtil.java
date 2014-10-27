package com.hbgz.jqmobile.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
public class HttpUtil 
{
//	private static final String url = "http://hiseemedical.com:10821/mobile.htm?method=axis";
	
	private static final String url = "http://localhost:7001/mobile.htm?method=axis";
	
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
		try
		{
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
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
		return buffer.toString();
	}
	
	public static void main(String[] args) throws Exception 
	{
		String param = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20030\",securityCode:\"0000000000\",params:{pushUserId:\"1078586329118986050\",pushChannelId:\"\"},rtnDataFormatType:\"user-defined\"}";
		System.err.println(HttpUtil.http(param));
	}
}
