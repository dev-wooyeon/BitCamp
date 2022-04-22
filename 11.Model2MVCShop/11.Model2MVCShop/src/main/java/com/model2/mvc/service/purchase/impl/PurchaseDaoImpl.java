package com.model2.mvc.service.purchase.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;

//==> 雀盔包府 DAO CRUD 备泅
@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PurchaseDaoImpl() {
		System.out.println(" PurchaseDaoImpl 积己磊 ");
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		System.out.println(purchase.getPurchaseProd().getProdNo()+"@@@@@@");
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws SQLException {
		System.out.println(" :: PurchaseDaoImpl getPurchase :: "+tranNo);
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}

	@Override
	public void updateTranCode(int prodNo) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", prodNo);
	}

	@Override
	public HashMap<String, Object> getPurchaseList(Search search,Map<String, Object> map1) throws Exception {
		
		System.out.println("2");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		map.put("buyerId", map1.get("userId"));
		
		map.put("tranStateCode",search.getTranStateCode());
		
		System.out.println("START ROW NUM " + map.get("startRowNum"));
		System.out.println("END ROW NUM " + map.get("endRowNum"));
		System.out.println("BUYER ID " + map.get("buyerId"));
		System.out.println(map.get("buyerId").equals("admin")?"YES":"NO");
		
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
		map.put("list", list);
		
		return map;
	}

	@Override
	public void getPurchase2(int prodNo) throws Exception {
		sqlSession.update("Purchase.getPurchase2", prodNo);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper.getTotalCount",map);
	}

	@Override
	public void updateTranCodeByTranNo(Map<String, Object> map) {
		
		System.out.println(" @@@@@@@ " + map);
		
		sqlSession.update("PurchaseMapper.updateTranCodeByTranNo", map);
	}

//	@Override
//	public HashMap<String, Object> getPurchaseManageList(Search search) {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("startRowNum",search.getStartRowNum());
//		map.put("endRowNum",search.getEndRowNum());
//		
//		System.out.println(map.get("buyerId").equals("user15")?"YES":"NO");
//		
//		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseManageList", map);
//		map.put("list", list);
//		return null;
//	}

	
}