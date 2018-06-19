package com.github.dalianghe;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.Arrays;

/**
 * Hello world!
 *
 */
@EnableWebMvc
@SpringBootApplication
@EnableTransactionManagement
@ComponentScan({"com.github.dalianghe"})
@MapperScan(basePackages = {"com.github.dalianghe.*.mapper"})
public class WebBootstrap {
    public static void main( String[] args ) {
        ApplicationContext applicationContext= SpringApplication.run(WebBootstrap.class,args);
        String[] names = applicationContext.getBeanDefinitionNames();
        Arrays.asList(names).forEach(name -> System.out.println(name));//1.8 forEach循环
    }
}
