package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysMasterTxData;

/**
 * sd主数据Service接口
 * 
 * @author liu
 * @date 2020-12-04
 */
public interface ISysMasterTxDataService 
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
     * 批量删除sd主数据
     * 
     * @param ids 需要删除的sd主数据ID
     * @return 结果
     */
    public int deleteSysMasterTxDataByIds(Long[] ids);

    /**
     * 删除sd主数据信息
     * 
     * @param id sd主数据ID
     * @return 结果
     */
    public int deleteSysMasterTxDataById(Long id);
}
