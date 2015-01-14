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
		String sql="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where patient_id='PID000251940' order by check_type";

		String sql6="select  top 1 * from view_ssqk_app";
		String sql1="select  top 10 * from mzbrxx";
		String sql2="select  top 10 * from view_lx_result_app ";
		String sql5="select  convert(varchar(10),check_time,110) check_time from  view_lis_lx_app where patient_id='PID000100014' group by convert(varchar(10),check_time,110)";
		
		String sql3="select  * from mzbrxx where patient_id='PID000000014' and identity_id='420102400905311   '";
		String sql4="select  * from mzbrxx where patient_id='PID000000014'";
		String sql7="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where patient_id='PID000251940' and convert(varchar(10),check_time,110)='12-05-2014' order by check_type";
		String sqlss="select  * from view_lis_result_app  where patient_id='PID000251940'";
		String sqlsss="select  distinct(check_type_id),check_type from  view_lis_lx_app where patient_id='PID000595293'";
		String ssss="select check_type,check_type_id from view_lis_result_app where    patient_id='PID000251940'";
		String ssssss="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where check_type_id=291 patient_id='PID000251940' and convert(varchar(10),check_time,110)='12-05-2014' ";
		String retVal = HisHttpUtil.http(ssssss);
		System.err.println(retVal);
	}
}
