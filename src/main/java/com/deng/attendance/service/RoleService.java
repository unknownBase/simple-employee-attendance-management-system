package com.deng.attendance.service;

import com.deng.attendance.entity.Role;

import java.util.List;

/**
 * @Author by djw on 2022/5/24
 */
public interface RoleService {
    List<Role> findAll();

    Role get(int id);

    int save(Role role);

    Role update(Role role);

    int delete(int id);
}
