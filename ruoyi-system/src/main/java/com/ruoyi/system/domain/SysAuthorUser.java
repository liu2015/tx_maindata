package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * SysAuthorUser对象 sys_author_user
 * 
 * @author ruoyi
 * @date 2020-12-01
 */
public class SysAuthorUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 单号id */
    @Excel(name = "单号id")
    private String orderid;

    /** 大区 */
    @Excel(name = "大区")
    private String region;

    /** 岗位名称 */
    @Excel(name = "岗位名称")
    private String pstName;

    /** 人员名称 */
    @Excel(name = "人员名称")
    private String nameUser;

    /** 人员编码 */
    @Excel(name = "人员编码")
    private String nameCode;

    /** 分公司编码 */
    @Excel(name = "分公司编码")
    private String offCode;

    /** ap分公司权限 */
    @Excel(name = "ap分公司权限")
    private String offAccess;

    /** pos名称 */
    @Excel(name = "pos名称")
    private String posText;

    /** pos岗位 */
    @Excel(name = "pos岗位")
    private String posNames;

    /** pos门店编号 */
    @Excel(name = "pos门店编号")
    private String posShop;

    /** 中台权限组名称 */
    @Excel(name = "中台权限组名称")
    private String ztAuthor;

    /** 备注 */
    @Excel(name = "备注")
    private String beizhu;

    /** 组 */
    @Excel(name = "组")
    private String groupText;

    /** 用户组名称 */
    @Excel(name = "用户组名称")
    private String groupName;

    /** 备用1 */
    @Excel(name = "备用1")
    private String gp1;

    /** 备用2 */
    @Excel(name = "备用2")
    private String gp2;

    /** 备用3 */
    @Excel(name = "备用3")
    private String gp3;

    /** 备用4 */
    @Excel(name = "备用4")
    private String gp4;

    /** 备用5 */
    @Excel(name = "备用5")
    private String gp5;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderid(String orderid) 
    {
        this.orderid = orderid;
    }

    public String getOrderid() 
    {
        return orderid;
    }
    public void setRegion(String region) 
    {
        this.region = region;
    }

    public String getRegion() 
    {
        return region;
    }
    public void setPstName(String pstName) 
    {
        this.pstName = pstName;
    }

    public String getPstName() 
    {
        return pstName;
    }
    public void setNameUser(String nameUser) 
    {
        this.nameUser = nameUser;
    }

    public String getNameUser() 
    {
        return nameUser;
    }
    public void setNameCode(String nameCode) 
    {
        this.nameCode = nameCode;
    }

    public String getNameCode() 
    {
        return nameCode;
    }
    public void setOffCode(String offCode) 
    {
        this.offCode = offCode;
    }

    public String getOffCode() 
    {
        return offCode;
    }
    public void setOffAccess(String offAccess) 
    {
        this.offAccess = offAccess;
    }

    public String getOffAccess() 
    {
        return offAccess;
    }
    public void setPosText(String posText) 
    {
        this.posText = posText;
    }

    public String getPosText() 
    {
        return posText;
    }
    public void setPosNames(String posNames) 
    {
        this.posNames = posNames;
    }

    public String getPosNames() 
    {
        return posNames;
    }
    public void setPosShop(String posShop) 
    {
        this.posShop = posShop;
    }

    public String getPosShop() 
    {
        return posShop;
    }
    public void setZtAuthor(String ztAuthor) 
    {
        this.ztAuthor = ztAuthor;
    }

    public String getZtAuthor() 
    {
        return ztAuthor;
    }
    public void setBeizhu(String beizhu) 
    {
        this.beizhu = beizhu;
    }

    public String getBeizhu() 
    {
        return beizhu;
    }
    public void setGroupText(String groupText) 
    {
        this.groupText = groupText;
    }

    public String getGroupText() 
    {
        return groupText;
    }
    public void setGroupName(String groupName) 
    {
        this.groupName = groupName;
    }

    public String getGroupName() 
    {
        return groupName;
    }
    public void setGp1(String gp1) 
    {
        this.gp1 = gp1;
    }

    public String getGp1() 
    {
        return gp1;
    }
    public void setGp2(String gp2) 
    {
        this.gp2 = gp2;
    }

    public String getGp2() 
    {
        return gp2;
    }
    public void setGp3(String gp3) 
    {
        this.gp3 = gp3;
    }

    public String getGp3() 
    {
        return gp3;
    }
    public void setGp4(String gp4) 
    {
        this.gp4 = gp4;
    }

    public String getGp4() 
    {
        return gp4;
    }
    public void setGp5(String gp5) 
    {
        this.gp5 = gp5;
    }

    public String getGp5() 
    {
        return gp5;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderid", getOrderid())
            .append("region", getRegion())
            .append("pstName", getPstName())
            .append("nameUser", getNameUser())
            .append("nameCode", getNameCode())
            .append("offCode", getOffCode())
            .append("offAccess", getOffAccess())
            .append("posText", getPosText())
            .append("posNames", getPosNames())
            .append("posShop", getPosShop())
            .append("ztAuthor", getZtAuthor())
            .append("beizhu", getBeizhu())
            .append("groupText", getGroupText())
            .append("groupName", getGroupName())
            .append("gp1", getGp1())
            .append("gp2", getGp2())
            .append("gp3", getGp3())
            .append("gp4", getGp4())
            .append("gp5", getGp5())
            .toString();
    }
}
