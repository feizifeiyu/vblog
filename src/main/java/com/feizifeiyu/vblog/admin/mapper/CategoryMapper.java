package com.feizifeiyu.vblog.admin.mapper;

import com.feizifeiyu.vblog.admin.config.MyMapper;
import com.feizifeiyu.vblog.admin.entity.Category;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/18
 */
public interface CategoryMapper extends MyMapper<Category> {

    List<Category> findCategoryByArticleId(long id);
}
