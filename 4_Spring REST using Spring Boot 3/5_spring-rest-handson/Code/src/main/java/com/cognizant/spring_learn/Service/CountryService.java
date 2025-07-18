package com.cognizant.spring_learn.Service;

import com.cognizant.spring_learn.model.CountryEntity;

import org.springframework.stereotype.Service;
import org.springframework.core.io.ClassPathResource;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Service
public class CountryService {

    private List<CountryEntity> countries;

    public CountryService() {
        this.countries = new ArrayList<>();
        loadCountriesFromXml();
    }

    private void loadCountriesFromXml() {
        try {
            ClassPathResource resource = new ClassPathResource("country.xml");
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(resource.getInputStream());
            doc.getDocumentElement().normalize();

            NodeList nodeList = doc.getElementsByTagName("country");

            for (int i = 0; i < nodeList.getLength(); i++) {
                Element element = (Element) nodeList.item(i);
                String code = element.getElementsByTagName("code").item(0).getTextContent();
                String name = element.getElementsByTagName("name").item(0).getTextContent();
                countries.add(new CountryEntity(code, name));
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions appropriately, e.g., throw a custom exception
        }
    }

    public CountryEntity getCountry(String code) {
        // Case-insensitive matching using lambda expression
        return countries.stream()
                .filter(country -> country.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElse(null); // Return null if not found, or throw an exception
    }
}