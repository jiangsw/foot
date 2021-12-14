package com.vanve.school.assess.feature.select;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.vanve.school.assess.base.BaseServiceImpl;
import com.vanve.school.assess.feature.assess.AssessUtils;
import com.vanve.school.commons.restful.RestUtils;
import com.vanve.school.commons.result.Result;
import com.vanve.school.commons.result.ResultUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("selectService")
public class SelectServiceImpl extends BaseServiceImpl implements SelectService {

  @Autowired
  private SelectDao dao;

  @Autowired
  private AssessUtils assessUtils;

  public String getAssessTempalteList(Map<String, Object> params) {
    List<Map<String, Object>> list = dao.selectAssessTemplateList(params);
    String json = JSON.toJSONString(list);
    return json;
  }

  public String selectAssessIndexListByTemplateId(Map<String, Object> params) {
    List<Map<String, Object>> list = dao.selectAssessIndexListByTemplateId(params);
    String json = JSON.toJSONString(list);

    return json;
  }

  public String selectAssessTaskList(Map<String, Object> params) {
    List<Map<String, Object>> list = dao.selectAssessTaskList(params);

    assessUtils.getAssessTaskList(list, params);

    Result<?> result = ResultUtils.success(list);

    return JSON.toJSONString(result);

  }
}
