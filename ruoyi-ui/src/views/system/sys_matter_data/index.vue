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


      <el-form-item label="大区" prop="region">
        <el-input
          v-model="queryParams.region"
          placeholder="请输入大区"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织级别" prop="organLevel">
        <el-input
          v-model="queryParams.organLevel"
          placeholder="请输入组织级别"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="销售组织" prop="sellDrgan">
        <el-input
          v-model="queryParams.sellDrgan"
          placeholder="请输入销售组织"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="料号" prop="matter">
        <el-input
          v-model="queryParams.matter"
          placeholder="请输入料号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物料描述" prop="matterDescribe">
        <el-input
          v-model="queryParams.matterDescribe"
          placeholder="请输入物料描述"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物料组" prop="matterGroup">
        <el-input
          v-model="queryParams.matterGroup"
          placeholder="请输入物料组"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-input
          v-model="queryParams.status"
          placeholder="请输入状态"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="备用1" prop="guard1">
        <el-input
          v-model="queryParams.guard1"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用2" prop="guard2">
        <el-input
          v-model="queryParams.guard2"
          placeholder="请输入备用2"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用3" prop="guard3">
        <el-input
          v-model="queryParams.guard3"
          placeholder="请输入备用3"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:sys_matter_data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:sys_matter_data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:sys_matter_data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:sys_matter_data:export']"
        >导出</el-button>
      </el-col>

 <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleImport"
          v-hasPermi="['system:sys_matter_data:export']"
        >批量导入</el-button>
      </el-col>

	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sys_matter_dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="大区" align="center" prop="region" />
      <el-table-column label="组织级别" align="center" prop="organLevel" />
      <el-table-column label="销售组织" align="center" prop="sellDrgan" />
      <el-table-column label="料号" align="center" prop="matter" />
      <el-table-column label="物料描述" align="center" prop="matterDescribe" />
      <el-table-column label="物料组" align="center" prop="matterGroup" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="备用1" align="center" prop="guard1" />
      <el-table-column label="备用2" align="center" prop="guard2" />
      <el-table-column label="备用3" align="center" prop="guard3" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:sys_matter_data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:sys_matter_data:remove']"
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

    <!-- 添加或修改sys_matter_data对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

  <el-form-item label="订单id" prop="orderId">
          <el-select v-model="form.orderId" placeholder="请选择订单id">
            <el-option
              v-for="dict in orderIdOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>


      <!--    <el-input v-model="form.orderId" placeholder="请输入订单id" />

      -->
        </el-form-item>
        <el-form-item label="大区" prop="region">
          <el-input v-model="form.region" placeholder="请输入大区" />
        </el-form-item>
        <el-form-item label="组织级别" prop="organLevel">
          <el-input v-model="form.organLevel" placeholder="请输入组织级别" />
        </el-form-item>
        <el-form-item label="销售组织" prop="sellDrgan">
          <el-input v-model="form.sellDrgan" placeholder="请输入销售组织" />
        </el-form-item>
        <el-form-item label="料号" prop="matter">
          <el-input v-model="form.matter" placeholder="请输入料号" />
        </el-form-item>
        <el-form-item label="物料描述" prop="matterDescribe">
          <el-input v-model="form.matterDescribe" placeholder="请输入物料描述" />
        </el-form-item>
        <el-form-item label="物料组" prop="matterGroup">
          <el-input v-model="form.matterGroup" placeholder="请输入物料组" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-input v-model="form.status" placeholder="请输入状态" />
        </el-form-item>
        <el-form-item label="备用1" prop="guard1">
          <el-input v-model="form.guard1" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用2" prop="guard2">
          <el-input v-model="form.guard2" placeholder="请输入备用2" />
        </el-form-item>
        <el-form-item label="备用3" prop="guard3">
          <el-input v-model="form.guard3" placeholder="请输入备用3" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的用户数据
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：仅允许导入“xls”或“xlsx”格式文件！</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>



  </div>
</template>

<script>
import { listSys_matter_data, getSys_matter_data, delSys_matter_data, addSys_matter_data, updateSys_matter_data, exportSys_matter_data,importTemplate } from "@/api/system/sys_matter_data";
import { getToken } from "@/utils/auth";

export default {
  name: "Sys_matter_data",
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
      // sys_matter_data表格数据
      sys_matter_dataList: [],
      // 订单id列表
      orderIdOptions :[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,

       // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/sys_matter_data/importData"
      },

      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        region: null,
        organLevel: null,
        sellDrgan: null,
        matter: null,
        matterDescribe: null,
        matterGroup: null,
        status: null,
        guard1: null,
        guard2: null,
        guard3: null
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
   this.getDicts("order_idtest").then(response => {
      this.orderIdOptions = response.data;
    });
  },
  methods: {



    /** 查询sys_matter_data列表 */
    getList() {
      this.loading = true;
      listSys_matter_data(this.queryParams).then(response => {
        this.sys_matter_dataList = response.rows;
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
        region: null,
        organLevel: null,
        sellDrgan: null,
        matter: null,
        matterDescribe: null,
        matterGroup: null,
        status: null,
        guard1: null,
        guard2: null,
        guard3: null
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
      this.title = "添加sys_matter_data";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSys_matter_data(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改sys_matter_data";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSys_matter_data(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSys_matter_data(this.form).then(response => {
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
      this.$confirm('是否确认删除sys_matter_data编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSys_matter_data(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有sys_matter_data数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSys_matter_data(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      importTemplate().then(response => {
        this.download(response.msg);
      });
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(response.msg, "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    }

  }
};
</script>
