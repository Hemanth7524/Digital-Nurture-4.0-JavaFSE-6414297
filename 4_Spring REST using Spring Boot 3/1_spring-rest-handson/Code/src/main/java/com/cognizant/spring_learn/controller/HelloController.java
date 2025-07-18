package com.cognizant.spring_learn.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private static final Logger logger = LoggerFactory.getLogger(HelloController.class);

    @GetMapping(path = "/hello")
    public String SayHello(){
        logger.info("sayHello() STARTED");
        logger.info("sayHello() ENDED");
        return "Hello World!";

    }
}
