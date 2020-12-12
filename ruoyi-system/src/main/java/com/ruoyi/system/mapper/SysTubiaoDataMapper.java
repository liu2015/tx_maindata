package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysTubiaoData;

/**
 * 销售图表Mapper接口
 * 
 * @author liu
 * @date 2020-12-12
 */
public interface SysTubiaoDataMapper 
{
    /**
     * 查询销售图表
     * 
     * @param digndanId 销售图表ID
     * @return 销售图表
     */
    public SysTubiaoData selectSysTubiaoDataById(String digndanId);

    /**
     * 查询销售图表列表
     * 
     * @param sysTubiaoData 销售图表
     * @return 销售图表集合
     */
    public List<SysTubiaoData> selectSysTubiaoDataList(SysTubiaoData sysTubiaoData);

    /**
     * 新增销售图表
     * 
     * @param sysTubiaoData 销售图表
     * @return 结果
     */
    public int insertSysTubiaoData(SysTubiaoData sysTubiaoData);

    /**
     * 修改销售图表
     * 
     * @param sysTubiaoData 销售图表
     * @return 结果
     */
    public int updateSysTubiaoData(SysTubiaoData sysTubiaoData);

    /**
     * 删除销售图表
     * 
     * @param digndanId 销售图表ID
     * @return 结果
     */
    public int deleteSysTubiaoDataById(String digndanId);

    /**
     * 批量删除销售图表
     * 
     * @param digndanIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysTubiaoDataByIds(String[] digndanIds);
}
