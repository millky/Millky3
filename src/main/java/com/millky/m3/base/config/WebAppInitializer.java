package com.millky.m3.base.config;

//import org.apache.tomcat.util.descriptor.web.JspPropertyGroupDescriptorImpl;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;
//import javax.servlet.descriptor.JspConfigDescriptor;
//import javax.servlet.descriptor.JspPropertyGroupDescriptor;
//import javax.servlet.descriptor.TaglibDescriptor;
//import java.util.ArrayList;
//import java.util.Collection;
import java.util.EnumSet;
import java.util.Set;

/**
 * Created by origoni on 2013. 12. 24..
 */
public class WebAppInitializer implements WebApplicationInitializer {
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.setConfigLocation("com.millky.m3.base.config");
        context.setDisplayName("Millky3");

        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
        encodingFilter.setInitParameter("encoding", "UTF-8");
        encodingFilter.setInitParameter("forceEncoding", "true");
        encodingFilter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");

        servletContext.addListener(new ContextLoaderListener(context));
        servletContext.setInitParameter("defaultHtmlEscape", "true");
        servletContext.setInitParameter("spring.profiles.default", "simple");
        servletContext.setInitParameter("enablePooling", "false");

       // servletContext.getRequestDispatcher().include();

        context.register(WebMvcConfig.class);

        ServletRegistration.Dynamic appDispatcherServlet = servletContext.addServlet("millkyServlet", new DispatcherServlet(context));
        appDispatcherServlet.setLoadOnStartup(1);
        appDispatcherServlet.setAsyncSupported(true);

        Set<String> mappingConflicts = appDispatcherServlet.addMapping("/");
    }
}
