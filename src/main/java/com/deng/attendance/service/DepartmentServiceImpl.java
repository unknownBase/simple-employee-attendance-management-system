package com.deng.attendance.service;

import com.deng.attendance.entity.Department;
import com.deng.attendance.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @Author by djw on 2022/5/10
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{
    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public List<Department> findAll() {
        List<Department> departments = departmentRepository.findAll();
        return departmentRepository.findAll();
    }

    @Override
    public Department get(int id) {
        return departmentRepository.get(id);
    }

    @Override
    public int save(Department department) {
        return departmentRepository.save(department);
    }

    @Override
    public int update(Department department) {
        return departmentRepository.update(department);
    }

    @Override
    public int delete(int id) {
        return departmentRepository.delete(id);
    }
}
