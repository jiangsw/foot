package com.vanve.school.assess.feature.select;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsw.commons.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("select")
@EnableAutoConfiguration
public class SelectController extends BaseController {

  @Autowired
  private SelectServiceImpl selectService;

  @GetMapping("/getAssessTemplateList")
  @ResponseBody
  public String getAssessTempalteList(HttpServletRequest request) {

    Map<String, Object> requestMap = requestToMap(request);

    String json = selectService.getAssessTempalteList(requestMap);
    return json;
  }

  @GetMapping("/getAssessIndexListByTemplateId")
  @ResponseBody
  public String getAssessIndexListByTemplateId(HttpServletRequest request) {

    Map<String, Object> requestMap = requestToMap(request);

    String json = selectService.selectAssessIndexListByTemplateId(requestMap);
    return json;
  }

  // assessTemplateId,current_time,assessTaskName
  @GetMapping("/getAssessTaskList")
  @ResponseBody
  public String getAssessTaskList(HttpServletRequest request) {

    Map<String, Object> requestMap = requestToMap(request);

    String json = selectService.selectAssessTaskList(requestMap);
    return json;
  }

}
