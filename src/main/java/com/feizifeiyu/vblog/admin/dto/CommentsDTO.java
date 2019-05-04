package com.feizifeiyu.vblog.admin.dto;

import com.feizifeiyu.vblog.admin.entity.Comments;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 封装评论信息的DTO
 *
 * @author 非子非鱼
 * @date 2018/11/2
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentsDTO implements Serializable {

    /**
     * 父级留言信息
     */
    private Comments parent;
    /**
     * 所有子级回复、评论列表
     */
    private List<Comments> childrenList;
}
