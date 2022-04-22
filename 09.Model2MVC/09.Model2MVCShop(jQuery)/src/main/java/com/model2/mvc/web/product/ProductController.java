package com.model2.mvc.web.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {


	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
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
	public String addProduct( @ModelAttribute("product") Product product, HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, @RequestParam("prodNo") int prodNo) throws Exception {

		System.out.println("/addProduct");
		//Business Logic
		String date = product.getManuDate();
		String temp = "";
		String[] dateArray = date.split("-");
		
		System.out.println("file :: " + file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());
		
		File target = new File(uploadPath, file.getOriginalFilename());
		FileCopyUtils.copy(file.getBytes(), target);
		
		String history=null;
		Cookie cookie = new Cookie("history", String.valueOf(prodNo));
		cookie.setMaxAge(60*60*24);
		System.out.println("cookie : " + cookie);
		history += cookie+",";
		response.addCookie(cookie);
		
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
	public String getProduct( @RequestParam("menu") String menu, @RequestParam("prodNo") int prodNo , Model model, HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println(" @@@@@@ "+menu);
		
		String temp=null;
		Cookie cookie = new Cookie("history", String.valueOf(prodNo));
		cookie.setMaxAge(60*60*24);
		System.out.println("cookie : " + cookie);
		temp += cookie+",";
		response.addCookie(cookie);
		
		System.out.println("/getProduct");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		session.setAttribute("product", product);
		
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
	public String updateproduct(@RequestParam("prodNo") int prodNo, @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		System.out.println("/updateProduct");
		//Business Logic
		productService.updateProduct(product);
		
		return "redirect:/product/updateProductView?prodNo="+prodNo;
	}
	
	@RequestMapping("/listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("search",search);
		
		if(request.getParameter("order") == null) {
			System.out.println(" 1 "+request.getParameter("order"));
			searchMap.put("order", "p.prod_no");
		} else if(request.getParameter("order").equals("1")) {
			System.out.println(" 2 "+request.getParameter("order"));
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE DESC");
		} else if(request.getParameter("order").equals("2")){
			System.out.println(" 3 "+request.getParameter("order"));
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE ASC");
		}	
		
		System.out.println(" 4 " + searchMap.get("order"));
		
		System.out.println(" getParameter : " + request.getParameter("menu"));
		
		System.out.println(search + " :: ");
		// Business logic 수행
		System.out.println(search.getStartRowNum()+" "+search.getEndRowNum());
		Map<String , Object> map=productService.getProductList(searchMap);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println(resultPage + " :: ");
		// Model 과 View 연결
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}
