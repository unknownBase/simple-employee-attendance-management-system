package com.deng.attendance.service;

import com.deng.attendance.entity.Employee;

import java.util.List;

/**
 * @Author by djw on 2022/7/15
 */
public interface EmployeeService {
    List<Employee> findAll();
}
