package com.feizifeiyu.vblog.common.service;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/16
 */
public interface BaseService<T> {

    List<T> selectAll();

    T selectByKey(Object key);

    void save(T entity);

    void delete(Object key);

    void batchDelete(List<Long> ids, String property, Class<T> clazz);

    void updateAll(T entity);

    void updateNotNull(T entity);

    List<T> selectByExample(Object example);
}
