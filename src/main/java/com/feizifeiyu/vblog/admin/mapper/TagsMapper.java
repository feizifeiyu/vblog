package com.feizifeiyu.vblog.admin.mapper;

import com.feizifeiyu.vblog.admin.config.MyMapper;
import com.feizifeiyu.vblog.admin.entity.Tags;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/18
 */
public interface TagsMapper extends MyMapper<Tags> {

    List<Tags> findByArticleId(long id);
}
