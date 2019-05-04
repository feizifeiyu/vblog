package com.feizifeiyu.vblog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@MapperScan("com.feizifeiyu.vblog.admin.mapper")
public class VBlogApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(VBlogApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(VBlogApplication.class);
    }
}
