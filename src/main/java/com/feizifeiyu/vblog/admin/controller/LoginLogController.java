package com.feizifeiyu.vblog.admin.controller;

import com.feizifeiyu.vblog.admin.annotation.Log;
import com.feizifeiyu.vblog.admin.dto.QueryPage;
import com.feizifeiyu.vblog.admin.dto.ResponseCode;
import com.feizifeiyu.vblog.admin.entity.LoginLog;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.service.LoginLogService;
import com.feizifeiyu.vblog.common.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2019-03-13
 */
@RestController
@RequestMapping("/loginlog")
public class LoginLogController extends BaseController {

    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("/list")
    public ResponseCode findByPage(QueryPage queryPage, LoginLog loginLog) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage, () -> loginLogService.findByPage(loginLog)));
    }

    @Log("删除登录日志")
    @PostMapping("/delete")
    @RequiresPermissions("loginlog:list")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            loginLogService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
