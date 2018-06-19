package com.github.dalianghe.core.base;

import java.io.Serializable;
import java.util.List;

/**
 * @author hedaliang
 * @date 2018/02/12.
 * @email 276420284@qq.com
 */
public interface BaseMapper<T,E extends Serializable>{

    /**
     * 根据id删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(E id);

    /**
     * 插入
     * @param record
     * @return
     */
    int insert(T record);

    /**
     *插入非空字段
     * @param record
     * @return
     */
    int insertSelective(T record);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    T selectByPrimaryKey(E id);

    /**
     * 更新非空数据
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);

    /**
     * 更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(T record);

    /**
     * 查询
     * @param record
     * @return
     */
    List<T> selectListByPage(T record);
}
