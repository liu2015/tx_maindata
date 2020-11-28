package com.ruoyi.system.wxmessage;

public class WxVo {

    private static String  corpid;

    private static String corpsecret;

    private static String access_token;

    private static String url;

    public static String getUrl() {
        return url;
    }

    public static void setUrl(String url) {
        WxVo.url = url;
    }

    public static String getCorpid() {
        return corpid;
    }

    public static void setCorpid(String corpid) {
        WxVo.corpid = corpid;
    }

    public static String getCorpsecret() {
        return corpsecret;
    }

    public static void setCorpsecret(String corpsecret) {
        WxVo.corpsecret = corpsecret;
    }

    public static String getAccess_token() {
        return access_token;
    }

    public static void setAccess_token(String access_token) {
        WxVo.access_token = access_token;
    }
}
