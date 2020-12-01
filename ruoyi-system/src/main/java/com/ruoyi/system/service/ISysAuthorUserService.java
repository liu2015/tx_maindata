package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysAuthorUser;

/**
 * SysAuthorUserService接口
 * 
 * @author ruoyi
 * @date 2020-12-01
 */
public interface ISysAuthorUserService 
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
     * 批量删除SysAuthorUser
     * 
     * @param ids 需要删除的SysAuthorUserID
     * @return 结果
     */
    public int deleteSysAuthorUserByIds(Long[] ids);

    /**
     * 删除SysAuthorUser信息
     * 
     * @param id SysAuthorUserID
     * @return 结果
     */
    public int deleteSysAuthorUserById(Long id);
}
