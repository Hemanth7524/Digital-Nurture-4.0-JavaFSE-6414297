package com.assertions;

//import junit.framework.TestCase;
//import org.junit.Test;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

//import static org.junit.Assert.assertNotEquals;
//import static org.junit.jupiter.api.Assertions.assertNotEquals;
//import static org.junit.jupiter.api.Assertions.*;

public class AssertionsTest {

    @Test
    public void testAdd() {
        Assertions obj = new Assertions();
        assertEquals(5 , obj.add(2,3));

        assertEquals(5, 2 + 3);

        assertNotEquals(5 , 6);

        assertTrue(5 > 3);

        assertFalse(5 < 3);

        assertNull(null);

        assertNotNull(new Object());

        assertSame(obj,obj);

        assertNotSame(null, obj);

    }
}