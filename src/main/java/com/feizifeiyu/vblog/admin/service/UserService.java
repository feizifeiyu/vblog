package com.feizifeiyu.vblog.admin.service;

import com.feizifeiyu.vblog.admin.entity.Setting;
import com.feizifeiyu.vblog.admin.entity.User;
import com.feizifeiyu.vblog.common.service.BaseService;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/19
 */
public interface UserService extends BaseService<User> {

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    User findById(Long id);

    /**
     * 根据Name查询用户数据
     *
     * @param username
     * @return
     */
    User findByName(String username);

    /**
     * 更新
     *
     * @param user
     */
    void update(User user);

    /**
     * 删除
     *
     * @param ids
     */
    void delete(List<Long> ids);

    /**
     * 获取系统设置数据
     *
     * @return
     */
    Setting findSetting();

    /**
     * 更新设置信息
     *
     * @param setting
     */
    void updateSetting(Setting setting);
}
