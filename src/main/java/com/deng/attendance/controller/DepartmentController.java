package com.deng.attendance.controller;

import com.deng.attendance.entity.Department;
import com.deng.attendance.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author by djw on 2022/5/10
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    // 查询所有部门信息
    @GetMapping("/list")
    public String departmentList(Model model) {
        List<Department> departments = departmentService.findAll();
        model.addAttribute("departments", departments);
        return "department_list";
    }

    @RequestMapping("/addPage")
    public String addPage(){
        return "department_add";
    }

    // 新建部门
    @RequestMapping("/add")
    public String addDepartment(Department department){
        departmentService.save(department);
//        System.out.println("添加的数据");
//        System.out.println(department);
        return "redirect:/department/list";
    }

    //根据id查找部门信息
    @GetMapping("/updatePage/{id}")
    public String updatePage(Model model, @PathVariable int id){
        Department departments = departmentService.get(id);
//        System.out.println(departments);
        model.addAttribute("departments",departments);
        return "department_edit";
    }

    // 更新部门信息
    @PostMapping("/update")
    public String updateDepartment(Model model, Department department, HttpServletRequest request){
        String id = request.getParameter("id");
        Department departmentById = departmentService.get(Integer.parseInt(id));
        departmentService.update(department);
//        System.out.println("更新前后数据对比");
//        System.out.println(departmentById);
//        System.out.println(department);
        return "redirect:/department/list";
    }

    //删除数据
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, HttpServletResponse servletResponse) throws IOException {
        int count =departmentService.delete(id);
        if(count==1){
            servletResponse.sendRedirect("/list");
        }
        return "404";
    }
}
