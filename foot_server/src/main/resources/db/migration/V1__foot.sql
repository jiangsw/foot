DROP SEQUENCE seq_data_id;

DROP TABLE irrigate CASCADE CONSTRAINTS;
DROP TABLE irrigate_point CASCADE CONSTRAINTS;
DROP TABLE irrigate_data CASCADE CONSTRAINTS;
DROP TABLE irrigate_data_type CASCADE CONSTRAINTS;

CREATE SEQUENCE seq_data_id;

CREATE TABLE irrigate (irrigate_id number(8) NOT NULL, irrigate_type number(4), name varchar2(200), data_src number(4), sts number(2), remarks varchar2(2000), PRIMARY KEY (irrigate_id));
COMMENT ON COLUMN irrigate.irrigate_id IS '灌溉代码(irrigate)';
COMMENT ON COLUMN irrigate.irrigate_type IS '灌溉类型';
COMMENT ON COLUMN irrigate.name IS '灌溉名称';
COMMENT ON COLUMN irrigate.data_src IS '数据来源(0-手工,1-采集)';
COMMENT ON COLUMN irrigate.sts IS '状态';
COMMENT ON COLUMN irrigate.remarks IS '备注';



CREATE TABLE irrigate_data (data_id number(8) NOT NULL, irrigate_type_id number(8), data_time date, data_value number(10, 2), PRIMARY KEY (data_id));
COMMENT ON COLUMN irrigate_data.data_id IS '数据代码(irrigate_data)';
COMMENT ON COLUMN irrigate_data.data_time IS '数据时间';
COMMENT ON COLUMN irrigate_data.data_value IS '数据值';

CREATE TABLE irrigate_data_type (irrigate_type_id number(8) NOT NULL, irrigate_id number(8), data_name varchar2(200), data_level number(4) DEFAULT 0, point_name varchar2(100), data_point varchar2(100), data_nbr number(4), is_calc number(4), calc_script varchar2(200), sort_nbr number(4), sts number(2), remarks varchar2(2000), PRIMARY KEY (irrigate_type_id));
COMMENT ON COLUMN irrigate_data_type.irrigate_type_id IS '灌区数据类型代码(irrigate_data_type)';
COMMENT ON COLUMN irrigate_data_type.irrigate_id IS '灌溉代码(irrigate_id)';
COMMENT ON COLUMN irrigate_data_type.data_name IS '数据名称';
COMMENT ON COLUMN irrigate_data_type.data_level IS '1-月，0-实际时间';
COMMENT ON COLUMN irrigate_data_type.point_name IS '测点名称';
COMMENT ON COLUMN irrigate_data_type.data_point IS '测点数据编码';
COMMENT ON COLUMN irrigate_data_type.data_nbr IS '测点数据量(一个测点几个数据)';
COMMENT ON COLUMN irrigate_data_type.is_calc IS '是否计算值';
COMMENT ON COLUMN irrigate_data_type.calc_script IS '计算脚本名称';
COMMENT ON COLUMN irrigate_data_type.sort_nbr IS '排序值';
COMMENT ON COLUMN irrigate_data_type.sts IS '状态';
COMMENT ON COLUMN irrigate_data_type.remarks IS '备注';
CREATE UNIQUE INDEX irrigate_data_type_irrigate_type_id ON irrigate_data_type (irrigate_type_id);

CREATE TABLE irrigate_data (data_id number(8) NOT NULL, irrigate_type_id number(8), point_id number(8), data_time date, data_group number(4), data_value number(10, 2), sts number(2), PRIMARY KEY (data_id));
COMMENT ON COLUMN irrigate_data.data_id IS '数据代码(irrigate_data)';
COMMENT ON COLUMN irrigate_data.irrigate_type_id IS '灌区数据类型代码(irrigate_data_type)';
COMMENT ON COLUMN irrigate_data.data_time IS '数据时间';
COMMENT ON COLUMN irrigate_data.data_group IS '数据组(第几组数据)';
COMMENT ON COLUMN irrigate_data.data_value IS '数据值';
COMMENT ON COLUMN irrigate_data.sts IS '状态';



CREATE TABLE irrigate_point (point_id number(8) NOT NULL, irrigate_id number(8) NOT NULL, point_name varchar2(200), PRIMARY KEY (point_id));
COMMENT ON COLUMN irrigate_point.point_id IS '测点代码(irrigate_point)';
COMMENT ON COLUMN irrigate_point.point_name IS '测点名称';
CREATE UNIQUE INDEX irrigate_point_point_id ON irrigate_point (point_id);

CREATE UNIQUE INDEX irrigate_irrigate_id ON irrigate (irrigate_id);
CREATE UNIQUE INDEX irrigate_data_data_id ON irrigate_data (data_id);
CREATE UNIQUE INDEX irrigate_data_type_irrigate_type_id ON irrigate_data_type (irrigate_type_id);
CREATE INDEX irrigate_point_irrigate_id ON irrigate_point (irrigate_id);

ALTER TABLE irrigate_data ADD CONSTRAINT FKirrigate_d90491 FOREIGN KEY (irrigate_type_id) REFERENCES irrigate_data_type (irrigate_type_id);
ALTER TABLE irrigate_data_type ADD CONSTRAINT FKirrigate_d2160 FOREIGN KEY (irrigate_id) REFERENCES irrigate (irrigate_id);
