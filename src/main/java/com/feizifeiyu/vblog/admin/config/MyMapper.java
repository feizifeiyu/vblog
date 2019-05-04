package com.feizifeiyu.vblog.admin.config;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @author 非子非鱼
 * @date 2019-03-25
 */
public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T> {
}
