package com.deng.attendance.entity;

import org.springframework.stereotype.Repository;

/**
 * @Author by djw on 2022/5/24
 */
@Repository
public class Role {
    private Integer id;
    private String role_name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", role_name='" + role_name + '\'' +
                '}';
    }
}
