package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysTestTubiaoDataMapper;
import com.ruoyi.system.domain.SysTestTubiaoData;
import com.ruoyi.system.service.ISysTestTubiaoDataService;

/**
 * 销售数据图表1Service业务层处理
 * 
 * @author liu
 * @date 2020-12-13
 */
@Service
public class SysTestTubiaoDataServiceImpl implements ISysTestTubiaoDataService 
{
    @Autowired
    private SysTestTubiaoDataMapper sysTestTubiaoDataMapper;

    /**
     * 查询销售数据图表1
     * 
     * @param ordId 销售数据图表1ID
     * @return 销售数据图表1
     */
    @Override
    public SysTestTubiaoData selectSysTestTubiaoDataById(String ordId)
    {
        return sysTestTubiaoDataMapper.selectSysTestTubiaoDataById(ordId);
    }

    /**
     * 查询销售数据图表1列表
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 销售数据图表1
     */
    @Override
    public List<SysTestTubiaoData> selectSysTestTubiaoDataList(SysTestTubiaoData sysTestTubiaoData)
    {
        return sysTestTubiaoDataMapper.selectSysTestTubiaoDataList(sysTestTubiaoData);
    }

    /**
     * 新增销售数据图表1
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 结果
     */
    @Override
    public int insertSysTestTubiaoData(SysTestTubiaoData sysTestTubiaoData)
    {
        return sysTestTubiaoDataMapper.insertSysTestTubiaoData(sysTestTubiaoData);
    }

    /**
     * 修改销售数据图表1
     * 
     * @param sysTestTubiaoData 销售数据图表1
     * @return 结果
     */
    @Override
    public int updateSysTestTubiaoData(SysTestTubiaoData sysTestTubiaoData)
    {
        return sysTestTubiaoDataMapper.updateSysTestTubiaoData(sysTestTubiaoData);
    }

    /**
     * 批量删除销售数据图表1
     * 
     * @param ordIds 需要删除的销售数据图表1ID
     * @return 结果
     */
    @Override
    public int deleteSysTestTubiaoDataByIds(String[] ordIds)
    {
        return sysTestTubiaoDataMapper.deleteSysTestTubiaoDataByIds(ordIds);
    }

    /**
     * 删除销售数据图表1信息
     * 
     * @param ordId 销售数据图表1ID
     * @return 结果
     */
    @Override
    public int deleteSysTestTubiaoDataById(String ordId)
    {
        return sysTestTubiaoDataMapper.deleteSysTestTubiaoDataById(ordId);
    }
}
