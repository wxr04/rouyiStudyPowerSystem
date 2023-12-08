<template>
  <div class="app-container">
    <el-form :model="this.queryParams" :rules="rules" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="日期" >
        <el-date-picker clearable
          v-model="queryParams.collectTime"
          type="month"
          value-format="yyyy-MM-dd"
          placeholder="请选择月份"
          @change="getTime"
          :picker-options="setMonthDisabled"
        >
        </el-date-picker >
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>


    <el-row>
      <el-col :span="4" :xs="24">
      <el-tree
        :data="devTree"
        show-checkbox
        node-key="id"
        ref="tree"
        :default-expanded-keys="[2, 3]"
        :default-checked-keys="[5]">
      </el-tree>
        <div class="buttons">
          <el-button @click="getCheckedNodes">通过 node 获取</el-button>
          <el-button @click="getCheckedKeys">通过 key 获取</el-button>

          <el-button @click="resetChecked">清空</el-button>
        </div>

      </el-col>
      <el-col :span="18" >
        <el-row :gutter="10" class="mb8">
          <!--部门数据-->
          <el-col :span="4" :xs="24">
            <!-- <div class="head-container">
               <el-input
                 v-model="deptName"
                 placeholder="请输入部门名称"
                 clearable
                 size="small"
                 prefix-icon="el-icon-search"
                 style="margin-bottom: 20px"
               />
             </div>-->
            <div class="head-container">

            </div>
          </el-col>


          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['analysis:energyMonth:export']"
            >导出</el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>
        <el-row>
          <el-table  border :data="energyMonthList" :row-key="getRowKeys" @selection-change="handleSelectionChange">
            <!-- <el-table-column type="selection" reserve-selection="true" width="55" align="center" />-->
            <el-table-column fixed label="线路名称" align="center" prop="devName" width="155">

            </el-table-column>
            <el-table-column align="center" v-for="(item,i) in this.dFiledList" :label="item">
              <template slot-scope="scope">
                {{formatDataMethod(scope.row.energyData,i)}}
              </template>
            </el-table-column>
            <el-table-column label="总计" prop="totalEnergy" align="center" class-name="small-padding fixed-width">

            </el-table-column>
          </el-table>
        </el-row>
        <el-row >
          <!--图表-->
          <div ref="energyChart" style="height:500px;padding:0"></div>

        </el-row>
     <!--<pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />-->
      </el-col>
    </el-row>


    <!-- 添加或修改powerEnergy analysis in month对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { compareEnergyMonth, getEnergyMonth, delEnergyMonth, addEnergyMonth, updateEnergyMonth } from "@/api/analysis/energyMonth";
import {listDevTree,listDept } from "@/api/system/dept";
import * as echarts from 'echarts';
export default {
  name: "EnergyMonth",
  data() {
    return {
      /*
   * 选择时间不能超过2年
   * */
      setMonthDisabled: {
        disabledDate(time) {
          // 获取当前的月份信息
          const date = new Date(); // 获取当前的时间基本信息，值是这样的： Tue Jul 20 2021 14:59:43 GMT+0800 (中国标准时间)
          const year = date.getFullYear(); // 获取当前年份，值是这样的： 2021
          let month = date.getMonth() + 1; // 获取当前月份，值是这样的： 6   getMonth()方法返回值是0-11，也就是1月份到12月份，所以要加上1，才是当前月份
          if (month >= 1 && month <= 9) {
            // 如果是1月到9月就要在前面补上一个0   比如：02、07    月份这样表示
            month = "0" + month;
          }
          const nowDate = year.toString() + month.toString(); // 转换成字符串拼接，最终得到年和月，比如此时的时间是2021年7月20号，所以nowDate的值是：202107
          //两年前截止时间
          const twoYearBefore=(year-2).toString() + month.toString();
          // 获取时间选择器的月份信息
          const timeyear = time.getFullYear(); // 获取时间选择器的年份（有很多）
          let timemonth = time.getMonth() + 1; // 与上面同理
          if (timemonth >= 1 && timemonth <= 9) {
            timemonth = "0" + timemonth;
          }
          const elTimeData = timeyear.toString() + timemonth.toString();

          // 返回，时间选择器的日期月份大于当前日期的月份，又因为disabledDate函数是控制月份禁用不可选
          // 所以，最终就是：时间选择器的月份大于当前的月份，就都禁用掉，所以就实现了最终效果：
          // 大于等于当前月份都不可选
          if(elTimeData<=twoYearBefore||elTimeData>nowDate)// 这里虽然是字符串，但是弱类型语言js会做一个转换，是可以比较大小的如： '202107' > '202008'
          {
             return true;
          }

          else
            return false;

        }
        },
      // 图表集合
      chart: null,
      //区域列表数据
      areaList: [],
      //动态列表
      dFiledList:[],
      //echarts x坐标
      echartsX:[],
      //选择月的最大天数
      selectMonMaxDays:30,
      //设备树
      // 部门树选项
      devTree: undefined,
      //树形菜单
      data: [{
        id: 11,
        label: '一级 2',
        children: [{
          id: 13,
          label: '二级 2-1',
          children: [{
            id: 4,
            label: '三级 3-1-1'
          }, {
            id: 5,
            label: '三级 3-1-2',
            disabled: true
          }]
        }, {
          id: 2,
          label: '二级 2-2',
          disabled: true,
          children: [{
            id: 6,
            label: '三级 3-2-1'
          }, {
            id: 7,
            label: '三级 3-2-2',
            disabled: true
          }]
        }]
      }],
      defaultProps: {
        children: 'children',
        label: 'label'
      },
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
      // powerEnergy analysis in month表格数据
      energyMonthList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数

      queryParams: {
        deptId:"",
        pageNum: 1,
        pageSize: 10,
        devId: null,
        epp2: null,
        collectTime: ''

      },
      queryTime:null,
      //查询设备树参数
      queryTreeParams: {
        pageNum: 1,
        pageSize: 100,
        areaId:1

      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {

        deptId:[
          {required: true, message: "区域不能为空", trigger:  "changeArea"}
          ],
      }
    };
  },

  created() {
    //this.getList();
    var date=new Date();
   // this.queryParams.collectTime=(date.getTime());
    this.getMonthMaxDays(date);
   // this.getAreaList();
    this.getDevTree();
    this.getDymaticFieldList();


  },
  mounted() {
    this.queryParams.collectTime=this.parseTime(new Date().getTime());
    this.initalEchart();
  },
  methods: {
/*初始化echarts*/
   initalEchart(){
   this.chart=echarts.init(this.$refs.energyChart,'macarons');
     this.chart.setOption({
       title: { text: '在Vue中使用echarts' },
       tooltip: {},
       xAxis: {
         data: this.echartsX
       },
       yAxis: {},
       series: [{
         name: '销量',
         type: 'bar',
         data: [5, 20, 36, 10, 10, 20]
       }]
     });
},
    /*
    * 当区域内容不为空时，清除rules
    * */
    changeArea(){
      this.$refs['queryForm'].clearValidate('deptId')
    },
    //解决翻页选项消失问题
    getRowKeys(row){
      /*console.log("row.id"+row.dictId)
      console.log("row is "+row)*/
      return row.devName;
    },
    //获取区域list
    getAreaList() {
      let queryParams2 = {
        pageSize: 10,
        pageNum: 1,
        userId: this.$store.state.user.userId
      }
      listDept(queryParams2).then(response => {
        this.areaList = response.data;

        console.log('this department is:'+this.areaList[0].deptId);
      });
    },
    //获取每月最大天数
    getMonthMaxDays(dateTime){
      this.selectMonMaxDays=(new Date(dateTime.getFullYear(),(dateTime.getMonth()+1),0)).getDate();
    },
    //查看日电能数据
    formatDataMethod(columnArray,dayId){
      if(dayId<=columnArray.length)
        return columnArray[dayId];
    },
    //动态表头的生成
    getDymaticFieldList(){
      console.log("this selectMonMaxdays is:"+this.selectMonMaxDays);
      for(let i=0;i<this.selectMonMaxDays;i++){
        this.dFiledList[i]=(i+1)+"日";
        if((i+1)%3==1)
          this.echartsX[i]=(i+1)+"日";
        else
          this.echartsX[i]="";
      }
      //console.log(this.dFiledList);
    },
    //根据获取的电能报表设置柱状图
    resetEcharts(energyMonthList){
      let listLength=energyMonthList.length;
      let routeNameList=[];
      let series=[];
      let option;

      if(listLength>0){
        if(listLength>8)
          listLength=8;
        for(let i=0;i<listLength;i++){
           series[i].name=energyMonthList[i].devName;
           series[i].type="bar";
           series[i].data=energyMonthList[i].energyData;
        }
        //x坐标
        routeNameList=this.dFiledList;
        let option={

          xAxis: {
            data: routeNameList
          },
          yAxis: {},
          series: series
        }
        this.chart=echarts.init(this.$refs.energyChart,'macarons');
        this.chart.setOption(option);
      }
    },
    /*获取yyyy-mm格式时间*/
    getTime(data){
      let selectTime=new Date(data);

      //获取选择月的最大天数
      this.getMonthMaxDays(selectTime);
      console.log(this.selectMonMaxDays);
      //this.queryParams.collectTime=data;

    },
    /*获取设备树内容*/
    getDevTree(){
     listDevTree(this.queryTreeParams).then(respose=>{
       this.devTree=respose.data;
       console.log("this is devTree:"+this.devTree);
     });
    },
    /*el-tree*/
    getCheckedNodes() {
      console.log(this.$refs.tree.getCheckedNodes());
    },
    getCheckedKeys() {
      console.log(this.$refs.tree.getCheckedKeys());
    },
    resetChecked() {
      this.$refs.tree.setCheckedKeys([]);
    },
    /** 查询powerEnergy analysis in month列表 */
    getList() {
      let selectDevs=this.$refs.tree.getCheckedKeys();

      this.loading = true;
      if(selectDevs.length===0){
        alert("请选择设备");
        return;
      }
      let searchParams=this.setParams(this.queryParams,selectDevs);
      compareEnergyMonth(searchParams).then(response => {
        this.energyMonthList = response.rows;
        this.total = response.total;
        this.resetEcharts(this.energyMonthList);
        this.loading = false;
        console.log("this.total is :"+this.total);
      });
    },
    //获取查询的时间，还有选择的设备
    setParams(params,selectDevs){

      let search=params;
      search.params = typeof (search.params) === 'object' && search.params !== null && !Array.isArray(search.params) ? search.params : {};
      selectDevs=JSON.stringify(Array.isArray(selectDevs)? selectDevs:[]);
      search.params['devIds']=selectDevs;

      return search;
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
        devId: null,
        epp2: null,
        collectTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.$refs["queryForm"].validate(value=>{
        if(value){
          this.queryParams.pageNum = 1;
          this.getList();

        }
        else{
          this.$modal.alert("搜索项不能为空！")

        }
      });

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
      this.title = "添加powerEnergy analysis in month";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getEnergyMonth(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改powerEnergy analysis in month";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateEnergyMonth(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEnergyMonth(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除powerEnergy analysis in month编号为"' + ids + '"的数据项？').then(function() {
        return delEnergyMonth(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('analysis/energyMonth/export', {
        ...this.queryParams
      }, `月电能报表_${new Date().getTime()}.xlsx`)
     // }, `月电能报表_${this.queryParams.collectTime}.xlsx`)
    }
  }
};
</script>
