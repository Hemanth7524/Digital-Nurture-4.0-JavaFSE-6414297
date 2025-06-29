package com.apiverification;

import static org.mockito.Mockito.*;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class serviceTest {

    @Test
    public void testVerifyInteraction() {

        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        service service = new service(mockApi);

        service.fetchData();

        verify(mockApi).getData();
    }
}


