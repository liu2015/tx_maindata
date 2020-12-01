package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAuthorUserMapper;
import com.ruoyi.system.domain.SysAuthorUser;
import com.ruoyi.system.service.ISysAuthorUserService;

/**
 * SysAuthorUserService业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-01
 */
@Service
public class SysAuthorUserServiceImpl implements ISysAuthorUserService 
{
    @Autowired
    private SysAuthorUserMapper sysAuthorUserMapper;

    /**
     * 查询SysAuthorUser
     * 
     * @param id SysAuthorUserID
     * @return SysAuthorUser
     */
    @Override
    public SysAuthorUser selectSysAuthorUserById(Long id)
    {
        return sysAuthorUserMapper.selectSysAuthorUserById(id);
    }

    /**
     * 查询SysAuthorUser列表
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return SysAuthorUser
     */
    @Override
    public List<SysAuthorUser> selectSysAuthorUserList(SysAuthorUser sysAuthorUser)
    {
        return sysAuthorUserMapper.selectSysAuthorUserList(sysAuthorUser);
    }

    /**
     * 新增SysAuthorUser
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return 结果
     */
    @Override
    public int insertSysAuthorUser(SysAuthorUser sysAuthorUser)
    {
        return sysAuthorUserMapper.insertSysAuthorUser(sysAuthorUser);
    }

    /**
     * 修改SysAuthorUser
     * 
     * @param sysAuthorUser SysAuthorUser
     * @return 结果
     */
    @Override
    public int updateSysAuthorUser(SysAuthorUser sysAuthorUser)
    {
        return sysAuthorUserMapper.updateSysAuthorUser(sysAuthorUser);
    }

    /**
     * 批量删除SysAuthorUser
     * 
     * @param ids 需要删除的SysAuthorUserID
     * @return 结果
     */
    @Override
    public int deleteSysAuthorUserByIds(Long[] ids)
    {
        return sysAuthorUserMapper.deleteSysAuthorUserByIds(ids);
    }

    /**
     * 删除SysAuthorUser信息
     * 
     * @param id SysAuthorUserID
     * @return 结果
     */
    @Override
    public int deleteSysAuthorUserById(Long id)
    {
        return sysAuthorUserMapper.deleteSysAuthorUserById(id);
    }
}
