package com.deng.attendance.entity;

import org.springframework.stereotype.Repository;

/**
 * @Author by djw on 2022/5/10
 */
@Repository
public class Department {
    private Integer id;
    private String department_name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", department_name='" + department_name + '\'' +
                '}';
    }
}
