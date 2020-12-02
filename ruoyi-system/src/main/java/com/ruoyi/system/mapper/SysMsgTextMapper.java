package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysMsgText;

/**
 * 消息管理Mapper接口
 * 
 * @author liu
 * @date 2020-12-02
 */
public interface SysMsgTextMapper 
{
    /**
     * 查询消息管理
     * 
     * @param id 消息管理ID
     * @return 消息管理
     */
    public SysMsgText selectSysMsgTextById(Long id);

    /**
     * 查询消息管理列表
     * 
     * @param sysMsgText 消息管理
     * @return 消息管理集合
     */
    public List<SysMsgText> selectSysMsgTextList(SysMsgText sysMsgText);

    /**
     * 新增消息管理
     * 
     * @param sysMsgText 消息管理
     * @return 结果
     */
    public int insertSysMsgText(SysMsgText sysMsgText);

    /**
     * 修改消息管理
     * 
     * @param sysMsgText 消息管理
     * @return 结果
     */
    public int updateSysMsgText(SysMsgText sysMsgText);

    /**
     * 删除消息管理
     * 
     * @param id 消息管理ID
     * @return 结果
     */
    public int deleteSysMsgTextById(Long id);

    /**
     * 批量删除消息管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysMsgTextByIds(Long[] ids);
}
