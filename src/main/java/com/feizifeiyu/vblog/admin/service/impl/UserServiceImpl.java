package com.feizifeiyu.vblog.admin.service.impl;

import com.feizifeiyu.vblog.admin.entity.Setting;
import com.feizifeiyu.vblog.admin.mapper.SettingMapper;
import com.feizifeiyu.vblog.admin.utils.PasswordHelper;
import com.feizifeiyu.vblog.admin.entity.User;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.mapper.UserMapper;
import com.feizifeiyu.vblog.admin.service.UserService;
import com.feizifeiyu.vblog.common.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/18
 */
@Service
@SuppressWarnings("all")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordHelper passwordHelper;

    @Override
    public User findById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public void save(User user) {
        try {
            passwordHelper.encryptPassword(user); //加密
            userMapper.insert(user);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @Override
    @Transactional
    public void update(User user) {
        if (user.getId() != 0) {
            try {
                if (user.getPassword() != null && !"".equals(user.getPassword())) {
                    passwordHelper.encryptPassword(user); //加密
                }
                this.updateNotNull(user);
            } catch (Exception e) {
                e.printStackTrace();
                throw new GlobalException(e.getMessage());
            }
        }
    }

    @Override
    @Transactional
    public void delete(List<Long> ids) {
        if (!ids.isEmpty()) {
            try {
                this.batchDelete(ids, "id", User.class);
            } catch (Exception e) {
                e.printStackTrace();
                throw new GlobalException(e.getMessage());
            }
        }
    }

    @Override
    public User findByName(String username) {
        if (!username.isEmpty()) {
            User user = new User();
            user.setUsername(username);
            return userMapper.select(user).get(0);
        } else {
            return new User();
        }
    }

    @Autowired
    private SettingMapper settingMapper;

    @Override
    public Setting findSetting() {
        return settingMapper.selectAll().get(0);
    }

    @Override
    @Transactional
    public void updateSetting(Setting setting) {
        settingMapper.updateByPrimaryKeySelective(setting);
    }
}
