package com.deng.attendance.repository;

import com.deng.attendance.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author by djw on 2022/5/24
 */
@Mapper
public interface RoleRepository {
    List<Role> findAll();
}
