package com.thai.reserveapp.config.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

/* Configuration 어노테이션은 
 * 이 객체 안에서 무엇인가를 뒤지겠다는 의미이다.
 * 뭘? 이 @Bean 이라는 설정을 뒤진다.
 * @Bean은 IOC에 컨테이너에 객체를 생성해 담는다.
 * 즉, @Bean은 IOC에 담게될 객체를 반환하는 함수다. 라는 표현
 * */

@Configuration
public class TilesConfig {
	
	/*Tiles 지시서를 IOC에 등록한다.*/
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/tiles.xml"} );
		tilesConfigurer.setCheckRefresh(true);
		
		return tilesConfigurer;
	}
	
	/*Tiles View Resolver를 IOC에 등록한다.
	 * 일반적으로 객체를 반환하는 메소드라서 get~~() 이라고 쓰지만, 객체에 대한 변수명 같이 생겼다.
	 * 이유는 누군가에 의해서 호출되는 것이 아니라, Bean 객체로써 IOC에 담겨질 객체를 반환하는 것이기 때문이다.
	 * */
	@Bean
	public TilesViewResolver tilesViewResovler() {
		TilesViewResolver viewResolver = new TilesViewResolver();
		viewResolver.setViewClass(TilesView.class);
		viewResolver.setOrder(1);
		
		return viewResolver;
	}
	

}
