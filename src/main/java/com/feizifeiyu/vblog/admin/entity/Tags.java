package com.feizifeiyu.vblog.admin.entity;

import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author 非子非鱼
 * @date 2018/10/17
 */
@Data
@Table(name = "tb_tags")
public class Tags implements Serializable {

    @Id
    private Long id;
    @NotNull
    private String name;

    @Transient
    private Long count;

    public Tags() {
    }

    public Tags(String name) {
        this.name = name;
    }
}
