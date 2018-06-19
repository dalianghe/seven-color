package com.github.dalianghe.core.exception;

/**
 * @author hedaliang
 * @date 2018/02/15.
 * @email 276420284@qq.com
 */
public class MyException extends RuntimeException {

  private String message;

  public MyException(String message){
    super(message);
    this.message=message;
  }

  @Override
  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }
}
