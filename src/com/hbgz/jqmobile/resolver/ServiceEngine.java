package com.hbgz.jqmobile.resolver;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.rmi.RemoteException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

import com.hbgz.jqmobile.util.StringUtil;



public class ServiceEngine 
{
	private static String urlStr ="http://58.53.209.120:7001/autoQueueUp/mobile.htm?method=axis";//测试环境
//	private static String urlStr ="http://www.tyhcl.com/mobile.htm?method=axis";//正式环境
	

	public static String invokeSer(String param) throws Exception
	{
		URL url = new URL(urlStr);
		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);  
		OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "utf-8");  
	    out.write("param="+param); //post的关键所在！      
	    out.flush();  
	    out.close();  
	    String sCurrentLine;  
        String sTotalString;  
        sCurrentLine = "";  
        sTotalString = "";  
        InputStream l_urlStream;  
        l_urlStream = connection.getInputStream();     
        BufferedReader l_reader = new BufferedReader(new InputStreamReader(l_urlStream,"utf-8"));  
        while ((sCurrentLine = l_reader.readLine()) != null) 
        {  
            sTotalString += sCurrentLine;  
        }  
        return sTotalString;  		
	}
	public static void main(String[] args) throws Exception
	{
		String userId ="72431";
//      String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1132\",securityCode:\"0000000000\",params:{userId:\"72431\",merchantId:\"900000000008\",pageNum:\"1\",pageSize:\"10\"},rtnDataFormatType:\"user-defined\"}";
//      String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10327\",securityCode:\"0000000000\",params:{userId:\"72431\",pageNum:\"1\",pageSize:\"10\"},rtnDataFormatType:\"user-defined\"}";
//		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1086\",securityCode:\"0000000000\",params:{userId:\"72431\",pageNum:\"1\",pageSize:\"10\"},rtnDataFormatType:\"user-defined\"}";
//		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1089\",securityCode:\"0000000000\",params:{discountId:\"1\",userId:\"70670\"},rtnDataFormatType:\"user-defined\"}";
//		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1104\",securityCode:\"0000000000\",params:{pageNum:\"1\",pageSize:\"10\",userId:\"72431\",type:\"DISHES\"},rtnDataFormatType:\"user-defined\"}";
//		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1028\",securityCode:\"0000000000\",params:{pageNum:\"9\",pageSize:\"10\",userId:\"72431\",queueType:\"H\"},rtnDataFormatType:\"user-defined\"}";
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10512\",securityCode:\"0000000000\",params:{userId:\"72431\",pageNum:\"1\",pageSize:\"10\",state:\"\",orderType:\"REPAST\"},rtnDataFormatType:\"user-defined\"}";		
//		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10517\",securityCode:\"0000000000\",params:{orderId:\"13664\"},rtnDataFormatType:\"user-defined\"}";
		System.out.println(ServiceEngine.invokeSer(param));
	}
}
