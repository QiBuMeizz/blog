package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

@Data
@EqualsAndHashCode(callSuper = false)
public class Type extends BaseTreeEntity {

    @Transient
    private String tname;
}
