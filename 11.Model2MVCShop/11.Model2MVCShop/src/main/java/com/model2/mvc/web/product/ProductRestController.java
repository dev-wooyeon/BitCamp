package com.model2.mvc.web.product;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {


	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public ProductRestController() {
		System.out.println("ProductController Defualt Constructor");
	}
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		System.out.println(" addProduct :: " + product);
		
		productService.addProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/getProduct : GET");
		
		System.out.println(" addProduct :: " + product);
		
		productService.updateProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
		
	@RequestMapping(value="json/listProduct/{menu}/{reqPageSize}/{curPage}", method=RequestMethod.GET)
	public Map listProduct(@ModelAttribute("search") Search search, 
							@PathVariable String menu,  
							@PathVariable int reqPageSize,
							@PathVariable int curPage,
							Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("listProduct : "+search);
		
		search.setCurrentPage(curPage);
		
		/*if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(curPage);
		}*/
		
		if(request.getParameter("pageSize") == null) {
			search.setPageSize(pageSize);
		} else {
			search.setPageSize(reqPageSize);
		}
		
		Map<String, Object> searchMap= new HashMap<String, Object>();
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
		// Business logic ผ๖วเ
		System.out.println(search.getStartRowNum()+" "+search.getEndRowNum());
		Map<String , Object> map=productService.getProductList(searchMap);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		System.out.println(resultPage);
			
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
	@RequestMapping(value="json/listProduct/{menu}/{reqPageSize}", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	//listProduct?menu=${param.menu}&order=2&pageSize=${search.pageSize}
	public List<String> listProduct(@RequestBody Search search, 
							@PathVariable String menu,  
							@PathVariable int reqPageSize,
							Model model , HttpServletRequest request) throws Exception {
		
		System.out.println(search);
		
		request.setCharacterEncoding("euc_kr");
		
		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+);
		String keyword = java.net.URLDecoder.decode(search.getSearchKeyword(),"euc_kr");
		//URLEncoder.encode(keyword, "UTF-8");
		
		System.out.println("listProduct : "+search);
		//search.setCurrentPage(curPage);
		System.out.println(" [before] ListProduct Keyword : "+keyword);
		//String keyword = new String(search.getSearchKeyword().getBytes("euc_kr"),"utf-8");
		//System.out.println(" [After] ListProduct Keyword : "+keyword);
		search.setSearchKeyword(keyword);
		
		Map<String, Object> searchMap= new HashMap<String, Object>();
			searchMap.put("searchKeyword",search.getSearchKeyword());
			searchMap.put("searchCondition", Integer.parseInt(search.getSearchCondition()));
		
		if(Integer.parseInt(search.getSearchCondition()) == 0) {
			searchMap.put("field", "prod_no");
		} else if(Integer.parseInt(search.getSearchCondition()) == 1) {
			searchMap.put("field", "prod_name");
		} else {	
			searchMap.put("field", "price");
		}
		
		if(request.getParameter("order") == null) {
			searchMap.put("order", "prod_no");
		} else if(request.getParameter("order").equals("1")) {
			searchMap.remove("order");
			searchMap.put("order", "PRICE DESC");
		} else if(request.getParameter("order").equals("2")){
			searchMap.remove("order");
			searchMap.put("order", "PRICE ASC");
		}
			
		//map.put("list", );
		List<String> list = productService.getProductSearchList(searchMap);
		System.out.println(" *********************** " +list);
		return list;
	}
	
}
