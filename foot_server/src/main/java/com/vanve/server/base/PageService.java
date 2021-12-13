package com.vanve.irr.base;

import java.util.List;
import java.util.Map;

public interface PageService {

  public List<Map<String, Object>> selectPageServiceList(Map<String, Object> map, int flag);
}
