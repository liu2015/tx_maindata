<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="业务场景" prop="typeScene">
        <el-input
          v-model="queryParams.typeScene"
          placeholder="请输入业务场景"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="公司id" prop="corpid">
        <el-input
          v-model="queryParams.corpid"
          placeholder="请输入公司id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户id" prop="suerid">
        <el-input
          v-model="queryParams.suerid"
          placeholder="请输入用户id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门id" prop="dept">
        <el-input
          v-model="queryParams.dept"
          placeholder="请输入部门id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标签id" prop="tagid">
        <el-input
          v-model="queryParams.tagid"
          placeholder="请输入标签id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应用程序id" prop="agentid">
        <el-input
          v-model="queryParams.agentid"
          placeholder="请输入应用程序id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应用秘钥" prop="secret">
        <el-input
          v-model="queryParams.secret"
          placeholder="请输入应用秘钥"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="token" prop="accessToken">
        <el-input
          v-model="queryParams.accessToken"
          placeholder="请输入token"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="rurl" prop="url">
        <el-input
          v-model="queryParams.url"
          placeholder="请输入rurl"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
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
      <el-form-item label="备用2" prop="guard3">
        <el-input
          v-model="queryParams.guard3"
          placeholder="请输入备用2"
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
          v-hasPermi="['system:appmanid:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:appmanid:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:appmanid:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:appmanid:export']"
        >导出</el-button>
      </el-col>

 <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdateone"
          v-hasPermi="['system:appmanid:edit']"
        >重置请求token</el-button>
      </el-col>

	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="appmanidList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="业务场景" align="center" prop="typeScene" />
      <el-table-column label="公司id" align="center" prop="corpid" />
      <el-table-column label="用户id" align="center" prop="suerid" />
      <el-table-column label="部门id" align="center" prop="dept" />
      <el-table-column label="标签id" align="center" prop="tagid" />
      <el-table-column label="应用程序id" align="center" prop="agentid" />
      <el-table-column label="应用秘钥" align="center" prop="secret" />
      <el-table-column label="token" align="center" prop="accessToken" />
      <el-table-column label="rurl" align="center" prop="url" />
      <el-table-column label="备用1" align="center" prop="guard1" />
      <el-table-column label="备用2" align="center" prop="guard2" />
      <el-table-column label="备用2" align="center" prop="guard3" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:appmanid:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:appmanid:remove']"
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

    <!-- 添加或修改SysAppmanid对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="业务场景" prop="typeScene">
          <el-input disabled  v-model="form.typeScene" placeholder="请输入业务场景" />
        </el-form-item>
        <el-form-item label="公司id" prop="corpid">
          <el-input v-model="form.corpid" placeholder="请输入公司id" />
        </el-form-item>
        <el-form-item label="用户id" prop="suerid">
          <el-input v-model="form.suerid" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="部门id" prop="dept">
          <el-input v-model="form.dept" placeholder="请输入部门id" />
        </el-form-item>
        <el-form-item label="标签id" prop="tagid">
          <el-input v-model="form.tagid" placeholder="请输入标签id" />
        </el-form-item>
        <el-form-item label="应用程序id" prop="agentid">
          <el-input v-model="form.agentid" placeholder="请输入应用程序id" />
        </el-form-item>
        <el-form-item label="应用秘钥" prop="secret">
          <el-input v-model="form.secret" placeholder="请输入应用秘钥" />
        </el-form-item>
        <el-form-item label="token" prop="accessToken">
          <el-input v-model="form.accessToken" disabled placeholder="请输入token" />
        </el-form-item>
        <el-form-item label="rurl" prop="url">
          <el-input v-model="form.url" placeholder="请输入rurl" />
        </el-form-item>
        <el-form-item label="备用1" prop="guard1">
          <el-input v-model="form.guard1" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用2" prop="guard2">
          <el-input v-model="form.guard2" placeholder="请输入备用2" />
        </el-form-item>
        <el-form-item label="备用2" prop="guard3">
          <el-input v-model="form.guard3" placeholder="请输入备用2" />
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
import { listAppmanid, getAppmanid, delAppmanid, addAppmanid, updateAppmanid, exportAppmanid } from "@/api/system/appmanid";

export default {
  name: "Appmanid",
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
      // SysAppmanid表格数据
      appmanidList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        typeScene: null,
        corpid: null,
        suerid: null,
        dept: null,
        tagid: null,
        agentid: null,
        secret: null,
        accessToken: null,
        url: null,
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
  },
  methods: {
    /** 查询SysAppmanid列表 */
    getList() {
      this.loading = true;
      listAppmanid(this.queryParams).then(response => {
        this.appmanidList = response.rows;
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
        typeScene: null,
        corpid: null,
        suerid: null,
        dept: null,
        tagid: null,
        agentid: null,
        secret: null,
        accessToken: null,
        url: null,
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
      this.title = "添加SysAppmanid";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAppmanid(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改SysAppmanid";
      });
    },

    handleUpdateone(row){

      console.log("实现修改后，接着调用token请求，达到更新病重新请求的token 的目的")


    },

    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAppmanid(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAppmanid(this.form).then(response => {
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
      this.$confirm('是否确认删除SysAppmanid编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delAppmanid(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有SysAppmanid数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportAppmanid(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
