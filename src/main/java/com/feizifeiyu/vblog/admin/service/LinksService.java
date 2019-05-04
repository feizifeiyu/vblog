package com.feizifeiyu.vblog.admin.service;

import com.feizifeiyu.vblog.admin.entity.Links;
import com.feizifeiyu.vblog.common.service.BaseService;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/19
 */
public interface LinksService extends BaseService<Links> {

    /**
     * 查询总记录数
     *
     * @return
     */
    Long findAllCount();

    /**
     * 查询所有
     *
     * @return
     */
    List<Links> findAll();

    /**
     * 分页查询
     *
     * @param link 查询条件
     * @return
     */
    List<Links> findByPage(Links link);

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    Links findById(Long id);

    /**
     * 更新
     *
     * @param link
     */
    void update(Links link);

    /**
     * 删除
     *
     * @param ids
     */
    void delete(List<Long> ids);
}
