package com.feizifeiyu.vblog.admin.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 非子非鱼
 * @date 2019-03-09
 */
public class GlobalException extends RuntimeException {

    @Getter
    @Setter
    private String msg;

    public GlobalException(String message) {
        this.msg = message;
    }
}
