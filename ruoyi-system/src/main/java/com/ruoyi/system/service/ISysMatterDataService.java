package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysMatterData;

/**
 * sys_matter_dataService接口
 * 
 * @author liu
 * @date 2020-12-03
 */
public interface ISysMatterDataService 
{
    /**
     * 查询sys_matter_data
     * 
     * @param id sys_matter_dataID
     * @return sys_matter_data
     */
    public SysMatterData selectSysMatterDataById(Long id);

    /**
     * 查询sys_matter_data列表
     * 
     * @param sysMatterData sys_matter_data
     * @return sys_matter_data集合
     */
    public List<SysMatterData> selectSysMatterDataList(SysMatterData sysMatterData);

    /**
     * 新增sys_matter_data
     * 
     * @param sysMatterData sys_matter_data
     * @return 结果
     */
    public int insertSysMatterData(SysMatterData sysMatterData);

    /**
     * 修改sys_matter_data
     * 
     * @param sysMatterData sys_matter_data
     * @return 结果
     */
    public int updateSysMatterData(SysMatterData sysMatterData);

    /**
     * 批量删除sys_matter_data
     * 
     * @param ids 需要删除的sys_matter_dataID
     * @return 结果
     */
    public int deleteSysMatterDataByIds(Long[] ids);

    /**
     * 删除sys_matter_data信息
     * 
     * @param id sys_matter_dataID
     * @return 结果
     */
    public int deleteSysMatterDataById(Long id);

    public String insertSysMatterDatatext(List<SysMatterData> userList, Boolean isUpdateSupport, String operName);

}
