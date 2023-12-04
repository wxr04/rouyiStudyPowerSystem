package com.ruoyi.common.utils.easyExecl;

public class DynamicExcelData {
    //列名
    private String name;
    //默认值
    private String defaultValue;

    public DynamicExcelData(String name, String defaultValue) {
        this.name = name;
        this.defaultValue = defaultValue;
    }

    public String getName() {
        return name;
    }

    public String getDefaultValue() {
        return defaultValue;
    }
}
