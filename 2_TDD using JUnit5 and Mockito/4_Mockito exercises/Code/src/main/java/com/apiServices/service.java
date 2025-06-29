package com.apiServices;

public class service {
    private ExternalAPI Api;

    public service(ExternalAPI Api) {
        this.Api = Api;
    }

    public String fetchData() {
        return Api.getdata();
    }
}

