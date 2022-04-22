package com.model2.mvc.web.purchase;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.UserService;

@Controller
public class PurchaseController {


	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public PurchaseController() {
		System.out.println("PurchaseController Defualt Constructor");
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("/addPurchaseView.do")
	public String addPurchaseView() throws Exception {

		System.out.println("/purchaseView.do");
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@RequestMapping("/addPurchase.do")
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, @ModelAttribute("product") Product product , @ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {

		System.out.println("/addPurchase.do");
		System.out.println("1");
		user = (User)session.getAttribute("user");
		
		System.out.println(" :: " + user);
		
		product = productService.getProduct(product.getProdNo());
		System.out.println(" :: "+ product);
		
		System.out.println(" :: " + purchase);
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		System.out.println(" =============== ");
		
		System.out.println(" :: " + purchase);
		
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	
	@RequestMapping("/getPurchase.do")
	public String getPurchase(@RequestParam("tranNo") int tranNo , Model model) throws Exception {
		
		System.out.println(" @@@@@@ "+tranNo);
		
		System.out.println("/getPurchase.do");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		// Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		
		return "forward:/purchase/getPurchase.jsp";
	}
	
	@RequestMapping("/updatePurchaseView.do")
	public String updateUserView(@ModelAttribute("purchase") Purchase purchase, Model model ) throws Exception{

		System.out.println("/updateUserView.do");

		purchase = purchaseService.getPurchase(purchase.getTranNo());
		// Model 과 View 연결
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping("/updatePurchase.do")
	public String updatePurchase(@RequestParam("tranNo") int tranNo, @ModelAttribute("purchase") Purchase purchase , Model model) throws Exception{

		System.out.println("/updatePurchase.do");
		
		System.out.println("========= updatePurchase Area DEBUG START ===========");
		System.out.println(" :: purchase :: " + purchase);
		System.out.println("========= updatePurchase Area DEBUG END =============");
		
		// UPDATE 수행
		purchaseService.updatePurcahse(purchase);
		
		// UPDATE 완료한 데이터 GET
		purchase = purchaseService.getPurchase(tranNo);
		
		// Model ObjectScope에 add
		model.addAttribute("purchase", purchase);
		
		return "redirect:/getPurchase.do?tranNo="+tranNo;
	}
	
	@RequestMapping("/updateTranCode.do")
	public String updateTranCode(@RequestParam("prodNo") int prodNo, HttpServletRequest request) throws Exception{
		
		System.out.println("/updatePurchase.do");
		
		purchaseService.updateTranCode(prodNo);
		
		return "redirect:/listProduct.do?menu="+request.getParameter("menu");
	}
	
	@RequestMapping("/updateTranCodeByTranNo.do")
	public String updateTranCodeByTranNo(@RequestParam("tranNo") int tranNo,
										 Model model , HttpServletRequest request,HttpSession session) throws Exception{
		
		System.out.println("/updatePurchase.do");
		
		purchaseService.updateTranCodeByTranNo(tranNo);
		
		return "forward:/listPurchase.do";
	}
		
	@RequestMapping("/listPurchase.do")
	public String listPurchase( @ModelAttribute("search") Search search , Model model , HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/listPurchase.do");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(search + " :: ");
		
		User user = (User)session.getAttribute("user");
		System.out.println(" listPurchase User :: " + user);
		Map<String , Object> map=purchaseService.getPurchaseList(search, user.getUserId());
		System.out.println(" 111111111 ");
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(" 222222222 ");
		
		System.out.println("==================== DEBUG START =======================");
		System.out.println(" :: resultPage :: " + resultPage + " :: ");
		System.out.println(" :: search :: " + search + " :: ");
		System.out.println(" :: list :: " + map.get("list") + " :: ");
		System.out.println("==================== DEBUG START =======================");
		// Model 과 View 연결
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/purchase/listPurchase.jsp";
	}

}
