package com.feizifeiyu.vblog.admin.mapper;

import com.feizifeiyu.vblog.admin.config.MyMapper;
import com.feizifeiyu.vblog.admin.entity.Article;
import com.feizifeiyu.vblog.admin.entity.ArticleTags;
import com.feizifeiyu.vblog.admin.entity.Tags;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/22
 */
public interface ArticleTagMapper extends MyMapper<ArticleTags> {

    List<Tags> findByArticleId(long articleId);

    List<Article> findByTagName(String name);
}
