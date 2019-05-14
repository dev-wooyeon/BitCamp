package client.app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

@SuppressWarnings("deprecation")
public class RestHttpClientApp {

	// main Method
	public static void main(String[] args) throws Exception {
		
		// 최근작업일시 : 20190508 AM08:38
		/*							 User 							*/
		// ◆ getUser 
		// RestHttpClientApp.getUserTest_JsonSimple();
		// RestHttpClientApp.getUserTest_Codehaus();
		// ◆ getListUser 											
		// RestHttpClientApp.getListTest_Codehaus();
		// ◆ addUser
		// RestHttpClientApp.addUserTest_JsonSimple();
		// RestHttpClientApp.addUserTest_Codehaus();
		// ◆ updateUser 									
		// RestHttpClientApp.updateUserTest_JsonSimple();
		// ◆ deleteUser 									추가예정
		// ◆ Login
		// RestHttpClientApp.LoginTest_JsonSimple();
		// RestHttpClientApp.LoginTest_Codehaus();
		// ◆ Logout 			
		// RestHttpClientApp.LogoutTest_Codehaus();
		// ◆ FindPassword									추가예정
		
		/*							 Product 						*/
		// ◆ getProduct
		// RestHttpClientApp.getProductTest_JsonSimple();
		// RestHttpClientApp.getProductTest_Codehaus();
		// ◆ getListProduct 
		RestHttpClientApp.getProductListTest_Codehaus();
		// ◆ addProduct
		// RestHttpClientApp.addProductTest_Codehaus();
		// ◆ deleteProduct 									추가예정
		// ◆ updateProduct
		// RestHttpClientApp.updateProductTest_Codehaus();
		
		/*							 Purchase 						*/
		/*							 추가예정 						*/
		// ◆ getPurchase
		// ◆ getListPurchase
		// ◆ addPurchase
		// ◆ deletePurchase
		// ◆ updateTranCode
		// ◆ updateTranCodeByTranNo
		
	} // end of Main

	private static void getProductListTest_Codehaus() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/listProduct";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);
		json.put("searchCondition", null);
		json.put("searchKeyword", null);
		json.put("pageSize", 5);
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(" :: "+httpResponse);

		HttpEntity httpEntity = httpResponse.getEntity();
		if(httpEntity != null) {			
			InputStream is = httpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));			
			try {		
				System.out.println("[ Server 에서 받은 Data 확인 ] ");
				String serverData = br.readLine();
				System.out.println(serverData);
		
				ObjectMapper objectMapper = new ObjectMapper();
		
				/*String jsonManyValue = objectMapper.writeValueAsString(br);
				System.out.println("2 : " + jsonManyValue);
				
				JSONObject jsonObj = (JSONObject)JSONValue.parse(br);
				System.out.println("3 : " + jsonObj);*/
				
				Map<String, Object> returnMap = objectMapper.readValue(serverData, new TypeReference<Map<String,Object>>(){});
				System.out.println(returnMap.get("list"));
				System.out.println(returnMap.get("resultPage"));
				System.out.println(returnMap.get("search"));	
			} finally {
				is.close();
			}
		}
	}

	private static void updateProductTest_Codehaus() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/updateProduct";
				
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
				
		JSONObject json = new JSONObject();
		json.put("fileName", "UpdateNoImg");
		json.put("manuDate", "20190909");
		json.put("price","77777");
		json.put("prodDetail","testUpdateProdDetail");
		json.put("prodName","testUpdateProdName");
		json.put("prodNo",10034);
		//json.put("regDate",new Date(19,05,14));
		json.put("proTranCode","000");
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		System.out.println(httpResponse);
		System.out.println();

		HttpEntity httpEntity = httpResponse.getEntity();

		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	private static void addProductTest_Codehaus() throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/product/json/addProduct";
				
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
				
		JSONObject json = new JSONObject();
		json.put("fileName", "noImg");
		json.put("manuDate", "20190514");
		json.put("price","88888");
		json.put("prodDetail","testProdDetail");
		json.put("prodName","testProdName");
		json.put("prodNo",10034);
		//json.put("regDate",new Date(19,05,14));
		json.put("proTranCode","000");
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		System.out.println(httpResponse);
		System.out.println();

		HttpEntity httpEntity = httpResponse.getEntity();

		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	private static void LogoutTest_Codehaus() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/logout";

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol 응답 Message 추상화
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response 확인
		System.out.println(httpResponse);

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> 다른 방법으로 serverData 처리
		// System.out.println("[ Server 에서 받은 Data 확인 ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API 확인 : Stream 객체를 직접 전달
		String serverData = br.readLine();
		//JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		// System.out.println(" JSONObject : " + jsonobj);
		System.out.println(serverData);
		//ObjectMapper objectMapper = new ObjectMapper();
		//Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		
	}

	private static void updateUserTest_JsonSimple() throws Exception {
		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();
		String url = "http://127.0.0.1:8080/user/json/updateUser";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("userId", "test06");
		json.put("password", 1234);
		json.put("addr","updatetestAddr");
		json.put("email","test@update.com");
		json.put("phone","010-9999-8888");
		json.put("role","user");
		json.put("userName","updatetestName");
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> 내용읽기(JSON Value 확인)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
		// TODO Auto-generated method stub
		
	}

	private static void getListTest_Codehaus() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
							
		String url = "http://127.0.0.1:8080/user/json/listUser";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject json = new JSONObject();
		json.put("currentPage", 1);
		json.put("searchCondition", null);
		json.put("searchKeyword", null);
		json.put("pageSize", 5);
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(" :: "+httpResponse);

		HttpEntity httpEntity = httpResponse.getEntity();
		if(httpEntity != null) {			
			InputStream is = httpEntity.getContent();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));			
			try {		
				System.out.println("[ Server 에서 받은 Data 확인 ] ");
				String serverData = br.readLine();
				System.out.println("1 : " + serverData);
		
				ObjectMapper objectMapper = new ObjectMapper();
		
				/*String jsonManyValue = objectMapper.writeValueAsString(br);
				System.out.println("2 : " + jsonManyValue);
				
				JSONObject jsonObj = (JSONObject)JSONValue.parse(br);
				System.out.println("3 : " + jsonObj);*/
				
				Map<String, Object> returnMap = objectMapper.readValue(serverData, new TypeReference<Map<String,Object>>(){});
				System.out.println("4 : " + returnMap.get("list"));
				System.out.println(returnMap.get("resultPage"));
				System.out.println(returnMap.get("search"));	
			} finally {
				is.close();
			}
		}
	}

	private static void addUserTest_JsonSimple() throws Exception {
		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();
		// 접속할 url 경로 서술
		String url = "http://127.0.0.1:8080/user/json/addUser";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		// [ 방법 1 : String 사용]
		// String data = "{\"userId\":\"admin\",\"password\":\"1234\"}";
		// HttpEntity httpEntity01 = new StringEntity(data,"utf-8");
		
		// [ 방법 2 : JSONObject 사용]
		JSONObject json = new JSONObject();
		json.put("userId", "test444");
		json.put("password", "1234");
		json.put("addr","testAddr");
		json.put("email","test@Email.com");
		json.put("phone","010-2222-3333");
		json.put("role","user");
		json.put("userName","testName");
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> 내용읽기(JSON Value 확인)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	private static void getProductTest_Codehaus() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10000";

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol 응답 Message 추상화
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> 다른 방법으로 serverData 처리
		// System.out.println("[ Server 에서 받은 Data 확인 ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API 확인 : Stream 객체를 직접 전달
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(" JSONObject : " + jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		Product product = objectMapper.readValue(jsonobj.toString(), Product.class);
		System.out.println(" product : " + product);

	}

	private static void getProductTest_JsonSimple() throws Exception {
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/product/json/getProduct/10000";

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol 응답 Message 추상화
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> 내용읽기(JSON Value 확인)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

	}

	// ================================================================//
	// 1.1 Http Protocol GET Request : JsonSimple 3rd party lib 사용
	public static void getUserTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/getUser/admin";

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol 응답 Message 추상화
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> 내용읽기(JSON Value 확인)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);
	}

	// 1.2 Http Protocol GET Request : JsonSimple + codehaus 3rd party lib 사용
	public static void getUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/getUser/admin";

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");

		// HttpResponse : Http Protocol 응답 Message 추상화
		HttpResponse httpResponse = httpClient.execute(httpGet);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> 다른 방법으로 serverData 처리
		// System.out.println("[ Server 에서 받은 Data 확인 ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API 확인 : Stream 객체를 직접 전달
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
	}
	// ================================================================//

	// ================================================================//
	// 2.1 Http Protocol POST Request : FromData 전달 / JsonSimple 3rd party lib 사용
	public static void LoginTest_JsonSimple() throws Exception {

		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// [ 방법 1 : String 사용]
		// String data = "{\"userId\":\"admin\",\"password\":\"1234\"}";
		// HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

		// [ 방법 2 : JSONObject 사용]
		JSONObject json = new JSONObject();
		json.put("userId", "admin");
		json.put("password", "1234");
		HttpEntity httpEntity01 = new StringEntity(json.toString(), "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		System.out.println("[ Server 에서 받은 Data 확인 ] ");
		String serverData = br.readLine();
		System.out.println(serverData);

		// ==> 내용읽기(JSON Value 확인)
		JSONObject jsonobj = (JSONObject) JSONValue.parse(serverData);
		System.out.println(jsonobj);

	}

	// 2.2 Http Protocol POST 방식 Request : FromData전달
	// ==> JsonSimple + codehaus 3rd party lib 사용
	public static void LoginTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/login";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// //[ 방법 1 : String 사용]
		// String data = "{\"userId\":\"admin\",\"password\":\"1234\"}";
		// HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

		// //[ 방법 2 : JSONObject 사용]
		// JSONObject json = new JSONObject();
		// json.put("userId", "admin");
		// json.put("password", "1234");
		// HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		// [ 방법 3 : codehaus 사용]
		User user01 = new User();
		user01.setUserId("admin");
		user01.setPassword("1234");
		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value 로 변환
		String jsonValue = objectMapper01.writeValueAsString(user01);
		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> 다른 방법으로 serverData 처리
		// System.out.println("[ Server 에서 받은 Data 확인 ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API 확인 : Stream 객체를 직접 전달
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
	}

	public static void addUserTest_Codehaus() throws Exception {

		// HttpClient : Http Protocol 의 client 추상화
		HttpClient httpClient = new DefaultHttpClient();

		String url = "http://127.0.0.1:8080/user/json/addUser";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");

		// //[ 방법 1 : String 사용]
		// String data = "{\"userId\":\"admin\",\"password\":\"1234\"}";
		// HttpEntity httpEntity01 = new StringEntity(data,"utf-8");

		// //[ 방법 2 : JSONObject 사용]
		// JSONObject json = new JSONObject();
		// json.put("userId", "admin");
		// json.put("password", "1234");
		// HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		// [ 방법 3 : codehaus 사용]
		User user01 = new User();
		user01.setUserId("test06");
		user01.setPassword("1234");
		user01.setAddr("testAddr");
		user01.setEmail("test@Email.com");
		user01.setPhone("010-2222-3333");
		user01.setRole("user");
		user01.setUserName("testName");
		ObjectMapper objectMapper01 = new ObjectMapper();
		// Object ==> JSON Value 로 변환
		String jsonValue = objectMapper01.writeValueAsString(user01);
		HttpEntity httpEntity01 = new StringEntity(jsonValue, "utf-8");

		httpPost.setEntity(httpEntity01);

		HttpResponse httpResponse = httpClient.execute(httpPost);

		// ==> Response 확인
		System.out.println(httpResponse);
		System.out.println();

		// ==> Response 중 entity(DATA) 확인
		HttpEntity httpEntity = httpResponse.getEntity();

		// ==> InputStream 생성
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

		// ==> 다른 방법으로 serverData 처리
		// System.out.println("[ Server 에서 받은 Data 확인 ] ");
		// String serverData = br.readLine();
		// System.out.println(serverData);

		// ==> API 확인 : Stream 객체를 직접 전달
		JSONObject jsonobj = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonobj);

		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.toString(), User.class);
		System.out.println(user);
		System.out.println("회원가입을 축하합니다 \n" + user.getUserName() + "님");
	}
}