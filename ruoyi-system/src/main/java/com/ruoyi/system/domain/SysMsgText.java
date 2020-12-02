package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 消息管理对象 sys_msg_text
 * 
 * @author liu
 * @date 2020-12-02
 */
public class SysMsgText extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 业务类型 */
    @Excel(name = "业务类型")
    private String yeuwType;

    /** 指定接收消息的成员 */
    @Excel(name = "指定接收消息的成员")
    private String touser;

    /** 指定接收消息的部门 */
    @Excel(name = "指定接收消息的部门")
    private String toparty;

    /** 指定接收消息的标签 */
    @Excel(name = "指定接收消息的标签")
    private String totag;

    /** 消息类型，此时固定为：text */
    @Excel(name = "消息类型，此时固定为：text")
    private String msgtype;

    /** 企业应用的id，整型 */
    @Excel(name = "企业应用的id，整型")
    private Long agentid;

    /** 消息内容text_content */
    @Excel(name = "消息内容text_content")
    private String text;

    /** 表示是否是保密消息 */
    @Excel(name = "表示是否是保密消息")
    private String safe;

    /** 表示是否开启id转译 */
    @Excel(name = "表示是否开启id转译")
    private String enableIdTrans;

    /** 表示是否开启重复消息检查 */
    @Excel(name = "表示是否开启重复消息检查")
    private String enableDuplicateCheck;

    /** 表示是否重复消息检查的时间间隔 */
    @Excel(name = "表示是否重复消息检查的时间间隔")
    private String duplicateCheckInterval;

    /** 请求url地址 */
    @Excel(name = "请求url地址")
    private String url;

    /** 备用 */
    @Excel(name = "备用")
    private String spare1;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setYeuwType(String yeuwType) 
    {
        this.yeuwType = yeuwType;
    }

    public String getYeuwType() 
    {
        return yeuwType;
    }
    public void setTouser(String touser) 
    {
        this.touser = touser;
    }

    public String getTouser() 
    {
        return touser;
    }
    public void setToparty(String toparty) 
    {
        this.toparty = toparty;
    }

    public String getToparty() 
    {
        return toparty;
    }
    public void setTotag(String totag) 
    {
        this.totag = totag;
    }

    public String getTotag() 
    {
        return totag;
    }
    public void setMsgtype(String msgtype) 
    {
        this.msgtype = msgtype;
    }

    public String getMsgtype() 
    {
        return msgtype;
    }
    public void setAgentid(Long agentid) 
    {
        this.agentid = agentid;
    }

    public Long getAgentid() 
    {
        return agentid;
    }
    public void setText(String text) 
    {
        this.text = text;
    }

    public String getText() 
    {
        return text;
    }
    public void setSafe(String safe) 
    {
        this.safe = safe;
    }

    public String getSafe() 
    {
        return safe;
    }
    public void setEnableIdTrans(String enableIdTrans) 
    {
        this.enableIdTrans = enableIdTrans;
    }

    public String getEnableIdTrans() 
    {
        return enableIdTrans;
    }
    public void setEnableDuplicateCheck(String enableDuplicateCheck) 
    {
        this.enableDuplicateCheck = enableDuplicateCheck;
    }

    public String getEnableDuplicateCheck() 
    {
        return enableDuplicateCheck;
    }
    public void setDuplicateCheckInterval(String duplicateCheckInterval) 
    {
        this.duplicateCheckInterval = duplicateCheckInterval;
    }

    public String getDuplicateCheckInterval() 
    {
        return duplicateCheckInterval;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setSpare1(String spare1) 
    {
        this.spare1 = spare1;
    }

    public String getSpare1() 
    {
        return spare1;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("yeuwType", getYeuwType())
            .append("touser", getTouser())
            .append("toparty", getToparty())
            .append("totag", getTotag())
            .append("msgtype", getMsgtype())
            .append("agentid", getAgentid())
            .append("text", getText())
            .append("safe", getSafe())
            .append("enableIdTrans", getEnableIdTrans())
            .append("enableDuplicateCheck", getEnableDuplicateCheck())
            .append("duplicateCheckInterval", getDuplicateCheckInterval())
            .append("url", getUrl())
            .append("spare1", getSpare1())
            .toString();
    }
}
