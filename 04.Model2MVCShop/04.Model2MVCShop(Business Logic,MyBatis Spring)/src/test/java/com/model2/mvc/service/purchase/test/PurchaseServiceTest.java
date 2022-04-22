package com.model2.mvc.service.purchase.test;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.user.UserService;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/commonservice.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	
	@SuppressWarnings("deprecation")
	Date date = new Date(19,4,24);
	
	//@Test
	public void testAddPurchase() throws Exception {
		
		// �׽�Ʈ�� �� ����
		Purchase purchase = new Purchase();
		
		Product product = new Product();
		product.setProdNo(10002);
		purchase.setPurchaseProd(product);
		
		System.out.println(purchase.getPurchaseProd().getProdNo());
		
		purchase.getPurchaseProd().getProdNo();
		
		User user = new User();
		user.setUserId("user01");
		purchase.setBuyer(user);

		System.out.println(purchase.getBuyer().getUserId());
		
		purchase.setPaymentOption("1");
		purchase.setReceiverName("testReceiverName");
		purchase.setReceiverPhone("01011112222");
		purchase.setDivyAddr("testAddr");
		purchase.setDivyRequest("testRequest");
		purchase.setTranCode("1");
		purchase.setOrderDate(date);
		purchase.setDivyDate("190419");
		
		System.out.println(purchase);
		
		purchaseService.addPurchase(purchase);
		
		// ��ǰ��ȣ�� �˻�
		//purchase = purchaseService.getPurchase(tranNo);

		// �����
		System.out.println(" :: purchase testAddPurchase :: " + purchase);
		
		// �׽�Ʈ
		Assert.assertEquals(10002, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user01",purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption());
		Assert.assertEquals("testReceiverName", purchase.getReceiverName());
		Assert.assertEquals("01011112222", purchase.getReceiverPhone());
		Assert.assertEquals("testAddr", purchase.getDivyAddr());
		Assert.assertEquals("testRequest", purchase.getDivyRequest());
		Assert.assertEquals("1", purchase.getTranCode());
		Assert.assertEquals(date, purchase.getOrderDate());
		Assert.assertEquals("190419", purchase.getDivyDate());
	}
	
	//@Test
	public void testGetPurchase() throws Exception {
		
		Purchase purchase = new Purchase();

		purchase = purchaseService.getPurchase(10001);
		
		//==> API Ȯ��

		Assert.assertEquals(10002, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user01",purchase.getBuyer().getUserId());
		Assert.assertEquals("1", purchase.getPaymentOption().trim());
		Assert.assertEquals("testReceiverName", purchase.getReceiverName());
		Assert.assertEquals("01011112222", purchase.getReceiverPhone());
		Assert.assertEquals("testAddr", purchase.getDivyAddr());
		Assert.assertEquals("testRequest", purchase.getDivyRequest());
		Assert.assertEquals("1", purchase.getTranCode().trim());
		Assert.assertEquals(date, purchase.getOrderDate());
		
		System.out.println(purchase.getDivyDate());
		
		String date1  = purchase.getDivyDate().substring(2,4);
		date1 += purchase.getDivyDate().substring(5,7);
		date1 += purchase.getDivyDate().substring(8,10);
		
		System.out.println(date1);
		
		//Assert.assertEquals(date1, purchase.getDivyDate());

		Assert.assertNotNull(purchaseService.getPurchase(purchase.getTranNo()));
	}
	
	//@Test
	 public void testUpdatePurchase() throws Exception{
		 
		
		Purchase purchase = purchaseService.getPurchase(10001);
		Assert.assertNotNull(purchase);
		
		Assert.assertEquals(10002, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user01",purchase.getBuyer().getUserId());
		Assert.assertEquals("2", purchase.getPaymentOption().trim());
		Assert.assertEquals("testReceiverName2", purchase.getReceiverName());
		Assert.assertEquals("01022223333", purchase.getReceiverPhone());
		Assert.assertEquals("testAdd2r", purchase.getDivyAddr());
		Assert.assertEquals("testRequest2", purchase.getDivyRequest());
		Assert.assertEquals("2", purchase.getTranCode().trim());
		Assert.assertEquals(date, purchase.getOrderDate());
		//Assert.assertEquals("190419", purchase.getDivyDate());
		
		purchase.setPaymentOption("2");
		purchase.setReceiverName("testReceiverName2");
		purchase.setReceiverPhone("01022223333");
		purchase.setDivyAddr("testAdd2r");
		purchase.setDivyRequest("testRequest2");
		purchase.setTranCode("3");
		purchase.setOrderDate(date);
		//purchase.setDivyDate("190419");
		
		purchaseService.updatePurcahse(purchase);
		
		purchase = purchaseService.getPurchase(10001);
		System.out.println(purchase);
		Assert.assertNotNull(purchase);
		System.out.println("1");
		System.out.println(purchase);
			
		//==> API Ȯ��
		Assert.assertEquals(10002, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user01",purchase.getBuyer().getUserId());
		Assert.assertEquals("2", purchase.getPaymentOption().trim());
		Assert.assertEquals("testReceiverName2", purchase.getReceiverName());
		Assert.assertEquals("01022223333", purchase.getReceiverPhone());
		Assert.assertEquals("testAdd2r", purchase.getDivyAddr());
		Assert.assertEquals("testRequest2", purchase.getDivyRequest());
		Assert.assertEquals("3", purchase.getTranCode().trim());
		Assert.assertEquals(date, purchase.getOrderDate());
		//Assert.assertEquals("190419", purchase.getDivyDate());
	 }
	 
	 @Test
	 public void testGetPurchaseListByUserId() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	String buyerId = "user01";
	 	
	 	
	 	Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
	 	System.out.println("1");
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis()); 
	 	// Unique�� ���� ��Ƴ��� ���� SKILL �����ϱ� ���� ���� RANDOM�� ���� ��� ���� �ߺ�üũ ? �� �ʿ����
	 	// �ߺ��� ��Ȳ�� 1���� ������ �ߺ�üũ ���־���ϴµ� ����ð��� �귯���⶧���� Unique�� ���� ���� �� �ִ�.
	 	// Test������ �ƴϿ��� ���Ǵ� �˾Ƶ���
	 	//map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
}