package com.ruoyi.system.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysMasterTxData;
import com.ruoyi.system.service.ISysMasterTxDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * sd主数据Controller
 * 
 * @author liu
 * @date 2020-12-04
 */
@RestController
@RequestMapping("/system/sys_master_tx_data")
public class SysMasterTxDataController extends BaseController
{
    @Autowired
    private ISysMasterTxDataService sysMasterTxDataService;

    /**
     * 查询sd主数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysMasterTxData sysMasterTxData)
    {
        startPage();
        List<SysMasterTxData> list = sysMasterTxDataService.selectSysMasterTxDataList(sysMasterTxData);
        return getDataTable(list);
    }

    /**
     * 导出sd主数据列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:export')")
    @Log(title = "sd主数据", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysMasterTxData sysMasterTxData)
    {
        List<SysMasterTxData> list = sysMasterTxDataService.selectSysMasterTxDataList(sysMasterTxData);
        ExcelUtil<SysMasterTxData> util = new ExcelUtil<SysMasterTxData>(SysMasterTxData.class);
        return util.exportExcel(list, "sys_master_tx_data");
    }

    /**
     * 获取sd主数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysMasterTxDataService.selectSysMasterTxDataById(id));
    }

    /**
     * 新增sd主数据
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:add')")
    @Log(title = "sd主数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysMasterTxData sysMasterTxData)
    {
        return toAjax(sysMasterTxDataService.insertSysMasterTxData(sysMasterTxData));
    }

    /**
     * 修改sd主数据
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:edit')")
    @Log(title = "sd主数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysMasterTxData sysMasterTxData)
    {
        return toAjax(sysMasterTxDataService.updateSysMasterTxData(sysMasterTxData));
    }

    /**
     * 删除sd主数据
     */
    @PreAuthorize("@ss.hasPermi('system:sys_master_tx_data:remove')")
    @Log(title = "sd主数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysMasterTxDataService.deleteSysMasterTxDataByIds(ids));
    }
}
