package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * sys_man_list_data对象 sys_man_list_data
 * 
 * @author ruoyi
 * @date 2020-11-30
 */
public class SysManListData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 订单id */
    @Excel(name = "订单id")
    private String orderId;

    /** 用户权限申请 */
    @Excel(name = "用户权限申请")
    private String suerAuthority;

    /** 财务确认 */
    @Excel(name = "财务确认")
    private String ficoConfi;

    /** it确认 */
    @Excel(name = "it确认")
    private String itConfi;

    /** 确认 */
    @Excel(name = "确认")
    private String billConfi;

    /** pos确认 */
    @Excel(name = "pos确认")
    private String posConfi;

    /** 供货价确认 */
    @Excel(name = "供货价确认")
    private String supplyPrice;

    /** 零售价确认 */
    @Excel(name = "零售价确认")
    private String retailPrice;

    /** 主数据确认1 */
    @Excel(name = "主数据确认1")
    private String manDataone;

    /** 主数据确认2 */
    @Excel(name = "主数据确认2")
    private String manDatatwo;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gu1;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gu2;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gu3;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gu4;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gu5;

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
    public void setSuerAuthority(String suerAuthority) 
    {
        this.suerAuthority = suerAuthority;
    }

    public String getSuerAuthority() 
    {
        return suerAuthority;
    }
    public void setFicoConfi(String ficoConfi) 
    {
        this.ficoConfi = ficoConfi;
    }

    public String getFicoConfi() 
    {
        return ficoConfi;
    }
    public void setItConfi(String itConfi) 
    {
        this.itConfi = itConfi;
    }

    public String getItConfi() 
    {
        return itConfi;
    }
    public void setBillConfi(String billConfi) 
    {
        this.billConfi = billConfi;
    }

    public String getBillConfi() 
    {
        return billConfi;
    }
    public void setPosConfi(String posConfi) 
    {
        this.posConfi = posConfi;
    }

    public String getPosConfi() 
    {
        return posConfi;
    }
    public void setSupplyPrice(String supplyPrice) 
    {
        this.supplyPrice = supplyPrice;
    }

    public String getSupplyPrice() 
    {
        return supplyPrice;
    }
    public void setRetailPrice(String retailPrice) 
    {
        this.retailPrice = retailPrice;
    }

    public String getRetailPrice() 
    {
        return retailPrice;
    }
    public void setManDataone(String manDataone) 
    {
        this.manDataone = manDataone;
    }

    public String getManDataone() 
    {
        return manDataone;
    }
    public void setManDatatwo(String manDatatwo) 
    {
        this.manDatatwo = manDatatwo;
    }

    public String getManDatatwo() 
    {
        return manDatatwo;
    }
    public void setGu1(String gu1) 
    {
        this.gu1 = gu1;
    }

    public String getGu1() 
    {
        return gu1;
    }
    public void setGu2(String gu2) 
    {
        this.gu2 = gu2;
    }

    public String getGu2() 
    {
        return gu2;
    }
    public void setGu3(String gu3) 
    {
        this.gu3 = gu3;
    }

    public String getGu3() 
    {
        return gu3;
    }
    public void setGu4(String gu4) 
    {
        this.gu4 = gu4;
    }

    public String getGu4() 
    {
        return gu4;
    }
    public void setGu5(String gu5) 
    {
        this.gu5 = gu5;
    }

    public String getGu5() 
    {
        return gu5;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("suerAuthority", getSuerAuthority())
            .append("ficoConfi", getFicoConfi())
            .append("itConfi", getItConfi())
            .append("billConfi", getBillConfi())
            .append("posConfi", getPosConfi())
            .append("supplyPrice", getSupplyPrice())
            .append("retailPrice", getRetailPrice())
            .append("manDataone", getManDataone())
            .append("manDatatwo", getManDatatwo())
            .append("gu1", getGu1())
            .append("gu2", getGu2())
            .append("gu3", getGu3())
            .append("gu4", getGu4())
            .append("gu5", getGu5())
            .toString();
    }
}
