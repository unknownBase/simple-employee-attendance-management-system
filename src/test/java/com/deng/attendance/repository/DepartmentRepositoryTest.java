package com.deng.attendance.repository;

import com.deng.attendance.entity.Department;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * @Author by djw on 2022/5/24
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class DepartmentRepositoryTest {
    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    public void findAll() {
    }

    @Test
    public void get() {
        Department departments = departmentRepository.get(1);
        System.out.println(departments);
    }

    @Test
    public void update() {
    }
}