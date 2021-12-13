package com.vanve.irr.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;

import org.jsw.commons.utils.TimeUtils;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class StatsUtils {

  // public void testStacksStats() {
  // List<Map<String, Object>> tList = dao.selectStatsDataList(Map.of("type_id",
  // 1));
  // tList.forEach(t -> {
  // t.put("legend", t.get("data_name"));
  // t.put("axis", getDataTime(t));
  // // t.put("stack", t.get("data_name"));
  // t.put("stack", getDataTime(t));
  // });

  // // log.info("tList1={}", JSON.toJSONString(tList, true));

  // getChartsStackData(tList);
  // }

  // 单柱状图
  public String getChartsData(List<Map<String, Object>> tList) {

    Map<String, Object> sMap = new HashMap<>();

    // 生成按照data_name分组的数据map
    Map<String, List<Map<String, Object>>> dataMap = tList.stream()
        .collect(Collectors.groupingBy(x -> x.get("data_name").toString()));

    log.info("getChartsData.dataMap={}", JSON.toJSONString(dataMap, true));

    List<String> legendList = tList.stream().map(m -> (String) m.get("legend")).distinct().collect(Collectors.toList());
    // log.info("legendList={}", JSON.toJSONString(legendList));
    List<String> axisList = tList.stream().map(m -> (String) m.get("axis")).distinct().collect(Collectors.toList());
    // log.info("axisList={}", JSON.toJSONString(axisList));
    List<String> stackList = tList.stream().map(m -> (String) m.get("stack")).distinct().collect(Collectors.toList());
    // log.info("stackList={}", JSON.toJSONString(stackList));

    // log.info("tList2={}", JSON.toJSONString(tList, true));

    // List<String> sList = new ArrayList<>();

    List<List<String>> dList = new ArrayList<>();
    // 1.循环legend,闸前水位,闸后水位
    legendList.forEach(l -> {
      // 2.filter dataMap.key=闸前水位,获得dataList
      List<Map<String, Object>> list1 = dataMap.get(l);
      // log.info("getChartsData.list1={}", JSON.toJSONString(list1, true));
      // 3.循环 stackList,filter time=dataList.time,获得第二个dataList
      List<String> sList = new ArrayList<>();
      stackList.forEach(s -> {

        // 4. 查询时间点对应的数据值
        Optional<String> o = list1.stream().filter(m -> m.get("stack").equals(s))
            .map(p -> ((BigDecimal) p.get("data_value")).toString()).findFirst();
        if (o.isPresent()) {
          String value = o.get();
          sList.add(value);
        }
      });
      dList.add(sList);
      // if (o.isPresent()) {
      // String value = o.get();
      // sList.add(value);
      // }
      // 4.map a = map.put('闸前水位',dataList)
      // 5.map.put('series',a);
    });

    // stackList.forEach(s -> {

    // Optional<String> o = tList.stream().filter(m -> m.get("stack").equals(s))
    // .map(p -> ((BigDecimal) p.get("data_value")).toString()).findFirst();

    // if (o.isPresent()) {
    // String value = o.get();
    // sList.add(value);
    // }
    // });

    sMap.put("legend", legendList);
    sMap.put("axis", axisList);
    sMap.put("stack", stackList);
    // sMap.put("series", sList);
    sMap.put("series", dList);

    log.info("sMap={}", JSON.toJSONString(sMap, true));

    return JSON.toJSONString(sMap);

  }

  // legend[],axis[],series<Map,ArrayList<>>
  public String getChartsStackData(List<Map<String, Object>> tList) {

    Map<String, Object> sMap = new HashMap<>();

    List<String> legendList = tList.stream().map(m -> (String) m.get("legend")).distinct().collect(Collectors.toList());
    List<String> axisList = tList.stream().map(m -> (String) m.get("axis")).distinct().collect(Collectors.toList());
    List<String> stackList = tList.stream().map(m -> (String) m.get("stack")).distinct().collect(Collectors.toList());

    // log.info("tList2={}", JSON.toJSONString(tList, true));

    List<Map<String, Object>> sList = new ArrayList<>();

    stackList.forEach(s -> {
      Map<String, Object> tMap = new HashMap<>();
      List<String> dList = tList.stream().filter(m -> m.get("stack").equals(s))
          .map(p -> ((BigDecimal) p.get("data_value")).toString()).collect(Collectors.toList());

      log.info("{}.dList={}", s, JSON.toJSONString(dList, true));

      tMap.put("stack", s);
      tMap.put("data", dList);
      sList.add(tMap);
    });

    sMap.put("legend", legendList);
    sMap.put("axis", axisList);
    sMap.put("stack", stackList);
    sMap.put("series", sList);

    log.info("sMap={}", JSON.toJSONString(sMap, true));

    return JSON.toJSONString(sMap);

  }

  private String getDataTime(Map<String, Object> m) {

    int dataLevel = ((BigDecimal) m.get("data_level")).intValue();
    String dataTime = "";
    Date date = (Date) m.get("data_time");
    if (dataLevel == 1) {

      dataTime = TimeUtils.dateToString(date, "MM月");
      log.info("dataTime={}", dataTime);
    } else {
      dataTime = TimeUtils.dateToString(date, "yyyy-MM-dd HH:mm:ss");
    }
    return dataTime;
  }
}
