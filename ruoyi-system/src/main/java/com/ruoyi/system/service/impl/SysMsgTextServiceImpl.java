package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysMsgTextMapper;
import com.ruoyi.system.domain.SysMsgText;
import com.ruoyi.system.service.ISysMsgTextService;

/**
 * 消息管理Service业务层处理
 * 
 * @author liu
 * @date 2020-12-02
 */
@Service
public class SysMsgTextServiceImpl implements ISysMsgTextService 
{
    @Autowired
    private SysMsgTextMapper sysMsgTextMapper;

    /**
     * 查询消息管理
     * 
     * @param id 消息管理ID
     * @return 消息管理
     */
    @Override
    public SysMsgText selectSysMsgTextById(Long id)
    {
        return sysMsgTextMapper.selectSysMsgTextById(id);
    }

    /**
     * 查询消息管理列表
     * 
     * @param sysMsgText 消息管理
     * @return 消息管理
     */
    @Override
    public List<SysMsgText> selectSysMsgTextList(SysMsgText sysMsgText)
    {
        return sysMsgTextMapper.selectSysMsgTextList(sysMsgText);
    }

    /**
     * 新增消息管理
     * 
     * @param sysMsgText 消息管理
     * @return 结果
     */
    @Override
    public int insertSysMsgText(SysMsgText sysMsgText)
    {
        return sysMsgTextMapper.insertSysMsgText(sysMsgText);
    }

    /**
     * 修改消息管理
     * 
     * @param sysMsgText 消息管理
     * @return 结果
     */
    @Override
    public int updateSysMsgText(SysMsgText sysMsgText)
    {
        return sysMsgTextMapper.updateSysMsgText(sysMsgText);
    }

    /**
     * 批量删除消息管理
     * 
     * @param ids 需要删除的消息管理ID
     * @return 结果
     */
    @Override
    public int deleteSysMsgTextByIds(Long[] ids)
    {
        return sysMsgTextMapper.deleteSysMsgTextByIds(ids);
    }

    /**
     * 删除消息管理信息
     * 
     * @param id 消息管理ID
     * @return 结果
     */
    @Override
    public int deleteSysMsgTextById(Long id)
    {
        return sysMsgTextMapper.deleteSysMsgTextById(id);
    }
}
