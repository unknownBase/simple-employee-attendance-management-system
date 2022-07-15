package com.deng.attendance.entity;

import org.springframework.stereotype.Repository;

/**
 * @Author by djw on 2022/5/10
 */
@Repository
public class Department {
    private Integer id;
    private String departmentName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String department_name) {
        this.departmentName = department_name;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", department_name='" + departmentName + '\'' +
                '}';
    }
}
