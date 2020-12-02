package com.ruoyi.system.wxmessage.service;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.controller.SysAppmanidController;
import com.ruoyi.system.domain.SysAppmanid;
import com.ruoyi.system.domain.SysAuthorUser;
import com.ruoyi.system.mapper.SysAppmanidMapper;
import com.ruoyi.system.service.impl.SysAppmanidServiceImpl;
import com.ruoyi.system.wxmessage.WxVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;



/** 初始化login请求获得token
 *
 * */
@Component
public class Wxservice {

    @Autowired
    private SysAppmanidServiceImpl sysAppmanidService;
    Long upid= Long.valueOf(1);

    @Log(title = "man_data", businessType = BusinessType.UPDATE)
    public void Wxservice1() {
//        初始化 请求信息
        String url="https://qyapi.weixin.qq.com/cgi-bin/gettoken";

        String corpid="wwaa46bcce7b1f388a";
        String corpsecret="q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM";
        List<SysAppmanid> wxlist=AppMap();

        for (int i = 0; i < wxlist.size(); i++) {
//            只取第一个list 0 序号的
            if (i==0) {
                SysAppmanid mapd = wxlist.get(i);
                upid=mapd.getId();
                url = mapd.getUrl();
                corpid = mapd.getCorpid();
                corpsecret = mapd.getSecret();
            }
        }

        WxVo.setCorpid(corpid);
        WxVo.setCorpsecret(corpsecret);
        WxVo.setUrl( url );
    }

    /**
     * 查询SysAppmanid列表
     * @return
     */
    @Log(title = "man_data", businessType = BusinessType.UPDATE)
    public List<SysAppmanid> AppMap()
    {

//        SysAppmanidServiceImpl df=new SysAppmanidServiceImpl();

        SysAppmanid apptext=new SysAppmanid();
        apptext.setTypeScene("token");
        SysAppmanid ddf=apptext;
     List<SysAppmanid> listd= sysAppmanidService.selectSysAppmanidList(ddf);

        for (SysAppmanid d: listd
             ) {
            System.out.println("遍历数组对象"+d.toString());
        }

     return listd;

    }

    //初始化方法 请求获得token
//    在依赖加载完成后，初始化这个方法，获得token
    @PostConstruct
    public void Wxrequest(){
//组合成一个 param参数
        Wxservice1();
        String param="corpid="+WxVo.getCorpid()+"&corpsecret="+WxVo.getCorpsecret();
        System.out.println(param);
        try {
            String httptext= HttpUtils.sendGet(WxVo.getUrl(),param);
            System.out.println(httptext);
            Map token=JSONObject.parseObject(httptext);
//            判断
if (token.get("access_token")!=null) {
    String getaccess_token = (String) token.get("access_token");
    SysAppmanid sysapp = new SysAppmanid();
    sysapp.setId(upid);
    sysapp.setAccessToken(getaccess_token);
//        更新数据数据的token
    sysAppmanidService.updateSysAppmanid(sysapp);
    System.out.println("gegnxin......................................获得token=  " + token.get("access_token"));
    WxVo.setAccess_token(getaccess_token);
    System.out.println("请求成功，获得token=  " + token.get("access_token"));
}else {
    System.out.println("出现错误请，检查配置参数");
}
        }catch (Exception e)
        {
            System.out.println("出现错误请，检查配置参数"+e);
        }
    }
}
