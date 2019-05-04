package com.feizifeiyu.vblog.admin.service;

import com.feizifeiyu.vblog.admin.entity.ArticleCategory;
import com.feizifeiyu.vblog.common.service.BaseService;

/**
 * @author 非子非鱼
 * @date 2018/10/22
 */
public interface ArticleCategoryService extends BaseService<ArticleCategory> {

    /**
     * 根据文章ID删除
     *
     * @param id
     */
    void deleteByArticleId(Long id);

    /**
     * 根据分类ID删除
     *
     * @param id
     */
    void deleteByCategoryId(Long id);
}
