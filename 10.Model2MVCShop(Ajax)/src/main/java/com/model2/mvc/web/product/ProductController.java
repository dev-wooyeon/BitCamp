package com.model2.mvc.web.product;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.comment.impl.CommentServiceImpl;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {


	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	public ProductController() {
		System.out.println("ProductController Defualt Constructor");
	}
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("/addProductView")
	public String addProductView() throws Exception {

		System.out.println("/ProductView");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping("/addProduct")
	public String addProduct( @ModelAttribute("product") Product product, HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file) throws Exception {

		System.out.println("/addProduct");
		//Business Logic
		String date = product.getManuDate();
		String temp = "";
		String[] dateArray = date.split("-");
		
		System.out.println("file :: " + file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());
		
		File target = new File(uploadPath, file.getOriginalFilename());
		FileCopyUtils.copy(file.getBytes(), target);
		
		for(int i = 0 ; i < dateArray.length ; i++) {
			temp += dateArray[i];
		}
		
		System.out.println("파싱후 :: " + temp );
		
		product.setManuDate(temp);
		
		productService.addProduct(product);
		
		request.setAttribute("product", product);
		
		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping("/getProduct")
	public String getProduct( @RequestParam("menu") String menu, @RequestParam("prodNo") int prodNo , Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
		/*String history="";
		cookie = new Cookie("history",String.valueOf(prodNo));
		System.out.println("cookie : " + cookie.getValue());
		history += cookie.getValue()+",";
		System.out.println("history : " + history);
		cookie = new Cookie("history", java.net.URLEncoder.encode(history, "utf-8"));
		
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		
		response.addCookie(cookie);*/
		
		System.out.println("/getProduct");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		Map<String, Object> map = commentService.getCommentList(prodNo);
		
		// Model 과 View 연결
		session.setAttribute("product", product);
		request.setAttribute("list", map.get("list"));
		if(menu.equals("manage")) {
			return "forward:/product/updateProduct.jsp";
		}
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping("/updateProductView")
	public String updateUserView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateUserView");

		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping("/updateProduct")
	public String updateproduct(@RequestParam("prodNo") int prodNo, @RequestParam("file") MultipartFile file, @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("/updateProduct");

		System.out.println(" updateProduct : " + file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());
		
		File target = new File(uploadPath, file.getOriginalFilename());
		FileCopyUtils.copy(file.getBytes(), target);
		
		productService.updateProduct(product);
		
		return "redirect:/product/updateProductView?prodNo="+prodNo;
	}
	
	@RequestMapping("/listProduct")
	public String listProduct( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		
		if(request.getParameter("pageSize") == null) {
			search.setPageSize(pageSize);
		} else {
			String repageSize = (String)request.getParameter("pageSize");
			search.setPageSize(Integer.parseInt(repageSize));
		}
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("search",search);
		
		if(request.getParameter("order") == null) {
			searchMap.put("order", "p.prod_no");
		} else if(request.getParameter("order").equals("1")) {
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE DESC");
		} else if(request.getParameter("order").equals("2")){
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE ASC");
		}	
			
		System.out.println(" getParameter : " + request.getParameter("menu"));
		
		System.out.println(search + " :: ");
		// Business logic 수행
		System.out.println(search.getStartRowNum()+" "+search.getEndRowNum());
		Map<String , Object> map=productService.getProductList(searchMap);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		System.out.println(resultPage);
		
		// Model 과 View 연결	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}
