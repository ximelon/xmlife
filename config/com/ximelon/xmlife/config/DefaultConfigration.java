package com.ximelon.xmlife.config;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class DefaultConfigration implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		//以annotation的方式装来加载配置
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		//扫描spring的配置类。
		rootContext.scan("com.ximelon.xmlife.config", "com.ximelon.xmlife.web.controller");
		context.addListener(new ContextLoaderListener(rootContext));
		
		//添加DispatcherServlet
		ServletRegistration.Dynamic dispatcher = context.addServlet("dispatcher", new DispatcherServlet(rootContext));
		dispatcher.setLoadOnStartup(1);
		//设置servlet mapping
		dispatcher.addMapping("/");
		// Set whether this servlet should dispatch an HTTP OPTIONS request to the #doService method.
		dispatcher.setInitParameter("dispatchOptionsRequest", "true");
		// Set whether this servlet should dispatch an HTTP TRACE request to the #doService method.
		dispatcher.setInitParameter("dispatchTraceRequest", "true");
		dispatcher.setAsyncSupported(true);

		// 设置编码
		CharacterEncodingFilter encodingfilter = new CharacterEncodingFilter();
		encodingfilter.setEncoding("UTF-8");
		encodingfilter.setForceEncoding(true);
		FilterRegistration.Dynamic encodingfilterDynamic = context.addFilter("encodingfilter", encodingfilter);
		encodingfilterDynamic.addMappingForServletNames(EnumSet.of(DispatcherType.REQUEST), true, "dispatcher");

		// 加载国际化消息
		context.setInitParameter("javax.servlet.jsp.jstl.fmt.localizationContext", "message");
	}
}