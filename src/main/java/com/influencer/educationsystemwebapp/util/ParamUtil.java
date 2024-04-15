package com.influencer.educationsystemwebapp.util;

public class ParamUtil {

    public static String get(String value) {
        if (value != null) return value;
        return "";
    }

    public static Integer parseInt(String value) {
        if (value != null && value.trim().length() > 0) {
            return Integer.parseInt(value.trim());
        }
        return null;
    }
}

