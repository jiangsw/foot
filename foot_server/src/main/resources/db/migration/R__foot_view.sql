-- create or replace view v_irrigate_data as
-- select data.*,
--        to_char(data_time,'yyyy-mm-dd hh24:mi:ss') data_time_string,
--        to_char(data_time,'yyyy-mm-dd') data_time_string1,
--        point_name,point_group,data_point,
--        data_name,data_nbr,
--        irrigate_type,irr.irrigate_id,name,data_src,data_level,is_calc,calc_script
--        from irrigate_data data
--        left join irrigate_point point on point.point_id = data.point_id       
--        left join irrigate_data_type data_type on data_type.irrigate_type_id = data.irrigate_type_id
--        left join irrigate irr on irr.irrigate_id = data_type.irrigate_id;


-- -- create or replace view v_irrigate_data as
-- -- select data.*,
-- --        to_char(data_time,'yyyy-mm-dd hh24:mi:ss') data_time_string,
-- --        point.irrigate_type_id,point_name,point_group,data_point,
-- --        data_name,data_nbr,
-- --        irrigate_type,name,data_src,data_level,is_calc,calc_script
-- --        from irrigate_data data,irrigate_point point,irrigate_data_type data_type,irrigate irr
-- --       where data.point_id = point.point_id
-- --         and point.irrigate_type_id = data_type.irrigate_type_id
-- --         and data_type.irrigate_id = irr.irrigate_id

-- -- create or replace view v_irrigate_data as
-- -- select irrigate_data.*,to_char(data_time,'yyyy-mm-dd hh24:mi:ss') data_time_string,
-- --        irrigate_type,name,data_name,data_level,data_nbr,is_calc,calc_script
-- --        from irrigate_data,irrigate_data_type,irrigate
-- --       where irrigate_data.irrigate_type_id = irrigate_data_type.irrigate_type_id
-- --         and irrigate_data_type.irrigate_id = irrigate.irrigate_id;

-- create or replace view v_irrigate_data_type as
-- select irrigate_data_type.*,name,irrigate_type,data_src
--        from irrigate_data_type,irrigate
--       where irrigate_data_type.irrigate_id=irrigate.irrigate_id;

-- create or replace view v_point as
-- select irrigate_point.*,irrigate_id,irrigate_type
--        from irrigate_point
--        left join v_irrigate_data_type on irrigate_point.irrigate_type_id = v_irrigate_data_type.irrigate_type_id
--       order by irrigate_id,irrigate_point.irrigate_type_id,point_group;