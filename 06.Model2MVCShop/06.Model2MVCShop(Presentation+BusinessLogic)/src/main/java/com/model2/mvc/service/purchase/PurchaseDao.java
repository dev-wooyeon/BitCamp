package com.model2.mvc.service.purchase;

import java.util.HashMap;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	
	public void addPurchase(Purchase purchase) throws Exception ;
	
	public HashMap<String,Object> getPurchaseList(Search search,String buyerId) throws Exception;

	public Purchase getPurchase(int tranNo) throws Exception;

	public void getPurchase2(int prodNo) throws Exception;

	public void updateTranCode(int tranNo) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public int getTotalCount(String buyerId) throws Exception ;

	public void updateTranCodeByTranNo(int tranNo);
}
