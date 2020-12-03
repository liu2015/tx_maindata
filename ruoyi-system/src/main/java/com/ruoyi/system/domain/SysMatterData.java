package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * sys_matter_data对象 sys_matter_data
 * 
 * @author liu
 * @date 2020-12-03
 */
public class SysMatterData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 订单id */
    @Excel(name = "订单id")
    private String orderId;

    /** 大区 */
    @Excel(name = "大区")
    private String region;

    /** 组织级别 */
    @Excel(name = "组织级别")
    private String organLevel;

    /** 销售组织 */
    @Excel(name = "销售组织")
    private String sellDrgan;

    /** 料号 */
    @Excel(name = "料号")
    private String matter;

    /** 物料描述 */
    @Excel(name = "物料描述")
    private String matterDescribe;

    /** 物料组 */
    @Excel(name = "物料组")
    private String matterGroup;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 备用1 */
    @Excel(name = "备用1")
    private String guard1;

    /** 备用2 */
    @Excel(name = "备用2")
    private String guard2;

    /** 备用3 */
    @Excel(name = "备用3")
    private String guard3;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setRegion(String region) 
    {
        this.region = region;
    }

    public String getRegion() 
    {
        return region;
    }
    public void setOrganLevel(String organLevel) 
    {
        this.organLevel = organLevel;
    }

    public String getOrganLevel() 
    {
        return organLevel;
    }
    public void setSellDrgan(String sellDrgan) 
    {
        this.sellDrgan = sellDrgan;
    }

    public String getSellDrgan() 
    {
        return sellDrgan;
    }
    public void setMatter(String matter) 
    {
        this.matter = matter;
    }

    public String getMatter() 
    {
        return matter;
    }
    public void setMatterDescribe(String matterDescribe) 
    {
        this.matterDescribe = matterDescribe;
    }

    public String getMatterDescribe() 
    {
        return matterDescribe;
    }
    public void setMatterGroup(String matterGroup) 
    {
        this.matterGroup = matterGroup;
    }

    public String getMatterGroup() 
    {
        return matterGroup;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("orderId", getOrderId())
            .append("region", getRegion())
            .append("organLevel", getOrganLevel())
            .append("sellDrgan", getSellDrgan())
            .append("matter", getMatter())
            .append("matterDescribe", getMatterDescribe())
            .append("matterGroup", getMatterGroup())
            .append("status", getStatus())
            .append("guard1", getGuard1())
            .append("guard2", getGuard2())
            .append("guard3", getGuard3())
            .toString();
    }
}
