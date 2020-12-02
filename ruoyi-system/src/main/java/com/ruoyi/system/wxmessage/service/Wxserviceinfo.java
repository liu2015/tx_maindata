package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.wxmessage.WxVo;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;
@Component
public class Wxserviceinfo {
    @Autowired
   public Wxserviceinfoimpl wxserviceinfoimpl;
    @Autowired
    public Wxservice wxservice;

    //    发送应用消息测试传入参数
    public void Wxserviceinfopost(String paramtest){
//        初始化请求获得token
        wxservice.Wxrequest();
//        初始化请求获得token

        String dizhi="access_token="+ WxVo.getAccess_token();
        String messageurl="https://qyapi.weixin.qq.com/cgi-bin/message/send?"+dizhi;
        System.out.println(dizhi);

//        这里可以改成传参的发送内容
        String param= String.valueOf(wxserviceinfoimpl.Wxserviceinfo(paramtest));

        System.out.println("需要修改传入参数对应，现在只是演示"+paramtest);

        String posttext= HttpUtils.sendPost(messageurl,param);
        System.out.println(posttext);
        Map  maptext= JSONObject.parseObject(posttext);

        if (maptext.get("errmsg").equals("ok"))
        {
            System.out.println("请求成功，已经发送返回值"+posttext);

        }else {
            System.out.println("请求失败");
        }

    }

    //    重写发送请求，Map类型参数 也是是对象格式
    public void WxserviceinfoMap(Map map){
        String dizhi="access_token"+ WxVo.getAccess_token();
        String messageurl="https://qyapi.weixin.qq.com/cgi-bin/message/send?"+dizhi;

//        将转换的参数转换成json格式

        String paramMap=JSONObject.toJSONString(map);

        String posttext=HttpUtils.sendPost(messageurl,paramMap);

        Map  maptext= JSONObject.parseObject(posttext);
        if (maptext.get("errmsg").equals("ok"))
        {
            System.out.println("请求成功，已经发送返回值"+posttext.toString());

        }else {
            System.out.println("请求失败");
        }

    }


}