package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAppmanidMapper;
import com.ruoyi.system.domain.SysAppmanid;
import com.ruoyi.system.service.ISysAppmanidService;

/**
 * SysAppmanidService业务层处理
 * 
 * @author liu
 * @date 2020-12-01
 */
@Service
public class SysAppmanidServiceImpl implements ISysAppmanidService
{
    @Autowired
    private SysAppmanidMapper sysAppmanidMapper;

    /**
     * 查询SysAppmanid
     * 
     * @param id SysAppmanidID
     * @return SysAppmanid
     */
    @Override
    public SysAppmanid selectSysAppmanidById(Long id)
    {
        return sysAppmanidMapper.selectSysAppmanidById(id);
    }

    /**
     * 查询SysAppmanid列表
     * 
     * @param sysAppmanid SysAppmanid
     * @return SysAppmanid
     */
    @Override
    public List<SysAppmanid> selectSysAppmanidList(SysAppmanid sysAppmanid)
    {
        System.out.println("请求内容查询" + sysAppmanid.toString());

//        为什么是空
      List<SysAppmanid> lisdf=   sysAppmanidMapper.selectSysAppmanidList(sysAppmanid);

        for (SysAppmanid dff: lisdf
             ) {
            System.out.println(dff);
        }

         return lisdf;
    }

    /**
     * 新增SysAppmanid
     * 
     * @param sysAppmanid SysAppmanid
     * @return 结果
     */
    @Override
    public int insertSysAppmanid(SysAppmanid sysAppmanid)
    {
        return sysAppmanidMapper.insertSysAppmanid(sysAppmanid);
    }

    /**
     * 修改SysAppmanid
     * 
     * @param sysAppmanid SysAppmanid
     * @return 结果
     */
    @Override
    public int updateSysAppmanid(SysAppmanid sysAppmanid)
    {
        return sysAppmanidMapper.updateSysAppmanid(sysAppmanid);
    }

    /**
     * 批量删除SysAppmanid
     * 
     * @param ids 需要删除的SysAppmanidID
     * @return 结果
     */
    @Override
    public int deleteSysAppmanidByIds(Long[] ids)
    {
        return sysAppmanidMapper.deleteSysAppmanidByIds(ids);
    }

    /**
     * 删除SysAppmanid信息
     * 
     * @param id SysAppmanidID
     * @return 结果
     */
    @Override
    public int deleteSysAppmanidById(Long id)
    {
        return sysAppmanidMapper.deleteSysAppmanidById(id);
    }
}
