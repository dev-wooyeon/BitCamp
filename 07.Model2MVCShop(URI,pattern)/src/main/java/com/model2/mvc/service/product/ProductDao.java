package com.model2.mvc.service.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	public void insertProdct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;

	public void updateProduct(Product product) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws SQLException;

	public int getTotalCount(Search search) throws SQLException;
	/*
	private String makeCurrentPageSql(String sql, Search search){

		System.out.println(" MAKE CURRENT PAGE SQL ///// "+sql);
		System.out.println(" MAKE CURRENT PAGE SQL ///// "+search);
		sql = 	"SELECT * "+ 
				"FROM (SELECT inner_table.*, ROWNUM AS row_seq " +
							"FROM ("+sql+") inner_table "+
							"WHERE ROWNUM <="+search.getCurrentPage()*search.getPageSize()+" ) " +
				"WHERE row_seq BETWEEN "+((search.getCurrentPage()-1)*search.getPageSize()+1) +" AND "+search.getCurrentPage()*search.getPageSize();
		return sql;
	} */
}