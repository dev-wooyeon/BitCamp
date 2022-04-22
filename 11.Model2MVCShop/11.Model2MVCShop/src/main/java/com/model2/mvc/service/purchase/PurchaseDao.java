package com.model2.mvc.service.purchase;

import java.util.HashMap;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public interface PurchaseDao {
	
	public void addPurchase(Purchase purchase) throws Exception ;
	
	public HashMap<String,Object> getPurchaseList(Search search,Map<String, Object> map) throws Exception;

	public Purchase getPurchase(int tranNo) throws Exception;

	public void getPurchase2(int prodNo) throws Exception;

	public void updateTranCode(int tranNo) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception ;

	public void updateTranCodeByTranNo(Map<String, Object> map);

	//public HashMap<String, Object> getPurchaseManageList(Search search);
}
