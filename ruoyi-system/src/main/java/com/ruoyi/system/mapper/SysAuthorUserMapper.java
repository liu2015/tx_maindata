package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysAuthorUser;

/**
 * SysAuthorUserMapper接口
 * 
 * @author ruoyi
 * @date 2020-12-01
 */
public interface SysAuthorUserMapper 
{
    /**
     * 查询SysAuthorUser
     * 
     * @param id SysAuthorUserID
     * @return SysAuthorUser
     */
    public SysAuthorUser selectSysAuthorUserById(Long id);

    /**
     * 查询SysAuthorUser列表
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return SysAuthorUser集合
     */
    public List<SysAuthorUser> selectSysAuthorUserList(SysAuthorUser sysAuthorUser);

    /**
     * 新增SysAuthorUser
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return 结果
     */
    public int insertSysAuthorUser(SysAuthorUser sysAuthorUser);

    /**
     * 修改SysAuthorUser
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return 结果
     */
    public int updateSysAuthorUser(SysAuthorUser sysAuthorUser);

    /**
     * 删除SysAuthorUser
     * 
     * @param id SysAuthorUserID
     * @return 结果
     */
    public int deleteSysAuthorUserById(Long id);

    /**
     * 批量删除SysAuthorUser
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAuthorUserByIds(Long[] ids);
}
