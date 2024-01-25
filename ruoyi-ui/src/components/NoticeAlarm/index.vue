<template>
  <div @click.stop="click">
    <i class="el-icon-bell"   ></i>
    <span class="btn-bell-badge" v-if="msgNotRead>0 && msgNotRead<100">{{msgNotRead}}</span>
    <span class="btn-bell-badge" v-else-if="msgNotRead>99" >99+</span>

   <!-- <el-badge :value="message" class="item"></el-badge>-->
  </div>


</template>

<script>
    export default {
        name: "NoticeAlarm",
        props:{
          message: {
            default:2,
            required:true
          }
        },
      data() {
        return {
         /*msgNotRead:this.$store.getters.messageNotRead*/
        };
      },

      computed: {
        msgNotRead() {
         /* console.log("this is store's messageNotRead:"+this.$store.getters.messageNotRead)*/
          return this.$store.getters.messageNotRead
        },

      },
      methods:{
        click(){
          this.$router.push(
            {path: '/device/alarm'})
        }
      }
    }
</script>

<style scoped>
  .btn-bell-badge {
    position: relative;
    right:5px;
    top: -10px;

    background: #f56c6c;
    color: #fff;
    text-align: center;
    font-size: 12px;
    border-radius: 12px;
    padding-left: 3px;
    padding-right:3px ;
     }

  .item  .el-badge__content{
    position: relative;
    right: -5px;
    top: -10px;
    width: 1px;
    height:1px;
    background-color: red !important; /* 设置小红点颜色 */
  }
</style>
