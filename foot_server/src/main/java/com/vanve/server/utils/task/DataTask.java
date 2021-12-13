package com.vanve.irr.utils.task;

import com.vanve.irr.utils.DataUtils1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DataTask {

  @Autowired
  private DataUtils1 dataUtils;

  public void generateData() {

    log.info("DataTask.generateDate");
    dataUtils.generateData();
  }
}
