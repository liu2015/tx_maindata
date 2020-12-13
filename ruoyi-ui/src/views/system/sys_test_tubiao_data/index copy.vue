<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="单据号" prop="ordId">
        <el-input
          v-model="queryParams.ordId"
          placeholder="请输入单据号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="流水号" prop="f1">
        <el-input
          v-model="queryParams.f1"
          placeholder="请输入流水号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收款机号" prop="f2">
        <el-input
          v-model="queryParams.f2"
          placeholder="请输入收款机号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收款员编码" prop="f3">
        <el-input
          v-model="queryParams.f3"
          placeholder="请输入收款员编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务类型" prop="f4">
        <el-input
          v-model="queryParams.f4"
          placeholder="请输入业务类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="购物类型" prop="f5">
        <el-input
          v-model="queryParams.f5"
          placeholder="请输入购物类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会员卡号" prop="f6">
        <el-input
          v-model="queryParams.f6"
          placeholder="请输入会员卡号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="销售时间" prop="f7">
        <el-input
          v-model="queryParams.f7"
          placeholder="请输入销售时间"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="营业日期" prop="f8">
        <el-input
          v-model="queryParams.f8"
          placeholder="请输入营业日期"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="记账日期" prop="f9">
        <el-input
          v-model="queryParams.f9"
          placeholder="请输入记账日期"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付标记" prop="f10">
        <el-input
          v-model="queryParams.f10"
          placeholder="请输入支付标记"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="交付标记" prop="f11">
        <el-input
          v-model="queryParams.f11"
          placeholder="请输入交付标记"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单据状态" prop="f12">
        <el-input
          v-model="queryParams.f12"
          placeholder="请输入单据状态"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户类型" prop="f13">
        <el-input
          v-model="queryParams.f13"
          placeholder="请输入客户类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户类型名称" prop="f14">
        <el-input
          v-model="queryParams.f14"
          placeholder="请输入客户类型名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="付款单号" prop="f15">
        <el-input
          v-model="queryParams.f15"
          placeholder="请输入付款单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="来源单据号" prop="f16">
        <el-input
          v-model="queryParams.f16"
          placeholder="请输入来源单据号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="来源业务类型" prop="f17">
        <el-input
          v-model="queryParams.f17"
          placeholder="请输入来源业务类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应收金额" prop="f18">
        <el-input
          v-model="queryParams.f18"
          placeholder="请输入应收金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠金额" prop="f19">
        <el-input
          v-model="queryParams.f19"
          placeholder="请输入优惠金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="实收金额" prop="f20">
        <el-input
          v-model="queryParams.f20"
          placeholder="请输入实收金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="支付金额" prop="f21">
        <el-input
          v-model="queryParams.f21"
          placeholder="请输入支付金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="找零金额" prop="f22">
        <el-input
          v-model="queryParams.f22"
          placeholder="请输入找零金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="舍入金额" prop="f23">
        <el-input
          v-model="queryParams.f23"
          placeholder="请输入舍入金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="明细件数" prop="f24">
        <el-input
          v-model="queryParams.f24"
          placeholder="请输入明细件数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="明细条数" prop="f25">
        <el-input
          v-model="queryParams.f25"
          placeholder="请输入明细条数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="原流水号" prop="f26">
        <el-input
          v-model="queryParams.f26"
          placeholder="请输入原流水号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="款项确认单据号" prop="f27">
        <el-input
          v-model="queryParams.f27"
          placeholder="请输入款项确认单据号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否打印发票" prop="f28">
        <el-input
          v-model="queryParams.f28"
          placeholder="请输入是否打印发票"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发票打印次数" prop="f29">
        <el-input
          v-model="queryParams.f29"
          placeholder="请输入发票打印次数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出货仓库编码打印次数" prop="f30">
        <el-input
          v-model="queryParams.f30"
          placeholder="请输入出货仓库编码打印次数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班次号" prop="f31">
        <el-input
          v-model="queryParams.f31"
          placeholder="请输入班次号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="外卖类型" prop="f32">
        <el-input
          v-model="queryParams.f32"
          placeholder="请输入外卖类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="台结流水" prop="f33">
        <el-input
          v-model="queryParams.f33"
          placeholder="请输入台结流水"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备注" prop="f34">
        <el-input
          v-model="queryParams.f34"
          placeholder="请输入备注"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单类型" prop="f35">
        <el-input
          v-model="queryParams.f35"
          placeholder="请输入订单类型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电子发票码" prop="f36">
        <el-input
          v-model="queryParams.f36"
          placeholder="请输入电子发票码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会员手机号" prop="f37">
        <el-input
          v-model="queryParams.f37"
          placeholder="请输入会员手机号"
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
          v-hasPermi="['system:sys_test_tubiao_data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:sys_test_tubiao_data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:sys_test_tubiao_data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:sys_test_tubiao_data:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sys_test_tubiao_dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="单据号" align="center" prop="ordId" />
      <el-table-column label="流水号" align="center" prop="f1" />
      <el-table-column label="收款机号" align="center" prop="f2" />
      <el-table-column label="收款员编码" align="center" prop="f3" />
      <el-table-column label="业务类型" align="center" prop="f4" />
      <el-table-column label="购物类型" align="center" prop="f5" />
      <el-table-column label="会员卡号" align="center" prop="f6" />
      <el-table-column label="销售时间" align="center" prop="f7" />
      <el-table-column label="营业日期" align="center" prop="f8" />
      <el-table-column label="记账日期" align="center" prop="f9" />
      <el-table-column label="支付标记" align="center" prop="f10" />
      <el-table-column label="交付标记" align="center" prop="f11" />
      <el-table-column label="单据状态" align="center" prop="f12" />
      <el-table-column label="客户类型" align="center" prop="f13" />
      <el-table-column label="客户类型名称" align="center" prop="f14" />
      <el-table-column label="付款单号" align="center" prop="f15" />
      <el-table-column label="来源单据号" align="center" prop="f16" />
      <el-table-column label="来源业务类型" align="center" prop="f17" />
      <el-table-column label="应收金额" align="center" prop="f18" />
      <el-table-column label="优惠金额" align="center" prop="f19" />
      <el-table-column label="实收金额" align="center" prop="f20" />
      <el-table-column label="支付金额" align="center" prop="f21" />
      <el-table-column label="找零金额" align="center" prop="f22" />
      <el-table-column label="舍入金额" align="center" prop="f23" />
      <el-table-column label="明细件数" align="center" prop="f24" />
      <el-table-column label="明细条数" align="center" prop="f25" />
      <el-table-column label="原流水号" align="center" prop="f26" />
      <el-table-column label="款项确认单据号" align="center" prop="f27" />
      <el-table-column label="是否打印发票" align="center" prop="f28" />
      <el-table-column label="发票打印次数" align="center" prop="f29" />
      <el-table-column label="出货仓库编码打印次数" align="center" prop="f30" />
      <el-table-column label="班次号" align="center" prop="f31" />
      <el-table-column label="外卖类型" align="center" prop="f32" />
      <el-table-column label="台结流水" align="center" prop="f33" />
      <el-table-column label="备注" align="center" prop="f34" />
      <el-table-column label="订单类型" align="center" prop="f35" />
      <el-table-column label="电子发票码" align="center" prop="f36" />
      <el-table-column label="会员手机号" align="center" prop="f37" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:sys_test_tubiao_data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:sys_test_tubiao_data:remove']"
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

    <!-- 添加或修改销售数据图表1对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单据号" prop="ordId">
          <el-input v-model="form.ordId" placeholder="请输入单据号" />
        </el-form-item>
        <el-form-item label="流水号" prop="f1">
          <el-input v-model="form.f1" placeholder="请输入流水号" />
        </el-form-item>
        <el-form-item label="收款机号" prop="f2">
          <el-input v-model="form.f2" placeholder="请输入收款机号" />
        </el-form-item>
        <el-form-item label="收款员编码" prop="f3">
          <el-input v-model="form.f3" placeholder="请输入收款员编码" />
        </el-form-item>
        <el-form-item label="业务类型" prop="f4">
          <el-input v-model="form.f4" placeholder="请输入业务类型" />
        </el-form-item>
        <el-form-item label="购物类型" prop="f5">
          <el-input v-model="form.f5" placeholder="请输入购物类型" />
        </el-form-item>
        <el-form-item label="会员卡号" prop="f6">
          <el-input v-model="form.f6" placeholder="请输入会员卡号" />
        </el-form-item>
        <el-form-item label="销售时间" prop="f7">
          <el-input v-model="form.f7" placeholder="请输入销售时间" />
        </el-form-item>
        <el-form-item label="营业日期" prop="f8">
          <el-input v-model="form.f8" placeholder="请输入营业日期" />
        </el-form-item>
        <el-form-item label="记账日期" prop="f9">
          <el-input v-model="form.f9" placeholder="请输入记账日期" />
        </el-form-item>
        <el-form-item label="支付标记" prop="f10">
          <el-input v-model="form.f10" placeholder="请输入支付标记" />
        </el-form-item>
        <el-form-item label="交付标记" prop="f11">
          <el-input v-model="form.f11" placeholder="请输入交付标记" />
        </el-form-item>
        <el-form-item label="单据状态" prop="f12">
          <el-input v-model="form.f12" placeholder="请输入单据状态" />
        </el-form-item>
        <el-form-item label="客户类型" prop="f13">
          <el-input v-model="form.f13" placeholder="请输入客户类型" />
        </el-form-item>
        <el-form-item label="客户类型名称" prop="f14">
          <el-input v-model="form.f14" placeholder="请输入客户类型名称" />
        </el-form-item>
        <el-form-item label="付款单号" prop="f15">
          <el-input v-model="form.f15" placeholder="请输入付款单号" />
        </el-form-item>
        <el-form-item label="来源单据号" prop="f16">
          <el-input v-model="form.f16" placeholder="请输入来源单据号" />
        </el-form-item>
        <el-form-item label="来源业务类型" prop="f17">
          <el-input v-model="form.f17" placeholder="请输入来源业务类型" />
        </el-form-item>
        <el-form-item label="应收金额" prop="f18">
          <el-input v-model="form.f18" placeholder="请输入应收金额" />
        </el-form-item>
        <el-form-item label="优惠金额" prop="f19">
          <el-input v-model="form.f19" placeholder="请输入优惠金额" />
        </el-form-item>
        <el-form-item label="实收金额" prop="f20">
          <el-input v-model="form.f20" placeholder="请输入实收金额" />
        </el-form-item>
        <el-form-item label="支付金额" prop="f21">
          <el-input v-model="form.f21" placeholder="请输入支付金额" />
        </el-form-item>
        <el-form-item label="找零金额" prop="f22">
          <el-input v-model="form.f22" placeholder="请输入找零金额" />
        </el-form-item>
        <el-form-item label="舍入金额" prop="f23">
          <el-input v-model="form.f23" placeholder="请输入舍入金额" />
        </el-form-item>
        <el-form-item label="明细件数" prop="f24">
          <el-input v-model="form.f24" placeholder="请输入明细件数" />
        </el-form-item>
        <el-form-item label="明细条数" prop="f25">
          <el-input v-model="form.f25" placeholder="请输入明细条数" />
        </el-form-item>
        <el-form-item label="原流水号" prop="f26">
          <el-input v-model="form.f26" placeholder="请输入原流水号" />
        </el-form-item>
        <el-form-item label="款项确认单据号" prop="f27">
          <el-input v-model="form.f27" placeholder="请输入款项确认单据号" />
        </el-form-item>
        <el-form-item label="是否打印发票" prop="f28">
          <el-input v-model="form.f28" placeholder="请输入是否打印发票" />
        </el-form-item>
        <el-form-item label="发票打印次数" prop="f29">
          <el-input v-model="form.f29" placeholder="请输入发票打印次数" />
        </el-form-item>
        <el-form-item label="出货仓库编码打印次数" prop="f30">
          <el-input v-model="form.f30" placeholder="请输入出货仓库编码打印次数" />
        </el-form-item>
        <el-form-item label="班次号" prop="f31">
          <el-input v-model="form.f31" placeholder="请输入班次号" />
        </el-form-item>
        <el-form-item label="外卖类型" prop="f32">
          <el-input v-model="form.f32" placeholder="请输入外卖类型" />
        </el-form-item>
        <el-form-item label="台结流水" prop="f33">
          <el-input v-model="form.f33" placeholder="请输入台结流水" />
        </el-form-item>
        <el-form-item label="备注" prop="f34">
          <el-input v-model="form.f34" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="订单类型" prop="f35">
          <el-input v-model="form.f35" placeholder="请输入订单类型" />
        </el-form-item>
        <el-form-item label="电子发票码" prop="f36">
          <el-input v-model="form.f36" placeholder="请输入电子发票码" />
        </el-form-item>
        <el-form-item label="会员手机号" prop="f37">
          <el-input v-model="form.f37" placeholder="请输入会员手机号" />
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
import { listSys_test_tubiao_data, getSys_test_tubiao_data, delSys_test_tubiao_data, addSys_test_tubiao_data, updateSys_test_tubiao_data, exportSys_test_tubiao_data } from "@/api/system/sys_test_tubiao_data";

export default {
  name: "Sys_test_tubiao_data",
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
      // 销售数据图表1表格数据
      sys_test_tubiao_dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ordId: null,
        f1: null,
        f2: null,
        f3: null,
        f4: null,
        f5: null,
        f6: null,
        f7: null,
        f8: null,
        f9: null,
        f10: null,
        f11: null,
        f12: null,
        f13: null,
        f14: null,
        f15: null,
        f16: null,
        f17: null,
        f18: null,
        f19: null,
        f20: null,
        f21: null,
        f22: null,
        f23: null,
        f24: null,
        f25: null,
        f26: null,
        f27: null,
        f28: null,
        f29: null,
        f30: null,
        f31: null,
        f32: null,
        f33: null,
        f34: null,
        f35: null,
        f36: null,
        f37: null
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
    /** 查询销售数据图表1列表 */
    getList() {
      this.loading = true;
      listSys_test_tubiao_data(this.queryParams).then(response => {
        this.sys_test_tubiao_dataList = response.rows;
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
        ordId: null,
        f1: null,
        f2: null,
        f3: null,
        f4: null,
        f5: null,
        f6: null,
        f7: null,
        f8: null,
        f9: null,
        f10: null,
        f11: null,
        f12: null,
        f13: null,
        f14: null,
        f15: null,
        f16: null,
        f17: null,
        f18: null,
        f19: null,
        f20: null,
        f21: null,
        f22: null,
        f23: null,
        f24: null,
        f25: null,
        f26: null,
        f27: null,
        f28: null,
        f29: null,
        f30: null,
        f31: null,
        f32: null,
        f33: null,
        f34: null,
        f35: null,
        f36: null,
        f37: null
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
      this.ids = selection.map(item => item.ordId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加销售数据图表1";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const ordId = row.ordId || this.ids
      getSys_test_tubiao_data(ordId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改销售数据图表1";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.ordId != null) {
            updateSys_test_tubiao_data(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSys_test_tubiao_data(this.form).then(response => {
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
      const ordIds = row.ordId || this.ids;
      this.$confirm('是否确认删除销售数据图表1编号为"' + ordIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSys_test_tubiao_data(ordIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有销售数据图表1数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSys_test_tubiao_data(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
