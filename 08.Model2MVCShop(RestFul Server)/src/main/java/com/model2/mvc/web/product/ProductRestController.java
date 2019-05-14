package com.model2.mvc.web.product;

import java.util.Map;

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
	
	@RequestMapping(value="json/listProduct", method=RequestMethod.POST)
	public Map listProduct(@RequestBody Search search) throws Exception {
		
		System.out.println("1 "+search);
		System.out.println("2 "+search.getStartRowNum());
		System.out.println("3 "+search.getEndRowNum());
		
		Map<String, Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 1, 5);
		System.out.println(resultPage);
		
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
}
