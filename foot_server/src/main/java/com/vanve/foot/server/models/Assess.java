package com.vanve.school.assess.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "assess")
public class Assess {

  @Id
  @Column(name = "assess_id")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assess_seq")
  @SequenceGenerator(name = "assess_seq", initialValue = 1, allocationSize = 1, sequenceName = "SEQ_ASSESS")
  private Integer assessId;

  @Column(name = "assess_task_id")
  private Integer assessTaskId;

  @Column(name = "assess_grade_id")
  private Integer assessGradeId;

  @Column(name = "biz_type_id")
  private Integer bizTypeId;

  @Column(name = "biz_id")
  private Integer bizId;

  @Column(name = "total_score")
  private Integer totalScore;

}