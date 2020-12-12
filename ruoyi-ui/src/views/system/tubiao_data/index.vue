<template>
  <div class="app-container">
<div >
<div id="myChart" :style="{width: '800px', height: '500px'}"></div>


</div>


    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="单号id" prop="digndanId">
        <el-input
          v-model="queryParams.digndanId"
          placeholder="请输入单号id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="流水id" prop="liushuiId">
        <el-input
          v-model="queryParams.liushuiId"
          placeholder="请输入流水id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="实收金额" prop="shishouJine">
        <el-input
          v-model="queryParams.shishouJine"
          placeholder="请输入实收金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠金额" prop="youhuiJine">
        <el-input
          v-model="queryParams.youhuiJine"
          placeholder="请输入优惠金额"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="huiyuanCall">
        <el-input
          v-model="queryParams.huiyuanCall"
          placeholder="请输入手机号码"
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
          v-hasPermi="['system:tubiao_data:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:tubiao_data:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:tubiao_data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:tubiao_data:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tubiao_dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="单号id" align="center" prop="digndanId" />
      <el-table-column label="流水id" align="center" prop="liushuiId" />
      <el-table-column label="实收金额" align="center" prop="shishouJine" />
      <el-table-column label="优惠金额" align="center" prop="youhuiJine" />
      <el-table-column label="手机号码" align="center" prop="huiyuanCall" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:tubiao_data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:tubiao_data:remove']"
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

    <!-- 添加或修改销售图表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="单号id" prop="digndanId">
          <el-input v-model="form.digndanId" placeholder="请输入单号id" />
        </el-form-item>
        <el-form-item label="流水id" prop="liushuiId">
          <el-input v-model="form.liushuiId" placeholder="请输入流水id" />
        </el-form-item>
        <el-form-item label="实收金额" prop="shishouJine">
          <el-input v-model="form.shishouJine" placeholder="请输入实收金额" />
        </el-form-item>
        <el-form-item label="优惠金额" prop="youhuiJine">
          <el-input v-model="form.youhuiJine" placeholder="请输入优惠金额" />
        </el-form-item>
        <el-form-item label="手机号码" prop="huiyuanCall">
          <el-input v-model="form.huiyuanCall" placeholder="请输入手机号码" />
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
import { listTubiao_data, getTubiao_data, delTubiao_data, addTubiao_data, updateTubiao_data, exportTubiao_data } from "@/api/system/tubiao_data";

export default {
  name: "Tubiao_data",
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
      // 销售图表表格数据
      tubiao_dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 30,
        digndanId: null,
        liushuiId: null,
        shishouJine: null,
        youhuiJine: null,
        huiyuanCall: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  mounted () {

    this.drawLine()


  },

  created() {
    this.getList();
  },
  methods: {
       drawLine(){

listTubiao_data(this.queryParams).then(response => {
        this.tubiao_dataList = response.rows;
  //  取出key放到一个地方去\
        const keys=[]
        const vluestest=[]
        this.tubiao_dataList.forEach(element => {
          console.log(element)
          keys.push(element.digndanId)
          vluestest.push(element.shishouJine)

        });

             console.log(keys)

            // 基于准备好的dom，初始化echarts实例
            const myChart = this.$echarts.init(document.getElementById('myChart'))
            // 绘制图表
            myChart.setOption({
                title: { text: '在Vue中使用echarts' },
                tooltip: {},
                xAxis: {
                    type: 'category',
                    data: keys
                },
                yAxis: {
                  type: 'value'
                },
                series: [{
                    type: 'bar',
                    data: vluestest
                    
                }]
            });
         });
        },



    /** 查询销售图表列表 */
    getList() {
      this.loading = true;
      listTubiao_data(this.queryParams).then(response => {
        this.tubiao_dataList = response.rows;
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
        digndanId: null,
        liushuiId: null,
        shishouJine: null,
        youhuiJine: null,
        huiyuanCall: null
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
      this.ids = selection.map(item => item.digndanId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加销售图表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const digndanId = row.digndanId || this.ids
      getTubiao_data(digndanId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改销售图表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.digndanId != null) {
            updateTubiao_data(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTubiao_data(this.form).then(response => {
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
      const digndanIds = row.digndanId || this.ids;
      this.$confirm('是否确认删除销售图表编号为"' + digndanIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delTubiao_data(digndanIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有销售图表数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportTubiao_data(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
