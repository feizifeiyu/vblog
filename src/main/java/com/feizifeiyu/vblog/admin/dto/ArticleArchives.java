package com.feizifeiyu.vblog.admin.dto;

import com.feizifeiyu.vblog.admin.entity.Article;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 用于封装Article表按时间归档的DTO
 *
 * @author 非子非鱼
 * @date 2018/10/28
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleArchives implements Serializable {

    private String date;
    private List<Article> articles;
}
