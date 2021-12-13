package com.vanve.foot.server.feature.assess.select;

import java.util.Map;

public interface AssessSelectService {
  public String getAssessTempalteList(Map<String, Object> params);

  public String selectAssessIndexListByTemplateId(Map<String, Object> params);

  public String selectAssessTaskList(Map<String, Object> params);
}
