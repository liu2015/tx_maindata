package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.wxmessage.WxVo;

import java.util.Map;

public class Wxserviceinfo {

//    发送应用消息测试传入参数
    public void Wxserviceinfopost(String paramtest){
        String dizhi="access_token"+ WxVo.getAccess_token();
        String messageurl="https://qyapi.weixin.qq.com/cgi-bin/message/send?"+dizhi;

//        这里可以改成传参的发送内容
        String param="{\n" +
                "   \"touser\" : \"LiuFuLing\",\n" +
                "   \"msgtype\" : \"text\",\n" +
                "   \"agentid\" : 1000002,\n" +
                "   \"text\" : {\n" +
                "       \"content\" : \"这是一段测试内容。\\n出发前可查看<a href=\\\"http://work.weixin.qq.com\\\">邮件中心视频实况</a>  换行内容。\"\n" +
                "   },\n" +
                "   \"safe\":0,\n" +
                "   \"enable_id_trans\": 0,\n" +
                "   \"enable_duplicate_check\": 0,\n" +
                "   \"duplicate_check_interval\": 1800\n" +
                "}";

        String posttext=HttpUtils.sendPost(messageurl,param);
        Map  maptext= JSONObject.parseObject(posttext);
        if (maptext.get("errmsg").equals("ok"))
        {
            System.out.println("请求成功，已经发送返回值"+posttext.toString());

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
