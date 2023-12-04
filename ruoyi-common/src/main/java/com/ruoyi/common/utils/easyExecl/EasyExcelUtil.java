package com.ruoyi.common.utils.easyExecl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.excel.util.DateUtils;

import com.github.pagehelper.util.StringUtil;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excels;
import com.ruoyi.common.exception.ServiceException;

import javax.servlet.http.HttpServletResponse;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;

import com.alibaba.excel.write.builder.ExcelWriterBuilder;
//import com.azxc.rapid.modules.dataAnalysis.entity.CountEntityFarmerCooperatives;
import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;


import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Collectors;


public class EasyExcelUtil<T>{
    private static final Logger log = LoggerFactory.getLogger(EasyExcelUtil.class);
    /**
     * 导出类型（EXPORT:导出数据；IMPORT：导入模板）
     */
    private Excel.Type type;
    /**
     * 对象的子列表方法
     */
    private Method subMethod;
    /**
     * 注解列表
     */
    private List<Object[]> fields;

    /**
     * 对象的子列表属性
     */
    private List<Field> subFields;
    /**
     * 需要排除列属性
     */
    public String[] excludeFields;

    public EasyExcelUtil(Class<T> clazz)
    {
        this.clazz = clazz;
    }
    /**
     * 实体对象
     */
    public Class<T> clazz;
    public void init(List<T> list, String sheetName, String title, Excel.Type type)
    {
        if (list == null)
        {
            list = new ArrayList<T>();
        }

        createExcelField();
      //带完成
        //createSubHead();
    }
    /**
     * 得到所有定义字段
     */
    private void createExcelField()
    {
        this.fields = getFields();
        this.fields = this.fields.stream().sorted(Comparator.comparing(objects -> ((Excel) objects[1]).sort())).collect(Collectors.toList());

    }
    /**
     * 获取字段注解信息
     */
    public List<Object[]> getFields()
    {
        List<Object[]> fields = new ArrayList<Object[]>();
        List<Field> tempFields = new ArrayList<>();
        tempFields.addAll(Arrays.asList(clazz.getSuperclass().getDeclaredFields()));
        tempFields.addAll(Arrays.asList(clazz.getDeclaredFields()));
        for (Field field : tempFields)
        {
            if (!ArrayUtils.contains(this.excludeFields, field.getName()))
            {
                // 单注解
                if (field.isAnnotationPresent(Excel.class))
                {
                    Excel attr = field.getAnnotation(Excel.class);
                    if (attr != null && (attr.type() == Excel.Type.ALL || attr.type() == type))
                    {
                        field.setAccessible(true);
                        fields.add(new Object[] { field, attr });
                    }
                    if (Collection.class.isAssignableFrom(field.getType()))
                    {
                        subMethod = getSubMethod(field.getName(), clazz);
                        ParameterizedType pt = (ParameterizedType) field.getGenericType();
                        Class<?> subClass = (Class<?>) pt.getActualTypeArguments()[0];
                        this.subFields = FieldUtils.getFieldsListWithAnnotation(subClass, Excel.class);
                    }
                }

                // 多注解
                if (field.isAnnotationPresent(Excels.class))
                {
                    Excels attrs = field.getAnnotation(Excels.class);
                    Excel[] excels = attrs.value();
                    for (Excel attr : excels)
                    {
                        if (!ArrayUtils.contains(this.excludeFields, field.getName() + "." + attr.targetAttr())
                                && (attr != null && (attr.type() == Excel.Type.ALL || attr.type() == type)))
                        {
                            field.setAccessible(true);
                            fields.add(new Object[] { field, attr });
                        }
                    }
                }
            }
        }
        return fields;
    }
    /**
     * 获取对象的子列表方法
     *
     * @param name 名称
     * @param pojoClass 类对象
     * @return 子列表方法
     */
    public Method getSubMethod(String name, Class<?> pojoClass)
    {
        StringBuffer getMethodName = new StringBuffer("get");
        getMethodName.append(name.substring(0, 1).toUpperCase());
        getMethodName.append(name.substring(1));
        Method method = null;
        try
        {
            method = pojoClass.getMethod(getMethodName.toString(), new Class[] {});
        }
        catch (Exception e)
        {
            log.error("获取对象异常{}", e.getMessage());
        }
        return method;
    }
    /**
     * 以类的属性的get方法方法形式获取值
     *
     * @param o
     * @param name
     * @return value
     * @throws Exception
     */
    private Object getValue(Object o, String name) throws Exception
    {
        if (StringUtils.isNotNull(o) && StringUtils.isNotEmpty(name))
        {
            Class<?> clazz = o.getClass();
            Field field = clazz.getDeclaredField(name);
            field.setAccessible(true);
            o = field.get(o);
        }
        return o;
    }
    public static <T> void exportExcel(List<T> list, String fileName, String sheetName, HttpServletResponse response){
        //设置返回值类型为
        try {
            if(list==null || list.size()==0) {
                throw new ServiceException("无数据可导出！");
            }
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            //编码 防止中文乱码
            fileName = URLEncoder.encode(fileName,"UTF-8");
            response.setHeader("Content-disposition","attachment;filename="+fileName+".xlsx");
            EasyExcel.write(response.getOutputStream(),list.get(0).getClass())
                 // .head(this.fields)
                    .excelType(ExcelTypeEnum.XLSX)
                    .registerWriteHandler(CellStyleUtils.getHorizontalCellStyleStrategy())
                    .registerWriteHandler(new CustomCellWriteHandler())
                    // .registerWriteHandler(new CustomRowWriteHandler())
                    .sheet(sheetName)
                    .doWrite(list);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static <T> void exportExcel(List<T> list, Class<T> clazz,String fileName,String sheetName,HttpServletResponse response){
        //设置返回值类型为
        try {
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            //编码 防止中文乱码
            fileName = URLEncoder.encode(fileName,"UTF-8");
            response.setHeader("Content-disposition","attachment;filename="+fileName+".xlsx");
            EasyExcel.write(response.getOutputStream(),clazz)
                    .excelType(ExcelTypeEnum.XLSX)
                    .registerWriteHandler(CellStyleUtils.getHorizontalCellStyleStrategy())
                    .registerWriteHandler(new CustomCellWriteHandler())
                     //.registerWriteHandler(new CustomRowWriteHandler())
                    .sheet(sheetName)
                    .doWrite(list);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * @param fileName  文件路径名
     * @param sheetName sheet名
     * @param list      查询出来的数据
     * @param headNameMap  传入的Excel头（例如：姓名，生日）
     *
     */
    public static void noModelWriteMy(List<Map<String, Object>>  list,String fileName, String sheetName,LinkedHashMap<String,DynamicExcelData> headNameMap,HttpServletResponse response){
        //设置返回值类型为
        try {
            if(list==null || list.size()==0) {
                throw new ServiceException("无数据可导出！");
            }
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            //编码 防止中文乱码
            fileName = URLEncoder.encode(fileName ,"UTF-8");
            //先初始化一下传入
            int size = list.size();
            List<List<String>> dataList = new ArrayList<>();
            for (int i = 0; i < size; i++) {
                dataList.add(new ArrayList<>());
            }

            //获取表头
            ArrayList<List<String>> head = new ArrayList<>();
            for (Map.Entry<String, DynamicExcelData> titleMap : headNameMap.entrySet()) {
                DynamicExcelData data = titleMap.getValue();
                head.add(Collections.singletonList(data.getName()));
            }
            //数据重组
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> map = list.get(i);
                List<String> columns = dataList.get(i);
                for (Map.Entry<String, DynamicExcelData> sortNameEntry : headNameMap.entrySet()) {
                    String key = sortNameEntry.getKey();
                    Object value = map.get(key);
                    columns.add(value!=null?String.valueOf(value):sortNameEntry.getValue().getDefaultValue());
                }
            }
            response.setHeader("Content-disposition","attachment;filename="+fileName+".xlsx");
            EasyExcel.write(response.getOutputStream())
                    .head(head)
                    .excelType(ExcelTypeEnum.XLSX)
                    .registerWriteHandler(CellStyleUtils.getHorizontalCellStyleStrategy())
                    //.registerWriteHandler(new CustomCellWriteHandler())
                    // .registerWriteHandler(new CustomRowWriteHandler())
                    .sheet(sheetName)
                    .doWrite(dataList);
                  } catch (IOException e) {
            //e.printStackTrace();
            log.error("获取对象异常{}", e.getMessage());
        }
    }
    /**
     * @param fileName  文件路径名
     * @param sheetName sheet名
     * @param list      查询出来的数据
     * @param headList  传入的Excel头（例如：姓名，生日）
     * @param fileList  传入需要展示的字段（例如：姓名对应字段是name,生日对应字段是birthday）
     */
    public static void noModelWrite(List<?> list,String fileName, String sheetName,List<String> headList, List<String> fileList,HttpServletResponse response){
        //设置返回值类型为
        try {
            if(list==null || list.size()==0) {
                throw new ServiceException("无数据可导出！");
            }
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            //编码 防止中文乱码
            fileName = URLEncoder.encode(fileName ,"UTF-8");
            response.setHeader("Content-disposition","attachment;filename="+fileName+".xlsx");
            EasyExcel.write(response.getOutputStream())
                    .head(head(headList))
                    .excelType(ExcelTypeEnum.XLSX)
                    .registerWriteHandler(CellStyleUtils.getHorizontalCellStyleStrategy())
                    .registerWriteHandler(new CustomCellWriteHandler())
                    // .registerWriteHandler(new CustomRowWriteHandler())
                    .sheet(sheetName)
                    .doWrite(dataList(list,fileList));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * @param fileName  文件路径名
     * @param sheetName sheet名
     * @param list      查询出来的数据
     * @param headList  传入的Excel头（例如：姓名，生日）
     * @param fileList  传入需要展示的字段（例如：姓名对应字段是name,生日对应字段是birthday）
     */
    public static void noModelWritePlus(List<?> list,String fileName, String sheetName,List<List<String>> headList, List<String> fileList,HttpServletResponse response){
        //设置返回值类型为
        try {
            if(list==null || list.size()==0) {
                throw new ServiceException("无数据可导出！");
            }
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            //编码 防止中文乱码
            fileName = URLEncoder.encode(fileName ,"UTF-8");
            response.setHeader("Content-disposition","attachment;filename="+fileName+".xlsx");

            ExcelWriterBuilder excelWriterBuilder = EasyExcel.write(response.getOutputStream())
                    .head(headList)
                    .excelType(ExcelTypeEnum.XLSX)
                    .registerWriteHandler(CellStyleUtils.getHorizontalCellStyleStrategy())
                    .registerWriteHandler(new CustomCellWriteHandler());
           /* if(list.size()>0 & list.get(0).getClass()== CountEntityFarmerCooperatives.class){
                excelWriterBuilder.registerWriteHandler(new ExcelFillCellMergeStrategy());
            }*/
            excelWriterBuilder.sheet(sheetName)
                    .doWrite(dataList(list,fileList));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 设置Excel头
     * @param headList  Excel头信息
     * @return
     */
    private static List<List<String>> head(List<String> headList) {
        List<List<String>> list = new ArrayList<>();
        for (String value : headList) {
            List<String> head = new ArrayList<>();
            head.add(value);
            list.add(head);
        }
        return list;
    }
    /**
     * 设置表格信息
     * @param dataList  查询出的数据
     * @param fileList  需要显示的字段
     * @return
     */
    private static List<List<?>> dataList(List<?> dataList, List<String> fileList) {
        List<List<?>> list = new ArrayList<>();
        for (Object person : dataList) {
            List<Object> data = new ArrayList<>();
            for (String fieldName : fileList) {
                /**通过反射根据需要显示的字段，获取对应的属性值*/
                data.add(getFieldValue(fieldName, person));
            }
            list.add(data);
        }
        return list;
    }
    /**
     * 根据传入的字段获取对应的get方法，如name,对应的getName方法
     * @param fieldName  字段名
     * @param person    对象
     * @return
     */
    private static Object getFieldValue(String fieldName, Object person) {
        try {
            String firstLetter = fieldName.substring(0, 1).toUpperCase();
            String getter = "get" + firstLetter + fieldName.substring(1);
            Method method = person.getClass().getMethod(getter);
            return method.invoke(person);
        } catch (Exception e) {
            return null;
        }
    }

    public static MultipartFile fileToMultipartFile(File file,String contentType) {
        if (StringUtil.isEmpty(contentType)){
            contentType="text/plain";
        }
        FileItem fileItem = createFileItem(file,contentType);
        MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
        return multipartFile;
    }

    private static FileItem createFileItem(File file,String contentType) {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        FileItem item = factory.createItem("textField", contentType, true, file.getName());
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        try {
            FileInputStream fis = new FileInputStream(file);
            OutputStream os = item.getOutputStream();
            while ((bytesRead = fis.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return item;
    }
}



