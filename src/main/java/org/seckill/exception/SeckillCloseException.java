package org.seckill.exception;

/**
 * 秒杀关闭异常
 * Created by 24102 on 2017/6/22.
 */
public class SeckillCloseException extends SeckillException {
    public SeckillCloseException(String message) {
        super(message);
    }

    public SeckillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}
