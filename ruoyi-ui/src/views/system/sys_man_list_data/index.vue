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
      <el-form-item label="用户权限申请" prop="suerAuthority">
        <el-input
          v-model="queryParams.suerAuthority"
          placeholder="请输入用户权限申请"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
     <!--
      </el-form-item>
      <el-form-item label="财务确认" prop="ficoConfi">
        <el-input
          v-model="queryParams.ficoConfi"
          placeholder="请输入财务确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="it确认" prop="itConfi">
        <el-input
          v-model="queryParams.itConfi"
          placeholder="请输入it确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="确认" prop="billConfi">
        <el-input
          v-model="queryParams.billConfi"
          placeholder="请输入确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="pos确认" prop="posConfi">
        <el-input
          v-model="queryParams.posConfi"
          placeholder="请输入pos确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供货价确认" prop="supplyPrice">
        <el-input
          v-model="queryParams.supplyPrice"
          placeholder="请输入供货价确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="零售价确认" prop="retailPrice">
        <el-input
          v-model="queryParams.retailPrice"
          placeholder="请输入零售价确认"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主数据确认1" prop="manDataone">
        <el-input
          v-model="queryParams.manDataone"
          placeholder="请输入主数据确认1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主数据确认2" prop="manDatatwo">
        <el-input
          v-model="queryParams.manDatatwo"
          placeholder="请输入主数据确认2"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gu1">
        <el-input
          v-model="queryParams.gu1"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gu2">
        <el-input
          v-model="queryParams.gu2"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gu3">
        <el-input
          v-model="queryParams.gu3"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gu4">
        <el-input
          v-model="queryParams.gu4"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gu5">
        <el-input
          v-model="queryParams.gu5"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
        -->
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!--
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:sys_man_list_data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:sys_man_list_data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:sys_man_list_data:remove']"
        >删除</el-button>
      </el-col>
      -->
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:sys_man_list_data:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sys_man_list_dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="用户权限申请" align="center" prop="suerAuthority" />
      <el-table-column label="财务确认" align="center" prop="ficoConfi" />
      <el-table-column label="it确认" align="center" prop="itConfi" />
      <el-table-column label="确认" align="center" prop="billConfi" />
      <el-table-column label="pos确认" align="center" prop="posConfi" />
      <el-table-column label="供货价确认" align="center" prop="supplyPrice" />
      <el-table-column label="零售价确认" align="center" prop="retailPrice" />
      <el-table-column label="主数据确认1" align="center" prop="manDataone" />
      <el-table-column label="主数据确认2" align="center" prop="manDatatwo" />
      <el-table-column label="备用1" align="center" prop="gu1" />
      <el-table-column label="备用1" align="center" prop="gu2" />
      <el-table-column label="备用1" align="center" prop="gu3" />
      <el-table-column label="备用1" align="center" prop="gu4" />
      <el-table-column label="备用1" align="center" prop="gu5" />
         <!--<el-table-column label="操作" align="center" class-name="small-padding fixed-width">
         -->
      <!--
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:sys_man_list_data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:sys_man_list_data:remove']"
          >删除</el-button>
        </template>
        -->
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改sys_man_list_data对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单id" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单id" />
        </el-form-item>
        <el-form-item label="用户权限申请" prop="suerAuthority">
          <el-input v-model="form.suerAuthority" placeholder="请输入用户权限申请" />
        </el-form-item>
        <el-form-item label="财务确认" prop="ficoConfi">
          <el-input v-model="form.ficoConfi" placeholder="请输入财务确认" />
        </el-form-item>
        <el-form-item label="it确认" prop="itConfi">
          <el-input v-model="form.itConfi" placeholder="请输入it确认" />
        </el-form-item>
        <el-form-item label="确认" prop="billConfi">
          <el-input v-model="form.billConfi" placeholder="请输入确认" />
        </el-form-item>
        <el-form-item label="pos确认" prop="posConfi">
          <el-input v-model="form.posConfi" placeholder="请输入pos确认" />
        </el-form-item>
        <el-form-item label="供货价确认" prop="supplyPrice">
          <el-input v-model="form.supplyPrice" placeholder="请输入供货价确认" />
        </el-form-item>
        <el-form-item label="零售价确认" prop="retailPrice">
          <el-input v-model="form.retailPrice" placeholder="请输入零售价确认" />
        </el-form-item>
        <el-form-item label="主数据确认1" prop="manDataone">
          <el-input v-model="form.manDataone" placeholder="请输入主数据确认1" />
        </el-form-item>
        <el-form-item label="主数据确认2" prop="manDatatwo">
          <el-input v-model="form.manDatatwo" placeholder="请输入主数据确认2" />
        </el-form-item>
        <el-form-item label="备用1" prop="gu1">
          <el-input v-model="form.gu1" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用1" prop="gu2">
          <el-input v-model="form.gu2" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用1" prop="gu3">
          <el-input v-model="form.gu3" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用1" prop="gu4">
          <el-input v-model="form.gu4" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用1" prop="gu5">
          <el-input v-model="form.gu5" placeholder="请输入备用1" />
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
import { listSys_man_list_data, getSys_man_list_data, delSys_man_list_data, addSys_man_list_data, updateSys_man_list_data, exportSys_man_list_data } from "@/api/system/sys_man_list_data";

export default {
  name: "Sys_man_list_data",
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
      // sys_man_list_data表格数据
      sys_man_list_dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        suerAuthority: null,
        ficoConfi: null,
        itConfi: null,
        billConfi: null,
        posConfi: null,
        supplyPrice: null,
        retailPrice: null,
        manDataone: null,
        manDatatwo: null,
        gu1: null,
        gu2: null,
        gu3: null,
        gu4: null,
        gu5: null
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
    /** 查询sys_man_list_data列表 */
    getList() {
      this.loading = true;
      listSys_man_list_data(this.queryParams).then(response => {
        this.sys_man_list_dataList = response.rows;
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
        suerAuthority: null,
        ficoConfi: null,
        itConfi: null,
        billConfi: null,
        posConfi: null,
        supplyPrice: null,
        retailPrice: null,
        manDataone: null,
        manDatatwo: null,
        gu1: null,
        gu2: null,
        gu3: null,
        gu4: null,
        gu5: null
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
      this.title = "添加sys_man_list_data";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSys_man_list_data(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改sys_man_list_data";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSys_man_list_data(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSys_man_list_data(this.form).then(response => {
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
      this.$confirm('是否确认删除sys_man_list_data编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSys_man_list_data(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有sys_man_list_data数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSys_man_list_data(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
