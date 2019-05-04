package com.feizifeiyu.vblog.admin.service;

import com.feizifeiyu.vblog.admin.entity.SysLog;
import com.feizifeiyu.vblog.common.service.BaseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.scheduling.annotation.Async;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2019-03-13
 */
public interface LogService extends BaseService<SysLog> {

    List<SysLog> findByPage(SysLog log);

    void deleteLogs(List<Long> ids);

    @Async
    void saveLog(ProceedingJoinPoint proceedingJoinPoint, SysLog log) throws JsonProcessingException;
}
