package com.hbgz.jqmobile.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbgz.jqmobile.resolver.ServiceEngine;
import com.hbgz.jqmobile.util.ObjectCensor;
import com.hbgz.jqmobile.util.StringUtil;

@Service
public class MyInfoService
{
	//��ȡ�̼��ղ��б�
	public JSONArray getStoreMerchants(String userId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10326\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		JSONObject json =JSONObject.fromObject(ServiceEngine.invokeSer(param));
		String arrayStr =StringUtil.getJSONObjectKeyVal(json, "merchantList");
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		return array;
	}
	
	//ȡ���̼��ղ�
	public String cancelStore(String favoriteId) throws Exception
	{
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1122\",securityCode:\"0000000000\",params:{favorite:\""+favoriteId+"\"},rtnDataFormatType:\"user-defined\"}";
		return ServiceEngine.invokeSer(param);
	}
	
	//��ҳ��ѯ�û���Ա��
	public JSONArray getVipCards(String userId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1075\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String arrayStr =ServiceEngine.invokeSer(param);
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		return array;
	}
	
	//�û�ȡ����Ա��
	public String cancelVipCard(String vipCardInstId) throws Exception
	{
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1074\",securityCode:\"0000000000\",params:{vipCardInstId:\""+vipCardInstId+"\"},rtnDataFormatType:\"user-defined\"}";
		return ServiceEngine.invokeSer(param);
	}
	
	//��ҳ��ѯ�û��Ƽ��̻���Ϣ
	public JSONArray getRecommendMerchants(String userId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
        String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10327\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			String arrayStr =StringUtil.getJSONObjectKeyVal(JSONObject.fromObject(jsonStr), "merchantList");
			if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
			{
				array =JSONArray.fromObject(arrayStr);
			}
		}
        return array;
	}
	
	//��ҳ��ѯ�û��Ƽ��̻���Ʒ��Ϣ
	public JSONArray getRecommendMerchantDishes(String userId,String merchantId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1132\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",merchantId:\""+merchantId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String arrayStr =ServiceEngine.invokeSer(param);
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		return array;
	}
	
	//��ҳ��ѯ�û��Ż�ȯ����
	public JSONArray getDiscountInfo(String userId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
        String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1086\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			String arrayStr =StringUtil.getJSONObjectKeyVal(JSONObject.fromObject(jsonStr), "discountInfo");
			if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
			{
				array =JSONArray.fromObject(arrayStr);
			}
		}
        return array;
	}
	
	//��ѯ�Ż����飨���ؼ�Ȩ��)
	public JSONObject getDiscountDetail(String discountId,String userId) throws Exception
	{
		JSONObject json = new JSONObject();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1089\",securityCode:\"0000000000\",params:{discountId:\""+discountId+"\",userId:\""+userId+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			json =JSONObject.fromObject(jsonStr);
		}
        return json;
	}
	
	//��ҳ��ѯ�Ż������̻�
	public JSONArray getDiscountRelatedMerchants(String discountId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
        String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10811\",securityCode:\"0000000000\",params:{userId:\""+discountId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			String arrayStr =StringUtil.getJSONObjectKeyVal(JSONObject.fromObject(jsonStr), "discountRelatedInfo");
			if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
			{
				array =JSONArray.fromObject(arrayStr);
			}
		}
        return array;
	}
	
	//��ҳ��ѯ�û�����
	public JSONObject getAppraiseList(String userId,String type,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONObject json = new JSONObject();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1104\",securityCode:\"0000000000\",params:{pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\",userId:\""+userId+"\",type:\""+type+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			json =JSONObject.fromObject(jsonStr);
		}	
        return json;

	}
	
	
	//��ҳ��ѯ�û������Ŷ���
	public JSONArray getUserQueueList(String userId,String queueType,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1028\",securityCode:\"0000000000\",params:{pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\",userId:\""+userId+"\",queueType:\""+queueType+"\"},rtnDataFormatType:\"user-defined\"}";
		String arrayStr =ServiceEngine.invokeSer(param);
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		
		return array;
	}
	
	//�û�ȡ��Ԥ��(ȡ���Ŷ�)
	public String cancelQueue(String userId,String queueId,String mobileNbr) throws Exception
	{
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1029\",securityCode:\"0000000000\",params:{queueId:\""+queueId+"\",userId:\""+userId+"\",mobileNbr:\""+mobileNbr+"\"},rtnDataFormatType:\"user-defined\"}";
		return ServiceEngine.invokeSer(param);
	}
	
	//��ȡ�û��Ĵ���ȯ��Ϣ
	public JSONArray getVouchersInfo(String accountId) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS11617\",securityCode:\"0000000000\",params:{accountId:\""+accountId+"\"},rtnDataFormatType:\"user-defined\"}";
		String arrayStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
		{
        	array =JSONArray.fromObject(arrayStr);
		}	
        return array;
	}
	
	//��ҳ��ѯ�û��Ķ�����Ϣ
	public JSONArray getUserOrderList(String userId,String orderType,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10512\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\",state:\"\",orderType:\""+orderType+"\"},rtnDataFormatType:\"user-defined\"}";		
		String arrayStr =ServiceEngine.invokeSer(param);
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		
		return array;
	}
	
	//�û�����
	public JSONObject userCancelOrder(String orderId) throws Exception
	{
		JSONObject json = new JSONObject();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10511\",securityCode:\"0000000000\",params:{orderId:\""+orderId+"\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			json =JSONObject.fromObject(jsonStr);
		}	
        return json;
	}
	
	//�û����볷��
	public JSONObject applyCancelOrder(String orderId, String remark,String userId) throws Exception
	{
		JSONObject json = new JSONObject();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10520\",securityCode:\"0000000000\",params:{orderId:\""+orderId+"\",remark:\""+remark+"\",type:\"U\",userId:\""+userId+"\"},rtnDataFormatType:\"user-defined\"}";		
		String jsonStr =ServiceEngine.invokeSer(param);
		if(jsonStr.indexOf("flag")!=-1)
		{
			json =JSONObject.fromObject(jsonStr);
		}
		else if(ObjectCensor.isStrRegular(jsonStr))
		{
			json.put("flag", "false");
			json.put("msg", "jsonStr");
		}
		return json;
	}
	
	//��ѯ��������
	public JSONObject getOrderDetail(String orderId) throws Exception
	{
		JSONObject json = new JSONObject();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS10517\",securityCode:\"0000000000\",params:{orderId:\"10671\"},rtnDataFormatType:\"user-defined\"}";
		String jsonStr =ServiceEngine.invokeSer(param);
        if(ObjectCensor.isStrRegular(jsonStr)&&!"null".equals(jsonStr))
		{
			json =JSONObject.fromObject(jsonStr);
		}	
        return json;
	}
	
	//��ҳ��ѯ�û�����Ϣ
	public JSONArray getUserMessages(String userId,Integer pageNum,Integer pageSize) throws Exception
	{
		JSONArray array = new JSONArray();
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1042\",securityCode:\"0000000000\",params:{userId:\""+userId+"\",pageNum:\""+pageNum+"\",pageSize:\""+pageSize+"\"},rtnDataFormatType:\"user-defined\"}";
		String arrayStr =ServiceEngine.invokeSer(param);
		if(ObjectCensor.isStrRegular(arrayStr)&&!"null".equals(arrayStr)&&!"[]".equals(arrayStr))
		{
			array =JSONArray.fromObject(arrayStr);
		}
		return array;
	}
	
	//�û�ɾ����Ϣ
	public String deleteMessage(String messageId) throws Exception
	{
		String param = "{channel:\"Q\",channelType:\"PC\",serviceType:\"BUS1041\",securityCode:\"0000000000\",params:{messageId:\""+messageId+"\"},rtnDataFormatType:\"user-defined\"}";		
		return ServiceEngine.invokeSer(param);
	}
}
