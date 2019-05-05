package newproject1.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebFilter("/*")
public class AuthFilter implements Filter {

  public AuthFilter() {
    System.out.println("123");
  }



  @Override
  public void doFilter(
      ServletRequest request, 
      ServletResponse response,
      FilterChain chain)
          throws IOException, ServletException {

    HttpServletRequest httpRequest = (HttpServletRequest)request;
    HttpServletResponse httpResponse = (HttpServletResponse)response;

    String pathInfo = httpRequest.getPathInfo();

    if(pathInfo !=null) {
            if (pathInfo.endsWith("prdt")) {
              System.out.println("2");
            }
        }
        chain.doFilter(request, response);
  }
}











