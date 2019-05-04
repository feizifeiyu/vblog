package com.feizifeiyu.vblog.admin.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 非子非鱼
 * @date 2019-03-09
 */
@Data
public class QueryPage implements Serializable {

    private int pageCode;
    private int pageSize;
}
