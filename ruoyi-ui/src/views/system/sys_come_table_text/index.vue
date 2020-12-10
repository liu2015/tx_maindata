<template>

  <div class="app-container">


    <el-form :model="queryParams" ref="queryForm" :inline="true"  :rules="rules" v-show="showSearch" label-width="68px">
      <el-form-item label="来访姓名" prop="comeName">
        <el-input
          v-model="queryParams.comeName"
          placeholder="请输入来访姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery" required
        />
      </el-form-item>


      <!--
      <el-form-item label="性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择性别" clearable size="small">
          <el-option
            v-for="dict in sexOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="身份证id" prop="ideNtity">
        <el-input
          v-model="queryParams.ideNtity"
          placeholder="请输入身份证id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label=" 工作单位" prop="worKunit">
        <el-input
          v-model="queryParams.worKunit"
          placeholder="请输入 工作单位"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      -->
      <el-form-item label=" 联系电话" prop="callLink">
        <el-input
          v-model="queryParams.callLink"
          placeholder="请输入 联系电话"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="来访时间" prop="comeTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.comeTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择来访时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="离开时间" prop="leaweTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.leaweTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择离开时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="备注" prop="reaMarks">
        <el-input
          v-model="queryParams.reaMarks"
          placeholder="请输入备注"
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:sys_come_table:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:sys_come_table:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:sys_come_table:remove']"
        >离开</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:sys_come_table:export']"
        >导出</el-button>
      </el-col> -->
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

<el-card class="box-card">
  <div v-for="itmet in sys_come_tableList" :key="itmet.id" class="text item">
    
    <el-tag>你好： {{itmet.comeName}}  你的来访问时间是：{{itmet.comeTime}}</el-tag>
        <el-button
            size="mini"
            type="warning"
            icon="el-icon-edit"
            @click="handleDeletetest(itmet)"
            v-hasPermi="['system:sys_come_table:edit']"
        round   >离开请点我</el-button>
  </div>
</el-card>

<div v-show="open_table">
    <el-table v-loading="loading"  :data="sys_come_tableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="来访姓名" align="center" prop="comeName" />
      <el-table-column label="性别" align="center" prop="sex" :formatter="sexFormat" />
      <el-table-column label="身份证id" align="center" prop="ideNtity" />
      <el-table-column label=" 工作单位" align="center" prop="worKunit" />
      <el-table-column label=" 联系电话" align="center" prop="callLink" />
      <el-table-column label="来访时间" align="center" prop="comeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.comeTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="离开时间" align="center" prop="leaweTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.leaweTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="reaMarks" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:sys_come_table:edit']"
          >修改</el-button>
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:sys_come_table:remove']"
          >删除</el-button> -->
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

</div>
    <!-- 添加或修改出入登记对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="来访姓名" prop="comeName">
          <el-input v-model="form.comeName" placeholder="请输入来访姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择性别">
            <el-option
              v-for="dict in sexOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="身份证id" prop="ideNtity">
          <el-input v-model="form.ideNtity" placeholder="请输入身份证id" />
        </el-form-item>
        <el-form-item label=" 工作单位" prop="worKunit">
          <el-input v-model="form.worKunit" placeholder="请输入 工作单位" />
        </el-form-item>
        <el-form-item label=" 联系电话" prop="callLink">
          <el-input v-model="form.callLink" placeholder="请输入 联系电话" />
        </el-form-item>
        <el-form-item label="来访时间" prop="comeTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.comeTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择来访时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="离开时间" prop="leaweTime">
          <el-date-picker disabled clearable size="small" style="width: 200px"
            v-model="form.leaweTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择离开时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="reaMarks">
          <el-input v-model="form.reaMarks" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">已填写请查询后选中“离开”</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSys_come_table, getSys_come_table, delSys_come_table, addSys_come_table, updateSys_come_table, exportSys_come_table ,delSys_come_table_text} from "@/api/system/sys_come_table";

export default {
  name: "Sys_come_table",
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
      // 出入登记表格数据
      sys_come_tableList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: true,
      open_table:false,
      // 性别字典
      sexOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        comeName: null,
        sex: null,
        ideNtity: null,
        worKunit: null,
        callLink: null,
        comeTime: null,
        leaweTime: null,
        reaMarks: null
      },
      idstext:{
        id:null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
         comeName: [{
          required: true,
          message: '请输入单行文本',
          trigger: 'blur'
        }],
        callLink: [{
          required: true,
          message: '请输入手机号',
          trigger: 'blur'
        }, {
          pattern: /^1(3|4|5|7|8|9)\d{9}$/,
          message: '手机号格式错误',
          trigger: 'blur'
        }],
      }
    };
  },
   
  created() {
    // this.getList();
    this.getDicts("sys_user_sex").then(response => {
      this.sexOptions = response.data;
    });
  },
  methods: {
    /** 查询出入登记列表 */
    getList() {
      this.loading = true;

      listSys_come_table(this.queryParams).then(response => {
        this.sys_come_tableList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
      getListtest(data) {
      this.loading = true;
      this.queryParams.callLink=data

      listSys_come_table(this.queryParams).then(response => {
        this.sys_come_tableList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 性别字典翻译
    sexFormat(row, column) {
      return this.selectDictLabel(this.sexOptions, row.sex);
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
        comeName: null,
        sex: null,
        ideNtity: null,
        worKunit: null,
        callLink: null,
        comeTime: null,
        leaweTime: null,
        reaMarks: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      if(this.queryParams.comeName!=null && this.queryParams.callLink!=null){
              this.getList();

      }
      this.open_table=true;
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
      this.title = "添加出入登记";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSys_come_table(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改出入登记";
      });
    },
    
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSys_come_table(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSys_come_table(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              const datatest= this.form.callLink

              this.getListtest(datatest);
            });
          }
        }
      });
    },
    /** 删除按钮操作 变更成修改操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认开开出入登记编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
       
          return delSys_come_table_text(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("欢迎下次光临周黑鸭工厂");
        })
    },

        /** 删除按钮操作 变更成修改操作 */
    handleDeletetest(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认开开出入登记编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
       
          return delSys_come_table_text(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("欢迎下次光临周黑鸭工厂");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有出入登记数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSys_come_table(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
<style>
  .text {
    font-size: 14px;
  }

  .item {
    padding: 18px 0;
  }

  .box-card {
    width: 500px;
  }
</style>