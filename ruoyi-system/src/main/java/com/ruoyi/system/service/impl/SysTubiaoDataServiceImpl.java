package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysTubiaoDataMapper;
import com.ruoyi.system.domain.SysTubiaoData;
import com.ruoyi.system.service.ISysTubiaoDataService;

/**
 * 销售图表Service业务层处理
 * 
 * @author liu
 * @date 2020-12-12
 */
@Service
public class SysTubiaoDataServiceImpl implements ISysTubiaoDataService 
{
    @Autowired
    private SysTubiaoDataMapper sysTubiaoDataMapper;

    /**
     * 查询销售图表
     * 
     * @param digndanId 销售图表ID
     * @return 销售图表
     */
    @Override
    public SysTubiaoData selectSysTubiaoDataById(String digndanId)
    {
        return sysTubiaoDataMapper.selectSysTubiaoDataById(digndanId);
    }

    /**
     * 查询销售图表列表
     * 
     * @param sysTubiaoData 销售图表
     * @return 销售图表
     */
    @Override
    public List<SysTubiaoData> selectSysTubiaoDataList(SysTubiaoData sysTubiaoData)
    {
        return sysTubiaoDataMapper.selectSysTubiaoDataList(sysTubiaoData);
    }

    /**
     * 新增销售图表
     * 
     * @param sysTubiaoData 销售图表
     * @return 结果
     */
    @Override
    public int insertSysTubiaoData(SysTubiaoData sysTubiaoData)
    {
        return sysTubiaoDataMapper.insertSysTubiaoData(sysTubiaoData);
    }

    /**
     * 修改销售图表
     * 
     * @param sysTubiaoData 销售图表
     * @return 结果
     */
    @Override
    public int updateSysTubiaoData(SysTubiaoData sysTubiaoData)
    {
        return sysTubiaoDataMapper.updateSysTubiaoData(sysTubiaoData);
    }

    /**
     * 批量删除销售图表
     * 
     * @param digndanIds 需要删除的销售图表ID
     * @return 结果
     */
    @Override
    public int deleteSysTubiaoDataByIds(String[] digndanIds)
    {
        return sysTubiaoDataMapper.deleteSysTubiaoDataByIds(digndanIds);
    }

    /**
     * 删除销售图表信息
     * 
     * @param digndanId 销售图表ID
     * @return 结果
     */
    @Override
    public int deleteSysTubiaoDataById(String digndanId)
    {
        return sysTubiaoDataMapper.deleteSysTubiaoDataById(digndanId);
    }
}
