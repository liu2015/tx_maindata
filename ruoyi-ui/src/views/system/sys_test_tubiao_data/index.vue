<template>
  <!-- <div id="canvas"></div> -->
  <div id="canvas"></div>
</template>

<script>
import { listSys_test_tubiao_data, getSys_test_tubiao_data, delSys_test_tubiao_data, addSys_test_tubiao_data, updateSys_test_tubiao_data, exportSys_test_tubiao_data,listSys_test_tubiao_data_test } from "@/api/system/sys_test_tubiao_data";

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
      queryParamstest:{
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
    myCars:[],
    myCarsvle:[],
    myCarsvle:[],
    myCarstest:[],

  
  persontest: {
      
      },

      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
        mockData: [
        { year: '1991', value: 3 },
        { year: '1992', value: 4 },
        { year: '1993', value: 3.5 },
        { year: '1994', value: 5 },
        { year: '1995', value: 4.9 },
        { year: '1996', value: 6 },
        { year: '1997', value: 7 },
        { year: '1998', value: 9 },
        { year: '1999', value: 13 }
      ],
      textddd:null,

    };
  },
  created() {
    this.getList();
    this.datae();
  },
  mounted() {
    //  this.textddd=JSON.stringify(this.myCars)
     this.textddd= this.myCars.join();
    
    const linePlot = new this.$g2plot.Line('canvas', {
      data: this.myCars,
      xField: 'f1',
      yField: 'f20'
    })
    linePlot.render()

  },

    
  methods: {

       datae() {

         listSys_test_tubiao_data_test(this.queryParamstest).then((result) => {
          const dd= JSON.stringify(result)
          // console.log("这是一个json"+dd)
          //  for (let index = 0; index < result.length; index++) {
          //    console.log("开始遍历")
          //    const element = array[index];
          //    console.log(element)

          //  }
       
         for (let index = 0; index < result.length; index++) {
           
           const element = result[index];
          const vote = {};
          vote.f20=result[index].f20;
          vote.f1=result[index].f1;
          this.myCars.push(vote);

        
      
         }
          console.log(this.myCars)
          // console.log(this.myCarsvle)




          
         }).catch((err) => {
           
         });
      },

  toObj1(key,val){

 var data = {};
            data[key] = val;
           return data;

  },


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
