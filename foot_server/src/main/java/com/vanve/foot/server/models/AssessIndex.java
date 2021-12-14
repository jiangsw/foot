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
@Table(name = "assess_index")
public class AssessIndex {
  @Id
  @Column(name = "assess_index_id")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assess_index_seq")
  @SequenceGenerator(name = "assess_index_seq", initialValue = 1, allocationSize = 1, sequenceName = "SEQ_ASSESS_INDEX")
  private Integer assessIndexId;

  @Column(name = "up_assess_index_id")
  private Integer upAssessIndexId;

  @Column(name = "assess_template_id")
  private Integer assessTemplateId;

  @Column(name = "assess_index_name")
  private String assessIndexName;

  @Column(name = "index_type")
  private Integer indexType;

  @Column(name = "is_input")
  private Integer isInput;

  @Column(name = "max_choice")
  private Integer maxChoice;

  @Column(name = "sort_nbr")
  private Integer sortNbr;

  @Column(name = "score_type")
  private Integer scoreType;

  @Column(name = "weight")
  private Integer weight;

  @Column(name = "score")
  private Integer score;

  @Column(name = "sts")
  private Integer sts;

  @Column(name = "sts_time")
  @Temporal(TemporalType.TIMESTAMP)
  private Date stsTime;

  @Column(name = "remarks")
  private String remarks;

  @Column(name = "assess_index_id", insertable = false, updatable = false, nullable = true)
  private Integer id;

  @Column(name = "up_assess_index_id", insertable = false, updatable = false, nullable = true)
  private Integer pid;

  @ManyToOne
  @JoinColumn(name = "assess_template_id", insertable = false, updatable = false, nullable = true)
  private AssessTemplate assessTemplate;

  @ManyToOne
  @JoinColumn(name = "up_assess_index_id", insertable = false, updatable = false, nullable = true)
  private AssessIndex upAssessIndex;

  // @ManyToOne
  // @JoinColumn(name = "score_type", referencedColumnName = "param_id",
  // insertable = false, updatable = false, nullable = true)
  // private Param paramScoreType;
}