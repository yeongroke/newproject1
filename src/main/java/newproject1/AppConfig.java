package newproject1;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource("classpath:/newproject1/conf/security.properties")
@MapperScan("newproject1.DAO")
@EnableTransactionManagement
public class AppConfig {
  
  Environment env;
  
  public AppConfig() {
    System.out.println("AppConfig() 호출됨!");
  }
  
  @Bean(destroyMethod="cloes")
  public DataSource dataSource() {
    
    BasicDataSource dbs = new BasicDataSource();
    System.out.println("datasource 생성");

    dbs.setDriverClassName(env.getProperty("jdbc.driver"));
    dbs.setUrl(env.getProperty("jdbc.url"));
    dbs.setUsername(env.getProperty("jdbc.username"));
    dbs.setPassword(env.getProperty("jdbc.password"));
    dbs.setDefaultAutoCommit(false);
    
    return dbs;
  }
  
}
