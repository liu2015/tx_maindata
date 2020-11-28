package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.wxmessage.WxVo;

import javax.annotation.PostConstruct;
import java.util.Map;



/** 初始化login请求获得token
 *
 * */
public class Wxservice {
    public Wxservice() {
//        初始化 请求信息
        String url="https://qyapi.weixin.qq.com/cgi-bin/gettoken";

        String corpid="wwaa46bcce7b1f388a";
        String corpsecret="q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM";
        WxVo.setCorpid(corpid);
        WxVo.setCorpsecret(corpsecret);
        WxVo.setUrl( url );
    }
    //初始化方法
//    在依赖加载完成后，初始化这个方法，获得token
    @PostConstruct
    public void Wxrequest(){
//组合成一个 param参数
        String param="corpid="+WxVo.getCorpid()+"&corpsecret="+WxVo.getCorpsecret();
        System.out.println(param);


        String httptext= HttpUtils.sendGet(WxVo.getUrl(),param);
        System.out.println(httptext);
//      Map格式取出token
        Map token=JSONObject.parseObject(httptext);
        String getaccess_token= (String) token.get("access_token");
        WxVo.setAccess_token(getaccess_token);
        System.out.println("请求成功，获得token=  "+token.get("access_token"));
//        将获得token给静态属性


    }

}
