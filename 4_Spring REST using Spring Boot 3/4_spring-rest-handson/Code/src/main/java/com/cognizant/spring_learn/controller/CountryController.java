package com.cognizant.spring_learn.controller;


import com.cognizant.spring_learn.model.CountryEntity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/country")
public class CountryController {

    @GetMapping
    public CountryEntity getCountryIndia(){
        ApplicationContext context = new ClassPathXmlApplicationContext("Country.xml");
        CountryEntity country = (CountryEntity) context.getBean("in");
        return country;
    }
}
