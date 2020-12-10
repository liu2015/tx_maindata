package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysComeTableMapper;
import com.ruoyi.system.domain.SysComeTable;
import com.ruoyi.system.service.ISysComeTableService;

/**
 * 出入登记Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-12-10
 */
@Service
public class SysComeTableServiceImpl implements ISysComeTableService 
{
    @Autowired
    private SysComeTableMapper sysComeTableMapper;

    /**
     * 查询出入登记
     * 
     * @param id 出入登记ID
     * @return 出入登记
     */
    @Override
    public SysComeTable selectSysComeTableById(Long id)
    {
        return sysComeTableMapper.selectSysComeTableById(id);
    }

    /**
     * 查询出入登记列表
     * 
     * @param sysComeTable 出入登记
     * @return 出入登记
     */
    @Override
    public List<SysComeTable> selectSysComeTableList(SysComeTable sysComeTable)
    {
        return sysComeTableMapper.selectSysComeTableList(sysComeTable);
    }

    /**
     * 新增出入登记
     * 
     * @param sysComeTable 出入登记
     * @return 结果
     */
    @Override
    public int insertSysComeTable(SysComeTable sysComeTable)
    {
        return sysComeTableMapper.insertSysComeTable(sysComeTable);
    }

    /**
     * 修改出入登记
     * 
     * @param sysComeTable 出入登记
     * @return 结果
     */
    @Override
    public int updateSysComeTable(SysComeTable sysComeTable)
    {
        return sysComeTableMapper.updateSysComeTable(sysComeTable);
    }

    /**
     * 批量删除出入登记
     * 
     * @param ids 需要删除的出入登记ID
     * @return 结果
     */
    @Override
    public int deleteSysComeTableByIds(Long[] ids)
    {
        return sysComeTableMapper.deleteSysComeTableByIds(ids);
    }

    /**
     * 删除出入登记信息
     * 
     * @param id 出入登记ID
     * @return 结果
     */
    @Override
    public int deleteSysComeTableById(Long id)
    {
        return sysComeTableMapper.deleteSysComeTableById(id);
    }
}
