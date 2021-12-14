package com.vanve.school.assess.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "assess_task")
public class AssessTask {

  @Id
  @Column(name = "assess_task_id")
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assess_task_seq")
  @SequenceGenerator(name = "assess_task_seq", initialValue = 1, allocationSize = 1, sequenceName = "SEQ_ASSESS_TASK")
  private Integer assessTaskId;

  @Column(name = "assess_template_id")
  private Integer assessTemplateId;

  @Column(name = "assess_task_name")
  private String assessTaskName;

  @Column(name = "assess_begin_time")
  // @DateTimeFormat(pattern = "yyyy-MM-dd")
  // @JSONField(format = "yyyy-MM-dd")
  // // @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT")
  // @Temporal(TemporalType.DATE)
  private String assessBeginTime;

  @Column(name = "assess_end_time")
  // @Temporal(TemporalType.DATE)
  // @DateTimeFormat(pattern = "yyyy-MM-dd")
  // @JSONField(format = "yyyy-MM-dd")
  // @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT")
  private String assessEndTime;

  @Column(name = "assessor_type")
  private Integer assessorType;

  @Column(name = "assess_object")
  private Integer assessObject;

  @Column(name = "others")
  private String others;

  @ManyToOne
  @JoinColumn(name = "assess_template_id", insertable = false, updatable = false, nullable = true)
  private AssessTemplate assessTemplate;

  @OneToMany(fetch = FetchType.EAGER)
  @JoinColumn(name = "assess_task_id", insertable = false, updatable = false, nullable = true)
  @Fetch(value = FetchMode.SUBSELECT)
  private List<Assess> assessList;

  // @ManyToOne
  // @JoinColumn(name = "assessor_type", referencedColumnName = "param_id",
  // insertable = false, updatable = false, nullable = true)
  // private Param assessTypeParam;

}