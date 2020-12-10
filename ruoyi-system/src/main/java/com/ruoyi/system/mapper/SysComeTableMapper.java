package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysComeTable;

/**
 * 出入登记Mapper接口
 * 
 * @author ruoyi
 * @date 2020-12-10
 */
public interface SysComeTableMapper 
{
    /**
     * 查询出入登记
     * 
     * @param id 出入登记ID
     * @return 出入登记
     */
    public SysComeTable selectSysComeTableById(Long id);

    /**
     * 查询出入登记列表
     * 
     * @param sysComeTable 出入登记
     * @return 出入登记集合
     */
    public List<SysComeTable> selectSysComeTableList(SysComeTable sysComeTable);

    /**
     * 新增出入登记
     * 
     * @param sysComeTable 出入登记
     * @return 结果
     */
    public int insertSysComeTable(SysComeTable sysComeTable);

    /**
     * 修改出入登记
     * 
     * @param sysComeTable 出入登记
     * @return 结果
     */
    public int updateSysComeTable(SysComeTable sysComeTable);

    /**
     * 删除出入登记
     * 
     * @param id 出入登记ID
     * @return 结果
     */
    public int deleteSysComeTableById(Long id);

    /**
     * 批量删除出入登记
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysComeTableByIds(Long[] ids);
}
