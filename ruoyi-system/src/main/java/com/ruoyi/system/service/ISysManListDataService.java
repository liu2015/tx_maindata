package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysManListData;

/**
 * sys_man_list_dataService接口
 * 
 * @author ruoyi
 * @date 2020-11-30
 */
public interface ISysManListDataService 
{
    /**
     * 查询sys_man_list_data
     * 
     * @param id sys_man_list_dataID
     * @return sys_man_list_data
     */
    public SysManListData selectSysManListDataById(Long id);

    /**
     * 查询sys_man_list_data列表
     * 
     * @param sysManListData sys_man_list_data
     * @return sys_man_list_data集合
     */
    public List<SysManListData> selectSysManListDataList(SysManListData sysManListData);

    /**
     * 新增sys_man_list_data
     * 
     * @param sysManListData sys_man_list_data
     * @return 结果
     */
    public int insertSysManListData(SysManListData sysManListData);

    /**
     * 修改sys_man_list_data
     * 
     * @param sysManListData sys_man_list_data
     * @return 结果
     */
    public int updateSysManListData(SysManListData sysManListData);

    /**
     * 批量删除sys_man_list_data
     * 
     * @param ids 需要删除的sys_man_list_dataID
     * @return 结果
     */
    public int deleteSysManListDataByIds(Long[] ids);

    /**
     * 删除sys_man_list_data信息
     * 
     * @param id sys_man_list_dataID
     * @return 结果
     */
    public int deleteSysManListDataById(Long id);
}
