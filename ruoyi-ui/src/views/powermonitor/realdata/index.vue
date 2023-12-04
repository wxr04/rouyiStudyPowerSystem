<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="devName">
        <el-input
          v-model="queryParams.devName"
          placeholder="请输入设备名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="柜号" prop="devGnum">
        <el-input
          v-model="queryParams.devGnum"
          placeholder="请输入柜号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="区域" prop="deptId">
        <el-select
          v-model="queryParams.deptId"
          placeholder="请输入设备所在的区域"
          size="mini"
          >
          <el-option
        v-for="area1 in areaList"
        :value="area1.deptId"
        :label="area1.deptName"
        :key="area1.deptId"
        >
        </el-option>
        </el-select>
      </el-form-item>



      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['powerMonitor:powerMonitor:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="powerMonitorList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="区域" align="center" prop="dept.deptName" />
      <el-table-column label="柜号" align="center" prop="devGnum" />
      <el-table-column label="设备名称" align="center" prop="devName" />
      <el-table-column label="电能" align="center"  >
        <template slot-scope="scope">
          {{getEpp(scope.row)}}
        </template>
      </el-table-column>
      <el-table-column label="电压a" align="center" prop="Ua" />
      <el-table-column label="电压b" align="center" prop="Ub" />
      <el-table-column label="电压c" align="center" prop="Uc" />
      <el-table-column label="电流a" align="center" prop="Ia" />
      <el-table-column label="电流b" align="center" prop="Ib" />
      <el-table-column label="电流c" align="center" prop="Ic" />
      <el-table-column label="总功率" align="center" prop="P" />
      <el-table-column label="功率因数" align="center" prop="cosQ" />
      <el-table-column label="频率" align="center" prop="F" />
      <el-table-column label="设备状态" align="center" prop="status" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.device_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <!--<el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['powerMonitor:powerMonitor:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['powerMonitor:powerMonitor:remove']"
          >删除</el-button>
        </template>
      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />


  </div>
</template>

<script>
import { listPowerMonitor, getPowerMonitor } from "@/api/powerMonitor/powerMonitor";
import {listDept} from "@/api/system/dept";
export default {
  name: "PowerMonitor",
  dicts: ['device_status'],
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
      // 电力监控表格数据
      powerMonitorList: [],
      //区域列表数据
      areaList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      test:"",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        devName: null,
        devGnum: null,
        status: null,
        deptId: null,
        dept:null,
        devCom: null,
        devAddr: null,
        pt: null,
        ct: null,
        epp: null,
        ua: null,
        ub: null,
        uc: null,
        ia: null,
        ib: null,
        ic: null,
        p: null,
        cosQ: null,
        f: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        devName: [
          { required: true, message: "设备名称不能为空", trigger: "blur" }
        ],
        devGnum: [
          { required: true, message: "柜号不能为空", trigger: "blur" }
        ],
        deptId: [
          { required: true, message: "设备所在的区域不能为空", trigger: "blur" }
        ],
        devCom: [
          { required: true, message: "com口号不能为空", trigger: "blur" }
        ],
        devAddr: [
          { required: true, message: "设备地址不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.loading = true;
    this.getAreaList();
    this.getList();
    this.loading = false;

  },
  methods: {
    //计算电能
    getEpp(row){
      console.log("row is:"+row);
      if(row!=null){
        return row.pt*row.ct;
      }
      return null;
    },
    //获取区域list
    getAreaList() {
      let queryParams = {
        pageSize: 30,
        pageNum: 1,
        userId: this.$store.state.user.userId
      }
      listDept(queryParams).then(response => {
        this.areaList = response.data;
        console.log('this department is:'+this.areaList[0].deptId);
      });
    },
    /** 查询电力监控列表 */
    getList() {

      listPowerMonitor(this.queryParams).then(response => {
        this.powerMonitorList = response.rows;
        this.total = response.total;
        console.log("this.totao is :"+this.total);


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
        devId: null,
        devName: null,
        devGnum: null,
        status: null,
        updateTime: null,
        deptId: null,
        devCom: null,
        devAddr: null,
        Pt: null,
        Ct: null,
        Epp: null,
        Ua: null,
        Ub: null,
        Uc: null,
        Ia: null,
        Ib: null,
        Ic: null,
        P: null,
        cosQ: null,
        F: null
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
      this.ids = selection.map(item => item.devId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加电力监控";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const devId = row.devId || this.ids
      getPowerMonitor(devId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改电力监控";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.devId != null) {
            updatePowerMonitor(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPowerMonitor(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const devIds = row.devId || this.ids;
      this.$modal.confirm('是否确认删除电力监控编号为"' + devIds + '"的数据项？').then(function() {
        return delPowerMonitor(devIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('powerMonitor/powerMonitor/export', {
        ...this.queryParams
      }, `powerMonitor_${new Date().getTime()}.xlsx`)
    }
  },

};
</script>
