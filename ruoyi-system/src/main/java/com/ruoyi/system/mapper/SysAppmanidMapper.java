package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysAppmanid;

/**
 * SysAppmanidMapper接口
 * 
 * @author liu
 * @date 2020-12-01
 */
public interface SysAppmanidMapper 
{
    /**
     * 查询SysAppmanid
     * 
     * @param id SysAppmanidID
     * @return SysAppmanid
     */
    public SysAppmanid selectSysAppmanidById(Long id);

    /**
     * 查询SysAppmanid列表
     * 
     * @param sysAppmanid SysAppmanid
     * @return SysAppmanid集合
     */
    public List<SysAppmanid> selectSysAppmanidList(SysAppmanid sysAppmanid);

    /**
     * 新增SysAppmanid
     * 
     * @param sysAppmanid SysAppmanid
     * @return 结果
     */
    public int insertSysAppmanid(SysAppmanid sysAppmanid);

    /**
     * 修改SysAppmanid
     * 
     * @param sysAppmanid SysAppmanid
     * @return 结果
     */
    public int updateSysAppmanid(SysAppmanid sysAppmanid);

    /**
     * 删除SysAppmanid
     * 
     * @param id SysAppmanidID
     * @return 结果
     */
    public int deleteSysAppmanidById(Long id);

    /**
     * 批量删除SysAppmanid
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAppmanidByIds(Long[] ids);
}
