package com.apiverification;

public class service {
    ExternalApi api;

    public service(ExternalApi api) {
        this.api = api;
    }

    public void fetchData() {
        api.getData();
    }
}
