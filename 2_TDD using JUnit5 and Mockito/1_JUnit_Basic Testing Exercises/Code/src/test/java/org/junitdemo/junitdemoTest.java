package org.junitdemo;

import org.junit.Test;
import static org.junit.Assert.*;

public class junitdemoTest {

    @Test
    public void testEmptyString() {
        junitdemo jd = new junitdemo();
        String result = jd.checkEmpty("");
        assertEquals("The String is Empty", result);
    }

    @Test
    public void testNonEmptyString() {
        junitdemo jd = new junitdemo();
        String result = jd.checkEmpty("Hello");
        assertEquals("The String is not Empty", result);
    }
}
