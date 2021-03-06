package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysTestTubiaoData;

/**
 * 销售数据图表1Mapper接口
 * 
 * @author liu
 * @date 2020-12-13
 */
public interface SysTestTubiaoDataMapper 
{
    /**
     * 查询销售数据图表1
     * 
     * @param ordId 销售数据图表1ID
     * @return 销售数据图表1
     */
    public SysTestTubiaoData selectSysTestTubiaoDataById(String ordId);

    /**
     * 查询销售数据图表1列表
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 销售数据图表1集合
     */
    public List<SysTestTubiaoData> selectSysTestTubiaoDataList(SysTestTubiaoData sysTestTubiaoData);

    /**
     * 新增销售数据图表1
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 结果
     */
    public int insertSysTestTubiaoData(SysTestTubiaoData sysTestTubiaoData);

    /**
     * 修改销售数据图表1
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 结果
     */
    public int updateSysTestTubiaoData(SysTestTubiaoData sysTestTubiaoData);

    /**
     * 删除销售数据图表1
     * 
     * @param ordId 销售数据图表1ID
     * @return 结果
     */
    public int deleteSysTestTubiaoDataById(String ordId);

    /**
     * 批量删除销售数据图表1
     * 
     * @param ordIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysTestTubiaoDataByIds(String[] ordIds);
}
