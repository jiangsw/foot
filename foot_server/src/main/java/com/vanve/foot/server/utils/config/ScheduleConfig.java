package com.vanve.foot.server.utils.config;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.vanve.foot.server.utils.helper.ApplicationContextHelper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.util.ReflectionUtils;

// @Configuration
// @EnableScheduling
public class ScheduleConfig implements SchedulingConfigurer {

  protected static final Logger log = LoggerFactory.getLogger(ScheduleConfig.class);

  @Mapper
  public interface ScheduleMapper {
    @ResultType(java.util.HashMap.class)
    @Select("select * from schedule_config where sts=1")
    public List<Map<String, Object>> selectScheduleConfigList();

    // @Update("{call
    // RTC_TASK.pms_patrol_i(#{list,mode=IN,jdbcType=ARRAY,jdbcTypeName=\"T_patrol_inspect\",typeHandler=com.vanve.rtc.domain.PmsPatrolInspectDBHandler},#{create_new})}")
    // public void insertPatrolInspect(Map<String, Object> map);

  }

  @Autowired
  @SuppressWarnings("all")
  ScheduleMapper scheduleMapper;

  @Override
  public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {

    // 获取所有任务
    List<Map<String, Object>> scheduleList = scheduleMapper.selectScheduleConfigList();
    log.info("{}", scheduleList.size());
    log.info("scheduleList={}", JSON.toJSONString(scheduleList));
    for (Map<String, Object> m : scheduleList) {
      scheduledTaskRegistrar.addTriggerTask(getRunnable(m), getTrigger(m));
    }
  }

  /**
   * 转换首字母小写
   *
   * @param str
   * @return
   */
  public static String lowerFirstCapse(String str) {
    char[] chars = str.toCharArray();
    chars[0] += 32;
    return String.valueOf(chars);
  }

  /**
   * runnable
   * 
   * @param scheduleConfig
   * @return
   */
  private Runnable getRunnable(Map<String, Object> scheduleConfig) {
    return new Runnable() {
      @Override
      public void run() {
        Class<?> clazz;
        try {
          clazz = Class.forName((String) scheduleConfig.get("class_name"));
          String className = lowerFirstCapse(clazz.getSimpleName());
          Object bean = (Object) ApplicationContextHelper.getBean(className);
          Method method = ReflectionUtils.findMethod(bean.getClass(), (String) scheduleConfig.get("method"));
          ReflectionUtils.invokeMethod(method, bean);
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }
      }
    };
  }

  /**
   * Trigger
   * 
   * @param scheduleConfig
   * @return
   */
  private Trigger getTrigger(Map<String, Object> scheduleConfig) {
    return new Trigger() {
      @Override
      public Date nextExecutionTime(TriggerContext triggerContext) {

        String cron = (String) scheduleConfig.get("cron");

        CronTrigger trigger = new CronTrigger(cron);
        Date nextExec = trigger.nextExecutionTime(triggerContext);
        return nextExec;
      }
    };

  }
}
