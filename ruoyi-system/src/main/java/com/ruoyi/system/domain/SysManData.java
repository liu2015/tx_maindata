package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * man_data对象 sys_man_data
 * 
 * @author liu
 * @date 2020-11-29
 */
public class SysManData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序列 */
    private Long id;

    /** 创建订单 */
    @Excel(name = "创建订单")
    private String orderId;

    /** 公司代码 */
    @Excel(name = "公司代码")
    private String offCode;

    /** 公司名称 */
    @Excel(name = "公司名称")
    private String offName;

    /** 核算方式 */
    @Excel(name = "核算方式")
    private String offAccanting;

    /** 门店信息 */
    @Excel(name = "门店信息")
    private String shopCode;

    /** 门店名称 */
    @Excel(name = "门店名称")
    private String shopName;

    /** 门店类型 */
    @Excel(name = "门店类型")
    private String shopType;

    /** 成本中心 */
    @Excel(name = "成本中心")
    private String costcenter;

    /** 利润中心 */
    @Excel(name = "利润中心")
    private String profitcenter;

    /** 门店地址 */
    @Excel(name = "门店地址")
    private String shopAddress;

    /** 财务确认 */
    @Excel(name = "财务确认")
    private String offFico;

    /** it确认 */
    @Excel(name = "it确认")
    private String offIt;

    /** 备用1 */
    @Excel(name = "备用1")
    private String beiyong1;

    /** 备用2 */
    @Excel(name = "备用2")
    private String beiyong2;

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
    public void setOffCode(String offCode) 
    {
        this.offCode = offCode;
    }

    public String getOffCode() 
    {
        return offCode;
    }
    public void setOffName(String offName) 
    {
        this.offName = offName;
    }

    public String getOffName() 
    {
        return offName;
    }
    public void setOffAccanting(String offAccanting) 
    {
        this.offAccanting = offAccanting;
    }

    public String getOffAccanting() 
    {
        return offAccanting;
    }
    public void setShopCode(String shopCode) 
    {
        this.shopCode = shopCode;
    }

    public String getShopCode() 
    {
        return shopCode;
    }
    public void setShopName(String shopName) 
    {
        this.shopName = shopName;
    }

    public String getShopName() 
    {
        return shopName;
    }
    public void setShopType(String shopType) 
    {
        this.shopType = shopType;
    }

    public String getShopType() 
    {
        return shopType;
    }
    public void setCostcenter(String costcenter) 
    {
        this.costcenter = costcenter;
    }

    public String getCostcenter() 
    {
        return costcenter;
    }
    public void setProfitcenter(String profitcenter) 
    {
        this.profitcenter = profitcenter;
    }

    public String getProfitcenter() 
    {
        return profitcenter;
    }
    public void setShopAddress(String shopAddress) 
    {
        this.shopAddress = shopAddress;
    }

    public String getShopAddress() 
    {
        return shopAddress;
    }
    public void setOffFico(String offFico) 
    {
        this.offFico = offFico;
    }

    public String getOffFico() 
    {
        return offFico;
    }
    public void setOffIt(String offIt) 
    {
        this.offIt = offIt;
    }

    public String getOffIt() 
    {
        return offIt;
    }
    public void setBeiyong1(String beiyong1) 
    {
        this.beiyong1 = beiyong1;
    }

    public String getBeiyong1() 
    {
        return beiyong1;
    }
    public void setBeiyong2(String beiyong2) 
    {
        this.beiyong2 = beiyong2;
    }

    public String getBeiyong2() 
    {
        return beiyong2;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("offCode", getOffCode())
            .append("offName", getOffName())
            .append("offAccanting", getOffAccanting())
            .append("shopCode", getShopCode())
            .append("shopName", getShopName())
            .append("shopType", getShopType())
            .append("costcenter", getCostcenter())
            .append("profitcenter", getProfitcenter())
            .append("shopAddress", getShopAddress())
            .append("offFico", getOffFico())
            .append("offIt", getOffIt())
            .append("beiyong1", getBeiyong1())
            .append("beiyong2", getBeiyong2())
            .toString();
    }
}
