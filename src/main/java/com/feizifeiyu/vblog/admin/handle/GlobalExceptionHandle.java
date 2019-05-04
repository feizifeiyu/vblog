package com.feizifeiyu.vblog.admin.handle;

import com.feizifeiyu.vblog.admin.dto.ResponseCode;
import com.feizifeiyu.vblog.admin.enums.StatusEnums;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletResponse;

/**
 * @author 非子非鱼
 * @date 2019-03-09
 */
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandle {

    @ExceptionHandler(value = Exception.class)
    public ResponseCode exception(Exception e) {
        e.printStackTrace();
        return new ResponseCode(StatusEnums.SYSTEM_ERROR);
    }

    @ExceptionHandler(value = GlobalException.class)
    public ResponseCode globalExceptionHandle(GlobalException e, HttpServletResponse response) {
        e.printStackTrace();
        return new ResponseCode(response.getStatus(), e.getMsg());
    }
}