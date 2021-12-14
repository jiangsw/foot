package com.vanve.school.assess.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
// @Builder
@Entity
@Table(name = "assess_grade")
public class AssessGrade {
  @Id
  @Column(name = "assess_grade_id")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assess_grade_seq")
  @SequenceGenerator(name = "assess_grade_seq", initialValue = 1, allocationSize = 1, sequenceName = "SEQ_ASSESS_GRADE")
  private Integer assessGradeId;

  @Column(name = "assess_template_id")
  private Integer assessTemplateId;

  @Column(name = "grade_name")
  private String assessGradeName;

  @Column(name = "min_score")
  private Integer minScore;

  @Column(name = "max_score")
  private Integer maxScore;

  @Column(name = "sts")
  private Integer sts;

  @Column(name = "sts_time")
  @Temporal(TemporalType.TIMESTAMP)
  private Date stsTime;

  @Column(name = "remarks")
  private String remarks;

  @ManyToOne
  @JoinColumn(name = "assess_template_id", insertable = false, updatable = false, nullable = true)
  private AssessTemplate assessTemplate;
}