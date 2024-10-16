package mvc.cgapp.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "mvc.cgapp" })
public class CarGarageConfigClass implements WebMvcConfigurer {

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public JdbcTemplate jdbcTemplate() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource());

		return jdbcTemplate;
	}

//	@Bean
//	public DataSource dataSource() {
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setUsername("root");
//		dataSource.setPassword("Reddy9090@");
//		dataSource.setUrl("jdbc:mysql://localhost:3306/cg_app_2");
//		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
//
//		return dataSource;
//	}

	
	///Appp/src/main/webapp/resources
	
//	/CarGarageApplicationMVC/src/main/webapp/resources
	@Bean
	public DataSource dataSource() {

		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUsername("smprowor_kartik");
		dataSource.setPassword("{+&VZP*p]R!@");
		dataSource.setUrl("jdbc:mysql://localhost:3306/smprowor_cg_app");
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

		return dataSource;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

//	@Override
//	public void addCorsMappings(CorsRegistry registry) {
//		registry.addMapping("/**") // This allows CORS for all endpoints
//				.allowedOrigins("*") // You can restrict this to specific origins if needed
//				.allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS").allowedHeaders("*") // This allows all
//																								// headers
//				.allowCredentials(true);
//	}
}
