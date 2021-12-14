package com.vanve.school.assess.feature.select;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SelectDao {

  public List<Map<String, Object>> selectAssessTemplateList(Map<String, Object> params);

  public List<Map<String, Object>> selectAssessIndexListByTemplateId(Map<String, Object> params);

  public List<Map<String, Object>> selectAssessTaskList(Map<String, Object> params);

  public Map<String, Object> getSemester();

}
