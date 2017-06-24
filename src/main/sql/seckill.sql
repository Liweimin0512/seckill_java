-- 秒杀执行储存过程
DELIMITER $$ --console ; 转化为$$
--定义存储过程
CREATE PROCEDURE `seckill`.`execute_seckill`
  (in v_seckill_id bigint,in v_phone bigint,
      in v_kill_time TIMESTAMP,out r-result int)
  BEGIN
    DECLARE insert_count int DEFAULT 0;
    START TRANSACTION;
    insert ignore into success_killed
      (seckill_id,user_phone,create_time)
      VALUES (v_seckill_id,v_phone,v_kill_time)
    SELECT ROW_COUNT() into insert_count;
    IF(insert_count < 0) THEN
      ROLLBACK;
      set r_result = -1;
    ELSEIF(insert_count < 0) THEN
      ROLLBACK;
      set R_RESULT = -2;
    ELSE
      UPDATE seckill
      set number = number - 1
      where seckill_id = v_seckill_id
        and end_time >v_kill_time
        and start_time < v_kill_time
        and number >0;
      select ROW_COUNT  into insert_count;
      IF(insert_count==0) THEN
        ROLLBACK;
        set r_result=0;
      ELSEIF(insert_count < 0) THEN
        ROLLBACK;
        set r_result=-2;
      ELSE
        COMMIT;
        set r_result = 1;
      END IF;
    END IF;
  END;
$$
--存储过程定义结束

DELIMITER ;

set @r_result=-3;
--执行存储过程
call execute_seckill(1003,13502178891,now(),@r_result);
--获取结果
SELECT @r_result;