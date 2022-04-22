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
	
	public HashMap<String, Object> getProductList(Search search) throws SQLException;

	/*
	private int getTotalCount(String sql) throws SQLException {
		
		System.out.println(" GET TOTAL COUNT ///// "+sql);
		sql = "SELECT COUNT(*) FROM ( "+ sql +" ) countTable";
		
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs  = pstmt.executeQuery();
		
		int totalCount = 0 ;
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		
		pstmt.close();
		con.close();
		rs.close();
		
		return totalCount;
	}
	
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