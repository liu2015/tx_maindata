package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysManData;

/**
 * man_dataService接口
 * 
 * @author liu
 * @date 2020-11-29
 */
public interface ISysManDataService 
{
    /**
     * 查询man_data
     * 
     * @param id man_dataID
     * @return man_data
     */
    public SysManData selectSysManDataById(Long id);

    /**
     * 查询man_data列表
     * 
     * @param sysManData man_data
     * @return man_data集合
     */
    public List<SysManData> selectSysManDataList(SysManData sysManData);

    /**
     * 新增man_data
     * 
     * @param sysManData man_data
     * @return 结果
     */
    public int insertSysManData(SysManData sysManData);

    /**
     * 修改man_data
     * 
     * @param sysManData man_data
     * @return 结果
     */
    public int updateSysManData(SysManData sysManData);

    /**
     * 批量删除man_data
     * 
     * @param ids 需要删除的man_dataID
     * @return 结果
     */
    public int deleteSysManDataByIds(Long[] ids);

    /**
     * 删除man_data信息
     * 
     * @param id man_dataID
     * @return 结果
     */
    public int deleteSysManDataById(Long id);
}
