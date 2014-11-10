package com.hbgz.jqmobile.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
public class HttpUtil 
{
//	private static final String url = "http://hiseemedical.com:10821/mobile.htm?method=axis";
	
	private static final String url = "http://172.16.214.43:7002/mobile.htm?method=axis";
	
	public static String http(String param) throws Exception
	{
		URL u = null;
		HttpURLConnection con = null;
		try
		{
			System.out.println("1");
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
			System.out.println("2");
			e.printStackTrace();
		} finally
		{
			System.out.println("3");
			if (con != null)
			{
				con.disconnect();
			}
		}

		// ��ȡ��������
		StringBuffer buffer = new StringBuffer();
		try
		{
			System.out.println("4");
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String temp;
			while ((temp = br.readLine()) != null)
			{
				buffer.append(temp);
				buffer.append("\n");
			}
		} 
		catch (Exception e)
		{	System.out.println("5");
			e.printStackTrace();
		}
		String sss=buffer.toString();
		System.out.println("buffer.toString():"+sss);
		return sss;
	}
	
	public static void main(String[] args) throws Exception 
	{
		String param = "param={channel:\"Q\",channelType:\"PC\",serviceType:\"BUS20030\",securityCode:\"0000000000\",params:{pushUserId:\"1078586329118986050\",pushChannelId:\"\"},rtnDataFormatType:\"user-defined\"}";
		System.err.println(HttpUtil.http(param));
	}
}
