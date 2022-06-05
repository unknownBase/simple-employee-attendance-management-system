package com.deng.attendance.service;

import com.deng.attendance.entity.Role;
import com.deng.attendance.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author by djw on 2022/5/24
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<Role> findAll() {
        return roleRepository.findAll();
    }

    @Override
    public Role get(int id) {
        return roleRepository.get(id);
    }

    @Override
    public int save(Role role) {
        return roleRepository.save(role);
    }

    @Override
    public Role update(Role role) {
        roleRepository.update(role);
        return role;
    }

    @Override
    public int delete(int id) {
        return roleRepository.delete(id);
    }
}
