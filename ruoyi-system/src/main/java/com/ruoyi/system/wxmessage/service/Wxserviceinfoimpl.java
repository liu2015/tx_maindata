package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.SysMsgText;
import com.ruoyi.system.service.impl.SysMsgTextServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 实现配置数据库然后获得文本内容，就可以发送制定消息
 */

@Component
public class Wxserviceinfoimpl {

    @Autowired
    SysMsgTextServiceImpl sysMsgTextService;

    public static String infourl="";
    public static String text_content="";

/**
 *
 * 实现 文本取值为数据库内容
 */

    public  String Wxserviceinfo(String addtext){
        HashMap maptext=new HashMap();
        SysMsgText text=new SysMsgText();
        text.setYeuwType("1");
//        获得 是1的业务类型审核第一步骤的结果
       List<SysMsgText> list= sysMsgTextService.selectSysMsgTextList(text);
        for (int i = 0; i < list.size(); i++) {
            if (i==0) {
                SysMsgText systext = list.get(i);
                text_content=systext.getText()+"\n 一下自动生成 \n "+addtext;
                infourl = systext.getUrl();

                System.out.println(systext.toString());
                HashMap<String,String> content=new HashMap();
                content.put("content",text_content);

                maptext.put("touser",systext.getTouser());
                maptext.put("toparty",systext.getToparty());
                maptext.put("totag",systext.getTotag());
                maptext.put("msgtype",systext.getMsgtype());
                maptext.put("agentid",systext.getAgentid());
                maptext.put("text",content);
                maptext.put("safe",systext.getSafe());
                maptext.put("enable_id_trans",systext.getEnableDuplicateCheck());
                maptext.put("duplicate_check_interval",systext.getDuplicateCheckInterval());

            }

        }
//        String textdd=new JSONObject(maptext).toJSONString();

        String textdd= JSONObject.toJSONString(maptext);


        System.out.println(".............."+textdd.toString());
        return textdd;
    }


    public  void serviceinfopost(){

        String xtnei="系统内请求";
      String param= String.valueOf(Wxserviceinfo(xtnei));

        String posttext= HttpUtils.sendPost(infourl,param);
//        看下返回结果
        System.out.println(posttext);
        Map maptext= JSONObject.parseObject(posttext);
        if (maptext.get("errmsg").equals("ok")){
            System.out.println("请求成功，已经发送返回值"+posttext);


        } else {
            System.out.println(".................请求失败");

        }


    }













}
