package com.feizifeiyu.vblog.admin.service.impl;

import com.feizifeiyu.vblog.admin.entity.ArticleCategory;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.mapper.ArticleCategoryMapper;
import com.feizifeiyu.vblog.admin.service.ArticleCategoryService;
import com.feizifeiyu.vblog.common.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 非子非鱼
 * @date 2018/10/22
 */
@Service
@SuppressWarnings("all")
public class ArticleCategoryServiceImpl extends BaseServiceImpl<ArticleCategory> implements ArticleCategoryService {

    @Autowired
    private ArticleCategoryMapper articleCategoryMapper;

    @Override
    @Transactional
    public void save(ArticleCategory articleCategory) {
        try {
            if (!exists(articleCategory)) {
                articleCategoryMapper.insert(articleCategory);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    private boolean exists(ArticleCategory articleCategory) {
        return articleCategoryMapper.selectCount(articleCategory) > 0 ? true : false;
    }

    @Override
    @Transactional
    public void deleteByArticleId(Long id) {
        try {
            if (!id.equals(null) && id != 0) {
                if (exists(new ArticleCategory(id, 0L))) {
                    ArticleCategory articleCategory = new ArticleCategory();
                    articleCategory.setArticleId(id);
                    articleCategoryMapper.delete(articleCategory);
                }
            } else {
                throw new GlobalException("参数错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @Override
    @Transactional
    public void deleteByCategoryId(Long id) {
        try {
            if (!id.equals(null) && id != 0) {
                if (exists(new ArticleCategory(0L, id))) {
                    ArticleCategory articleCategory = new ArticleCategory();
                    articleCategory.setCategoryId(id);
                    articleCategoryMapper.delete(articleCategory);
                }
            } else {
                throw new GlobalException("参数错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
