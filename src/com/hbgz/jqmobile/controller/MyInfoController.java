package com.hbgz.jqmobile.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hbgz.jqmobile.service.MyInfoService;
import com.hbgz.jqmobile.util.ObjectCensor;

@Controller
@RequestMapping("/myinfo.do")
public class MyInfoController
{
	@Autowired
	private MyInfoService myinfoService;
	
	@RequestMapping(params = "method=getStoreMerchants")
	public void getStoreMerchants(String userId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId , pageNum , pageSize))
			{
				JSONArray array = myinfoService.getStoreMerchants(userId, Integer.valueOf(pageNum),  Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
		
	}
	
	@RequestMapping(params = "method=cancelStore")
	public void cancelStore(String favoriteId,HttpServletResponse response)
	{
		PrintWriter out = null;
		String result ="";
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(favoriteId))
			{
				result = myinfoService.cancelStore(favoriteId);
			}
			out.write(result);    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
		
	}
	
	
	@RequestMapping(params = "method=getVipCards")
	public void getVipCards(String userId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId , pageNum , pageSize))
			{
				JSONArray array = myinfoService.getVipCards(userId, Integer.valueOf(pageNum),  Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
		
	}
	
	
	@RequestMapping(params = "method=cancelVipCard")
	public void cancelVipCard(String vipCardInstId,HttpServletResponse response)
	{
		PrintWriter out = null;
		String result ="";
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(vipCardInstId))
			{
				result = myinfoService.cancelVipCard(vipCardInstId);
			}
			out.write(result);    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	
	@RequestMapping(params = "method=getRecommendMerchants")
	public void getRecommendMerchants(String userId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONArray array = myinfoService.getRecommendMerchants(userId, Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getRecommendMerchantDishes")
	public void getRecommendMerchantDishes(String userId,String merchantId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId,merchantId))
			{
				JSONArray array = myinfoService.getRecommendMerchantDishes(userId,merchantId,Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getDiscountInfo")
	public void getDiscountInfo(String userId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONArray array = myinfoService.getDiscountInfo(userId,Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getDiscountDetail")
	public void getDiscountDetail(String discountId,String userId,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONObject json = myinfoService.getDiscountDetail(discountId,userId);
				out.write(json.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getDiscountRelatedMerchants")
	public void getDiscountRelatedMerchants(String discountId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(discountId))
			{
				JSONArray array = myinfoService.getDiscountRelatedMerchants(discountId,Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	
	@RequestMapping(params = "method=getAppraiseList")
	public void getAppraiseList(String userId,String type,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONObject json = myinfoService.getAppraiseList(userId,type,Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(json.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getUserQueueList")
	public void getUserQueueList(String userId,String queueType,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONArray array = myinfoService.getUserQueueList(userId,queueType,Integer.valueOf(pageNum),Integer.valueOf(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=cancelQueue")
	public void cancelQueue(String userId,String queueId,String mobileNbr,HttpServletResponse response)
	{
		PrintWriter out = null;
		String result ="";
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId,queueId,mobileNbr))
			{
				result = myinfoService.cancelQueue(userId, queueId, mobileNbr);
			}
			out.write(result);    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getVouchersInfo")
	public void getVouchersInfo(String accountId,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(accountId))
			{
				JSONArray array = myinfoService.getVouchersInfo(accountId);
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getUserOrderList")
	public void getUserOrderList(String userId,String orderType,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONArray array = myinfoService.getUserOrderList(userId,orderType,Integer.parseInt(pageNum), Integer.parseInt(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=userCancelOrder")
	public void userCancelOrder(String orderId,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(orderId))
			{
				JSONObject json = myinfoService.userCancelOrder(orderId);
				out.write(json.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=applyCancelOrder")
	public void applyCancelOrder(String orderId, String remark,String userId,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONObject json = myinfoService.applyCancelOrder(orderId, remark, userId);
				out.write(json.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	@RequestMapping(params = "method=getOrderDetail")
	public void getOrderDetail(String orderId,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(orderId))
			{
				JSONObject json = myinfoService.getOrderDetail(orderId);
				out.write(json.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	
	@RequestMapping(params = "method=getUserMessages")
	public void getUserMessages(String userId,String pageNum,String pageSize,HttpServletResponse response)
	{
		PrintWriter out = null;
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(userId))
			{
				JSONArray array = myinfoService.getUserMessages(userId,Integer.parseInt(pageNum), Integer.parseInt(pageSize));
				out.write(array.toString());
			}
			else
			{
				out.write("");    
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	
	@RequestMapping(params = "method=deleteMessage")
	public void deleteMessage(String messageId,HttpServletResponse response)
	{
		PrintWriter out = null;
		String result ="";
		try
		{
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			if(ObjectCensor.isStrRegular(messageId))
			{
				result = myinfoService.deleteMessage(messageId	);
			}
			out.write(result);    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
}
