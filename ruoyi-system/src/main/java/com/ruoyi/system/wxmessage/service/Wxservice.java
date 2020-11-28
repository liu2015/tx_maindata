package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.wxmessage.WxVo;

import java.util.Map;

public class Wxservice {
    public Wxservice() {
//        初始化 请求信息
        String url="https://qyapi.weixin.qq.com/cgi-bin/gettoken";

        String corpid="wwaa46bcce7b1f388a";
        String corpsecret="q7OgmArKfeOKO_m6zFZX1LNR09v561F83QPBmysINHA";
        WxVo.setCorpid(corpid);
        WxVo.setCorpsecret(corpsecret);
        WxVo.setUrl( url );
    }

    public void Wxrequest(){
//组合成一个 param参数
        String param="corpid="+WxVo.getCorpid()+"corpsecret="+WxVo.getCorpsecret();
        System.out.println(param);


      String httptext= HttpUtils.sendGet(WxVo.getUrl(),param);
//      Map格式取出token
        Map token=JSONObject.parseObject(httptext);
        System.out.println(token);
        String getaccess_token= (String) token.get("access_token");
        WxVo.setAccess_token(getaccess_token);
//        将获得token给静态属性













    }

}
