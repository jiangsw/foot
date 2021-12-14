package com.vanve.school.assess.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
// @Builder
@Entity
@Table(name = "assess_template")
public class AssessTemplate {
  @Id
  @Column(name = "assess_template_id")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assess_template_seq")
  @SequenceGenerator(name = "assess_template_seq", initialValue = 1, allocationSize = 1, sequenceName = "SEQ_ASSESS_TEMPLATE")
  private Integer assessTemplateId;

  @Column(name = "assess_template_type")
  private Integer assessTemplateType;

  @Column(name = "assess_template_name")
  private String assessTemplateName;

  @Column(name = "school_id")
  private Integer schoolId;

  @Column(name = "sts")
  private Integer sts;

  @Column(name = "sts_time")
  @Temporal(TemporalType.TIMESTAMP)
  private Date stsTime;

  @Column(name = "remarks")
  private String remarks;

  // @ManyToOne
  // @JoinColumn(name = "assess_template_type", referencedColumnName = "param_id",
  // insertable = false, updatable = false, nullable = true)
  // private Param param;
}