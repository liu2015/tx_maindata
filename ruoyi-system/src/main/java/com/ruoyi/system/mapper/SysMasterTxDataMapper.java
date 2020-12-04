package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysMasterTxData;

/**
 * sd主数据Mapper接口
 * 
 * @author liu
 * @date 2020-12-04
 */
public interface SysMasterTxDataMapper 
{
    /**
     * 查询sd主数据
     * 
     * @param id sd主数据ID
     * @return sd主数据
     */
    public SysMasterTxData selectSysMasterTxDataById(Long id);

    /**
     * 查询sd主数据列表
     * 
     * @param sysMasterTxData sd主数据
     * @return sd主数据集合
     */
    public List<SysMasterTxData> selectSysMasterTxDataList(SysMasterTxData sysMasterTxData);

    /**
     * 新增sd主数据
     * 
     * @param sysMasterTxData sd主数据
     * @return 结果
     */
    public int insertSysMasterTxData(SysMasterTxData sysMasterTxData);

    /**
     * 修改sd主数据
     * 
     * @param sysMasterTxData sd主数据
     * @return 结果
     */
    public int updateSysMasterTxData(SysMasterTxData sysMasterTxData);

    /**
     * 删除sd主数据
     * 
     * @param id sd主数据ID
     * @return 结果
     */
    public int deleteSysMasterTxDataById(Long id);

    /**
     * 批量删除sd主数据
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysMasterTxDataByIds(Long[] ids);
}
