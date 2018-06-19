package com.github.dalianghe.core.util;

import lombok.Getter;
import lombok.Setter;

/**
 * @author hedaliang
 * @date 2018/02/12.
 * @email 276420284@qq.com
 * 复选框类
 */
@Getter
@Setter
public class Checkbox {

  private String id;
  private String name;
  /**默认未选择*/
  private boolean check=false;

}
