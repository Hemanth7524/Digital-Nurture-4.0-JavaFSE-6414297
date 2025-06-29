//import org.apache.commons.lang3.StringUtils;
package org.junitdemo;

public class junitdemo {
    public String checkEmpty(String input) {
        if (input.isEmpty()) {
            return "The String is Empty";
        } else {
            return "The String is not Empty";
        }
    }

    public static void main(String[] args) {
        junitdemo jd = new junitdemo();
        String testSt = "";
        System.out.println(jd.checkEmpty(testSt));
    }
}
