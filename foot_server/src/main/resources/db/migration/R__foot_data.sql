-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (1, 1, '年可用饮水量', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (2, 2, '实际用水量', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (3, 3, '闸门水位流量', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (4, 4, '灌溉需水量用水量', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (5, 5, '灌区排水量', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (6, 6, '雨量监测', 1, '5对');

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (7, 7, '地下水位监测', 1, '5个测点共5个数据');

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (8, 8, '土壤墒情监测', 1, '5个测点，每个点3组数据');

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (9, 9, '电水平尺', 1, '3个测点，每个点2个数据');

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (10, 10, '渗压计', 1, '3个测点，每个点1个数据');

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (11, 11, '灌溉水利用率', 1, null);

-- insert into irrigate (IRRIGATE_ID, IRRIGATE_TYPE, NAME, STS, REMARKS)
-- values (12, 12, '灌溉用水占比', 1, null);

-- prompt Importing table irrigate_data_type...
-- set feedback off
-- set define off
-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (33, 3, '闸门', 16, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (1, 1, '引用水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (2, 2, '实际用水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (3, 3, '闸前水位', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (4, 3, '闸后水位', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (5, 3, '闸门流量', 1, 1, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (6, 4, '需水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (7, 4, '用水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (8, 5, '灌区排水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (9, 6, '降水量', 5, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (10, 6, '降水日数', 5, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (11, 7, '测点', 1, 0, null, 1, null, 2, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (12, 8, '测点1', 3, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (13, 8, '测点2', 3, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (14, 8, '测点3', 3, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (15, 9, '测点1', 2, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (16, 9, '测点2', 2, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (17, 10, '测点1', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (18, 11, '用水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (19, 11, '总用水量', 1, 0, null, 1, null, 1, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (20, 12, '用水量', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (21, 12, '总用水量', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (22, 12, '用水面积', 1, 0, null, 1, null, 0, null);

-- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS, DATA_LEVEL, SORT_NBR)
-- values (23, 12, '面积', 1, 0, null, 1, null, 0, null);

-- prompt Importing table irrigate_point...
-- set feedback off
-- set define off
-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (1, 3, 1, 'gate01', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (2, 4, 1, 'gate01', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (3, 3, 2, 'gate02', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (4, 4, 2, 'gate02', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (5, 3, 3, 'gate03', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (6, 4, 3, 'gate03', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (7, 3, 4, 'gate04', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (8, 4, 4, 'gate04', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (9, 3, 5, 'gate05', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (10, 4, 5, 'gate05', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (11, 3, 6, 'gate06', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (12, 4, 6, 'gate06', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (13, 3, 7, 'gate07', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (14, 4, 7, 'gate07', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (15, 3, 8, 'gate08', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (16, 4, 8, 'gate08', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (17, 3, 9, 'gate09', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (18, 4, 9, 'gate09', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (19, 3, 10, 'gate10', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (20, 4, 10, 'gate10', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (21, 3, 11, 'gate11', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (22, 4, 11, 'gate11', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (23, 3, 12, 'gate12', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (24, 4, 12, 'gate12', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (25, 3, 13, 'gate13', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (26, 4, 13, 'gate13', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (27, 3, 14, 'gate14', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (28, 4, 14, 'gate14', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (29, 3, 15, 'gate15', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (30, 4, 15, 'gate15', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (31, 3, 16, 'gate16', 'mwpf');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (32, 4, 16, 'gate16', 'mwpr');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (33, 9, 1, 'rain1', 'rain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (34, 10, 1, 'rain1', 'accrain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (35, 9, 2, 'rain2', 'rain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (36, 10, 2, 'rain2', 'accrain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (37, 9, 3, 'rain3', 'rain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (38, 10, 3, 'rain3', 'accrain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (39, 9, 4, 'rain4', 'rain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (40, 10, 4, 'rain4', 'accrain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (41, 9, 5, 'rain5', 'rain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (42, 10, 5, 'rain5', 'accrain');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (43, 11, 1, 'rain1', 'wp');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (44, 11, 2, 'rain2', 'wp');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (45, 11, 3, 'rain3', 'wp');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (46, 11, 4, 'rain4', 'wp');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (47, 11, 5, 'rain5', 'wp');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (48, 12, 1, 'rain1', 'an1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (49, 13, 1, 'rain1', 'an2');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (50, 14, 1, 'rain1', 'an3');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (51, 12, 2, 'rain2', 'an1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (52, 13, 2, 'rain2', 'an2');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (53, 14, 2, 'rain2', 'an3');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (54, 12, 3, 'rain3', 'an1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (55, 13, 3, 'rain3', 'an2');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (56, 14, 3, 'rain3', 'an3');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (57, 12, 4, 'rain4', 'an1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (58, 13, 4, 'rain4', 'an2');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (59, 14, 4, 'rain4', 'an3');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (60, 12, 5, 'rain5', 'an1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (61, 13, 5, 'rain5', 'an2');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (62, 14, 5, 'rain5', 'an3');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (63, 15, 1, 'safety1', 'x1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (64, 16, 1, 'safety1', 'y1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (65, 15, 2, 'safety2', 'x1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (66, 16, 2, 'safety2', 'y1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (67, 15, 3, 'safety3', 'x1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (68, 16, 3, 'safety3', 'y1');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (69, 17, 1, 'safety1', 'fmodel');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (70, 17, 2, 'safety2', 'fmodel');

-- insert into irrigate_point (POINT_ID, IRRIGATE_TYPE_ID, POINT_GROUP, POINT_NAME, DATA_POINT)
-- values (71, 17, 3, 'safety3', 'fmodel');

-- prompt Done.








-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (1, 1, '引用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (2, 2, '实际用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (3, 3, '闸前水位', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (4, 3, '闸后水位', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (5, 3, '闸门流量', 1, 1, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (6, 4, '需水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (7, 4, '用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (8, 5, '灌区排水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (9, 6, '降水量', 5, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (10, 6, '降水日数', 5, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (11, 7, '测点1', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (12, 7, '测点2', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (13, 7, '测点3', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (14, 7, '测点4', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (15, 7, '测点5', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (16, 8, '测点1', 3, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (17, 8, '测点2', 3, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (18, 8, '测点3', 3, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (19, 8, '测点4', 3, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (20, 8, '测点5', 3, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (21, 9, '测点1', 2, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (22, 9, '测点2', 2, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (23, 9, '测点3', 2, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (24, 10, '测点1', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (25, 10, '测点2', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (26, 10, '测点3', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (27, 11, '用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (28, 11, '总用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (29, 12, '用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (30, 12, '总用水量', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (31, 12, '用水面积', 1, 0, null, 1, null);

-- -- insert into irrigate_data_type (IRRIGATE_TYPE_ID, IRRIGATE_ID, DATA_NAME, DATA_NBR, IS_CALC, CALC_SCRIPT, STS, REMARKS)
-- -- values (32, 12, '面积', 1, 0, null, 1, null);




-- prompt Importing table irrigate_data...
-- set feedback off
-- set define off
-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (2, 1, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 92.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (3, 2, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 82.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (4, 3, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 30.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (5, 4, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 51.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (6, 5, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 39.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (7, 6, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 54.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (8, 7, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 47.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (9, 8, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 30.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (10, 9, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 23.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (11, 9, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 52.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (12, 9, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 6.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (13, 9, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 23.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (14, 9, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 10.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (15, 10, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 70.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (16, 10, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 22.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (17, 10, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 43.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (18, 10, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 16.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (19, 10, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (20, 11, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 17.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (21, 12, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (22, 13, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (23, 14, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 63.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (24, 15, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 52.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (25, 16, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 41.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (26, 16, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (27, 16, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 81.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (28, 20, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 57.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (29, 20, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 30.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (30, 20, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 67.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (31, 19, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 59.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (32, 19, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 30.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (33, 19, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (34, 18, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (35, 18, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 68.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (36, 18, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 77.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (37, 17, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 11.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (38, 17, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (39, 17, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (40, 22, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (41, 22, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (42, 21, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 8.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (43, 21, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 51.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (44, 23, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 24.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (45, 23, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (46, 25, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 36.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (47, 24, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (48, 26, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (49, 27, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 49.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (50, 28, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 88.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (51, 31, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 94.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (52, 30, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 51.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (53, 29, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 67.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (54, 32, to_date('11-04-2021 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 65.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (55, 1, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 65.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (56, 2, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (57, 3, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 11.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (58, 4, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (59, 5, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 57.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (60, 6, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (61, 7, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 71.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (62, 8, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 96.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (63, 9, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 87.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (64, 9, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 52.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (65, 9, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 41.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (66, 9, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 97.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (67, 9, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (68, 10, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 8.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (69, 10, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 1.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (70, 10, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 58.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (71, 10, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 31.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (72, 10, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 73.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (73, 11, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 34.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (74, 12, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 19.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (75, 13, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 17.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (76, 14, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 29.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (77, 15, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 88.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (78, 16, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 93.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (79, 16, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 95.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (80, 16, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 14.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (81, 20, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 18.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (82, 20, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (83, 20, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 38.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (84, 19, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 83.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (85, 19, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 41.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (86, 19, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 40.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (87, 18, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 81.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (88, 18, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 88.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (89, 18, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (90, 17, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 84.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (91, 17, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 15.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (92, 17, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 22.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (93, 22, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 16.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (94, 22, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 92.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (95, 21, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 36.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (96, 21, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 11.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (97, 23, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 70.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (98, 23, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (99, 25, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (100, 24, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 37.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (101, 26, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 96.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (102, 27, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 26.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (103, 28, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 90.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (104, 31, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 5.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (105, 30, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 22.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (106, 29, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 24.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (107, 32, to_date('11-04-2021 21:49:03', 'dd-mm-yyyy hh24:mi:ss'), 72.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (108, 1, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 30.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (109, 2, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 6.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (110, 3, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 88.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (111, 4, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 36.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (112, 5, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (113, 6, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 99.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (114, 7, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 95.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (115, 8, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (116, 9, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 10.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (117, 9, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 71.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (118, 9, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 75.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (119, 9, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 61.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (120, 9, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 78.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (121, 10, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 96.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (122, 10, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (123, 10, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 92.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (124, 10, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 75.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (125, 10, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 65.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (126, 11, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (127, 12, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 21.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (128, 13, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 2.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (129, 14, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 72.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (130, 15, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 12.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (131, 16, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 27.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (132, 16, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 36.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (133, 16, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 87.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (134, 20, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 15.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (135, 20, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 34.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (136, 20, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 1.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (137, 19, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 94.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (138, 19, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 92.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (139, 19, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (140, 18, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (141, 18, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 89.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (142, 18, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 88.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (143, 17, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 90.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (144, 17, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 5.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (145, 17, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 59.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (146, 22, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 26.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (147, 22, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (148, 21, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 51.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (149, 21, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (150, 23, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 17.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (151, 23, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 83.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (152, 25, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 19.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (153, 24, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 96.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (154, 26, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (155, 27, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 63.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (156, 28, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 37.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (157, 31, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 4.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (158, 30, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 35.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (159, 29, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 73.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (160, 32, to_date('11-04-2021 21:50:03', 'dd-mm-yyyy hh24:mi:ss'), 5.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (161, 1, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 76.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (162, 2, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 18.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (163, 3, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 37.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (164, 4, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 59.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (165, 5, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (166, 6, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 95.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (167, 7, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 74.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (168, 8, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 40.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (169, 9, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 79.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (170, 9, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 53.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (171, 9, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 78.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (172, 9, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 7.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (173, 9, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 26.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (174, 10, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 90.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (175, 10, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 35.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (176, 10, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 99.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (177, 10, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 14.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (178, 10, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 6.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (179, 11, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 81.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (180, 12, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 33.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (181, 13, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (182, 14, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 42.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (183, 15, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 87.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (184, 16, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (185, 16, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 57.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (186, 16, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 28.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (187, 20, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (188, 20, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (189, 20, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 55.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (190, 19, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 75.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (191, 19, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 3.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (192, 19, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 9.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (193, 18, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 82.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (194, 18, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 29.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (195, 18, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 65.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (196, 17, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 42.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (197, 17, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 47.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (198, 17, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 43.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (199, 22, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 2.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (200, 22, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 38.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (201, 21, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 24.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (202, 21, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 90.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (203, 23, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 93.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (204, 23, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 81.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (205, 25, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 84.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (206, 24, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 91.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (207, 26, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 52.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (208, 27, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 35.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (209, 28, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 70.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (210, 31, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 99.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (211, 30, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 11.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (212, 29, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 94.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (213, 32, to_date('11-04-2021 21:50:20', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (214, 1, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (215, 2, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 57.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (216, 3, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 95.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (217, 4, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 21.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (218, 5, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 40.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (219, 6, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 98.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (220, 7, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 37.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (221, 8, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 51.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (222, 9, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 66.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (223, 9, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 37.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (224, 9, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 17.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (225, 9, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 25.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (226, 9, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 48.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (227, 10, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 20.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (228, 10, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 35.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (229, 10, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 5.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (230, 10, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 43.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (231, 10, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 13.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (232, 11, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 96.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (233, 12, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 21.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (234, 13, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 2.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (235, 14, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (236, 15, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 72.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (237, 16, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 15.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (238, 16, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 16.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (239, 16, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 53.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (240, 20, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 33.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (241, 20, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 39.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (242, 20, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 66.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (243, 19, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 69.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (244, 19, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 67.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (245, 19, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 80.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (246, 18, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 44.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (247, 18, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 5.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (248, 18, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 28.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (249, 17, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 82.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (250, 17, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 31.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (251, 17, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 56.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (252, 22, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 80.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (253, 22, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 49.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (254, 21, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 62.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (255, 21, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 69.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (256, 23, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 25.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (257, 23, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 27.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (258, 25, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 79.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (259, 24, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 43.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (260, 26, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 45.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (261, 27, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 78.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (262, 28, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 93.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (263, 31, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 46.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (264, 30, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 75.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (265, 29, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 52.00);

-- insert into irrigate_data (DATA_ID, IRRIGATE_TYPE_ID, DATA_TIME, DATA_VALUE)
-- values (266, 32, to_date('11-04-2021 21:51:25', 'dd-mm-yyyy hh24:mi:ss'), 87.00);

-- prompt Done.
