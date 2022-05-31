package com.deng.attendance.service;

import com.deng.attendance.entity.Department;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @Author by djw on 2022/5/10
 */
public interface DepartmentService {
    public List<Department> findAll();

    Department get(int id);

    int save(Department department);

    int update(Department department);

    int delete(int id);
}
