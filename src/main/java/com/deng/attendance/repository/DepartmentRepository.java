package com.deng.attendance.repository;

import com.deng.attendance.entity.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @Author by djw on 2022/5/10
 */
@Mapper
public interface DepartmentRepository {
    List<Department> findAll();

    Department get(int id);

    int save(Department department);

    int update(Department department);

    int delete(int id);
}
