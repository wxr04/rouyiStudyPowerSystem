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
      <el-form-item label="区域" prop="deptId">
        <el-select
          v-model="queryParams.deptId"
          placeholder="请输入设备所在的区域"
          size="mini"
          @change="changeArea"
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



    <el-tabs  tab-position="left" @tab-click="tabClick" v-model="tabName">
      <el-tab-pane label="月报表" name="月报表">
        <el-row>

          <!-- <el-col :span="18" >-->
          <el-row :gutter="10" class="mb8">

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
          <el-table  border :data="energyMonthList" :row-key="getRowKeys" @selection-change="handleSelectionChange">
            <!-- <el-table-column type="selection" reserve-selection="true" width="55" align="center" />-->
            <el-table-column fixed label="线路名称" align="center" prop="devName" width="155">

            </el-table-column>
            <el-table-column align="center" v-for="(item,i) in this.dFiledListMonth" :label="item">
              <template slot-scope="scope">
                {{formatDataMethod(scope.row.energyData,i)}}
              </template>
            </el-table-column>
            <el-table-column label="总计" prop="totalEnergy" align="center" class-name="small-padding fixed-width">

            </el-table-column>
          </el-table>
          <!--  </el-col>-->
        </el-row>
        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-tab-pane>
      <el-tab-pane label="年报表" name="年报表">
        <el-row>

          <!-- <el-col :span="18" >-->
          <el-row :gutter="10" class="mb8">

            <el-col :span="1.5">
              <el-button
                type="warning"
                plain
                icon="el-icon-download"
                size="mini"
                @click="handleExport"
                v-hasPermi="['analysis:energyYear:export']"
              >导出</el-button>
            </el-col>
            <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
          </el-row>
          <el-table  border :data="energyMonthList" :row-key="getRowKeys" @selection-change="handleSelectionChange">
            <!-- <el-table-column type="selection" reserve-selection="true" width="55" align="center" />-->
            <el-table-column fixed label="线路名称" align="center" prop="devName" width="155">

            </el-table-column>
            <el-table-column align="center" v-for="(item,i) in this.dFiledListYear" :label="item">
              <template slot-scope="scope">
                {{formatDataMethod(scope.row.energyData,i)}}
              </template>
            </el-table-column>
            <el-table-column label="总计" prop="totalEnergy" align="center" class-name="small-padding fixed-width">

            </el-table-column>
          </el-table>
          <!--  </el-col>-->
        </el-row>
        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-tab-pane>
    </el-tabs>
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
import { listEnergyMonth, getEnergyMonth, delEnergyMonth, addEnergyMonth, updateEnergyMonth } from "@/api/analysis/energyMonth";
import {listDevTree,listDept } from "@/api/system/dept";
import {listEnergyYear} from  "@/api/analysis/energyYear"

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
      //区域列表数据
      areaList: [],
      //动态列表
      dFiledListMonth:[],
      dFiledListYear:[],
      //设备树
      // 部门树选项
      devTree: undefined,

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
      tabName:'月报表',
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
    this.getAreaList();
   // this.getDevTree();
    this.getDymaticFieldList();
  },
  mounted() {
    this.queryParams.collectTime=this.parseTime(new Date().getTime());
  },
  methods: {
    /*
    * 当切换月电能表和年电能表切换时，更改表头
    * */
    tabClick(){
      if(this.tabName==="月报表"){
        console.log("this is 月报表");
      }
      else {
        console.log("this is 年报表");
      }
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
    //查看日电能数据
    formatDataMethod(columnArray,dayId){
      if(dayId<=columnArray.length)
        return columnArray[dayId];
    },
    //动态表头的生成
    getDymaticFieldList(){
      for(let i=0;i<31;i++){
        this.dFiledListMonth[i]=(i+1)+"日";
      }
      for(let i=0;i<12;i++){
        this.dFiledListYear[i]=(i+1)+"月";
      }

    },
    /*获取yyyy-mm格式时间*/
    getTime(data){
      this.queryParams.collectTime=data;
      console.log(this.queryParams.collectTime);
    },
    /*获取设备树内容*/
    getDevTree(){
     listDevTree(this.queryTreeParams).then(respose=>{
       this.devTree=respose.data;
       console.log("this is devTree:"+this.devTree);
     });
    },

    /** 查询powerEnergy analysis in month列表 */
    getList() {


      this.loading = true;
     // let searchParams=this.setParams(this.queryParams,selectDevs);
      if(this.tabName=="月报表"){
        listEnergyMonth(this.queryParams).then(response => {
          this.energyMonthList = response.rows;
          this.total = response.total;
          this.loading = false;

        });
      }
      else {//年报表
        listEnergyYear(this.queryParams).then(response => {
          this.energyMonthList = response.rows;
          this.total = response.total;
          this.loading = false;

        });
      }

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
      this.ids=[];
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
      if(this.tabname=="月报表"){
        this.download('analysis/energyMonth/export', {
          ...this.queryParams
        }, `月电能报表_${new Date().getTime()}.xlsx`)
      }
      else {
        this.download('analysis/energyYear/export', {
          ...this.queryParams
        }, `年电能报表_${new Date().getTime()}.xlsx`)
      }

     // }, `月电能报表_${this.queryParams.collectTime}.xlsx`)
    }
  }
};
</script>
