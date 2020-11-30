package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysManListDataMapper;
import com.ruoyi.system.domain.SysManListData;
import com.ruoyi.system.service.ISysManListDataService;

/**
 * sys_man_list_dataService业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-30
 */
@Service
public class SysManListDataServiceImpl implements ISysManListDataService 
{
    @Autowired
    private SysManListDataMapper sysManListDataMapper;

    /**
     * 查询sys_man_list_data
     * 
     * @param id sys_man_list_dataID
     * @return sys_man_list_data
     */
    @Override
    public SysManListData selectSysManListDataById(Long id)
    {
        return sysManListDataMapper.selectSysManListDataById(id);
    }

    /**
     * 查询sys_man_list_data列表
     * 
     * @param sysManListData sys_man_list_data
     * @return sys_man_list_data
     */
    @Override
    public List<SysManListData> selectSysManListDataList(SysManListData sysManListData)
    {
        return sysManListDataMapper.selectSysManListDataList(sysManListData);
    }

    /**
     * 新增sys_man_list_data
     * 
     * @param sysManListData sys_man_list_data
     * @return 结果
     */
    @Override
    public int insertSysManListData(SysManListData sysManListData)
    {
        return sysManListDataMapper.insertSysManListData(sysManListData);
    }

    /**
     * 修改sys_man_list_data
     * 
     * @param sysManListData sys_man_list_data
     * @return 结果
     */
    @Override
    public int updateSysManListData(SysManListData sysManListData)
    {
        return sysManListDataMapper.updateSysManListData(sysManListData);
    }

    /**
     * 批量删除sys_man_list_data
     * 
     * @param ids 需要删除的sys_man_list_dataID
     * @return 结果
     */
    @Override
    public int deleteSysManListDataByIds(Long[] ids)
    {
        return sysManListDataMapper.deleteSysManListDataByIds(ids);
    }

    /**
     * 删除sys_man_list_data信息
     * 
     * @param id sys_man_list_dataID
     * @return 结果
     */
    @Override
    public int deleteSysManListDataById(Long id)
    {
        return sysManListDataMapper.deleteSysManListDataById(id);
    }
}
