-- ALTER TABLE staff_foot_log DROP CONSTRAINT FKstaff_foot48986;
-- ALTER TABLE staff DROP CONSTRAINT FKstaff963681;
-- ALTER TABLE dept DROP CONSTRAINT FKdept96894;
-- ALTER TABLE assess_task DROP CONSTRAINT FKassess_tas191845;
-- ALTER TABLE assess_grade DROP CONSTRAINT FKassess_gra228429;
-- ALTER TABLE assess_task DROP CONSTRAINT FKassess_tas191846;
-- ALTER TABLE assess_grade DROP CONSTRAINT FKassess_gra228430;
-- ALTER TABLE assess_index DROP CONSTRAINT FKassess_ind497616;
-- ALTER TABLE assess_index DROP CONSTRAINT FKassess_ind15566;

DROP TABLE IF EXISTS dept CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS staff_foot_log CASCADE;
DROP TABLE IF EXISTS assess CASCADE;
DROP TABLE IF EXISTS assess_grade CASCADE;
DROP TABLE IF EXISTS assess_index CASCADE;
DROP TABLE IF EXISTS assess_score CASCADE;
DROP TABLE IF EXISTS assess_task CASCADE;
DROP TABLE IF EXISTS assess_template CASCADE;

DROP SEQUENCE IF EXISTS seq_dept;
DROP SEQUENCE IF EXISTS seq_staff;
DROP SEQUENCE IF EXISTS seq_foot_log;
DROP SEQUENCE IF EXISTS seq_assess;
DROP SEQUENCE IF EXISTS seq_assess_grade;
DROP SEQUENCE IF EXISTS seq_assess_index;
DROP SEQUENCE IF EXISTS seq_assess_score;
DROP SEQUENCE IF EXISTS seq_assess_task;
DROP SEQUENCE IF EXISTS seq_assess_template;

DROP INDEX IF EXISTS dept_dept_id;
DROP INDEX IF EXISTS dept_up_dept_id;
DROP INDEX IF EXISTS staff_staff_id;
DROP INDEX IF EXISTS staff_foot_log_staff_foot_log_id;
DROP INDEX IF EXISTS assess_assess_id;
DROP INDEX IF EXISTS assess_grade_assess_grade_id;
DROP INDEX IF EXISTS assess_index_assess_index_id;
DROP INDEX IF EXISTS assess_score_assess_score_id;
DROP INDEX IF EXISTS assess_template_assess_template_id;

CREATE SEQUENCE seq_dept;
CREATE SEQUENCE seq_staff;
CREATE SEQUENCE seq_foot_log;
CREATE SEQUENCE seq_assess;
CREATE SEQUENCE seq_assess_grade;
CREATE SEQUENCE seq_assess_index;
CREATE SEQUENCE seq_assess_score;
CREATE SEQUENCE seq_assess_task;
CREATE SEQUENCE seq_assess_template;

CREATE TABLE dept (
  dept_id    SERIAL NOT NULL, 
  up_dept_id int4 NOT NULL, 
  dept_type  int4, 
  dept_name  varchar(100), 
  dept_level int4, 
  dept_duty  varchar(200), 
  phone_nbr  varchar(100), 
  sort_nbr   int4, 
  sts        int2, 
  sys_time   timestamp, 
  remarks    varchar(2000), 
  PRIMARY KEY (dept_id));
COMMENT ON COLUMN dept.dept_id IS '????????????(dept)';
COMMENT ON COLUMN dept.up_dept_id IS '??????????????????(dept)';
COMMENT ON COLUMN dept.dept_type IS '????????????(param)';
COMMENT ON COLUMN dept.dept_name IS '????????????';
COMMENT ON COLUMN dept.dept_level IS '????????????(param)';
COMMENT ON COLUMN dept.dept_duty IS '????????????';
COMMENT ON COLUMN dept.phone_nbr IS '????????????';
COMMENT ON COLUMN dept.sort_nbr IS '?????????';
COMMENT ON COLUMN dept.sts IS '??????';
COMMENT ON COLUMN dept.sys_time IS '????????????';
COMMENT ON COLUMN dept.remarks IS '??????';
CREATE TABLE staff (
  staff_id   SERIAL NOT NULL, 
  dept_id    int4 NOT NULL, 
  staff_name varchar(100), 
  nickname   varchar(100), 
  account    varchar(100), 
  password   varchar(100), 
  phone      varchar(100), 
  avatar     varchar(100), 
  sort_nbr   int4, 
  sts        int2, 
  sts_time   timestamp, 
  remarks    varchar(2000), 
  PRIMARY KEY (staff_id));
COMMENT ON COLUMN staff.staff_id IS '????????????(staff)';
COMMENT ON COLUMN staff.staff_name IS '????????????';
COMMENT ON COLUMN staff.nickname IS '??????';
COMMENT ON COLUMN staff.account IS '??????';
COMMENT ON COLUMN staff.password IS '??????';
COMMENT ON COLUMN staff.phone IS '????????????';
COMMENT ON COLUMN staff.avatar IS '??????';
COMMENT ON COLUMN staff.sort_nbr IS '?????????';
COMMENT ON COLUMN staff.sts IS '??????';
COMMENT ON COLUMN staff.sts_time IS '????????????';
COMMENT ON COLUMN staff.remarks IS '??????';
CREATE TABLE staff_foot_log (
  staff_foot_log_id SERIAL NOT NULL, 
  staff_id          int4 NOT NULL, 
  log_time          timestamp, 
  log_data          varchar(200), 
  PRIMARY KEY (staff_foot_log_id));
COMMENT ON COLUMN staff_foot_log.staff_foot_log_id IS '????????????????????????(staff_foot_log)';
COMMENT ON COLUMN staff_foot_log.staff_id IS '????????????(staff)';
COMMENT ON COLUMN staff_foot_log.log_time IS '????????????';
COMMENT ON COLUMN staff_foot_log.log_data IS '????????????';

CREATE TABLE assess (
  assess_id       int4 DEFAULT nextval('seq_assess') NOT NULL, 
  assess_task_id  int4, 
  assess_grade_id int4, 
  biz_id          int4, 
  assess_time     date, 
  assessor_id     int4, 
  answer          json, 
  score           int4, 
  remarks         varchar(4000), 
  PRIMARY KEY (assess_id));
COMMENT ON COLUMN assess.assess_id IS '????????????(assess)';
COMMENT ON COLUMN assess.assess_task_id IS '??????????????????(assess_task)';
COMMENT ON COLUMN assess.assess_grade_id IS '??????????????????(assess_grade)';
COMMENT ON COLUMN assess.biz_id IS '??????????????????';
COMMENT ON COLUMN assess.assess_time IS '????????????';
COMMENT ON COLUMN assess.assessor_id IS '?????????';
COMMENT ON COLUMN assess.answer IS '????????????';
COMMENT ON COLUMN assess.score IS '????????????';
COMMENT ON COLUMN assess.remarks IS '??????';
CREATE TABLE assess_grade (
  assess_grade_id    int4 DEFAULT nextval('seq_assess_grade') NOT NULL, 
  assess_template_id int4, 
  grade_name         varchar(200), 
  min_score          int4, 
  max_score          int4, 
  sts                int2 DEFAULT 0, 
  sts_time           timestamp DEFAULT CURRENT_TIMESTAMP, 
  remarks            varchar(4000), 
  PRIMARY KEY (assess_grade_id));
COMMENT ON COLUMN assess_grade.assess_grade_id IS '??????????????????(assess_grade)';
COMMENT ON COLUMN assess_grade.assess_template_id IS '??????????????????(assess_template)';
COMMENT ON COLUMN assess_grade.grade_name IS '??????????????????';
COMMENT ON COLUMN assess_grade.min_score IS '????????????';
COMMENT ON COLUMN assess_grade.max_score IS '????????????';
COMMENT ON COLUMN assess_grade.sts IS '??????';
COMMENT ON COLUMN assess_grade.sts_time IS '????????????';
COMMENT ON COLUMN assess_grade.remarks IS '??????';
CREATE TABLE assess_index (
  assess_index_id    int4 DEFAULT nextval('seq_assess_index') NOT NULL, 
  assess_index_name  varchar(200), 
  up_assess_index_id int4, 
  assess_template_id int4, 
  index_type         int4, 
  max_choice         int4, 
  is_input           int2, 
  weight             int4, 
  score              int4, 
  score_type         int4, 
  sort_nbr           int4, 
  sts                int2 DEFAULT 0, 
  sts_time           timestamp DEFAULT CURRENT_TIMESTAMP, 
  remarks            varchar(4000), 
  PRIMARY KEY (assess_index_id));
COMMENT ON COLUMN assess_index.assess_index_id IS '??????????????????(assess_index)';
COMMENT ON COLUMN assess_index.assess_index_name IS '??????????????????';
COMMENT ON COLUMN assess_index.up_assess_index_id IS '????????????????????????(assess_index)';
COMMENT ON COLUMN assess_index.assess_template_id IS '??????????????????(assess_template)';
COMMENT ON COLUMN assess_index.index_type IS '????????????????????????';
COMMENT ON COLUMN assess_index.max_choice IS '???????????????';
COMMENT ON COLUMN assess_index.is_input IS '????????????(0-???,1-???)';
COMMENT ON COLUMN assess_index.weight IS '??????';
COMMENT ON COLUMN assess_index.score IS '??????';
COMMENT ON COLUMN assess_index.score_type IS '?????????????????????';
COMMENT ON COLUMN assess_index.sort_nbr IS '????????????';
COMMENT ON COLUMN assess_index.sts IS '??????';
COMMENT ON COLUMN assess_index.sts_time IS '????????????';
COMMENT ON COLUMN assess_index.remarks IS '??????';
CREATE TABLE assess_score (
  assess_score_id int4 DEFAULT nextval('seq_assess_score') NOT NULL, 
  assess_id       int4, 
  assess_index_id int4, 
  assess_options  varchar(400), 
  score           varchar(100), 
  PRIMARY KEY (assess_score_id));
COMMENT ON COLUMN assess_score.assess_score_id IS '??????????????????(assess_score)';
COMMENT ON COLUMN assess_score.assess_id IS '????????????(assess)';
COMMENT ON COLUMN assess_score.assess_index_id IS '??????????????????(assess_index)';
COMMENT ON COLUMN assess_score.assess_options IS '?????????????????????????????????????????????';
COMMENT ON COLUMN assess_score.score IS '??????';
CREATE TABLE assess_task (
  assess_task_id     int4 DEFAULT nextval('seq_assess_task') NOT NULL, 
  assess_template_id int4, 
  assess_task_name   varchar(200), 
  assess_begin_time  varchar(100), 
  assess_end_time    varchar(100), 
  assessor_type      int4, 
  assess_object      int4, 
  others             varchar(400), 
  sts                int2 DEFAULT 0, 
  sts_time           timestamp DEFAULT CURRENT_TIMESTAMP, 
  remarks            varchar(4000), 
  PRIMARY KEY (assess_task_id));
COMMENT ON COLUMN assess_task.assess_task_id IS '??????????????????(assess_task)';
COMMENT ON COLUMN assess_task.assess_template_id IS '??????????????????(assess_template)';
COMMENT ON COLUMN assess_task.assess_task_name IS '??????????????????';
COMMENT ON COLUMN assess_task.assess_begin_time IS '??????????????????';
COMMENT ON COLUMN assess_task.assess_end_time IS '??????????????????';
COMMENT ON COLUMN assess_task.assessor_type IS '???????????????';
COMMENT ON COLUMN assess_task.assess_object IS '????????????';
COMMENT ON COLUMN assess_task.others IS '????????????';
COMMENT ON COLUMN assess_task.sts IS '??????';
COMMENT ON COLUMN assess_task.sts_time IS '????????????';
COMMENT ON COLUMN assess_task.remarks IS '??????';
CREATE TABLE assess_template (
  assess_template_id   int4 DEFAULT nextval('seq_assess_template') NOT NULL, 
  assess_template_name varchar(200), 
  assess_template_type int4, 
  sts                  int2 DEFAULT 0, 
  sts_time             timestamp DEFAULT CURRENT_TIMESTAMP, 
  remarks              varchar(4000), 
  PRIMARY KEY (assess_template_id));
COMMENT ON COLUMN assess_template.assess_template_id IS '??????????????????(assess_template)';
COMMENT ON COLUMN assess_template.assess_template_name IS '??????????????????';
COMMENT ON COLUMN assess_template.assess_template_type IS '??????????????????';
COMMENT ON COLUMN assess_template.sts IS '??????';
COMMENT ON COLUMN assess_template.sts_time IS '????????????';
COMMENT ON COLUMN assess_template.remarks IS '??????';

CREATE UNIQUE INDEX dept_dept_id 
  ON dept (dept_id);
CREATE UNIQUE INDEX dept_up_dept_id 
  ON dept (up_dept_id);
CREATE UNIQUE INDEX staff_staff_id 
  ON staff (staff_id);
CREATE UNIQUE INDEX staff_foot_log_staff_foot_log_id 
  ON staff_foot_log (staff_foot_log_id);
CREATE UNIQUE INDEX assess_assess_id 
  ON assess (assess_id);
CREATE UNIQUE INDEX assess_grade_assess_grade_id 
  ON assess_grade (assess_grade_id);
CREATE UNIQUE INDEX assess_index_assess_index_id 
  ON assess_index (assess_index_id);
CREATE UNIQUE INDEX assess_score_assess_score_id 
  ON assess_score (assess_score_id);
CREATE UNIQUE INDEX assess_template_assess_template_id 
  ON assess_template (assess_template_id);

ALTER TABLE assess_task ADD CONSTRAINT FKassess_tas191845 FOREIGN KEY (assess_template_id) REFERENCES assess_template (assess_template_id);
ALTER TABLE assess_grade ADD CONSTRAINT FKassess_gra228429 FOREIGN KEY (assess_template_id) REFERENCES assess_template (assess_template_id);
ALTER TABLE assess_task ADD CONSTRAINT FKassess_tas191846 FOREIGN KEY (assess_template_id) REFERENCES assess_template (assess_template_id);
ALTER TABLE assess_grade ADD CONSTRAINT FKassess_gra228430 FOREIGN KEY (assess_template_id) REFERENCES assess_template (assess_template_id);
ALTER TABLE assess_index ADD CONSTRAINT FKassess_ind497616 FOREIGN KEY (assess_template_id) REFERENCES assess_template (assess_template_id);
ALTER TABLE assess_index ADD CONSTRAINT FKassess_ind15566 FOREIGN KEY (up_assess_index_id) REFERENCES assess_INDEX (assess_index_id);
ALTER TABLE staff_foot_log ADD CONSTRAINT FKstaff_foot48986 FOREIGN KEY (staff_id) REFERENCES staff (staff_id);
ALTER TABLE staff ADD CONSTRAINT FKstaff963681 FOREIGN KEY (dept_id) REFERENCES dept (dept_id);
ALTER TABLE dept ADD CONSTRAINT FKdept96894 FOREIGN KEY (up_dept_id) REFERENCES dept (dept_id);