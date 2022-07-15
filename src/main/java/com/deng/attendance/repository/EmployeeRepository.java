package com.deng.attendance.repository;

import com.deng.attendance.entity.Employee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author by djw on 2022/7/15
 */
@Mapper
public interface EmployeeRepository {
    List<Employee> findAll();
}
