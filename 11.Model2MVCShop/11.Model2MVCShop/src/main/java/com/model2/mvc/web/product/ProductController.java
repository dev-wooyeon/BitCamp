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
import com.model2.mvc.service.purchase.PurchaseService;

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

	@Resource(name = "uploadPath")
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
	public String addProduct(@ModelAttribute("product") Product product, HttpServletRequest request,
			HttpServletResponse response, @RequestParam("file") MultipartFile file) throws Exception {

		System.out.println("/addProduct");
		// Business Logic
		String date = product.getManuDate();
		String temp = "";
		String[] dateArray = date.split("-");

		System.out.println("file :: " + file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());

		File target = new File(uploadPath, file.getOriginalFilename());
		FileCopyUtils.copy(file.getBytes(), target);

		for (int i = 0; i < dateArray.length; i++) {
			temp += dateArray[i];
		}

		System.out.println("파싱후 :: " + temp);

		product.setManuDate(temp);

		productService.addProduct(product);

		request.setAttribute("product", product);

		return "forward:/product/addProduct.jsp";
	}

	@RequestMapping("/getProduct")
	public String getProduct(@RequestParam("menu") String menu, @RequestParam("prodNo") int prodNo, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		String history = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
		}
		
		
		history += "," + prodNo;
		
//		System.out.println(" @@@@@@@@@ history : " + history);
//			String[] historyDuplicationCheck = history.split(",");
//			System.out.println(" @@@@@@@@@ : " + 1);
//			for (int i = 1 ; i <= historyDuplicationCheck.length; i++) {
//				System.out.println(" @@@@@@@@@ : " + 2 + " "+ historyDuplicationCheck[i]);				
//				if ( ! (historyDuplicationCheck[i].equals(Integer.toString(prodNo) ) ) ) {
//					System.out.println(" @@@@@@@@@ : " + 3);
//				} else {
//					history += "," + prodNo;
//				}
//			}

		System.out.println("Get Product history :: " + history);
		Cookie coo = new Cookie("history", history);
		coo.setPath("/");
		coo.setMaxAge(600);
		response.addCookie(coo);

		System.out.println("/getProduct");
		// Business Logic
		Product product = productService.getProduct(prodNo);

		Map<String, Object> map = commentService.getCommentList(prodNo);

		// Model 과 View 연결
		session.setAttribute("product", product);
		request.setAttribute("list", map.get("list"));
		if (menu.equals("manage")) {
			return "forward:/product/updateProduct.jsp";
		}

		return "forward:/product/getProduct.jsp";
	}

	@RequestMapping("/updateProductView")
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/updateUserView");

		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);

		return "forward:/product/updateProductView.jsp";
	}

	@RequestMapping("/updateProduct")
	public String updateproduct(@RequestParam("prodNo") int prodNo, @RequestParam("file") MultipartFile file,
			@ModelAttribute("product") Product product, Model model, HttpSession session) throws Exception {

		System.out.println("/updateProduct");

		System.out.println(" updateProduct : " + file.getOriginalFilename());
		product.setFileName(file.getOriginalFilename());

		File target = new File(uploadPath, file.getOriginalFilename());
		FileCopyUtils.copy(file.getBytes(), target);

		productService.updateProduct(product);

		product = productService.getProduct(prodNo);

		model.addAttribute("product", product);
		return "redirect:/product/getProduct?prodNo=" + prodNo + "&menu=search";
	}

	@RequestMapping("/listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/listProduct");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		if (request.getParameter("pageSize") == null) {
			search.setPageSize(pageSize);
		} else {
			String repageSize = (String) request.getParameter("pageSize");
			search.setPageSize(Integer.parseInt(repageSize));
		}

		System.out.println("1");

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("search", search);

		if (request.getParameter("order") == null) {
			searchMap.put("order", "p.prod_no");
		} else if (request.getParameter("order").equals("1")) {
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE DESC");
		} else if (request.getParameter("order").equals("2")) {
			searchMap.remove("order");
			searchMap.put("order", "p.PRICE ASC");
		} else if (request.getParameter("order").equals("3")) {
			searchMap.remove("order");
			searchMap.put("order", "p.prod_amount ASC");
		} else if (request.getParameter("order").equals("4")) {
			searchMap.remove("order");
			searchMap.put("order", "p.manufacture_day DESC");
		} else if (request.getParameter("order").equals("5")) {
			searchMap.remove("order");
			searchMap.put("order", "p.reg_date DESC");
		} 

		System.out.println(" getParameter : " + request.getParameter("menu"));

		System.out.println(search + " :: ");
		// Business logic 수행
		System.out.println(search.getStartRowNum() + " " + search.getEndRowNum());
		Map<String, Object> map = productService.getProductList(searchMap);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				search.getPageSize());
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/listProduct.jsp";
	}

}
