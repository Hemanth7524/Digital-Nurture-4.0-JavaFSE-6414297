package com.arrangeactassert;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class impelementingAAATest {

    private  impelementingAAA obj;

    @Before
    public void setObj(){
        obj = new impelementingAAA();
        System.out.println("Object is created for Each test");
    }

    @Test
    public void add() {
        int a = 2;
        int b = 3;
        int res = obj.add(a,b);
        assertEquals(5, res);
    }

    @Test
    public void sub() {
        int a = 2;
        int b = 3;
        int res = obj.sub(b,a);
        assertEquals(1, res);
    }

    @Test
    public void mul() {
        int a = 2;
        int b = 3;
        int res = obj.mul(a,b);
        assertEquals(6, res);
    }

    @Test
    public void div() {
        int a = 10;
        int b = 2;
        int res = obj.div(a,b);
        assertEquals(5, res);
    }

    @After
    public void teardown(){
        obj = null;
        System.out.println("Object is destroyed for Each test");
    }
}