package newproject1;

import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource("classpath:/newproject1/conf/security.properties")
@MapperScan("newproject1.DAO")
@EnableTransactionManagement
public class AppConfig {

  @Autowired
  Environment env;

  public AppConfig() {
    System.out.println("AppConfig() 호출됨!");
  }

  @Bean(destroyMethod="close")
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
  @Bean
  public SqlSessionFactory sqlSessionFactory(
      DataSource dataSource , ApplicationContext ac) {

    try {
      SqlSessionFactoryBean sb = new SqlSessionFactoryBean();

      // DB 커넥션풀을 관리해주는 객체를 꼽는다.
      sb.setDataSource(dataSource);
      
      // SQL 맵퍼 파일에서 도메인 객체의 별명을 사용하려면 
      // 도메인 객체가 들어 있는 패키지를 지정해야 한다. 
      // 그러면 Mybatis가 해당 패키지의 모든 클래스에 대해 별명을 자동으로 생성할 것이다.
      sb.setTypeAliasesPackage("newproject1.Domain");
      
      sb.setMapperLocations(ac.getResources("classpath:/newproject1/mapper/**/*.xml"));

      return sb.getObject();
    } catch(Exception e) {
      throw new RuntimeException(e);
    }
    
  }
  @Bean
  public PlatformTransactionManager transactionManager(
      DataSource dataSource) {
    // 트랜잭션 관리자가 하는 일은 DB 커넥션의 commit과 rollback을 다루는 것이다.
    // 따라서 트랜잭션 관리자는 DB 커넥션을 제공해주는 
    // DataSource(DB 커넥션 풀)가 필요하다.
    // 그래서 트랜잭션 관리자를 만들 때 반드시 DataSource 객체를 넘겨줘야 한다.
    // 물론 관리자 객체를 만든 후에 세터를 호출해서 넘겨줘도 된다.
    return new DataSourceTransactionManager(dataSource);
  }
}
