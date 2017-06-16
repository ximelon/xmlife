package com.ximelon.xmlife.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;

@Configuration
public class TilesConfig {
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tiles = new TilesConfigurer();
		tiles.setDefinitions(new String[] {
				"/layout/tiles.xml"
		});
		tiles.setCheckRefresh(true);	//启动刷新功能
		return tiles;
	}

}
