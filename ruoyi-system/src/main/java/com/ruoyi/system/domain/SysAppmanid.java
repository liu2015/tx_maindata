package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * SysAppmanid对象 sys_appmanid
 * 
 * @author liu
 * @date 2020-12-01
 */
public class SysAppmanid extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 业务场景 */
    @Excel(name = "业务场景")
    private String typeScene;

    /** 公司id */
    @Excel(name = "公司id")
    private String corpid;

    /** 用户id */
    @Excel(name = "用户id")
    private String suerid;

    /** 部门id */
    @Excel(name = "部门id")
    private String dept;

    /** 标签id */
    @Excel(name = "标签id")
    private String tagid;

    /** 应用程序id */
    @Excel(name = "应用程序id")
    private String agentid;

    /** 应用秘钥 */
    @Excel(name = "应用秘钥")
    private String secret;

    /** token */
    @Excel(name = "token")
    private String accessToken;

    /** rurl */
    @Excel(name = "rurl")
    private String url;

    /** 备用1 */
    @Excel(name = "备用1")
    private String guard1;

    /** 备用2 */
    @Excel(name = "备用2")
    private String guard2;

    /** 备用2 */
    @Excel(name = "备用2")
    private String guard3;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTypeScene(String typeScene) 
    {
        this.typeScene = typeScene;
    }

    public String getTypeScene() 
    {
        return typeScene;
    }
    public void setCorpid(String corpid) 
    {
        this.corpid = corpid;
    }

    public String getCorpid() 
    {
        return corpid;
    }
    public void setSuerid(String suerid) 
    {
        this.suerid = suerid;
    }

    public String getSuerid() 
    {
        return suerid;
    }
    public void setDept(String dept) 
    {
        this.dept = dept;
    }

    public String getDept() 
    {
        return dept;
    }
    public void setTagid(String tagid) 
    {
        this.tagid = tagid;
    }

    public String getTagid() 
    {
        return tagid;
    }
    public void setAgentid(String agentid) 
    {
        this.agentid = agentid;
    }

    public String getAgentid() 
    {
        return agentid;
    }
    public void setSecret(String secret) 
    {
        this.secret = secret;
    }

    public String getSecret() 
    {
        return secret;
    }
    public void setAccessToken(String accessToken) 
    {
        this.accessToken = accessToken;
    }

    public String getAccessToken() 
    {
        return accessToken;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setGuard1(String guard1) 
    {
        this.guard1 = guard1;
    }

    public String getGuard1() 
    {
        return guard1;
    }
    public void setGuard2(String guard2) 
    {
        this.guard2 = guard2;
    }

    public String getGuard2() 
    {
        return guard2;
    }
    public void setGuard3(String guard3) 
    {
        this.guard3 = guard3;
    }

    public String getGuard3() 
    {
        return guard3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("typeScene", getTypeScene())
            .append("corpid", getCorpid())
            .append("suerid", getSuerid())
            .append("dept", getDept())
            .append("tagid", getTagid())
            .append("agentid", getAgentid())
            .append("secret", getSecret())
            .append("accessToken", getAccessToken())
            .append("url", getUrl())
            .append("guard1", getGuard1())
            .append("guard2", getGuard2())
            .append("guard3", getGuard3())
            .toString();
    }
}
