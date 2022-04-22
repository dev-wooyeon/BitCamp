package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

// ��ǰ���� ���� ����
@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService{
	
	// �ʵ�
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao; 
	}
	
	// ������
	public ProductServiceImpl() {
		System.out.println(" ProductServiceImpl ������ ");
	}
	
	
	// �޼ҵ�
	@Override
	public void addProduct(Product product) throws Exception {
		productDao.insertProdct(product);
		
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		System.out.println("1");
		Product product = productDao.getProduct(prodNo);
		System.out.println("3");
		return product;
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		List<User> list= (List<User>) productDao.getProductList(search);
		//int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		//map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		System.out.println("4");
		productDao.updateProduct(product);
	}

} // Ŭ������ ��
