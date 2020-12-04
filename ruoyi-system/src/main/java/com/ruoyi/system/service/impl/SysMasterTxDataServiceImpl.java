package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysMasterTxDataMapper;
import com.ruoyi.system.domain.SysMasterTxData;
import com.ruoyi.system.service.ISysMasterTxDataService;

/**
 * sd主数据Service业务层处理
 * 
 * @author liu
 * @date 2020-12-04
 */
@Service
public class SysMasterTxDataServiceImpl implements ISysMasterTxDataService 
{
    @Autowired
    private SysMasterTxDataMapper sysMasterTxDataMapper;

    /**
     * 查询sd主数据
     * 
     * @param id sd主数据ID
     * @return sd主数据
     */
    @Override
    public SysMasterTxData selectSysMasterTxDataById(Long id)
    {
        return sysMasterTxDataMapper.selectSysMasterTxDataById(id);
    }

    /**
     * 查询sd主数据列表
     * 
     * @param sysMasterTxData sd主数据
     * @return sd主数据
     */
    @Override
    public List<SysMasterTxData> selectSysMasterTxDataList(SysMasterTxData sysMasterTxData)
    {
        return sysMasterTxDataMapper.selectSysMasterTxDataList(sysMasterTxData);
    }

    /**
     * 新增sd主数据
     * 
     * @param sysMasterTxData sd主数据
     * @return 结果
     */
    @Override
    public int insertSysMasterTxData(SysMasterTxData sysMasterTxData)
    {
        return sysMasterTxDataMapper.insertSysMasterTxData(sysMasterTxData);
    }

    /**
     * 修改sd主数据
     * 
     * @param sysMasterTxData sd主数据
     * @return 结果
     */
    @Override
    public int updateSysMasterTxData(SysMasterTxData sysMasterTxData)
    {
        return sysMasterTxDataMapper.updateSysMasterTxData(sysMasterTxData);
    }

    /**
     * 批量删除sd主数据
     * 
     * @param ids 需要删除的sd主数据ID
     * @return 结果
     */
    @Override
    public int deleteSysMasterTxDataByIds(Long[] ids)
    {
        return sysMasterTxDataMapper.deleteSysMasterTxDataByIds(ids);
    }

    /**
     * 删除sd主数据信息
     * 
     * @param id sd主数据ID
     * @return 结果
     */
    @Override
    public int deleteSysMasterTxDataById(Long id)
    {
        return sysMasterTxDataMapper.deleteSysMasterTxDataById(id);
    }
}
