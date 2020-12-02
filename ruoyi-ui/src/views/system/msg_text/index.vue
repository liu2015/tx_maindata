<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="业务类型" prop="yeuwType">
        <el-select v-model="queryParams.yeuwType" placeholder="业务类型" clearable size="small">
          <el-option
            v-for="dict in yeuwTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="消息成员" prop="touser">
        <el-input
          v-model="queryParams.touser"
          placeholder="请输入指定接收消息的成员"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="指定接收消息的部门" prop="toparty">
        <el-input
          v-model="queryParams.toparty"
          placeholder="请输入指定接收消息的部门"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      -->
      <el-form-item label="消息标签" prop="totag">
        <el-input
          v-model="queryParams.totag"
          placeholder="请输入指定接收消息的标签"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="消息类型" prop="msgtype">
        <el-input
          v-model="queryParams.msgtype"
          placeholder="请输入消息类型，此时固定为：text"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="企业应用的id，整型" prop="agentid">
        <el-input
          v-model="queryParams.agentid"
          placeholder="请输入企业应用的id，整型"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="消息内容text_content" prop="text">
        <el-input
          v-model="queryParams.text"
          placeholder="请输入消息内容text_content"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="表示是否是保密消息" prop="safe">
        <el-input
          v-model="queryParams.safe"
          placeholder="请输入表示是否是保密消息"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="表示是否开启id转译" prop="enableIdTrans">
        <el-input
          v-model="queryParams.enableIdTrans"
          placeholder="请输入表示是否开启id转译"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="表示是否开启重复消息检查" prop="enableDuplicateCheck">
        <el-input
          v-model="queryParams.enableDuplicateCheck"
          placeholder="请输入表示是否开启重复消息检查"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="表示是否重复消息检查的时间间隔" prop="duplicateCheckInterval">
        <el-input
          v-model="queryParams.duplicateCheckInterval"
          placeholder="请输入表示是否重复消息检查的时间间隔"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="请求url地址" prop="url">
        <el-input
          v-model="queryParams.url"
          placeholder="请输入请求url地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用" prop="spare1">
        <el-input
          v-model="queryParams.spare1"
          placeholder="请输入备用"
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
          v-hasPermi="['system:msg_text:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:msg_text:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:msg_text:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:msg_text:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="msg_textList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="业务类型" align="center" prop="yeuwType" :formatter="yeuwTypeFormat" />
      <el-table-column label="指定接收消息的成员" align="center" prop="touser" />
      <el-table-column label="指定接收消息的部门" align="center" prop="toparty" />
      <el-table-column label="指定接收消息的标签" align="center" prop="totag" />
      <el-table-column label="消息类型，此时固定为：text" align="center" prop="msgtype" />
      <el-table-column label="企业应用的id，整型" align="center" prop="agentid" />
      <el-table-column label="消息内容text_content" align="center" prop="text" />
      <el-table-column label="表示是否是保密消息" align="center" prop="safe" />
      <el-table-column label="表示是否开启id转译" align="center" prop="enableIdTrans" />
      <el-table-column label="表示是否开启重复消息检查" align="center" prop="enableDuplicateCheck" />
      <el-table-column label="表示是否重复消息检查的时间间隔" align="center" prop="duplicateCheckInterval" />
      <el-table-column label="请求url地址" align="center" prop="url" />
      <el-table-column label="备用" align="center" prop="spare1" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:msg_text:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:msg_text:remove']"
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

    <!-- 添加或修改消息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="业务类型" prop="yeuwType">
          <el-select v-model="form.yeuwType" placeholder="请选择业务类型">
            <el-option
              v-for="dict in yeuwTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="指定接收消息的成员" prop="touser">
          <el-input v-model="form.touser" placeholder="请输入指定接收消息的成员" />
        </el-form-item>
        <el-form-item label="指定接收消息的部门" prop="toparty">
          <el-input v-model="form.toparty" placeholder="请输入指定接收消息的部门" />
        </el-form-item>
        <el-form-item label="指定接收消息的标签" prop="totag">
          <el-input v-model="form.totag" placeholder="请输入指定接收消息的标签" />
        </el-form-item>
        <el-form-item label="消息类型，此时固定为：text" prop="msgtype">
          <el-input  v-model="form.msgtype" placeholder="请输入消息类型，此时固定为：text" />
        </el-form-item>
        <el-form-item label="企业应用的id，整型" prop="agentid">
          <el-input v-model="form.agentid" placeholder="请输入企业应用的id，整型" />
        </el-form-item>
        <el-form-item label="消息内容text_content" prop="text">
          <el-input type="textarea" row=3 v-model="form.text" placeholder="请输入消息内容text_content" />
        </el-form-item>
        <el-form-item label="表示是否是保密消息" prop="safe">
          <el-input v-model="form.safe" placeholder="请输入表示是否是保密消息" />
        </el-form-item>
        <el-form-item label="表示是否开启id转译" prop="enableIdTrans">
          <el-input v-model="form.enableIdTrans" placeholder="请输入表示是否开启id转译" />
        </el-form-item>
        <el-form-item label="表示是否开启重复消息检查" prop="enableDuplicateCheck">
          <el-input v-model="form.enableDuplicateCheck" placeholder="请输入表示是否开启重复消息检查" />
        </el-form-item>
        <el-form-item label="表示是否重复消息检查的时间间隔" prop="duplicateCheckInterval">
          <el-input v-model="form.duplicateCheckInterval" placeholder="请输入表示是否重复消息检查的时间间隔" />
        </el-form-item>
        <el-form-item label="请求url地址" prop="url">
          <el-input v-model="form.url" placeholder="请输入请求url地址" />
        </el-form-item>
       <!--
        <el-form-item label="备用" prop="spare1">
          <el-input v-model="form.spare1" placeholder="请输入备用" />
        </el-form-item>
        -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMsg_text, getMsg_text, delMsg_text, addMsg_text, updateMsg_text, exportMsg_text } from "@/api/system/msg_text";

export default {
  name: "Msg_text",
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
      // 消息管理表格数据
      msg_textList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 业务类型字典
      yeuwTypeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        yeuwType: null,
        touser: null,
        toparty: null,
        totag: null,
        msgtype: null,
        agentid: null,
        text: null,
        safe: null,
        enableIdTrans: null,
        enableDuplicateCheck: null,
        duplicateCheckInterval: null,
        url: null,
        spare1: null
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
    this.getDicts("examine_msg").then(response => {
      this.yeuwTypeOptions = response.data;
    });
  },
  methods: {
    /** 查询消息管理列表 */
    getList() {
      this.loading = true;
      listMsg_text(this.queryParams).then(response => {
        this.msg_textList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 业务类型字典翻译
    yeuwTypeFormat(row, column) {
      return this.selectDictLabel(this.yeuwTypeOptions, row.yeuwType);
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
        yeuwType: null,
        touser: null,
        toparty: null,
        totag: null,
        msgtype: null,
        agentid: null,
        text: null,
        safe: null,
        enableIdTrans: null,
        enableDuplicateCheck: null,
        duplicateCheckInterval: null,
        url: null,
        spare1: null
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
      this.title = "添加消息管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMsg_text(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改消息管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMsg_text(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMsg_text(this.form).then(response => {
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
      this.$confirm('是否确认删除消息管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delMsg_text(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有消息管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportMsg_text(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
