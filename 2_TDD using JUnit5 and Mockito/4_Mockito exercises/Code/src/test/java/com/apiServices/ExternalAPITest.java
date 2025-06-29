package com.apiServices;

import org.junit.Test;
import org.mockito.Mockito;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

public class ExternalAPITest {

    ExternalAPI api;

    @Test
    public void testExternalAPI(){
        api = Mockito.mock(ExternalAPI.class);
        when(api.getdata()).thenReturn("Hemanth");
        service myService = new service(api);
        String result = myService.fetchData();
        assertEquals("Hemanth", result);
    }
}

