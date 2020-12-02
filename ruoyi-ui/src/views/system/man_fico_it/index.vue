<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="创建订单" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入创建订单"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司代码" prop="offCode">
        <el-input
          v-model="queryParams.offCode"
          placeholder="请输入公司代码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司名称" prop="offName">
        <el-input
          v-model="queryParams.offName"
          placeholder="请输入公司名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="核算方式" prop="offAccanting">
        <el-select v-model="queryParams.offAccanting" placeholder="请选择核算方式" clearable size="small">
          <el-option
            v-for="dict in offAccantingOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="门店信息" prop="shopCode">
        <el-input
          v-model="queryParams.shopCode"
          placeholder="请输入门店信息"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="门店名称" prop="shopName">
        <el-input
          v-model="queryParams.shopName"
          placeholder="请输入门店名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="门店类型" prop="shopType">
        <el-select v-model="queryParams.shopType" placeholder="请选择门店类型" clearable size="small">
          <el-option
            v-for="dict in shopTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="成本中心" prop="costcenter">
        <el-input
          v-model="queryParams.costcenter"
          placeholder="请输入成本中心"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="利润中心" prop="profitcenter">
        <el-input
          v-model="queryParams.profitcenter"
          placeholder="请输入利润中心"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="门店地址" prop="shopAddress">
        <el-input
          v-model="queryParams.shopAddress"
          placeholder="请输入门店地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->
      </el-form-item>
      <el-form-item label="财务确认" prop="offFico">
        <el-select v-model="queryParams.offFico" placeholder="请选择财务确认" clearable size="small">
          <el-option
            v-for="dict in offFicoOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <!--
      <el-form-item label="it确认" prop="offIt">
        <el-select v-model="queryParams.offIt" placeholder="请选择it确认" clearable size="small">
          <el-option
            v-for="dict in offItOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="门店编码" prop="beiyong1">
        <el-input
          v-model="queryParams.beiyong1"
          placeholder="请输入门店编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用2" prop="beiyong2">
        <el-input
          v-model="queryParams.beiyong2"
          placeholder="请输入备用2"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      -->
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
     <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:man_fico_it:add']"
        >新增</el-button>
      </el-col>
      -->
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:man_fico_it:edit']"
        >财务赋值代码</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate1"
          v-hasPermi="['system:man_fico_it:edit']"
        >IT赋值代码</el-button>
      </el-col>

     <!--<el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:man_fico_it:remove']"
        >删除</el-button>
      </el-col>

      -->

      
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:man_fico_it:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="man_fico_itList" 
    :row-class-name="tabrowname"
    @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序列" align="center" prop="id" />
      <el-table-column label="创建订单" align="center" prop="orderId" />
      <el-table-column label="公司代码" align="center" prop="offCode" />
      <el-table-column label="公司名称" align="center" prop="offName" />
      <el-table-column label="核算方式" align="center" prop="offAccanting" :formatter="offAccantingFormat" />
      <el-table-column label="门店信息" align="center" prop="shopCode" />
      <el-table-column label="门店名称" align="center" prop="shopName" />
      <el-table-column label="门店类型" align="center" prop="shopType" :formatter="shopTypeFormat" />
      <el-table-column label="成本中心" align="center" prop="costcenter" />
      <el-table-column label="利润中心" align="center" prop="profitcenter" />
      <el-table-column label="门店地址" align="center" prop="shopAddress" />
      <el-table-column label="财务确认" align="center" prop="offFico" :formatter="offFicoFormat" />
      <el-table-column label="it确认" align="center" prop="offIt" :formatter="offItFormat" />
      <el-table-column label="门店编码" align="center" prop="beiyong1" />
      <el-table-column label="备用2" align="center" prop="beiyong2" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:man_fico_it:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:man_fico_it:remove']"
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

    <!-- 添加或修改man_fico_it对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="公司代码" prop="offCode">
          <el-input v-model="form.offCode" placeholder="请输入公司代码" />
        </el-form-item>
        <el-form-item label="成本中心" prop="costcenter">
          <el-input v-model="form.costcenter" placeholder="请输入成本中心" />
        </el-form-item>
        <el-form-item label="利润中心" prop="profitcenter">
          <el-input v-model="form.profitcenter" placeholder="请输入利润中心" />
        </el-form-item>
        <el-form-item label="财务确认" prop="offFico">
          <el-select v-model="form.offFico" placeholder="请选择财务确认">
            <el-option
              v-for="dict in offFicoOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="it确认" prop="offIt">
          <el-select v-model="form.offIt" disabled placeholder="请选择it确认">
            <el-option
              v-for="dict in offItOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="门店编码" prop="beiyong1">
          <el-input v-model="form.beiyong1" disabled placeholder="请输入门店编码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


        <!-- it唤醒弹窗 添加或修改man_fico_it对话框 -->
    <el-dialog :title="title" :visible.sync="open1" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="公司代码" prop="offCode">
          <el-input v-model="form.offCode" disabled placeholder="请输入公司代码" />
        </el-form-item>
        <el-form-item label="成本中心" prop="costcenter">
          <el-input v-model="form.costcenter"  disabled placeholder="请输入成本中心" />
        </el-form-item>
        <el-form-item label="利润中心" prop="profitcenter">
          <el-input v-model="form.profitcenter" disabled placeholder="请输入利润中心" />
        </el-form-item>
        <el-form-item label="财务确认" prop="offFico">
          <el-select v-model="form.offFico" disabled  placeholder="请选择财务确认">
            <el-option
              v-for="dict in offFicoOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="it确认" prop="offIt">
          <el-select v-model="form.offIt"  placeholder="请选择it确认">
            <el-option
              v-for="dict in offItOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="门店编码" prop="beiyong1">
          <el-input v-model="form.beiyong1" placeholder="请输入门店编码" />
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
import { listMan_fico_it, getMan_fico_it, delMan_fico_it, addMan_fico_it, updateMan_fico_it, exportMan_fico_it } from "@/api/system/man_fico_it";

export default {
  name: "Man_fico_it",
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
      // man_fico_it表格数据
      man_fico_itList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 核算方式字典
      offAccantingOptions: [],
      // 门店类型字典
      shopTypeOptions: [],
      // 财务确认字典
      offFicoOptions: [],
      // it确认字典
      offItOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        offCode: null,
        offName: null,
        offAccanting: null,
        shopCode: null,
        shopName: null,
        shopType: null,
        costcenter: null,
        profitcenter: null,
        shopAddress: null,
        offFico: null,
        offIt: null,
        beiyong1: null,
        beiyong2: null
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
    this.getDicts("sys_accunting").then(response => {
      this.offAccantingOptions = response.data;
    });
    this.getDicts("zhu_data").then(response => {
      this.shopTypeOptions = response.data;
    });
    this.getDicts("fico").then(response => {
      this.offFicoOptions = response.data;
    });
    this.getDicts("ITok").then(response => {
      this.offItOptions = response.data;
    });
  },
  methods: {

      tabrowname({row,rowIndex}){

         if (row.orderId ==null || row.orderId==undefined || row.orderId =='') {
          return 'warning-row';
        } else if(row.orderId !== null)
        {
          return 'success-row'
        }
        return '';
      },


    /** 查询man_fico_it列表 */
    getList() {
      this.loading = true;
      listMan_fico_it(this.queryParams).then(response => {
        this.man_fico_itList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 核算方式字典翻译
    offAccantingFormat(row, column) {
      return this.selectDictLabel(this.offAccantingOptions, row.offAccanting);
    },
    // 门店类型字典翻译
    shopTypeFormat(row, column) {
      return this.selectDictLabel(this.shopTypeOptions, row.shopType);
    },
    // 财务确认字典翻译
    offFicoFormat(row, column) {
      return this.selectDictLabel(this.offFicoOptions, row.offFico);
    },
    // it确认字典翻译
    offItFormat(row, column) {
      return this.selectDictLabel(this.offItOptions, row.offIt);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.open1 = false;

      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderId: null,
        offCode: null,
        offName: null,
        offAccanting: null,
        shopCode: null,
        shopName: null,
        shopType: null,
        costcenter: null,
        profitcenter: null,
        shopAddress: null,
        offFico: null,
        offIt: null,
        beiyong1: null,
        beiyong2: null
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
      this.title = "添加man_fico_it";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMan_fico_it(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改man_fico_it";
      });
    },
    /** IT修改部分修改按钮操作 */
    handleUpdate1(row) {
      this.reset();
      const id = row.id || this.ids
      getMan_fico_it(id).then(response => {
        this.form = response.data;
        this.open1 = true;
        this.title = "it 唤醒弹窗man_fico_it";
      });
    },

    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMan_fico_it(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMan_fico_it(this.form).then(response => {
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
      this.$confirm('是否确认删除man_fico_it编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delMan_fico_it(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有man_fico_it数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportMan_fico_it(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>

<style >
  .el-table .warning-row {
    background: #F56C6C;
    
  }

  .el-table .success-row {
    background: #f0f9eb;
  }
</style>

