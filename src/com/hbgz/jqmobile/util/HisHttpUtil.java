package com.hbgz.jqmobile.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class HisHttpUtil 
{
	private static String urls="http://27.17.0.42:10821/his/mobile.htm?method=axis&param=";
//	private static String urls="http://mobilemedical.net.cn:10821/his/mobile.htm?method=axis&param=";
	
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

		// ��ȡ��������
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

		String sql6="select  top 10000 convert(varchar(10),operation_time,102) operation_time,patient_id from view_ssqk_app   order by operation_time desc";
		
		String sql1="select  top 10 patient_name,patient_id from mzbrxx where  patient_id='PID000595293'";
		String sql2="select  top 50 * from view_ssqk_app ";
		String sql5="select  convert(varchar(10),check_time,110) check_time from  view_lis_lx_app where patient_id='PID000100014' group by convert(varchar(10),check_time,110)";
		
		String sql3="select  * from mzbrxx where patient_id='PID000000014' and identity_id='420102400905311   '";
		String sql4="select rtrim(v.operation_type) operation_type,rtrim(v.department) department,rtrim(v.patient_id) patient_id,convert(varchar(10),v.operation_time,102) operation_time,rtrim(m.patient_name) patient_name from view_ssqk_app v,mzbrxx m where v.patient_id=m.patient_id and v.patient_id='PID000595293' ";
		String sql7="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where patient_id='PID000251940' and convert(varchar(10),check_time,110)='12-05-2014' order by check_type asc";
		String sqlss="select  * from view_lis_result_app  where patient_id='PID000251940'";
		String sqlsss="select  distinct(check_type_id),check_type from  view_lis_lx_app where patient_id='PID000595293'";
		String ssss="select check_type,check_type_id from view_lis_result_app where    patient_id='PID000251940'";
		String ssssss="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,110) check_time from view_lis_result_app where check_type_id=291 patient_id='PID000251940' and convert(varchar(10),check_time,110)='12-05-2014' ";
		String a=" select  convert(varchar(10),check_time,102) check_time from  view_lis_lx_app where patient_id='PID000595293' group by convert(varchar(10),check_time,102)  order by check_time desc ";
		String b="select card_id,sample_type,patient_id,check_scope,check_unit,check_name,department,check_result,check_type,convert(varchar(10),check_time,102) check_time from view_lis_result_app where      convert(varchar(10),check_time,102)='2015.01.14' ";
		String ss="select top 10 card_id,sample_type,patient_id,rtrim(check_scope)check_scope,check_unit,check_name,department,rtrim(check_result)check_result,check_type,convert(varchar(10),check_time,102) check_time from view_lis_result_app";
		String retVal = HisHttpUtil.http(sql2);
		JSONArray array = JSONArray.fromObject(retVal);
		 
		System.err.println(retVal);
//		String patientId="PID000251940";
//		patientId=patientId.substring(patientId.length()-6,patientId.length());
//		System.out.println(patientId);
	}
}
