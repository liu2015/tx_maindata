<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单id" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="sap客户编码" prop="customerCode">
        <el-input
          v-model="queryParams.customerCode"
          placeholder="请输入sap客户编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="sap客户名称" prop="customeName">
        <el-input
          v-model="queryParams.customeName"
          placeholder="请输入sap客户名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="营业执照名称" prop="business">
        <el-input
          v-model="queryParams.business"
          placeholder="请输入营业执照名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="sap简称" prop="sapAbb">
        <el-input
          v-model="queryParams.sapAbb"
          placeholder="请输入sap简称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="国家" prop="statE">
        <el-input
          v-model="queryParams.statE"
          placeholder="请输入国家"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="省份" prop="province">
        <el-input
          v-model="queryParams.province"
          placeholder="请输入省份"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="城市县" prop="county">
        <el-input
          v-model="queryParams.county"
          placeholder="请输入城市县"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
    
   
      <el-form-item label=" 门店状态1" prop="storEtype">
        <el-select v-model="queryParams.storEtype" placeholder="请选择 门店状态1" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label=" 特许商id" prop="speCialid">
        <el-input
          v-model="queryParams.speCialid"
          placeholder="请输入 特许商id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:sys_master_tx_data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:sys_master_tx_data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:sys_master_tx_data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:sys_master_tx_data:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sys_master_tx_dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="sap客户编码" align="center" prop="customerCode" />
      <el-table-column label="sap客户名称" align="center" prop="customeName" />
      <el-table-column label="营业执照名称" align="center" prop="business" />
      <el-table-column label="sap简称" align="center" prop="sapAbb" />
      <el-table-column label="国家" align="center" prop="statE" />
      <el-table-column label="省份" align="center" prop="province" />
      <el-table-column label="城市县" align="center" prop="county" />
      <el-table-column label="合同签订地址" align="center" prop="address" />
      <el-table-column label="门店联系人" align="center" prop="storeContact" />
      <el-table-column label=" 门店联系人电话" align="center" prop="storeContelephone" />
      <el-table-column label=" 语言" align="center" prop="lanGuae" />
      <el-table-column label=" 客户分类" align="center" prop="clientClassify" />
      <el-table-column label=" 属性6" align="center" prop="av6" />
      <el-table-column label="开店时间" align="center" prop="openShop" />
      <el-table-column label=" 建设店时间" align="center" prop="setshop" />
      <el-table-column label=" 营业面积展示宽度" align="center" prop="doBusiress" />
      <el-table-column label=" 月租金" align="center" prop="montHrent" />
      <el-table-column label=" 经度" align="center" prop="longItude" />
      <el-table-column label=" 纬度" align="center" prop="latiFude" />
      <el-table-column label="合同租期" align="center" prop="contrActtenany" />
      <el-table-column label=" 租金付款" align="center" prop="rentAdvice" />
      <el-table-column label=" 租金扣点" align="center" prop="rentOne" />
      <el-table-column label="租金扣点1" align="center" prop="pints1" />
      <el-table-column label=" 保证金" align="center" prop="deposit" />
      <el-table-column label="转让费" align="center" prop=" conveYancefee" />
      <el-table-column label="预估月销售" align="center" prop="preDict" />
      <el-table-column label=" 预估月销售占比" align="center" prop="preDictpr" />
      <el-table-column label=" 投资回收周期" align="center" prop="pbp" />
      <el-table-column label="开发人员" align="center" prop="dereName" />
      <el-table-column label=" 预估进店率" align="center" prop="predIctstore" />
      <el-table-column label="预估保本销售额" align="center" prop="predIctsales" />
      <el-table-column label=" 预估平均客流量" align="center" prop="predIctflow" />
      <el-table-column label="合同地址1" align="center" prop="addConfract" />
      <el-table-column label="门店类型" align="center" prop="shopClass" />
      <el-table-column label="税收5" align="center" prop="tax5" />
      <el-table-column label="银行代码" align="center" prop="brnkCode" />
      <el-table-column label="银行国家" align="center" prop=" bankNatio" />
      <el-table-column label="银行账户号码" align="center" prop="bankaCcount" />
      <el-table-column label="账户持有人姓名" align="center" prop="baokName" />
      <el-table-column label=" 公司代码" align="center" prop="offCode" />
      <el-table-column label=" 总账中的统驭科目" align="center" prop="numBer" />
      <el-table-column label=" 排序码" align="center" prop="numBersort" />
      <el-table-column label="付款方式" align="center" prop="typePaymnt" />
      <el-table-column label=" 备注" align="center" prop="remarks" />
      <el-table-column label="销售组织必填" align="center" prop="marKeting" />
      <el-table-column label="分销渠道" align="center" prop="retAil" />
      <el-table-column label=" 产品组" align="center" prop="divSion" />
      <el-table-column label=" 销售大区" align="center" prop="salesRegion" />
      <el-table-column label="销售部门" align="center" prop="salesDepart" />
      <el-table-column label=" 销售组" align="center" prop="salesGroup" />
      <el-table-column label="客户组" align="center" prop="custGroup" />
      <el-table-column label=" 货币" align="center" prop="moneY" />
      <el-table-column label=" 价格组" align="center" prop="pricetAriff" />
      <el-table-column label=" 定价过程分配到客户" align="center" prop="pricingProcedure" />
      <el-table-column label=" 装运条件" align="center" prop="operatIng" />
      <el-table-column label=" 交货工厂" align="center" prop="deliverypLant" />
      <el-table-column label=" 订单组和标识" align="center" prop="orididide" />
      <el-table-column label=" 国际贸易条款" align="center" prop="trade1" />
      <el-table-column label=" 国际贸易条款2" align="center" prop="trade2" />
      <el-table-column label="付款条件码" align="center" prop="paycode" />
      <el-table-column label=" 客户组账户分配1" align="center" prop="custGroupaccount" />
      <el-table-column label="客户税1" align="center" prop="custtax" />
      <el-table-column label=" 运输区域" align="center" prop="rtd" />
      <el-table-column label=" 区域经理" align="center" prop="regionManager" />
      <el-table-column label=" 营运主管" align="center" prop="servicel" />
      <el-table-column label="统一社会信用代码" align="center" prop="codesocill" />
      <el-table-column label=" 纳税人识别号" align="center" prop="taxcode" />
      <el-table-column label=" 食品经营许可证" align="center" prop="foodLicense" />
      <el-table-column label=" 餐饮许可证" align="center" prop="foodLicensel" />
      <el-table-column label=" 食品经营许可证有效期" align="center" prop="foodLicensetime" />
      <el-table-column label="食品许可证有效期开始" align="center" prop="foodLicensetimeto" />
      <el-table-column label="食品许可或者能有效期至" align="center" prop="foodLicensetimeon" />
      <el-table-column label=" pos公司代码" align="center" prop="posCode" />
      <el-table-column label=" 门店状态1" align="center" prop="storEtype" />
      <el-table-column label=" 特许商id" align="center" prop="speCialid" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:sys_master_tx_data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:sys_master_tx_data:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改sd主数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单id" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单id" />
        </el-form-item>
        <el-form-item label="sap客户编码" prop="customerCode">
          <el-input v-model="form.customerCode" placeholder="请输入sap客户编码" />
        </el-form-item>
        <el-form-item label="sap客户名称" prop="customeName">
          <el-input v-model="form.customeName" placeholder="请输入sap客户名称" />
        </el-form-item>
        <el-form-item label="营业执照名称" prop="business">
          <el-input v-model="form.business" placeholder="请输入营业执照名称" />
        </el-form-item>
        <el-form-item label="sap简称" prop="sapAbb">
          <el-input v-model="form.sapAbb" placeholder="请输入sap简称" />
        </el-form-item>
        <el-form-item label="国家" prop="statE">
          <el-input v-model="form.statE" placeholder="请输入国家" />
        </el-form-item>
        <el-form-item label="省份" prop="province">
          <el-input v-model="form.province" placeholder="请输入省份" />
        </el-form-item>
        <el-form-item label="城市县" prop="county">
          <el-input v-model="form.county" placeholder="请输入城市县" />
        </el-form-item>
        <el-form-item label="合同签订地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入合同签订地址" />
        </el-form-item>
        <el-form-item label="门店联系人" prop="storeContact">
          <el-input v-model="form.storeContact" placeholder="请输入门店联系人" />
        </el-form-item>
        <el-form-item label=" 门店联系人电话" prop="storeContelephone">
          <el-input v-model="form.storeContelephone" placeholder="请输入 门店联系人电话" />
        </el-form-item>
        <el-form-item label=" 语言" prop="lanGuae">
          <el-input v-model="form.lanGuae" placeholder="请输入 语言" />
        </el-form-item>
        <el-form-item label=" 客户分类" prop="clientClassify">
          <el-input v-model="form.clientClassify" placeholder="请输入 客户分类" />
        </el-form-item>
        <el-form-item label=" 属性6" prop="av6">
          <el-input v-model="form.av6" placeholder="请输入 属性6" />
        </el-form-item>
        <el-form-item label="开店时间" prop="openShop">
          <el-input v-model="form.openShop" placeholder="请输入开店时间" />
        </el-form-item>
        <el-form-item label=" 建设店时间" prop="setshop">
          <el-input v-model="form.setshop" placeholder="请输入 建设店时间" />
        </el-form-item>
        <el-form-item label=" 营业面积展示宽度" prop="doBusiress">
          <el-input v-model="form.doBusiress" placeholder="请输入 营业面积展示宽度" />
        </el-form-item>
        <el-form-item label=" 月租金" prop="montHrent">
          <el-input v-model="form.montHrent" placeholder="请输入 月租金" />
        </el-form-item>
        <el-form-item label=" 经度" prop="longItude">
          <el-input v-model="form.longItude" placeholder="请输入 经度" />
        </el-form-item>
        <el-form-item label=" 纬度" prop="latiFude">
          <el-input v-model="form.latiFude" placeholder="请输入 纬度" />
        </el-form-item>
        <el-form-item label="合同租期" prop="contrActtenany">
          <el-input v-model="form.contrActtenany" placeholder="请输入合同租期" />
        </el-form-item>
        <el-form-item label=" 租金付款" prop="rentAdvice">
          <el-input v-model="form.rentAdvice" placeholder="请输入 租金付款" />
        </el-form-item>
        <el-form-item label=" 租金扣点" prop="rentOne">
          <el-input v-model="form.rentOne" placeholder="请输入 租金扣点" />
        </el-form-item>
        <el-form-item label="租金扣点1" prop="pints1">
          <el-input v-model="form.pints1" placeholder="请输入租金扣点1" />
        </el-form-item>
        <el-form-item label=" 保证金" prop="deposit">
          <el-input v-model="form.deposit" placeholder="请输入 保证金" />
        </el-form-item>
        <el-form-item label="转让费" prop=" conveYancefee">
          <el-input v-model="form. conveYancefee" placeholder="请输入转让费" />
        </el-form-item>
        <el-form-item label="预估月销售" prop="preDict">
          <el-input v-model="form.preDict" placeholder="请输入预估月销售" />
        </el-form-item>
        <el-form-item label=" 预估月销售占比" prop="preDictpr">
          <el-input v-model="form.preDictpr" placeholder="请输入 预估月销售占比" />
        </el-form-item>
        <el-form-item label=" 投资回收周期" prop="pbp">
          <el-input v-model="form.pbp" placeholder="请输入 投资回收周期" />
        </el-form-item>
        <el-form-item label="开发人员" prop="dereName">
          <el-input v-model="form.dereName" placeholder="请输入开发人员" />
        </el-form-item>
        <el-form-item label=" 预估进店率" prop="predIctstore">
          <el-input v-model="form.predIctstore" placeholder="请输入 预估进店率" />
        </el-form-item>
        <el-form-item label="预估保本销售额" prop="predIctsales">
          <el-input v-model="form.predIctsales" placeholder="请输入预估保本销售额" />
        </el-form-item>
        <el-form-item label=" 预估平均客流量" prop="predIctflow">
          <el-input v-model="form.predIctflow" placeholder="请输入 预估平均客流量" />
        </el-form-item>
        <el-form-item label="合同地址1" prop="addConfract">
          <el-input v-model="form.addConfract" placeholder="请输入合同地址1" />
        </el-form-item>
        <el-form-item label="门店类型" prop="shopClass">
          <el-input v-model="form.shopClass" placeholder="请输入门店类型" />
        </el-form-item>
        <el-form-item label="税收5" prop="tax5">
          <el-input v-model="form.tax5" placeholder="请输入税收5" />
        </el-form-item>
        <el-form-item label="银行代码" prop="brnkCode">
          <el-input v-model="form.brnkCode" placeholder="请输入银行代码" />
        </el-form-item>
        <el-form-item label="银行国家" prop=" bankNatio">
          <el-input v-model="form. bankNatio" placeholder="请输入银行国家" />
        </el-form-item>
        <el-form-item label="银行账户号码" prop="bankaCcount">
          <el-input v-model="form.bankaCcount" placeholder="请输入银行账户号码" />
        </el-form-item>
        <el-form-item label="账户持有人姓名" prop="baokName">
          <el-input v-model="form.baokName" placeholder="请输入账户持有人姓名" />
        </el-form-item>
        <el-form-item label=" 公司代码" prop="offCode">
          <el-input v-model="form.offCode" placeholder="请输入 公司代码" />
        </el-form-item>
        <el-form-item label=" 总账中的统驭科目" prop="numBer">
          <el-input v-model="form.numBer" placeholder="请输入 总账中的统驭科目" />
        </el-form-item>
        <el-form-item label=" 排序码" prop="numBersort">
          <el-input v-model="form.numBersort" placeholder="请输入 排序码" />
        </el-form-item>
        <el-form-item label="付款方式" prop="typePaymnt">
          <el-input v-model="form.typePaymnt" placeholder="请输入付款方式" />
        </el-form-item>
        <el-form-item label=" 备注" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入 备注" />
        </el-form-item>
        <el-form-item label="销售组织必填" prop="marKeting">
          <el-input v-model="form.marKeting" placeholder="请输入销售组织必填" />
        </el-form-item>
        <el-form-item label="分销渠道" prop="retAil">
          <el-input v-model="form.retAil" placeholder="请输入分销渠道" />
        </el-form-item>
        <el-form-item label=" 产品组" prop="divSion">
          <el-input v-model="form.divSion" placeholder="请输入 产品组" />
        </el-form-item>
        <el-form-item label=" 销售大区" prop="salesRegion">
          <el-input v-model="form.salesRegion" placeholder="请输入 销售大区" />
        </el-form-item>
        <el-form-item label="销售部门" prop="salesDepart">
          <el-input v-model="form.salesDepart" placeholder="请输入销售部门" />
        </el-form-item>
        <el-form-item label=" 销售组" prop="salesGroup">
          <el-input v-model="form.salesGroup" placeholder="请输入 销售组" />
        </el-form-item>
        <el-form-item label="客户组" prop="custGroup">
          <el-input v-model="form.custGroup" placeholder="请输入客户组" />
        </el-form-item>
        <el-form-item label=" 货币" prop="moneY">
          <el-input v-model="form.moneY" placeholder="请输入 货币" />
        </el-form-item>
        <el-form-item label=" 价格组" prop="pricetAriff">
          <el-input v-model="form.pricetAriff" placeholder="请输入 价格组" />
        </el-form-item>
        <el-form-item label=" 定价过程分配到客户" prop="pricingProcedure">
          <el-input v-model="form.pricingProcedure" placeholder="请输入 定价过程分配到客户" />
        </el-form-item>
        <el-form-item label=" 装运条件" prop="operatIng">
          <el-input v-model="form.operatIng" placeholder="请输入 装运条件" />
        </el-form-item>
        <el-form-item label=" 交货工厂" prop="deliverypLant">
          <el-input v-model="form.deliverypLant" placeholder="请输入 交货工厂" />
        </el-form-item>
        <el-form-item label=" 订单组和标识" prop="orididide">
          <el-input v-model="form.orididide" placeholder="请输入 订单组和标识" />
        </el-form-item>
        <el-form-item label=" 国际贸易条款" prop="trade1">
          <el-input v-model="form.trade1" placeholder="请输入 国际贸易条款" />
        </el-form-item>
        <el-form-item label=" 国际贸易条款2" prop="trade2">
          <el-input v-model="form.trade2" placeholder="请输入 国际贸易条款2" />
        </el-form-item>
        <el-form-item label="付款条件码" prop="paycode">
          <el-input v-model="form.paycode" placeholder="请输入付款条件码" />
        </el-form-item>
        <el-form-item label=" 客户组账户分配1" prop="custGroupaccount">
          <el-input v-model="form.custGroupaccount" placeholder="请输入 客户组账户分配1" />
        </el-form-item>
        <el-form-item label="客户税1" prop="custtax">
          <el-input v-model="form.custtax" placeholder="请输入客户税1" />
        </el-form-item>
        <el-form-item label=" 运输区域" prop="rtd">
          <el-input v-model="form.rtd" placeholder="请输入 运输区域" />
        </el-form-item>
        <el-form-item label=" 区域经理" prop="regionManager">
          <el-input v-model="form.regionManager" placeholder="请输入 区域经理" />
        </el-form-item>
        <el-form-item label=" 营运主管" prop="servicel">
          <el-input v-model="form.servicel" placeholder="请输入 营运主管" />
        </el-form-item>
        <el-form-item label="统一社会信用代码" prop="codesocill">
          <el-input v-model="form.codesocill" placeholder="请输入统一社会信用代码" />
        </el-form-item>
        <el-form-item label=" 纳税人识别号" prop="taxcode">
          <el-input v-model="form.taxcode" placeholder="请输入 纳税人识别号" />
        </el-form-item>
        <el-form-item label=" 食品经营许可证" prop="foodLicense">
          <el-input v-model="form.foodLicense" placeholder="请输入 食品经营许可证" />
        </el-form-item>
        <el-form-item label=" 餐饮许可证" prop="foodLicensel">
          <el-input v-model="form.foodLicensel" placeholder="请输入 餐饮许可证" />
        </el-form-item>
        <el-form-item label=" 食品经营许可证有效期" prop="foodLicensetime">
          <el-input v-model="form.foodLicensetime" placeholder="请输入 食品经营许可证有效期" />
        </el-form-item>
        <el-form-item label="食品许可证有效期开始" prop="foodLicensetimeto">
          <el-input v-model="form.foodLicensetimeto" placeholder="请输入食品许可证有效期开始" />
        </el-form-item>
        <el-form-item label="食品许可或者能有效期至" prop="foodLicensetimeon">
          <el-input v-model="form.foodLicensetimeon" placeholder="请输入食品许可或者能有效期至" />
        </el-form-item>
        <el-form-item label=" pos公司代码" prop="posCode">
          <el-input v-model="form.posCode" placeholder="请输入 pos公司代码" />
        </el-form-item>
        <el-form-item label=" 门店状态1" prop="storEtype">
          <el-select v-model="form.storEtype" placeholder="请选择 门店状态1">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label=" 特许商id" prop="speCialid">
          <el-input v-model="form.speCialid" placeholder="请输入 特许商id" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSys_master_tx_data, getSys_master_tx_data, delSys_master_tx_data, addSys_master_tx_data, updateSys_master_tx_data, exportSys_master_tx_data } from "@/api/system/sys_master_tx_data";

export default {
  name: "Sys_master_tx_data",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // sd主数据表格数据
      sys_master_tx_dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        customerCode: null,
        customeName: null,
        business: null,
        sapAbb: null,
        statE: null,
        province: null,
        county: null,
        address: null,
        storeContact: null,
        storeContelephone: null,
        lanGuae: null,
        clientClassify: null,
        av6: null,
        openShop: null,
        setshop: null,
        doBusiress: null,
        montHrent: null,
        longItude: null,
        latiFude: null,
        contrActtenany: null,
        rentAdvice: null,
        rentOne: null,
        pints1: null,
        deposit: null,
         conveYancefee: null,
        preDict: null,
        preDictpr: null,
        pbp: null,
        dereName: null,
        predIctstore: null,
        predIctsales: null,
        predIctflow: null,
        addConfract: null,
        shopClass: null,
        tax5: null,
        brnkCode: null,
         bankNatio: null,
        bankaCcount: null,
        baokName: null,
        offCode: null,
        numBer: null,
        numBersort: null,
        typePaymnt: null,
        remarks: null,
        marKeting: null,
        retAil: null,
        divSion: null,
        salesRegion: null,
        salesDepart: null,
        salesGroup: null,
        custGroup: null,
        moneY: null,
        pricetAriff: null,
        pricingProcedure: null,
        operatIng: null,
        deliverypLant: null,
        orididide: null,
        trade1: null,
        trade2: null,
        paycode: null,
        custGroupaccount: null,
        custtax: null,
        rtd: null,
        regionManager: null,
        servicel: null,
        codesocill: null,
        taxcode: null,
        foodLicense: null,
        foodLicensel: null,
        foodLicensetime: null,
        foodLicensetimeto: null,
        foodLicensetimeon: null,
        posCode: null,
        storEtype: null,
        speCialid: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询sd主数据列表 */
    getList() {
      this.loading = true;
      listSys_master_tx_data(this.queryParams).then(response => {
        this.sys_master_tx_dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderId: null,
        customerCode: null,
        customeName: null,
        business: null,
        sapAbb: null,
        statE: null,
        province: null,
        county: null,
        address: null,
        storeContact: null,
        storeContelephone: null,
        lanGuae: null,
        clientClassify: null,
        av6: null,
        openShop: null,
        setshop: null,
        doBusiress: null,
        montHrent: null,
        longItude: null,
        latiFude: null,
        contrActtenany: null,
        rentAdvice: null,
        rentOne: null,
        pints1: null,
        deposit: null,
         conveYancefee: null,
        preDict: null,
        preDictpr: null,
        pbp: null,
        dereName: null,
        predIctstore: null,
        predIctsales: null,
        predIctflow: null,
        addConfract: null,
        shopClass: null,
        tax5: null,
        brnkCode: null,
         bankNatio: null,
        bankaCcount: null,
        baokName: null,
        offCode: null,
        numBer: null,
        numBersort: null,
        typePaymnt: null,
        remarks: null,
        marKeting: null,
        retAil: null,
        divSion: null,
        salesRegion: null,
        salesDepart: null,
        salesGroup: null,
        custGroup: null,
        moneY: null,
        pricetAriff: null,
        pricingProcedure: null,
        operatIng: null,
        deliverypLant: null,
        orididide: null,
        trade1: null,
        trade2: null,
        paycode: null,
        custGroupaccount: null,
        custtax: null,
        rtd: null,
        regionManager: null,
        servicel: null,
        codesocill: null,
        taxcode: null,
        foodLicense: null,
        foodLicensel: null,
        foodLicensetime: null,
        foodLicensetimeto: null,
        foodLicensetimeon: null,
        posCode: null,
        storEtype: null,
        speCialid: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加sd主数据";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSys_master_tx_data(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改sd主数据";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSys_master_tx_data(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSys_master_tx_data(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除sd主数据编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSys_master_tx_data(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有sd主数据数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSys_master_tx_data(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
