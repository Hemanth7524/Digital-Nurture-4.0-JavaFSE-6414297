package com.cognizant.spring_learn.controller;

import com.cognizant.spring_learn.model.CountryEntity;
import com.cognizant.spring_learn.Service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CountryController {

    @Autowired
    private CountryService countryService;

    @GetMapping("/countries/{code}")
    public CountryEntity getCountry(@PathVariable("code") String code) {
        return countryService.getCountry(code);
    }
}