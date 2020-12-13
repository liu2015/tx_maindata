package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 销售数据图表1对象 sys_test_tubiao_data
 * 
 * @author liu
 * @date 2020-12-13
 */
public class SysTestTubiaoData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 单据号 */
    @Excel(name = "单据号")
    private String ordId;

    /** 流水号 */
    @Excel(name = "流水号")
    private String f1;

    /** 收款机号 */
    @Excel(name = "收款机号")
    private String f2;

    /** 收款员编码 */
    @Excel(name = "收款员编码")
    private String f3;

    /** 业务类型 */
    @Excel(name = "业务类型")
    private String f4;

    /** 购物类型 */
    @Excel(name = "购物类型")
    private String f5;

    /** 会员卡号 */
    @Excel(name = "会员卡号")
    private String f6;

    /** 销售时间 */
    @Excel(name = "销售时间")
    private String f7;

    /** 营业日期 */
    @Excel(name = "营业日期")
    private String f8;

    /** 记账日期 */
    @Excel(name = "记账日期")
    private String f9;

    /** 支付标记 */
    @Excel(name = "支付标记")
    private String f10;

    /** 交付标记 */
    @Excel(name = "交付标记")
    private String f11;

    /** 单据状态 */
    @Excel(name = "单据状态")
    private String f12;

    /** 客户类型 */
    @Excel(name = "客户类型")
    private String f13;

    /** 客户类型名称 */
    @Excel(name = "客户类型名称")
    private String f14;

    /** 付款单号 */
    @Excel(name = "付款单号")
    private String f15;

    /** 来源单据号 */
    @Excel(name = "来源单据号")
    private String f16;

    /** 来源业务类型 */
    @Excel(name = "来源业务类型")
    private String f17;

    /** 应收金额 */
    @Excel(name = "应收金额")
    private String f18;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private String f19;

    /** 实收金额 */
    @Excel(name = "实收金额")
    private String f20;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private String f21;

    /** 找零金额 */
    @Excel(name = "找零金额")
    private String f22;

    /** 舍入金额 */
    @Excel(name = "舍入金额")
    private String f23;

    /** 明细件数 */
    @Excel(name = "明细件数")
    private String f24;

    /** 明细条数 */
    @Excel(name = "明细条数")
    private String f25;

    /** 原流水号 */
    @Excel(name = "原流水号")
    private String f26;

    /** 款项确认单据号 */
    @Excel(name = "款项确认单据号")
    private String f27;

    /** 是否打印发票 */
    @Excel(name = "是否打印发票")
    private String f28;

    /** 发票打印次数 */
    @Excel(name = "发票打印次数")
    private String f29;

    /** 出货仓库编码打印次数 */
    @Excel(name = "出货仓库编码打印次数")
    private String f30;

    /** 班次号 */
    @Excel(name = "班次号")
    private String f31;

    /** 外卖类型 */
    @Excel(name = "外卖类型")
    private String f32;

    /** 台结流水 */
    @Excel(name = "台结流水")
    private String f33;

    /** 备注 */
    @Excel(name = "备注")
    private String f34;

    /** 订单类型 */
    @Excel(name = "订单类型")
    private String f35;

    /** 电子发票码 */
    @Excel(name = "电子发票码")
    private String f36;

    /** 会员手机号 */
    @Excel(name = "会员手机号")
    private String f37;

    public void setOrdId(String ordId) 
    {
        this.ordId = ordId;
    }

    public String getOrdId() 
    {
        return ordId;
    }
    public void setF1(String f1) 
    {
        this.f1 = f1;
    }

    public String getF1() 
    {
        return f1;
    }
    public void setF2(String f2) 
    {
        this.f2 = f2;
    }

    public String getF2() 
    {
        return f2;
    }
    public void setF3(String f3) 
    {
        this.f3 = f3;
    }

    public String getF3() 
    {
        return f3;
    }
    public void setF4(String f4) 
    {
        this.f4 = f4;
    }

    public String getF4() 
    {
        return f4;
    }
    public void setF5(String f5) 
    {
        this.f5 = f5;
    }

    public String getF5() 
    {
        return f5;
    }
    public void setF6(String f6) 
    {
        this.f6 = f6;
    }

    public String getF6() 
    {
        return f6;
    }
    public void setF7(String f7) 
    {
        this.f7 = f7;
    }

    public String getF7() 
    {
        return f7;
    }
    public void setF8(String f8) 
    {
        this.f8 = f8;
    }

    public String getF8() 
    {
        return f8;
    }
    public void setF9(String f9) 
    {
        this.f9 = f9;
    }

    public String getF9() 
    {
        return f9;
    }
    public void setF10(String f10) 
    {
        this.f10 = f10;
    }

    public String getF10() 
    {
        return f10;
    }
    public void setF11(String f11) 
    {
        this.f11 = f11;
    }

    public String getF11() 
    {
        return f11;
    }
    public void setF12(String f12) 
    {
        this.f12 = f12;
    }

    public String getF12() 
    {
        return f12;
    }
    public void setF13(String f13) 
    {
        this.f13 = f13;
    }

    public String getF13() 
    {
        return f13;
    }
    public void setF14(String f14) 
    {
        this.f14 = f14;
    }

    public String getF14() 
    {
        return f14;
    }
    public void setF15(String f15) 
    {
        this.f15 = f15;
    }

    public String getF15() 
    {
        return f15;
    }
    public void setF16(String f16) 
    {
        this.f16 = f16;
    }

    public String getF16() 
    {
        return f16;
    }
    public void setF17(String f17) 
    {
        this.f17 = f17;
    }

    public String getF17() 
    {
        return f17;
    }
    public void setF18(String f18) 
    {
        this.f18 = f18;
    }

    public String getF18() 
    {
        return f18;
    }
    public void setF19(String f19) 
    {
        this.f19 = f19;
    }

    public String getF19() 
    {
        return f19;
    }
    public void setF20(String f20) 
    {
        this.f20 = f20;
    }

    public String getF20() 
    {
        return f20;
    }
    public void setF21(String f21) 
    {
        this.f21 = f21;
    }

    public String getF21() 
    {
        return f21;
    }
    public void setF22(String f22) 
    {
        this.f22 = f22;
    }

    public String getF22() 
    {
        return f22;
    }
    public void setF23(String f23) 
    {
        this.f23 = f23;
    }

    public String getF23() 
    {
        return f23;
    }
    public void setF24(String f24) 
    {
        this.f24 = f24;
    }

    public String getF24() 
    {
        return f24;
    }
    public void setF25(String f25) 
    {
        this.f25 = f25;
    }

    public String getF25() 
    {
        return f25;
    }
    public void setF26(String f26) 
    {
        this.f26 = f26;
    }

    public String getF26() 
    {
        return f26;
    }
    public void setF27(String f27) 
    {
        this.f27 = f27;
    }

    public String getF27() 
    {
        return f27;
    }
    public void setF28(String f28) 
    {
        this.f28 = f28;
    }

    public String getF28() 
    {
        return f28;
    }
    public void setF29(String f29) 
    {
        this.f29 = f29;
    }

    public String getF29() 
    {
        return f29;
    }
    public void setF30(String f30) 
    {
        this.f30 = f30;
    }

    public String getF30() 
    {
        return f30;
    }
    public void setF31(String f31) 
    {
        this.f31 = f31;
    }

    public String getF31() 
    {
        return f31;
    }
    public void setF32(String f32) 
    {
        this.f32 = f32;
    }

    public String getF32() 
    {
        return f32;
    }
    public void setF33(String f33) 
    {
        this.f33 = f33;
    }

    public String getF33() 
    {
        return f33;
    }
    public void setF34(String f34) 
    {
        this.f34 = f34;
    }

    public String getF34() 
    {
        return f34;
    }
    public void setF35(String f35) 
    {
        this.f35 = f35;
    }

    public String getF35() 
    {
        return f35;
    }
    public void setF36(String f36) 
    {
        this.f36 = f36;
    }

    public String getF36() 
    {
        return f36;
    }
    public void setF37(String f37) 
    {
        this.f37 = f37;
    }

    public String getF37() 
    {
        return f37;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ordId", getOrdId())
            .append("f1", getF1())
            .append("f2", getF2())
            .append("f3", getF3())
            .append("f4", getF4())
            .append("f5", getF5())
            .append("f6", getF6())
            .append("f7", getF7())
            .append("f8", getF8())
            .append("f9", getF9())
            .append("f10", getF10())
            .append("f11", getF11())
            .append("f12", getF12())
            .append("f13", getF13())
            .append("f14", getF14())
            .append("f15", getF15())
            .append("f16", getF16())
            .append("f17", getF17())
            .append("f18", getF18())
            .append("f19", getF19())
            .append("f20", getF20())
            .append("f21", getF21())
            .append("f22", getF22())
            .append("f23", getF23())
            .append("f24", getF24())
            .append("f25", getF25())
            .append("f26", getF26())
            .append("f27", getF27())
            .append("f28", getF28())
            .append("f29", getF29())
            .append("f30", getF30())
            .append("f31", getF31())
            .append("f32", getF32())
            .append("f33", getF33())
            .append("f34", getF34())
            .append("f35", getF35())
            .append("f36", getF36())
            .append("f37", getF37())
            .toString();
    }
}
