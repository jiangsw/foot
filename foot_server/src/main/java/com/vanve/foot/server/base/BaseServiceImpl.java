package com.vanve.foot.server.base;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import org.jsw.commons.domain.PagePOJO;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BaseServiceImpl implements PageService {

  @Autowired
  private BaseDao dao;

  private static final String TABLE_NAME = "tableName";
  private static final String PARAMS = "params";

  public Map<String, Object> selectOne(String tableName, Map<String, Object> params, String fields) {

    List<Map<String, Object>> list = null;

    try {
      Map<String, Object> map = convertToSelectMap(params, tableName, fields);
      list = dao.selectList(map);

    } catch (Exception e) {
      e.printStackTrace();
    }
    if (list != null)
      return list.get(0);
    return null;
  }

  public Map<String, Object> selectOne(String tableName, Map<String, Object> params) {
    return selectOne(tableName, params, "*");
  }

  public Map<String, Object> selectOne(String tableName) {

    Map<String, Object> params = new HashMap<>();
    return selectOne(tableName, params);

  }

  public Map<String, Object> selectOneBySql(String sql) {
    List<Map<String, Object>> list = dao.selectListBySql(sql);
    if (!list.isEmpty())
      return list.get(0);
    return null;
  }

  public List<Map<String, Object>> selectList(String tableName, Map<String, Object> params, String fields) {

    List<Map<String, Object>> list = new ArrayList<>();

    try {
      Map<String, Object> map = convertToSelectMap(params, tableName, fields);
      list = dao.selectList(map);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  public List<Map<String, Object>> selectList(String tableName, String fields) {
    Map<String, Object> params = new HashMap<>();
    return selectList(tableName, params, fields);
  }

  public List<Map<String, Object>> selectList(String tableName) {
    Map<String, Object> params = new HashMap<>();
    return selectList(tableName, params, "*");
  }

  public List<Map<String, Object>> selectListBySql(String sql) {
    return dao.selectListBySql(sql);
  }

  public int selectCount(String tableName, Map<String, Object> params) {

    int count = 0;
    try {
      Map<String, Object> map = convertToSelectMap(params, tableName, "*");
      count = (Integer) dao.selectCount(map);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return count;
  }

  public int selectCount(String tableName) {
    Map<String, Object> params = new HashMap<>();
    return selectCount(tableName, params);
  }

  public int selectCountBySql(String sql) {
    return (Integer) dao.selectCountBySql(sql);
  }

  public List<Map<String, Object>> selectListByPage(String tableName, String startRow, String endRow) {
    Map<String, Object> params = new HashMap<>();
    return selectListByPage(tableName, params, startRow, endRow, "*");
  }

  public List<Map<String, Object>> selectListByPage(String tableName, String startRow, String endRow, String fields) {
    Map<String, Object> params = new HashMap<>();
    return selectListByPage(tableName, params, startRow, endRow, fields);
  }

  public List<Map<String, Object>> selectListByPage(String tableName, Map<String, Object> params, String startRow,
      String endRow, String fields) {

    List<Map<String, Object>> list = new ArrayList<>();

    try {
      Map<String, Object> map = convertToSelectMap(params, tableName, fields);

      PagePOJO page = new PagePOJO();

      page.setPageSize(10);
      page.setStartIndex(Integer.parseInt(startRow));
      page.setTotalSelect(Integer.parseInt(endRow) - Integer.parseInt(startRow));

      map.put("page", page);

      map.put("startRow", startRow);
      map.put("endRow", endRow);

      list = dao.selectListByPage(map);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  public List<Map<String, Object>> selectPageListBySql(String sql, String startRow, String endRow) {

    List<Map<String, Object>> list = new ArrayList<>();

    Map<String, Object> map = new HashMap<>();

    try {
      map.put("sql", sql);
      map.put("startRow", startRow);
      map.put("endRow", endRow);

      list = dao.selectPageListBySql(map);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  public String selectPageList(Map<String, Object> params, int flag) {

    PagePOJO page = new PagePOJO();
    String limit = params.get("limit") == null ? "0" : (String) (params.get("limit"));
    String offset = params.get("offset") == null ? "0" : (String) (params.get("offset"));

    page.setPageSize(Integer.parseInt(limit));
    page.setStartIndex(Integer.parseInt(offset));
    page.setTotalSelect(Integer.parseInt(limit));

    params.put("page", page);

    List<Map<String, Object>> list = this.selectPageServiceList(params, flag);

    int count = page.getTotalNumber();

    JSONObject jsonObj = new JSONObject();
    jsonObj.put("rows", list);
    jsonObj.put("total", count);

    String json = JSON.toJSONString(jsonObj, true);

    log.info("selectPageList.json={}", json);

    return json;

  }

  public int insert(String tableName, Map<String, Object> params) {

    Map<String, Object> map = convertToInsertMap(params, tableName);
    dao.insert(map);
    return (Integer) map.get("id");
  }

  public void update(String tableName, Map<String, Object> params, Map<String, Object> conditions) {

    Map<String, Object> map = convertToUpdateMap(params, conditions, tableName);
    dao.update(map);
  }

  public void updateBySql(String sql) {
    dao.updateBySql(sql);
  }

  public int delete(String tableName, Map<String, Object> params) {

    Map<String, Object> map = convertToInsertMap(params, tableName);
    return dao.delete(map);
  }

  public String getMultiArrayInsertSql(String table, Map<String, Object> params, String field, String ids) {
    StringBuilder sb = new StringBuilder();
    sb.append("insert into ").append(table).append("(");

    String[] keys = new String[params.size()];
    // String[] values = new String[params.size()];
    Set<String> keySet = params.keySet();
    int i = 0;
    for (String key : keySet) {
      sb.append(key);
      i++;
      if (i < keys.length)
        sb.append(",");
    }
    sb.append(") values ");

    StringBuilder sb1 = new StringBuilder();
    String[] id = ids.split(",");

    for (int j = 0; j < id.length; j++) {
      int k = 0;
      sb1.append("(");
      for (String key : keySet) {
        if (key.equals(field))
          sb1.append(id[j]);
        else
          sb1.append(params.get(key));
        k++;
        if (k < keys.length)
          sb1.append(",");
      }

      sb1.append(")");
      if (j != id.length - 1)
        sb1.append(",");
    }

    sb.append(sb1.toString());
    log.info("getMultiArrayInsertSql.sb={}", sb.toString());

    return sb.toString();
  }

  private Map<String, Object> convertToInsertMap(Map<String, Object> params, String tableName) {
    String[] keys = new String[params.size()];
    Set<String> keySet = params.keySet();
    int i = 0;
    for (String key : keySet) {
      keys[i++] = key;
    }

    Map<String, Object> map = new HashMap<>();
    map.put(TABLE_NAME, tableName);
    map.put("id", 0);
    map.put("keys", keys);
    map.put(PARAMS, params);

    return map;
  }

  private Map<String, Object> convertToUpdateMap(Map<String, Object> params, Map<String, Object> conditions,
      String tableName) {
    String[] keys = new String[params.size()];
    String[] conditionKeys = new String[conditions.size()];
    Set<String> keySet = params.keySet();
    Set<String> conditionSet = conditions.keySet();
    int i = 0;
    for (String key : keySet) {
      keys[i++] = key;
    }
    i = 0;
    for (String key : conditionSet) {
      conditionKeys[i++] = key;
    }

    Map<String, Object> map = new HashMap<>();
    map.put(TABLE_NAME, tableName);
    map.put("id", 0);
    map.put("keys", keys);
    map.put(PARAMS, params);
    map.put("conditionKeys", conditionKeys);
    map.put("conditionParams", conditions);

    return map;
  }

  private Map<String, Object> convertToSelectMap(Map<String, Object> params, String tableName, String fields) {
    String[] keys = new String[params.size()];
    Set<String> keySet = params.keySet();
    int i = 0;
    for (String key : keySet) {
      keys[i++] = key;
    }

    Map<String, Object> map = new HashMap<>();
    map.put(TABLE_NAME, tableName);
    map.put("fields", fields);
    map.put("keys", keys);
    map.put(PARAMS, params);

    return map;
  }

  @Override
  public List<Map<String, Object>> selectPageServiceList(Map<String, Object> map, int flag) {
    return Collections.emptyList();
  }
}
