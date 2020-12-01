<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="单号id" prop="orderid">
        <el-input
          v-model="queryParams.orderid"
          placeholder="请输入单号id"
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
      <el-form-item label="岗位名称" prop="pstName">
        <el-input
          v-model="queryParams.pstName"
          placeholder="请输入岗位名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="人员名称" prop="nameUser">
        <el-input
          v-model="queryParams.nameUser"
          placeholder="请输入人员名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
  
      <el-form-item label="人员编码" prop="nameCode">
        <el-input
          v-model="queryParams.nameCode"
          placeholder="请输入人员编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分公司编码" prop="offCode">
        <el-input
          v-model="queryParams.offCode"
          placeholder="请输入分公司编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--
      <el-form-item label="ap分公司权限" prop="offAccess">
        <el-select v-model="queryParams.offAccess" placeholder="请选择ap分公司权限" clearable size="small">
          <el-option
            v-for="dict in offAccessOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="pos名称" prop="posText">
        <el-input
          v-model="queryParams.posText"
          placeholder="请输入pos名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="pos岗位" prop="posNames">
        <el-select v-model="queryParams.posNames" placeholder="请选择pos岗位" clearable size="small">
          <el-option
            v-for="dict in posNamesOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="pos门店编号" prop="posShop">
        <el-input
          v-model="queryParams.posShop"
          placeholder="请输入pos门店编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="中台权限组名称" prop="ztAuthor">
        <el-select v-model="queryParams.ztAuthor" placeholder="请选择中台权限组名称" clearable size="small">
          <el-option
            v-for="dict in ztAuthorOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>



      <el-form-item label="备注" prop="beizhu">
        <el-input
          v-model="queryParams.beizhu"
          placeholder="请输入备注"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组" prop="groupText">
        <el-input
          v-model="queryParams.groupText"
          placeholder="请输入组"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户组名称" prop="groupName">
        <el-input
          v-model="queryParams.groupName"
          placeholder="请输入用户组名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用1" prop="gp1">
        <el-input
          v-model="queryParams.gp1"
          placeholder="请输入备用1"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用2" prop="gp2">
        <el-input
          v-model="queryParams.gp2"
          placeholder="请输入备用2"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用3" prop="gp3">
        <el-input
          v-model="queryParams.gp3"
          placeholder="请输入备用3"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用4" prop="gp4">
        <el-input
          v-model="queryParams.gp4"
          placeholder="请输入备用4"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备用5" prop="gp5">
        <el-input
          v-model="queryParams.gp5"
          placeholder="请输入备用5"
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
          v-hasPermi="['system:SysAuthorUser:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:SysAuthorUser:edit']"
        >协同赋值(编辑)</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:SysAuthorUser:remove']"
        >删除</el-button>
      </el-col>
     
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:SysAuthorUser:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="SysAuthorUserList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="单号id" align="center" prop="orderid" />
      <el-table-column label="大区" align="center" prop="region" />
      <el-table-column label="岗位名称" align="center" prop="pstName" />
      <el-table-column label="人员名称" align="center" prop="nameUser" />
      <el-table-column label="人员编码" align="center" prop="nameCode" />
      <el-table-column label="分公司编码" align="center" prop="offCode" />
      <el-table-column label="ap分公司权限" align="center" prop="offAccess" :formatter="offAccessFormat" />
      <el-table-column label="pos名称" align="center" prop="posText" />
      <el-table-column label="pos岗位" align="center" prop="posNames" :formatter="posNamesFormat" />
      <el-table-column label="pos门店编号" align="center" prop="posShop" />
      <el-table-column label="中台权限组名称" align="center" prop="ztAuthor" :formatter="ztAuthorFormat" />
      <el-table-column label="备注" align="center" prop="beizhu" />
      <el-table-column label="组" align="center" prop="groupText" />
      <el-table-column label="用户组名称" align="center" prop="groupName" />
      <el-table-column label="备用1" align="center" prop="gp1" />
      <el-table-column label="备用2" align="center" prop="gp2" />
      <el-table-column label="备用3" align="center" prop="gp3" />
      <el-table-column label="备用4" align="center" prop="gp4" />
      <el-table-column label="备用5" align="center" prop="gp5" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:SysAuthorUser:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:SysAuthorUser:remove']"
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

    <!-- 添加或修改SysAuthorUser对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单号id" prop="orderid">
          <el-input v-model="form.orderid" placeholder="请输入单号id" />
        </el-form-item>
        <el-form-item label="大区" prop="region">
          <el-input v-model="form.region" placeholder="请输入大区" />
        </el-form-item>
        <el-form-item label="岗位名称" prop="pstName">
          <el-input v-model="form.pstName" placeholder="请输入岗位名称" />
        </el-form-item>
        <el-form-item label="人员名称" prop="nameUser">
          <el-input v-model="form.nameUser" placeholder="请输入人员名称" />
        </el-form-item>
        <el-form-item label="人员编码" prop="nameCode">
          <el-input v-model="form.nameCode" placeholder="请输入人员编码" />
        </el-form-item>
        <el-form-item label="分公司编码" prop="offCode">
          <el-input v-model="form.offCode" placeholder="请输入分公司编码" />
        </el-form-item>
        <el-form-item label="ap分公司权限" prop="offAccess">
          <el-select v-model="form.offAccess" placeholder="请选择ap分公司权限">
            <el-option
              v-for="dict in offAccessOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="pos名称" prop="posText">
          <el-input v-model="form.posText" placeholder="请输入pos名称" />
        </el-form-item>
        <el-form-item label="pos岗位" prop="posNames">
          <el-select v-model="form.posNames" placeholder="请选择pos岗位">
            <el-option
              v-for="dict in posNamesOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="pos门店编号" prop="posShop">
          <el-input v-model="form.posShop" placeholder="请输入pos门店编号" />
        </el-form-item>
        <el-form-item label="中台权限组名称" prop="ztAuthor">
          <el-select v-model="form.ztAuthor" placeholder="请选择中台权限组名称">
            <el-option
              v-for="dict in ztAuthorOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>

          <el-form-item label="是否需要新申请编码" prop="gp5">
          <el-input v-model="form.gp5" placeholder="是否需要新申请编码" />
        </el-form-item>

          <!--
        <el-form-item label="备注" prop="beizhu">
          <el-input v-model="form.beizhu" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="组" prop="groupText">
          <el-input v-model="form.groupText" placeholder="请输入组" />
        </el-form-item>
        <el-form-item label="用户组名称" prop="groupName">
          <el-input v-model="form.groupName" placeholder="请输入用户组名称" />
        </el-form-item>
      
        <el-form-item label="备用1" prop="gp1">
          <el-input v-model="form.gp1" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用2" prop="gp2">
          <el-input v-model="form.gp2" placeholder="请输入备用2" />
        </el-form-item>
        <el-form-item label="备用3" prop="gp3">
          <el-input v-model="form.gp3" placeholder="请输入备用3" />
        </el-form-item>
        <el-form-item label="备用4" prop="gp4">
          <el-input v-model="form.gp4" placeholder="请输入备用4" />
        </el-form-item>
        <el-form-item label="备用5" prop="gp5">
          <el-input v-model="form.gp5" placeholder="请输入备用5" />
        </el-form-item>

-->

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel1">取 消</el-button>
      </div>
    </el-dialog>


      <!-- 添加或修改协同办公对话框 -->
    <el-dialog title="添加或修改协同办公对话框_dialog分成多个，实现不同的调用效果" :visible.sync="open1" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单号id" prop="orderid">
          <el-input disabled="true" v-model="form.orderid" placeholder="请输入单号id" />
        </el-form-item>
        <el-form-item label="大区" prop="region">
          <el-input disabled="true" v-model="form.region" placeholder="请输入大区" />
        </el-form-item>
        <el-form-item label="岗位名称" prop="pstName">
          <el-input disabled="true" v-model="form.pstName" placeholder="请输入岗位名称" />
        </el-form-item>
        <el-form-item   label="人员名称" prop="nameUser">
          <el-input disabled="true" v-model="form.nameUser" placeholder="请输入人员名称" />
        </el-form-item>
        <el-form-item   label="人员编码"  prop="nameCode">
          <el-input v-model="form.nameCode" placeholder="请输入人员编码" />
        </el-form-item>
        <el-form-item  label="分公司编码" prop="offCode">
          <el-input v-model="form.offCode" placeholder="请输入分公司编码" />
        </el-form-item>
        <el-form-item label="ap分公司权限" prop="offAccess">
          <el-select v-model="form.offAccess" placeholder="请选择ap分公司权限">
            <el-option
              v-for="dict in offAccessOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="pos名称" prop="posText">
          <el-input v-model="form.posText" placeholder="请输入pos名称" />
        </el-form-item>
        <el-form-item label="pos岗位" prop="posNames">
          <el-select v-model="form.posNames" placeholder="请选择pos岗位">
            <el-option
              v-for="dict in posNamesOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="pos门店编号" prop="posShop">
          <el-input v-model="form.posShop" placeholder="请输入pos门店编号" />
        </el-form-item>
        <el-form-item label="中台权限组名称" prop="ztAuthor">
          <el-select v-model="form.ztAuthor" placeholder="请选择中台权限组名称">
            <el-option
              v-for="dict in ztAuthorOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
          <!--
        <el-form-item label="备注" prop="beizhu">
          <el-input v-model="form.beizhu" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="组" prop="groupText">
          <el-input v-model="form.groupText" placeholder="请输入组" />
        </el-form-item>
        <el-form-item label="用户组名称" prop="groupName">
          <el-input v-model="form.groupName" placeholder="请输入用户组名称" />
        </el-form-item>
      
        <el-form-item label="备用1" prop="gp1">
          <el-input v-model="form.gp1" placeholder="请输入备用1" />
        </el-form-item>
        <el-form-item label="备用2" prop="gp2">
          <el-input v-model="form.gp2" placeholder="请输入备用2" />
        </el-form-item>
        <el-form-item label="备用3" prop="gp3">
          <el-input v-model="form.gp3" placeholder="请输入备用3" />
        </el-form-item>
        <el-form-item label="备用4" prop="gp4">
          <el-input v-model="form.gp4" placeholder="请输入备用4" />
        </el-form-item>
        <el-form-item label="备用5" prop="gp5">
          <el-input v-model="form.gp5" placeholder="请输入备用5" />
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
import { listSysAuthorUser, getSysAuthorUser, delSysAuthorUser, addSysAuthorUser, updateSysAuthorUser, exportSysAuthorUser } from "@/api/system/SysAuthorUser";

export default {
  name: "SysAuthorUser",
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
      // SysAuthorUser表格数据
      SysAuthorUserList: [],
      // 弹出层标题
      title: "",
      open1:false,
      // 是否显示弹出层
      open: false,
      // ap分公司权限字典
      offAccessOptions: [],
      // pos岗位字典
      posNamesOptions: [],
      // 中台权限组名称字典
      ztAuthorOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderid: null,
        region: null,
        pstName: null,
        nameUser: null,
        nameCode: null,
        offCode: null,
        offAccess: null,
        posText: null,
        posNames: null,
        posShop: null,
        ztAuthor: null,
        beizhu: null,
        groupText: null,
        groupName: null,
        gp1: null,
        gp2: null,
        gp3: null,
        gp4: null,
        gp5: null
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
    this.getDicts("off_code_author").then(response => {
      this.offAccessOptions = response.data;
    });
    this.getDicts("pos_names").then(response => {
      this.posNamesOptions = response.data;
    });
    this.getDicts("tz_author").then(response => {
      this.ztAuthorOptions = response.data;
    });
  },
  methods: {
    /** 查询SysAuthorUser列表 */
    getList() {
      this.loading = true;
      listSysAuthorUser(this.queryParams).then(response => {
        this.SysAuthorUserList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // ap分公司权限字典翻译
    offAccessFormat(row, column) {
      return this.selectDictLabel(this.offAccessOptions, row.offAccess);
    },
    // pos岗位字典翻译
    posNamesFormat(row, column) {
      return this.selectDictLabel(this.posNamesOptions, row.posNames);
    },
    // 中台权限组名称字典翻译
    ztAuthorFormat(row, column) {
      return this.selectDictLabel(this.ztAuthorOptions, row.ztAuthor);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    cancel1(){
  this.open1 = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderid: null,
        region: null,
        pstName: null,
        nameUser: null,
        nameCode: null,
        offCode: null,
        offAccess: null,
        posText: null,
        posNames: null,
        posShop: null,
        ztAuthor: null,
        beizhu: null,
        groupText: null,
        groupName: null,
        gp1: null,
        gp2: null,
        gp3: null,
        gp4: null,
        gp5: null
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
      this.title = "添加SysAuthorUser";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSysAuthorUser(id).then(response => {
        this.form = response.data;
        this.open1 = true;
        this.title = "修改SysAuthorUser";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSysAuthorUser(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSysAuthorUser(this.form).then(response => {
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
      this.$confirm('是否确认删除SysAuthorUser编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSysAuthorUser(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有SysAuthorUser数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSysAuthorUser(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
