package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/addPurchase", method=RequestMethod.POST )
	public Purchase purchase(@RequestBody Purchase purchase,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/addUser : POST");
		//Business Logic
		System.out.println("::"+purchase);
		
		purchaseService.addPurchase(purchase);
		
		Purchase purchase01 = purchaseService.getPurchase(purchase.getTranNo());
		
		System.out.println("1111111111111111111111111 \n" + purchase);
		
		return purchase01;
	}
	
	
}