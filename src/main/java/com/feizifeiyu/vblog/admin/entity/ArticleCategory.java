package com.feizifeiyu.vblog.admin.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author 非子非鱼
 * @date 2018/10/22
 */
@Data
@Table(name = "tb_article_category")
public class ArticleCategory implements Serializable {

    @Id
    private Long id;
    @NotNull
    @Column(name = "article_id")
    private Long articleId;
    @NotNull
    @Column(name = "category_id")
    private Long categoryId;

    public ArticleCategory() {
    }

    public ArticleCategory(Long articleId, Long categoryId) {
        this.articleId = articleId;
        this.categoryId = categoryId;
    }
}
