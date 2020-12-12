package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 销售图表对象 sys_tubiao_data
 * 
 * @author liu
 * @date 2020-12-12
 */
public class SysTubiaoData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 单号id */
    @Excel(name = "单号id")
    private String digndanId;

    /** 流水id */
    @Excel(name = "流水id")
    private String liushuiId;

    /** 实收金额 */
    @Excel(name = "实收金额")
    private String shishouJine;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private String youhuiJine;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String huiyuanCall;

    public void setDigndanId(String digndanId) 
    {
        this.digndanId = digndanId;
    }

    public String getDigndanId() 
    {
        return digndanId;
    }
    public void setLiushuiId(String liushuiId) 
    {
        this.liushuiId = liushuiId;
    }

    public String getLiushuiId() 
    {
        return liushuiId;
    }
    public void setShishouJine(String shishouJine) 
    {
        this.shishouJine = shishouJine;
    }

    public String getShishouJine() 
    {
        return shishouJine;
    }
    public void setYouhuiJine(String youhuiJine) 
    {
        this.youhuiJine = youhuiJine;
    }

    public String getYouhuiJine() 
    {
        return youhuiJine;
    }
    public void setHuiyuanCall(String huiyuanCall) 
    {
        this.huiyuanCall = huiyuanCall;
    }

    public String getHuiyuanCall() 
    {
        return huiyuanCall;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("digndanId", getDigndanId())
            .append("liushuiId", getLiushuiId())
            .append("shishouJine", getShishouJine())
            .append("youhuiJine", getYouhuiJine())
            .append("huiyuanCall", getHuiyuanCall())
            .toString();
    }
}
