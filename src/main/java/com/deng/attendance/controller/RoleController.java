package com.deng.attendance.controller;

import com.deng.attendance.entity.Role;
import com.deng.attendance.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author by djw on 2022/5/24
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/list")
    public String RoleList(Model model){
        List<Role> roles = roleService.findAll();
        model.addAttribute("roles", roles);
        return "role_list";
    }

    @PostMapping("/add")
    @ResponseBody
    public int addRole(Role role){
        return roleService.save(role);
    }

    @GetMapping("/updatePage/{id}")
    @ResponseBody
    public Role updatePage(@PathVariable int id){
        return roleService.get(id);
    }

    @PostMapping("/update")
    @ResponseBody
    public Role updateRole(Role role){
        return roleService.update(role);
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public Integer delete(@PathVariable Integer id) {
        return roleService.delete(id);
    }

}
