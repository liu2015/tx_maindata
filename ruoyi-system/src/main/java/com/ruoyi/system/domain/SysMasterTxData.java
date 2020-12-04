package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * sd主数据对象 sys_master_tx_data
 * 
 * @author liu
 * @date 2020-12-04
 */
public class SysMasterTxData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 订单id */
    @Excel(name = "订单id")
    private String orderId;

    /** sap客户编码 */
    @Excel(name = "sap客户编码")
    private String customerCode;

    /** sap客户名称 */
    @Excel(name = "sap客户名称")
    private String customeName;

    /** 营业执照名称 */
    @Excel(name = "营业执照名称")
    private String business;

    /** sap简称 */
    @Excel(name = "sap简称")
    private String sapAbb;

    /** 国家 */
    @Excel(name = "国家")
    private String statE;

    /** 省份 */
    @Excel(name = "省份")
    private String province;

    /** 城市县 */
    @Excel(name = "城市县")
    private String county;

    /** 合同签订地址 */
    @Excel(name = "合同签订地址")
    private String address;

    /** 门店联系人 */
    @Excel(name = "门店联系人")
    private String storeContact;

    /**  门店联系人电话 */
    @Excel(name = " 门店联系人电话")
    private String storeContelephone;

    /**  语言 */
    @Excel(name = " 语言")
    private String lanGuae;

    /**  客户分类 */
    @Excel(name = " 客户分类")
    private String clientClassify;

    /**  属性6 */
    @Excel(name = " 属性6")
    private String av6;

    /** 开店时间 */
    @Excel(name = "开店时间")
    private String openShop;

    /**  建设店时间 */
    @Excel(name = " 建设店时间")
    private String setshop;

    /**  营业面积展示宽度 */
    @Excel(name = " 营业面积展示宽度")
    private String doBusiress;

    /**  月租金 */
    @Excel(name = " 月租金")
    private String montHrent;

    /**  经度 */
    @Excel(name = " 经度")
    private String longItude;

    /**  纬度 */
    @Excel(name = " 纬度")
    private String latiFude;

    /** 合同租期 */
    @Excel(name = "合同租期")
    private String contrActtenany;

    /**  租金付款 */
    @Excel(name = " 租金付款")
    private String rentAdvice;

    /**  租金扣点 */
    @Excel(name = " 租金扣点")
    private String rentOne;

    /** 租金扣点1 */
    @Excel(name = "租金扣点1")
    private String pints1;

    /**  保证金 */
    @Excel(name = " 保证金")
    private String deposit;

    /** 转让费 */
    @Excel(name = "转让费")
    private String  conveYancefee;

    /** 预估月销售 */
    @Excel(name = "预估月销售")
    private String preDict;

    /**  预估月销售占比 */
    @Excel(name = " 预估月销售占比")
    private String preDictpr;

    /**  投资回收周期 */
    @Excel(name = " 投资回收周期")
    private String pbp;

    /** 开发人员 */
    @Excel(name = "开发人员")
    private String dereName;

    /**  预估进店率 */
    @Excel(name = " 预估进店率")
    private String predIctstore;

    /** 预估保本销售额 */
    @Excel(name = "预估保本销售额")
    private String predIctsales;

    /**  预估平均客流量 */
    @Excel(name = " 预估平均客流量")
    private String predIctflow;

    /** 合同地址1 */
    @Excel(name = "合同地址1")
    private String addConfract;

    /** 门店类型 */
    @Excel(name = "门店类型")
    private String shopClass;

    /** 税收5 */
    @Excel(name = "税收5")
    private String tax5;

    /** 银行代码 */
    @Excel(name = "银行代码")
    private String brnkCode;

    /** 银行国家 */
    @Excel(name = "银行国家")
    private String  bankNatio;

    /** 银行账户号码 */
    @Excel(name = "银行账户号码")
    private String bankaCcount;

    /** 账户持有人姓名 */
    @Excel(name = "账户持有人姓名")
    private String baokName;

    /**  公司代码 */
    @Excel(name = " 公司代码")
    private String offCode;

    /**  总账中的统驭科目 */
    @Excel(name = " 总账中的统驭科目")
    private String numBer;

    /**  排序码 */
    @Excel(name = " 排序码")
    private String numBersort;

    /** 付款方式 */
    @Excel(name = "付款方式")
    private String typePaymnt;

    /**  备注 */
    @Excel(name = " 备注")
    private String remarks;

    /** 销售组织必填 */
    @Excel(name = "销售组织必填")
    private String marKeting;

    /** 分销渠道 */
    @Excel(name = "分销渠道")
    private String retAil;

    /**  产品组 */
    @Excel(name = " 产品组")
    private String divSion;

    /**  销售大区 */
    @Excel(name = " 销售大区")
    private String salesRegion;

    /** 销售部门 */
    @Excel(name = "销售部门")
    private String salesDepart;

    /**  销售组 */
    @Excel(name = " 销售组")
    private String salesGroup;

    /** 客户组 */
    @Excel(name = "客户组")
    private String custGroup;

    /**  货币 */
    @Excel(name = " 货币")
    private String moneY;

    /**  价格组 */
    @Excel(name = " 价格组")
    private String pricetAriff;

    /**  定价过程分配到客户 */
    @Excel(name = " 定价过程分配到客户")
    private String pricingProcedure;

    /**  装运条件 */
    @Excel(name = " 装运条件")
    private String operatIng;

    /**  交货工厂 */
    @Excel(name = " 交货工厂")
    private String deliverypLant;

    /**  订单组和标识 */
    @Excel(name = " 订单组和标识")
    private String orididide;

    /**  国际贸易条款 */
    @Excel(name = " 国际贸易条款")
    private String trade1;

    /**  国际贸易条款2 */
    @Excel(name = " 国际贸易条款2")
    private String trade2;

    /** 付款条件码 */
    @Excel(name = "付款条件码")
    private String paycode;

    /**  客户组账户分配1 */
    @Excel(name = " 客户组账户分配1")
    private String custGroupaccount;

    /** 客户税1 */
    @Excel(name = "客户税1")
    private String custtax;

    /**  运输区域 */
    @Excel(name = " 运输区域")
    private String rtd;

    /**  区域经理 */
    @Excel(name = " 区域经理")
    private String regionManager;

    /**  营运主管 */
    @Excel(name = " 营运主管")
    private String servicel;

    /** 统一社会信用代码 */
    @Excel(name = "统一社会信用代码")
    private String codesocill;

    /**  纳税人识别号 */
    @Excel(name = " 纳税人识别号")
    private String taxcode;

    /**  食品经营许可证 */
    @Excel(name = " 食品经营许可证")
    private String foodLicense;

    /**  餐饮许可证 */
    @Excel(name = " 餐饮许可证")
    private String foodLicensel;

    /**  食品经营许可证有效期 */
    @Excel(name = " 食品经营许可证有效期")
    private String foodLicensetime;

    /** 食品许可证有效期开始 */
    @Excel(name = "食品许可证有效期开始")
    private String foodLicensetimeto;

    /** 食品许可或者能有效期至 */
    @Excel(name = "食品许可或者能有效期至")
    private String foodLicensetimeon;

    /**  pos公司代码 */
    @Excel(name = " pos公司代码")
    private String posCode;

    /**  门店状态1 */
    @Excel(name = " 门店状态1")
    private String storEtype;

    /**  特许商id */
    @Excel(name = " 特许商id")
    private String speCialid;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomeName() {
        return customeName;
    }

    public void setCustomeName(String customeName) {
        this.customeName = customeName;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getSapAbb() {
        return sapAbb;
    }

    public void setSapAbb(String sapAbb) {
        this.sapAbb = sapAbb;
    }

    public String getStatE() {
        return statE;
    }

    public void setStatE(String statE) {
        this.statE = statE;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStoreContact() {
        return storeContact;
    }

    public void setStoreContact(String storeContact) {
        this.storeContact = storeContact;
    }

    public String getStoreContelephone() {
        return storeContelephone;
    }

    public void setStoreContelephone(String storeContelephone) {
        this.storeContelephone = storeContelephone;
    }

    public String getLanGuae() {
        return lanGuae;
    }

    public void setLanGuae(String lanGuae) {
        this.lanGuae = lanGuae;
    }

    public String getClientClassify() {
        return clientClassify;
    }

    public void setClientClassify(String clientClassify) {
        this.clientClassify = clientClassify;
    }

    public String getAv6() {
        return av6;
    }

    public void setAv6(String av6) {
        this.av6 = av6;
    }

    public String getOpenShop() {
        return openShop;
    }

    public void setOpenShop(String openShop) {
        this.openShop = openShop;
    }

    public String getSetshop() {
        return setshop;
    }

    public void setSetshop(String setshop) {
        this.setshop = setshop;
    }

    public String getDoBusiress() {
        return doBusiress;
    }

    public void setDoBusiress(String doBusiress) {
        this.doBusiress = doBusiress;
    }

    public String getMontHrent() {
        return montHrent;
    }

    public void setMontHrent(String montHrent) {
        this.montHrent = montHrent;
    }

    public String getLongItude() {
        return longItude;
    }

    public void setLongItude(String longItude) {
        this.longItude = longItude;
    }

    public String getLatiFude() {
        return latiFude;
    }

    public void setLatiFude(String latiFude) {
        this.latiFude = latiFude;
    }

    public String getContrActtenany() {
        return contrActtenany;
    }

    public void setContrActtenany(String contrActtenany) {
        this.contrActtenany = contrActtenany;
    }

    public String getRentAdvice() {
        return rentAdvice;
    }

    public void setRentAdvice(String rentAdvice) {
        this.rentAdvice = rentAdvice;
    }

    public String getRentOne() {
        return rentOne;
    }

    public void setRentOne(String rentOne) {
        this.rentOne = rentOne;
    }

    public String getPints1() {
        return pints1;
    }

    public void setPints1(String pints1) {
        this.pints1 = pints1;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getConveYancefee() {
        return conveYancefee;
    }

    public void setConveYancefee(String conveYancefee) {
        this.conveYancefee = conveYancefee;
    }

    public String getPreDict() {
        return preDict;
    }

    public void setPreDict(String preDict) {
        this.preDict = preDict;
    }

    public String getPreDictpr() {
        return preDictpr;
    }

    public void setPreDictpr(String preDictpr) {
        this.preDictpr = preDictpr;
    }

    public String getPbp() {
        return pbp;
    }

    public void setPbp(String pbp) {
        this.pbp = pbp;
    }

    public String getDereName() {
        return dereName;
    }

    public void setDereName(String dereName) {
        this.dereName = dereName;
    }

    public String getPredIctstore() {
        return predIctstore;
    }

    public void setPredIctstore(String predIctstore) {
        this.predIctstore = predIctstore;
    }

    public String getPredIctsales() {
        return predIctsales;
    }

    public void setPredIctsales(String predIctsales) {
        this.predIctsales = predIctsales;
    }

    public String getPredIctflow() {
        return predIctflow;
    }

    public void setPredIctflow(String predIctflow) {
        this.predIctflow = predIctflow;
    }

    public String getAddConfract() {
        return addConfract;
    }

    public void setAddConfract(String addConfract) {
        this.addConfract = addConfract;
    }

    public String getShopClass() {
        return shopClass;
    }

    public void setShopClass(String shopClass) {
        this.shopClass = shopClass;
    }

    public String getTax5() {
        return tax5;
    }

    public void setTax5(String tax5) {
        this.tax5 = tax5;
    }

    public String getBrnkCode() {
        return brnkCode;
    }

    public void setBrnkCode(String brnkCode) {
        this.brnkCode = brnkCode;
    }

    public String getBankNatio() {
        return bankNatio;
    }

    public void setBankNatio(String bankNatio) {
        this.bankNatio = bankNatio;
    }

    public String getBankaCcount() {
        return bankaCcount;
    }

    public void setBankaCcount(String bankaCcount) {
        this.bankaCcount = bankaCcount;
    }

    public String getBaokName() {
        return baokName;
    }

    public void setBaokName(String baokName) {
        this.baokName = baokName;
    }

    public String getOffCode() {
        return offCode;
    }

    public void setOffCode(String offCode) {
        this.offCode = offCode;
    }

    public String getNumBer() {
        return numBer;
    }

    public void setNumBer(String numBer) {
        this.numBer = numBer;
    }

    public String getNumBersort() {
        return numBersort;
    }

    public void setNumBersort(String numBersort) {
        this.numBersort = numBersort;
    }

    public String getTypePaymnt() {
        return typePaymnt;
    }

    public void setTypePaymnt(String typePaymnt) {
        this.typePaymnt = typePaymnt;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getMarKeting() {
        return marKeting;
    }

    public void setMarKeting(String marKeting) {
        this.marKeting = marKeting;
    }

    public String getRetAil() {
        return retAil;
    }

    public void setRetAil(String retAil) {
        this.retAil = retAil;
    }

    public String getDivSion() {
        return divSion;
    }

    public void setDivSion(String divSion) {
        this.divSion = divSion;
    }

    public String getSalesRegion() {
        return salesRegion;
    }

    public void setSalesRegion(String salesRegion) {
        this.salesRegion = salesRegion;
    }

    public String getSalesDepart() {
        return salesDepart;
    }

    public void setSalesDepart(String salesDepart) {
        this.salesDepart = salesDepart;
    }

    public String getSalesGroup() {
        return salesGroup;
    }

    public void setSalesGroup(String salesGroup) {
        this.salesGroup = salesGroup;
    }

    public String getCustGroup() {
        return custGroup;
    }

    public void setCustGroup(String custGroup) {
        this.custGroup = custGroup;
    }

    public String getMoneY() {
        return moneY;
    }

    public void setMoneY(String moneY) {
        this.moneY = moneY;
    }

    public String getPricetAriff() {
        return pricetAriff;
    }

    public void setPricetAriff(String pricetAriff) {
        this.pricetAriff = pricetAriff;
    }

    public String getPricingProcedure() {
        return pricingProcedure;
    }

    public void setPricingProcedure(String pricingProcedure) {
        this.pricingProcedure = pricingProcedure;
    }

    public String getOperatIng() {
        return operatIng;
    }

    public void setOperatIng(String operatIng) {
        this.operatIng = operatIng;
    }

    public String getDeliverypLant() {
        return deliverypLant;
    }

    public void setDeliverypLant(String deliverypLant) {
        this.deliverypLant = deliverypLant;
    }

    public String getOrididide() {
        return orididide;
    }

    public void setOrididide(String orididide) {
        this.orididide = orididide;
    }

    public String getTrade1() {
        return trade1;
    }

    public void setTrade1(String trade1) {
        this.trade1 = trade1;
    }

    public String getTrade2() {
        return trade2;
    }

    public void setTrade2(String trade2) {
        this.trade2 = trade2;
    }

    public String getPaycode() {
        return paycode;
    }

    public void setPaycode(String paycode) {
        this.paycode = paycode;
    }

    public String getCustGroupaccount() {
        return custGroupaccount;
    }

    public void setCustGroupaccount(String custGroupaccount) {
        this.custGroupaccount = custGroupaccount;
    }

    public String getCusttax() {
        return custtax;
    }

    public void setCusttax(String custtax) {
        this.custtax = custtax;
    }

    public String getRtd() {
        return rtd;
    }

    public void setRtd(String rtd) {
        this.rtd = rtd;
    }

    public String getRegionManager() {
        return regionManager;
    }

    public void setRegionManager(String regionManager) {
        this.regionManager = regionManager;
    }

    public String getServicel() {
        return servicel;
    }

    public void setServicel(String servicel) {
        this.servicel = servicel;
    }

    public String getCodesocill() {
        return codesocill;
    }

    public void setCodesocill(String codesocill) {
        this.codesocill = codesocill;
    }

    public String getTaxcode() {
        return taxcode;
    }

    public void setTaxcode(String taxcode) {
        this.taxcode = taxcode;
    }

    public String getFoodLicense() {
        return foodLicense;
    }

    public void setFoodLicense(String foodLicense) {
        this.foodLicense = foodLicense;
    }

    public String getFoodLicensel() {
        return foodLicensel;
    }

    public void setFoodLicensel(String foodLicensel) {
        this.foodLicensel = foodLicensel;
    }

    public String getFoodLicensetime() {
        return foodLicensetime;
    }

    public void setFoodLicensetime(String foodLicensetime) {
        this.foodLicensetime = foodLicensetime;
    }

    public String getFoodLicensetimeto() {
        return foodLicensetimeto;
    }

    public void setFoodLicensetimeto(String foodLicensetimeto) {
        this.foodLicensetimeto = foodLicensetimeto;
    }

    public String getFoodLicensetimeon() {
        return foodLicensetimeon;
    }

    public void setFoodLicensetimeon(String foodLicensetimeon) {
        this.foodLicensetimeon = foodLicensetimeon;
    }

    public String getPosCode() {
        return posCode;
    }

    public void setPosCode(String posCode) {
        this.posCode = posCode;
    }

    public String getStorEtype() {
        return storEtype;
    }

    public void setStorEtype(String storEtype) {
        this.storEtype = storEtype;
    }

    public String getSpeCialid() {
        return speCialid;
    }

    public void setSpeCialid(String speCialid) {
        this.speCialid = speCialid;
    }


    public String String(){

        return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
    }

}
