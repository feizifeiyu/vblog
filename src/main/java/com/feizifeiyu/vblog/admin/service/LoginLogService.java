package com.feizifeiyu.vblog.admin.service;


import com.feizifeiyu.vblog.admin.entity.LoginLog;
import com.feizifeiyu.vblog.common.service.BaseService;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2019-03-13
 */
public interface LoginLogService extends BaseService<LoginLog> {

    List<LoginLog> findByPage(LoginLog log);

    void delete(List<Long> ids);

    void saveLog(LoginLog log);
}
