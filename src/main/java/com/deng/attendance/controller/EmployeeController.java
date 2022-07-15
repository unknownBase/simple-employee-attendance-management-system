package com.deng.attendance.controller;

import com.deng.attendance.entity.Employee;
import com.deng.attendance.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author by djw on 2022/7/15
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/list")
    @ResponseBody
    public List<Employee> employeeList(Model model) {
//        List<Employee> employees = employeeService.findAll();
//        model.addAttribute("employees", employees);
//        return "employee_list";
        return employeeService.findAll();
    }
}
