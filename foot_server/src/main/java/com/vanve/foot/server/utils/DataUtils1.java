package com.vanve.irr.utils;

import java.math.BigDecimal;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;
import com.vanve.irr.base.TestServiceImpl;
import com.vanve.irr.models.IrrigateData;
import com.vanve.irr.repository.IrrigateDataRepository;

import org.jsw.commons.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DataUtils1 {

  @Autowired
  private TestServiceImpl testService;

  @Autowired
  private IrrigateDataRepository repository;

  public void generateData() {

    List<Map<String, Object>> irrigateList = testService
        .selectListBySql("select * from irrigate order by irrigate_type");
    // log.info("irrigateList={}", JSON.toJSONString(irrigateList, true));
    List<Map<String, Object>> pointAllList = testService.selectListBySql("select * from v_point");

    irrigateList.forEach(m -> {

      int irrigateId = ((BigDecimal) m.get("irrigate_id")).intValue();
      int irrigateType = ((BigDecimal) m.get("irrigate_type")).intValue();
      // log.info("irrigateId {}", irrigateId);

      List<Map<String, Object>> pointList = pointAllList.stream()
          .filter(map -> irrigateType == ((BigDecimal) map.get("irrigate_type")).intValue())
          .collect(Collectors.toList());
      // log.info("irrigateType={} pointList={}", irrigateType,
      // JSON.toJSONString(pointList));

      pointList.forEach(p -> {
        String currentTime = TimeUtils.getCurrentTime();
        p.put("data_time", currentTime);
        p.put("data_value", getRandomValue(1, 100));
      });

      // log.info("irrigateType={} pointList={}", irrigateType,
      // JSON.toJSONString(pointList));
      saveIrrigateData(pointList);
    });

  }

  private void saveIrrigateData(List<Map<String, Object>> list) {

    list.forEach(m -> {
      IrrigateData data = new IrrigateData();
      data.setDataTime(strToDateLong((String) m.get("data_time")));
      data.setIrrigateTypeId(((BigDecimal) m.get("irrigate_type_id")).intValue());
      data.setDataValue(((Integer) m.get("data_value")).doubleValue());

      data.setPointId(((BigDecimal) m.get("point_id")).intValue());
      data.setDataGroup(((BigDecimal) m.get("point_group")).intValue());
      data.setSts(1);
      repository.save(data);
    });
  }

  private Date strToDateLong(String strDate) {
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    ParsePosition pos = new ParsePosition(0);
    Date strtodate = formatter.parse(strDate, pos);
    return strtodate;
  }

  private int getRandomValue(int min, int max) {

    Random rand = new Random();
    int randNumber = rand.nextInt(max - min + 1) + min;

    return randNumber;
  }

}
