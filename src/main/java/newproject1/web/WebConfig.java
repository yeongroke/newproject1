package newproject1.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//이 클래스가 IoC 컨테이너가 사용해야 할 설정 정보를 담고 있는 클래스임을
//프론트 컨트롤러에게 알려주기 위해서는 다음 애노테이션을 반드시 붙여야 한다.
@EnableWebMvc
//다음 애노테이션을 붙이면 <mvc:annotation-driven/> 설정과 같은 의미이다.
//mvc 관련 설정을 활성화시킨다.
public class WebConfig implements WebMvcConfigurer{
  
  public WebConfig() {
    System.out.println("WebConfig 호출됨");
  }
  
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    //WebMvcConfigurer.super.addInterceptors(registry);
  }
}
