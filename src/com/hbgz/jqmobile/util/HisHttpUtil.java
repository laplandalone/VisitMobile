package com.hbgz.jqmobile.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
public class HisHttpUtil 
{
	private static String urls="http://27.17.0.42:10821/his/mobile.htm?method=axis&param=";
	public static String http(String param) throws Exception
	{
		URL u = null;
		HttpURLConnection con = null;
		try
		{
			u = new URL(urls+param);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream(), "UTF-8");
//			osw.write(param);
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
//		String sql="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where patient_id='PID000251940' order by check_type";

		String sql="select  top 50 * from view_ssqk_app";
		String sql1="select  top 10 * from mzbrxx";
		String sql2="select  top 30 * from view_lis_result_app";
		String sql3="select  * from mzbrxx where patient_id='PID000000014' and identity_id='420102400905311   '";
		String sql4="select  * from mzbrxx where patient_id='PID000000014'";
		String retVal = HisHttpUtil.http(sql4);
		System.err.println(retVal);
	}
}
