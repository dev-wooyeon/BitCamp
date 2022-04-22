package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao ;
	}
	public PurchaseServiceImpl() {
		System.out.println(" PurchaseServiceImpl »ý¼ºÀÚ ");
	}
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		System.out.println("========================= \n" + purchase);
		purchaseDao.addPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.getPurchase(tranNo);
	}

	@Override
	public void getPurchase2(int ProdNo) throws Exception {
		purchaseDao.getPurchase2(ProdNo);
	}

	@Override
	public HashMap<String, Object> getPurchaseList(Search search, Map<String,Object> map1) throws Exception {
		
		System.out.println("1");
		int totalCount = purchaseDao.getTotalCount(map1);
		
		HashMap<String, Object> map = purchaseDao.getPurchaseList(search, map1);
		map.put("list", map.get("list"));
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public HashMap<String, Object> getSaleList(Search searchVO) throws Exception {
		return null;
	}

	@Override
	public void updatePurcahse(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);
	}

	@Override
	public void updateTranCode(int prodNo) throws Exception {
		purchaseDao.updateTranCode(prodNo);
	}
	@Override
	public void updateTranCodeByTranNo(Map<String, Object> map) {
		purchaseDao.updateTranCodeByTranNo(map);
	}

}
