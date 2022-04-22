package com.model2.mvc.service.product.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;



/*
 *	FileName :  productServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Test
	@SuppressWarnings("deprecation")
	public void testAddproduct() throws Exception {
		
		Product product  = new Product();
		Date date = new Date(2016,8,30);
		product.setFileName("testproductFileName");
		product.setManuDate("20190423");
		product.setPrice(55555);
		product.setProdDetail("testproductProdDetail");
		product.setProdName("testproductProdName");
		product.setProdNo(44444);
		product.setProTranCode("000");
		product.setRegDate(date);
		
		productService.addProduct(product);
		
		//product = productService.getProduct(44444);

		//==> console 확인
		//System.out.println(product);
		
		//==> API 확인
		Assert.assertEquals("testproductFileName", product.getFileName());
		Assert.assertEquals("20190423", product.getManuDate());
		Assert.assertEquals(55555, product.getPrice());
		Assert.assertEquals("testproductProdDetail", product.getProdDetail());
		Assert.assertEquals("testproductProdName", product.getProdName());
		Assert.assertEquals(44444, product.getProdNo());
		Assert.assertEquals("000", product.getProTranCode());
		Assert.assertEquals(date, product.getRegDate());
	}
	
	
	//@Test
	public void testGetproduct() throws Exception {
		
		Product product = new Product();
		
		System.out.println(" 1111 ");
		
		product = productService.getProduct(44444);
		System.out.println("4");
		//==> console 확인
		System.out.println(product);
		
		//==> API 확인
		Assert.assertEquals("testproductFileName", product.getFileName());
		Assert.assertEquals("20190423", product.getManuDate());
		Assert.assertEquals(55555, product.getPrice());
		Assert.assertEquals("testproductProdDetail", product.getProdDetail());
		Assert.assertEquals("testproductProdName", product.getProdName());
		Assert.assertEquals(44444, product.getProdNo());
		//Assert.assertEquals("000", product.getProTranCode());
		//Assert.assertEquals(new Date(2016,8,30), product.getRegDate());

		Assert.assertNotNull(productService.getProduct(44444));
	}
	
	
	// @Test
	 public void testUpdateproduct() throws Exception{
		 
		Product product = productService.getProduct(44444);
		Assert.assertNotNull(product);
		
		Assert.assertEquals(44444, product.getProdNo());
		Assert.assertEquals("change", product.getProdName());

		product.setProdName("change1");
		product.setProdDetail("changeDetailtest1");
		product.setManuDate("20190405");
		product.setPrice(99998);
		product.setFileName("changeFileNameTest1");
		
		productService.updateProduct(product);
		
		product = productService.getProduct(44444);
		
		Assert.assertNotNull(product);
		
		//==> console 확인
		//System.out.println(product);
		
		//==> API 확인
		Assert.assertEquals("change1", product.getProdName());
		Assert.assertEquals("changeDetailtest1", product.getProdDetail());
		Assert.assertEquals("20190405", product.getManuDate());
		Assert.assertEquals(99998, product.getPrice());
		Assert.assertEquals("changeFileNameTest1", product.getFileName());
		
		System.out.println(" UpdateComplete product : " + product);
	 }
	 
	 //@Test
	 public void testGetProductListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	
	 	for(int i = 0 ; i < list.size() ; i ++) {
	 		System.out.println(list.get(i));
	 	}
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 /*
	 //@Test
	 public void testGetproductListByproductId() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("admin");
	 	Map<String,Object> map = productService.getproductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getproductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetproductListByproductName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("SCOTT");
	 	Map<String,Object> map = productService.getproductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = productService.getproductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
		//==> console 확인
	 	System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 
	 */
}