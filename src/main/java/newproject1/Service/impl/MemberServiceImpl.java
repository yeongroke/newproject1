package newproject1.Service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.aspectj.apache.bcel.classfile.annotation.NameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import newproject1.DAO.MemberDao;
import newproject1.Domain.Member;
import newproject1.Service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

  @Autowired MemberDao memberDao;
  
  @Override
  public void insert(Member member) {
    
    member.setStat("N");
    memberDao.insert(member);
  }

  @Override
  public int findemacount(String email) {
    
    return memberDao.findemacount(email);
  }

  @Override
  public Member logindo(String email, String pwd) {
    HashMap<String, Object> findva = new HashMap<>();
    
    findva.put("email", email);
    findva.put("pwd", pwd);
    return memberDao.logindo(findva);
  }

	/*
	 * @Override public Member getbyno(int no) {
	 * 
	 * return memberDao.getbyno(no); }
	 */

	@Override
	public Member kakaologin(String accessToken) {
		String RequestUrl = "https://kauth.kakao.com/oauth/token";

    HashMap<Object, Object> postParams = new HashMap<Object, Object>();
    postParams.put("grant_type", "authorization_code");
    postParams.put("client_id", "b98c5aa480af911daa8a20e12a27258a");
    postParams.put("redirect_uri", "http://localhost:8888/app/member/login");
    postParams.put("code", accessToken);

		/*
		 * final HttpClient client = HttpClientBuilder.create().build();
		 * 
		 * HttpPost post = new HttpPost(RequestUrl);
		 * 
		 * JsonNode returnNode = null;
		 * 
		 * 
		 * 
		 * try {
		 * 
		 * post.setEntity(new UrlEncodedFormEntity(postParams));
		 * 
		 * final HttpResponse response = client.execute(post);
		 * 
		 * final int responseCode = response.getStatusLine().getStatusCode();
		 * 
		 * 
		 * 
		 * System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
		 * 
		 * System.out.println("Post parameters : " + postParams);
		 * 
		 * System.out.println("Response Code : " + responseCode);
		 * 
		 * 
		 * 
		 * //JSON 형태 반환값 처리
		 * 
		 * ObjectMapper mapper = new ObjectMapper();
		 * 
		 * returnNode = mapper.readTree(response.getEntity().getContent());
		 * 
		 * 
		 * 
		 * } catch (UnsupportedEncodingException e) {
		 * 
		 * e.printStackTrace();
		 * 
		 * } catch (ClientProtocolException e) {
		 * 
		 * e.printStackTrace();
		 * 
		 * } catch (IOException e) {
		 * 
		 * e.printStackTrace();
		 * 
		 * } finally {
		 * 
		 * // clear resources
		 * 
		 * }
		 */

    

    //return returnNode;



		
		Member member = new Member();
		
		
		return member;
	}
}
