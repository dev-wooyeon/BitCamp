package com.model2.mvc.service.product.impl;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.user.UserDao;


//==> 회원관리 DAO CRUD 구현
@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ProductDaoImpl() {
		System.out.println(" ProductDaoImpl 생성자 ");
	}

	@Override
	public void insertProdct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	@Override
	public Product getProduct(int prodNo) throws SQLException {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	@Override
	public HashMap<String, Object> getProductList(Map<String, Object> searchMap) throws SQLException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Search search = (Search)searchMap.get("search");
		System.out.println(" searchCondition : "+search.getSearchCondition());
		System.out.println(" searchKeyword : "+search.getSearchKeyword());
		System.out.println(" startRowNum : "+search.getStartRowNum());
		System.out.println(" endRowNum : "+search.getEndRowNum());
		
		searchMap.put("searchCondition", search.getSearchCondition());
		searchMap.put("searchKeyword", search.getSearchKeyword());
		searchMap.put("startRowNum", search.getStartRowNum());
		searchMap.put("endRowNum", search.getEndRowNum());
		System.out.println(" order : " + searchMap.get("order"));
		searchMap.put("order", searchMap.get("order"));
		// 정렬기능 추가 예정
		// searchMap.put("order", search.getOrderCondition());
		
		List<Product> list = sqlSession.selectList("ProductMapper.getProductList", searchMap);
		System.out.println(" :: " + list +"\n");
		map.put("list", list);
		System.out.println(" List 2 : " + map.get("list"));
		return map;
	}
	
	public int getTotalCount(Search search) throws SQLException{
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}

}