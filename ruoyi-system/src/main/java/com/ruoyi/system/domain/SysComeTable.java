package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出入登记对象 sys_come_table
 * 
 * @author ruoyi
 * @date 2020-12-10
 */
public class SysComeTable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 来访姓名 */
    @Excel(name = "来访姓名")
    private String comeName;

    /** 性别 */
    @Excel(name = "性别")
    private String sex;

    /** 身份证id */
    @Excel(name = "身份证id")
    private String ideNtity;

    /**  工作单位 */
    @Excel(name = " 工作单位")
    private String worKunit;

    /**  联系电话 */
    @Excel(name = " 联系电话")
    private String callLink;

    /** 来访时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "来访时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date comeTime;

    /** 离开时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "离开时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date leaweTime;

    /** 备注 */
    @Excel(name = "备注")
    private String reaMarks;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setComeName(String comeName) 
    {
        this.comeName = comeName;
    }

    public String getComeName() 
    {
        return comeName;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setIdeNtity(String ideNtity) 
    {
        this.ideNtity = ideNtity;
    }

    public String getIdeNtity() 
    {
        return ideNtity;
    }
    public void setWorKunit(String worKunit) 
    {
        this.worKunit = worKunit;
    }

    public String getWorKunit() 
    {
        return worKunit;
    }
    public void setCallLink(String callLink) 
    {
        this.callLink = callLink;
    }

    public String getCallLink() 
    {
        return callLink;
    }
    public void setComeTime(Date comeTime) 
    {
        this.comeTime = comeTime;
    }

    public Date getComeTime() 
    {
        return comeTime;
    }
    public void setLeaweTime(Date leaweTime) 
    {
        this.leaweTime = leaweTime;
    }

    public Date getLeaweTime() 
    {
        return leaweTime;
    }
    public void setReaMarks(String reaMarks) 
    {
        this.reaMarks = reaMarks;
    }

    public String getReaMarks() 
    {
        return reaMarks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("comeName", getComeName())
            .append("sex", getSex())
            .append("ideNtity", getIdeNtity())
            .append("worKunit", getWorKunit())
            .append("callLink", getCallLink())
            .append("comeTime", getComeTime())
            .append("leaweTime", getLeaweTime())
            .append("reaMarks", getReaMarks())
            .toString();
    }
}
