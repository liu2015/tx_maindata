package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysManDataMapper;
import com.ruoyi.system.domain.SysManData;
import com.ruoyi.system.service.ISysManDataService;

/**
 * man_dataService业务层处理
 * 
 * @author liu
 * @date 2020-11-29
 */
@Service
public class SysManDataServiceImpl implements ISysManDataService 
{
    @Autowired
    private SysManDataMapper sysManDataMapper;

    /**
     * 查询man_data
     * 
     * @param id man_dataID
     * @return man_data
     */
    @Override
    public SysManData selectSysManDataById(Long id)
    {
        return sysManDataMapper.selectSysManDataById(id);
    }

    /**
     * 查询man_data列表
     * 
     * @param sysManData man_data
     * @return man_data
     */
    @Override
    public List<SysManData> selectSysManDataList(SysManData sysManData)
    {
        return sysManDataMapper.selectSysManDataList(sysManData);
    }

    /**
     * 新增man_data
     * 
     * @param sysManData man_data
     * @return 结果
     */
    @Override
    public int insertSysManData(SysManData sysManData)
    {
        return sysManDataMapper.insertSysManData(sysManData);
    }

    /**
     * 修改man_data
     * 
     * @param sysManData man_data
     * @return 结果
     */
    @Override
    public int updateSysManData(SysManData sysManData)
    {
        return sysManDataMapper.updateSysManData(sysManData);
    }

    /**
     * 批量删除man_data
     * 
     * @param ids 需要删除的man_dataID
     * @return 结果
     */
    @Override
    public int deleteSysManDataByIds(Long[] ids)
    {
        return sysManDataMapper.deleteSysManDataByIds(ids);
    }

    /**
     * 删除man_data信息
     * 
     * @param id man_dataID
     * @return 结果
     */
    @Override
    public int deleteSysManDataById(Long id)
    {
        return sysManDataMapper.deleteSysManDataById(id);
    }
}
