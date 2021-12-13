package com.vanve.irr.utils;

import static java.util.stream.Collectors.collectingAndThen;
import static java.util.stream.Collectors.toCollection;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeSet;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;
import com.vanve.irr.feature.stats.StatsDao;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DataUtils {

  @Autowired
  private StatsDao dao;

  public List<Map<String, Object>> generateRandomData(int irrigateId) {

    return generateRandomData(1, irrigateId);

  }

  public List<Map<String, Object>> generateRandomData(int round, int irrigateId) {
    // int level = 0;
    // int dataGroup = 2;

    log.info("generateRandomData.type_id={}", irrigateId);

    List<Map<String, Object>> pointList = dao.selectPointList(Map.of("irrigate_id", irrigateId));

    // Map<String, Object> pointMap = pointList.stream()
    // .max(Comparator.comparing(map -> (BigDecimal) map.get("point_group"))).get();

    // List<String> dataNameList = pointList.stream().map(m -> (String)
    // m.get("data_name")).distinct()
    // .collect(Collectors.toList());

    // log.info("pointMap={} dataNameList={}", JSON.toJSONString(pointMap),
    // JSON.toJSONString(dataNameList));
    // List<String> dataNameList = new ArrayList<>(Arrays.asList("闸前水位", "闸后水位"));

    return generateRandomData(round, pointList);

  }

  // data_time,data_name,data_value,data_group,data_level
  private List<Map<String, Object>> generateRandomData(int round, List<Map<String, Object>> pointList) {

    List<Map<String, Object>> list = new ArrayList<>();

    if (pointList.isEmpty()) {
      return Lists.emptyList();
    }

    Map<String, Object> pointMap = pointList.get(0);

    BigDecimal dataGroup = (BigDecimal) pointMap.get("point_group");

    for (int j = 0; j < round; j++) {
      for (int i = 0; i < dataGroup.intValue(); i++) {

        Date date = new Date();
        int[] group = new int[1];
        group[0] = i + 1;

        pointList.forEach(p -> {
          Map<String, Object> m = new HashMap<>();

          // dd.put("data_time", currentTime);
          // dd.put("irrigate_type_id", typeId);
          // dd.put("data_value", getDataValue());

          m.put("irrigate_type_id", p.get("irrigate_type_id"));
          m.put("data_time", date);
          m.put("data_name", p.get("data_name"));
          m.put("data_value", BigDecimal.valueOf(getRandomValue(10, 100)));
          m.put("data_group", BigDecimal.valueOf(group[0]));
          m.put("data_level", p.get("data_level"));

          list.add(m);
        });
      }
    }

    log.info("dataList = {}", JSON.toJSONString(list, true));

    return list;
  }

  private int getRandomValue(int min, int max) {

    Random rand = new Random();
    int randNumber = rand.nextInt(max - min + 1) + min;

    return randNumber;
  }
}
