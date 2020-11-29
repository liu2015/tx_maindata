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
import com.ruoyi.system.domain.SysManData;
import com.ruoyi.system.service.ISysManDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * man_dataController
 * 
 * @author liu
 * @date 2020-11-29
 */
@RestController
@RequestMapping("/system/man_data")
public class SysManDataController extends BaseController
{
    @Autowired
    private ISysManDataService sysManDataService;

    /**
     * 查询man_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysManData sysManData)
    {
        startPage();
        List<SysManData> list = sysManDataService.selectSysManDataList(sysManData);
        return getDataTable(list);
    }

    /**
     * 导出man_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:export')")
    @Log(title = "man_data", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysManData sysManData)
    {
        List<SysManData> list = sysManDataService.selectSysManDataList(sysManData);
        ExcelUtil<SysManData> util = new ExcelUtil<SysManData>(SysManData.class);
        return util.exportExcel(list, "man_data");
    }

    /**
     * 获取man_data详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysManDataService.selectSysManDataById(id));
    }

    /**
     * 新增man_data
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:add')")
    @Log(title = "man_data", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysManData sysManData)
    {
        return toAjax(sysManDataService.insertSysManData(sysManData));
    }

    /**
     * 修改man_data
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:edit')")
    @Log(title = "man_data", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysManData sysManData)
    {
        return toAjax(sysManDataService.updateSysManData(sysManData));
    }

    /**
     * 删除man_data
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:remove')")
    @Log(title = "man_data", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysManDataService.deleteSysManDataByIds(ids));
    }
}
