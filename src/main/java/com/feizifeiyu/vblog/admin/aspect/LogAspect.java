package com.feizifeiyu.vblog.admin.aspect;

import com.feizifeiyu.vblog.admin.entity.SysLog;
import com.feizifeiyu.vblog.admin.entity.User;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.service.LogService;
import com.feizifeiyu.vblog.admin.utils.HttpContextUtil;
import com.feizifeiyu.vblog.admin.utils.IPUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 非子非鱼
 * @date 2019-03-26
 */
@Aspect
@Component
public class LogAspect {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LogService logService;

    @Pointcut("@annotation(com.feizifeiyu.vblog.admin.annotation.Log)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws JsonProcessingException {
        Object result = null;
        long beginTime = System.currentTimeMillis();
        try {
            result = proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw new GlobalException(throwable.getMessage());
        }
        //获取Request请求
        HttpServletRequest request = HttpContextUtil.getHttpServletRequest();
        //设置IP地址
        String ip = IPUtil.getIpAddr(request);
        //记录时间（毫秒）
        long time = System.currentTimeMillis() - beginTime;
        //保存日志
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        SysLog log = new SysLog();
        log.setUsername(user.getUsername());
        log.setIp(ip);
        log.setTime(time);
        logService.saveLog(proceedingJoinPoint, log);
        return result;
    }
}