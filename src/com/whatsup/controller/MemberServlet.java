package com.whatsup.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import org.json.simple.*;
import org.json.simple.parser.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.whatsup.dao.Member_BoardDao;
import com.google.api.client.auth.openidconnect.IdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.whatsup.dto.Member_BoardDto;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.json.jackson2.JacksonFactory;



@WebServlet("/member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Member_BoardDao dao = new Member_BoardDao(); 
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		
		if("idchk".equals(command)){
			String myid = request.getParameter("myid");
			Member_BoardDto dto =  dao.check(myid);
			boolean notUsed = true;
			
			if(dto == null){
				
	 			notUsed =true;
	 		}else {
	 			notUsed=false;
	 		}
			response.sendRedirect("idchk.jsp?notUsed="+notUsed);
			
		}else if("nickchk".equals(command)) {
			String nickname = request.getParameter("nickname");
			Member_BoardDto dto =dao.check(nickname);
			boolean notUsed = true;
			if (dto==null) {
				notUsed = true;
			}else {
				notUsed=false;
			}JSONObject obj = new JSONObject();
			obj.put("notUsed", notUsed);
			
			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());
			
		}else if(command.equals("registeres")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birthyear = request.getParameter("birthyear");
			String birthmonth = request.getParameter("birthmonth");
			String birthdate = request.getParameter("birthdate");
			String birthday = birthyear+"-"+birthmonth+"-"+birthdate;
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String email = email1+"@"+email2;
			
			Member_BoardDto dto = new Member_BoardDto();
			dto.setId(id);
			dto.setPw(pw);
			dto.setNickname(nickname);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setBirthday(birthday);
			dto.setEmail(email);
			
			int res  = dao.insert(dto);
			if(res>0) {
				jsResponse("회원가입 성공","index.jsp", response);
			}else {
				jsResponse("회원가입 실패","registers.jsp", response);
			}
		}else if("login".equals(command)) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			
			Member_BoardDto dto = dao.login(id, pw);
			
			if(dto == null || dto.getId()==null){
				String err = "ID 또는 비밀 번호가 일치하지 않습니다.";
				request.setAttribute("err", err);
				dispatch("login.jsp", request, response);
		 		
			} else if(dto.getId() != null){
				
			
		 		session.setAttribute("login",dto);
		 		session.setMaxInactiveInterval(-1);
		 		response.sendRedirect("index.jsp");
			} 
		}else if("logout".equals(command)) {
			session.invalidate();	
			response.sendRedirect("index.jsp");
		}else if("findid".equals(command)) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			Member_BoardDto dto = dao.findId(name, email);
			if(dto == null||dto.getId() == null){
				String err = "입력하 정보로 조회된 ID가 없습니다.";
				request.setAttribute("err", err);
				dispatch("findidpw.jsp", request, response);
		 		
			} else if(dto.getId() != null){
				String msg = name + " 님의 ID는 "+ dto.getId() +" 입니다.";
				request.setAttribute("msg", msg);
				dispatch("findidpw.jsp", request, response);
		
			} 
		}else if("findpw".equals(command)) {
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			
			String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
			
			Member_BoardDto dto = dao.findPw(name, id, email, uuid);
			
			if(dto == null||dto.getPw() == null){
				String errpw = "입력하신 정보로 조회된 데이터가 없습니다.";
				request.setAttribute("errpw", errpw);
				dispatch("findidpw.jsp", request, response);
		 		
			} else if(dto.getPw() != null){
				String msgpw = id + " 님의  임시비밀번호는  "+ dto.getPw() +" 입니다.";
				request.setAttribute("msgpw", msgpw);
				dispatch("findidpw.jsp", request, response);
		
			} 
		}else if("googlelogin".equals(command)) {

	        try {
	            String idToken = request.getParameter("id_token");
	            GoogleIdToken.Payload payLoad = getPayload(idToken);
	            String name = (String) payLoad.get("name");
	            String id = payLoad.getSubject();
	            String email = payLoad.getEmail();
	            String nickname = (String)payLoad.get("given_name");
	         
	            if(dao.check(id) != null) {
		        	Member_BoardDto dto = new Member_BoardDto();
		        	
		        	dto  =  dao.sns(id);
		        	session.setAttribute("login",dto);
			 		session.setMaxInactiveInterval(-1);
			 		response.sendRedirect("index.jsp");
			 		
		        }else {
		        	 Member_BoardDto dto = new Member_BoardDto();
		        	 
				        dto.setId(id);
				        dto.setEmail(email);
				        dto.setName(name);
				        dto.setNickname(nickname);
				        dto.setAddr("google");
		        	int snsres = dao.snslogin(dto);
			        
			        if(snsres>0){
			        	System.out.println("db등록완료");
			        	response.sendRedirect("login.jsp");
			        }
			        
		        }


	        } catch (Exception e) {
	            throw new RuntimeException(e);
	        }
	    
				
			
		}else if("naverlogin".equals(command)) {
			String clientId = "bGlgaATXhrDCX6ib_fDu";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "bTuB3yx5Mn";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://localhost:8787/semi_project03/member.do?command=naverlogin", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token;
		    String refresh_token;
		   // System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		     // System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	
		    	String json = res.toString();
		    	
		    	JSONParser parser =new JSONParser();
		    	Object obj = parser.parse(json);
		    	JSONObject jsonObj = (JSONObject)obj;
		    			        
		    	access_token = (String)jsonObj.get("access_token");
		    	refresh_token = (String)jsonObj.get("refresh_token");
		    	
		    	String token = access_token; // 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가

		        String apiurl = "https://openapi.naver.com/v1/nid/me";

		        Map<String, String> requestHeaders = new HashMap<>();
		        requestHeaders.put("Authorization", header);
		        String responseBody = get(apiurl,requestHeaders);

		        Object responseObj = parser.parse(responseBody);
		        JSONObject resObj = (JSONObject)responseObj;
		        JSONObject resobj = (JSONObject)resObj.get("response");
		        
		        String naverId = (String)resobj.get("id");
		        String email =(String)resobj.get("email");
		        String name =(String)resobj.get("name");
		        String nickName =(String)resobj.get("nickname");
		        
		        if(dao.check(naverId) != null) {
		        	Member_BoardDto dto = new Member_BoardDto();
		        	
		        	dto  =  dao.sns(naverId);
		        	response.sendRedirect("index.jsp");
		        	
		        	session.setAttribute("login",dto);
			 		session.setMaxInactiveInterval(-1);
			 		response.sendRedirect("index.jsp");
			 		
		        }else {
		        	 Member_BoardDto dto = new Member_BoardDto();
		        	 
				        dto.setId(naverId);
				        dto.setEmail(email);
				        dto.setName(name);
				        dto.setNickname(nickName);
				        dto.setAddr("naver");
		        	int snsres = dao.snslogin(dto);
			        
			        if(snsres>0){
			        	System.out.println("db등록완료");
			        	response.sendRedirect("login.jsp");
			        }
			        
		        }
	
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		}else if("deletemember".equals(command)) {
			int memberseq = Integer.parseInt(request.getParameter("seq"));
			
			int res = dao.deleteMember(memberseq);
			
			if(res>0) {
				String success = "회원 탈퇴 성공! 다음에 또만나용~";
				System.out.println(success);
				session.invalidate();
				request.setAttribute("success",success);
				dispatch("index.jsp",request,response);
				
			}else {
				String err = "회원탈퇴 실패 다시 시도해 주세ㅇㅅㅇ";
				request.setAttribute("err",err);
				dispatch("mypage.jsp", request, response);
			}
		
		}
		
	}
		
	    private static final String GOOGLE_CLIENT_ID = 	"910896443172-llnq01i6rrc8hlgruf3sm3c40bqhvvp4.apps.googleusercontent.com";

	    public static GoogleIdToken.Payload getPayload (String tokenString) throws Exception {

	        JacksonFactory jacksonFactory = new JacksonFactory();
	        GoogleIdTokenVerifier googleIdTokenVerifier =
	                            new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);

	        GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, tokenString);

	        if (googleIdTokenVerifier.verify(token)) {
	            GoogleIdToken.Payload payload = token.getPayload();
	            if (!GOOGLE_CLIENT_ID.equals(payload.getAudience())) {
	                throw new IllegalArgumentException("Audience mismatch");
	            } else if (!GOOGLE_CLIENT_ID.equals(payload.getAuthorizedParty())) {
	                throw new IllegalArgumentException("Client ID mismatch");
	            }
	            return payload;
	        } else {
	            throw new IllegalArgumentException("id token cannot be verified");
	        }
	    }
	
	  private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }
	  private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }

	private void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String result = "<script> alert(\"" + msg + "\"); location.href=\""+url+"\"; </script> ";
		response.getWriter().append(result);
	}


}
