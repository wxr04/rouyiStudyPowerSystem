<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
       <el-form-item label="设备名称" prop="devName">
        <el-input
          v-model="queryParams.devName"
          placeholder="设备名称"
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

      <el-form-item label="创建时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
          v-hasPermi="['alarm:alarm:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="alarmList" @selection-change="handleSelectionChange">
      <!--<el-table-column type="selection" width="55" align="center" />
      <el-table-column label="读取" align="center" prop="read" >
        <template slot-scope="scope">
            <template v-if="scope.row.read==1">

              <svg-icon icon-class="inbox"/>
            </template>
          <template v-else >

            <svg-icon icon-class="envelope"/>
          </template>
          &lt;!&ndash;<template  v-else>
            <svg-icon class-name="eye-open-icon" icon-class="eye-open"/>
          </template>&ndash;&gt;
          </template>
      </el-table-column>-->
      <el-table-column label="报警设备" align="left" prop="devName">
      </el-table-column>
      <el-table-column label="报警类别" align="left" prop="alarmExplain" />
      <el-table-column label="报警值" align="left" prop="alarmValue"/>
      <el-table-column label="报警限值" align="left" prop="limitValue"/>
      <el-table-column label="报警时间" align="center" prop="alarmTimeS" width="180">
        <!--<template slot-scope="scope">
          <span>{{ parseTime(scope.row.AlarmTime) }}</span>
        </template>-->
      </el-table-column>


    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改报警查询对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="读取" prop="isRead">
          <el-input v-model="form.IOServerName" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="内容" prop="MachineName">
          <el-input v-model="form.MachineName" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="时间" prop="AlarmTime">
          <el-input v-model="form.TagName" type="textarea" placeholder="请输入内容" />
        </el-form-item>

        <el-form-item label="${comment}" prop="ResumeValue">
          <el-input v-model="form.ResumeValue" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="${comment}" prop="AlarmText">
          <el-input v-model="form.AlarmText" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="${comment}" prop="ExtendField1">
          <el-input v-model="form.ExtendField1" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="${comment}" prop="ExtendField2">
          <el-input v-model="form.ExtendField2" type="textarea" placeholder="请输入内容" />
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
import { listAlarm, getAlarm, delAlarm, addAlarm, updateAlarm } from "@/api/powerMonitor/alarm";
import {listDept} from "@/api/system/dept";

export default {
  name: "Alarm",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 日期范围
      dateRange: [],
      //区域
      areaList:[],
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
      // 报警查询表格数据
      alarmList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        depId: null,
        devName: null,
        messageId: null,
        read: null,
        GroupName: null,
        AlarmValue: null,
        AlarmValueDataType: null,
        LimitValue: null,
        LimitValueDataType: null,
        AlarmType: null,
        Pri: null,
        Quality: null,
        AlarmTime: null,
        AlarmTimeMs: null,
        alarmExplain: null,
        EventTimeMs: null,
        OperatorName: null,
        OperatorDomain: null,
        ResumeValue: null,
        ResumeValueDataType: null,
        EventType: null,
        AlarmText: null,
        ExtendField1: null,
        ExtendField2: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
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
    /** 查询报警查询列表 */
    getList() {
      this.loading = true;
      listAlarm(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.alarmList = response.rows;
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
        IOServerName: null,
        MachineName: null,
        TagName: null,
        TagComment: null,
        GroupName: null,
        AlarmValue: null,
        AlarmValueDataType: null,
        LimitValue: null,
        LimitValueDataType: null,
        AlarmType: null,
        Pri: null,
        Quality: null,
        AlarmTime: null,
        AlarmTimeMs: null,
        EventTime: null,
        EventTimeMs: null,
        OperatorName: null,
        OperatorDomain: null,
        ResumeValue: null,
        ResumeValueDataType: null,
        EventType: null,
        AlarmText: null,
        ExtendField1: null,
        ExtendField2: null
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
      this.title = "添加报警查询";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAlarm(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改报警查询";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAlarm(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAlarm(this.form).then(response => {
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
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除报警查询编号为"' + ids + '"的数据项？').then(function() {
        return delAlarm(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('powerMonitor/alarm/export', {
        ...this.queryParams
      }, `alarm_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
