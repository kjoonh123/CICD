package world.navie.www.member;

import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class KakaoService {
	private String accessToken;
	
	public void getAccessToken(String code) {	// 발급받은 인가 코드를 인자로 설정 (docs 구조에 맞추어 요청을 날려야)
		String reqUrl = "https://kauth.kakao.com/oauth/token";
		String reqParam = "grant_type=authorization_code";
		reqParam += "&client_id=d188a169fcc06291e00b3da19fbac7ed";
		reqParam += "&redirect_uri=http://www.navie.world/kakaoLogin";
		reqParam += "&code="+code;
	
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		
			conn.setRequestMethod("POST"); 
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(
					new OutputStreamWriter(conn.getOutputStream())
					);
			bw.write(reqParam);		// 위에서 만든 데이터를 setting
			bw.flush();			// 비어있는 상태로 초기화
			
			// 요청을 통해 얻은 JSON타입(key-value)의 Response 메시지 읽어오기 (토큰 발급)
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());   // 들어오는 것을 isr 참조변수의 객체에 
			ObjectMapper om = new ObjectMapper();
			Map<String, String> map = om.readValue(isr, new TypeReference<Map<String, String>>() {}); // 데이터 읽어오기
			accessToken = map.get("access_token");
			
			System.out.println("accessToken : " + map.get("access_token"));
			System.out.println(map);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Autowired private HttpSession session;
	public void getUserInfo() {
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
	//	Authorization: Bearer ${ACCESS_TOKEN} // 인증토큰 제시
		
		try {
			URL url = new URL(reqUrl); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			
			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);
			
			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());
			System.out.println(jsonNode.get("kakao_account"));
			System.out.println(jsonNode.get("kakao_account").get("profile").get("nickname"));
		
			//session.setAttribute("id", jsonNode.get("kakao_account").get("email"));
			session.setAttribute("id", jsonNode.get("id"));	// 세션 확인 작업
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void unlink() {
		String reqUrl = "https://kapi.kakao.com/v1/user/unlink";
		
		try {
			URL url = new URL(reqUrl); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);
			
			ObjectMapper om = new ObjectMapper();
			JsonNode jsonNode = om.readTree(conn.getInputStream());
			System.out.println(jsonNode.get("id"));
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
