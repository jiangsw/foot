package com.vanve.irr.base;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BaseDao {

  public int insert(Map<String, Object> params);

  public int update(Map<String, Object> params);

  public int delete(Map<String, Object> params);

  public int updateBySql(String sql);

  public List<Map<String, Object>> selectList(Map<String, Object> params);

  public List<Map<String, Object>> selectListByPage(Map<String, Object> params);

  public List<Map<String, Object>> selectListBySql(String sql);

  public List<Map<String, Object>> selectPageListBySql(Map<String, Object> params);

  public int selectCount(Map<String, Object> params);

  public int selectCountBySql(String sql);
}
