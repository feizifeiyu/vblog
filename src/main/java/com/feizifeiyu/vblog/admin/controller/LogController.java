package com.feizifeiyu.vblog.admin.controller;

import com.feizifeiyu.vblog.admin.annotation.Log;
import com.feizifeiyu.vblog.admin.dto.QueryPage;
import com.feizifeiyu.vblog.admin.dto.ResponseCode;
import com.feizifeiyu.vblog.admin.entity.SysLog;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.service.LogService;
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
@RequestMapping("/log")
public class LogController extends BaseController {

    @Autowired
    private LogService logService;

    @PostMapping("/list")
    public ResponseCode findByPage(QueryPage page, SysLog log) {
        return ResponseCode.success(super.selectByPageNumSize(page, () -> logService.findByPage(log)));
    }

    @Log("删除系统日志")
    @PostMapping("/delete")
    @RequiresPermissions("log:delete")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            logService.deleteLogs(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
