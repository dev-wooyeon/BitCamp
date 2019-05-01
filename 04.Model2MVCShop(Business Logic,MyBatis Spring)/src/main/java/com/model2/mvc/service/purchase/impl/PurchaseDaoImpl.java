package com.model2.mvc.service.purchase.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
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
	public int addPurchase(Purchase purchase) throws Exception {
		System.out.println(purchase.getPurchaseProd().getProdNo()+"@@@@@@");
		return sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws SQLException {
		System.out.println(" :: PurchaseDaoImpl getPurchase :: "+tranNo);
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}

	@Override
	public void updateTranCode(int tranNo) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", tranNo);
	}

	@Override
	public HashMap<String, Object> getPurchaseList(Search search,String buyerId) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		map.put("pageSize",search.getPageSize());
		map.put("currentPage",search.getCurrentPage());
		map.put("buyerId",buyerId);
		
		System.out.println(map.get("buyerId").equals("user01")?"YES":"NO");
		
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

	
}