package com.ruoyi.analysis.domain;

import com.ruoyi.common.core.domain.entity.SysDept;

import java.util.ArrayList;
import java.util.List;

//设备数据树内容
public class DevTree {
    private int id;
    private String label;
    private List<DevTree> children = new ArrayList<DevTree>();
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<DevTree> getChildren() {
        return children;
    }

    public void setChildren(List<DevTree> children) {
        this.children = children;
    }
}
