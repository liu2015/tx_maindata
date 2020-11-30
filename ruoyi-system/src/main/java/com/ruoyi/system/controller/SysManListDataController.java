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
import com.ruoyi.system.domain.SysManListData;
import com.ruoyi.system.service.ISysManListDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * sys_man_list_dataController
 * 
 * @author ruoyi
 * @date 2020-11-30
 */
@RestController
@RequestMapping("/system/sys_man_list_data")
public class SysManListDataController extends BaseController
{
    @Autowired
    private ISysManListDataService sysManListDataService;

    /**
     * 查询sys_man_list_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysManListData sysManListData)
    {
        startPage();
        List<SysManListData> list = sysManListDataService.selectSysManListDataList(sysManListData);
        return getDataTable(list);
    }

    /**
     * 导出sys_man_list_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:export')")
    @Log(title = "sys_man_list_data", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysManListData sysManListData)
    {
        List<SysManListData> list = sysManListDataService.selectSysManListDataList(sysManListData);
        ExcelUtil<SysManListData> util = new ExcelUtil<SysManListData>(SysManListData.class);
        return util.exportExcel(list, "sys_man_list_data");
    }

    /**
     * 获取sys_man_list_data详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysManListDataService.selectSysManListDataById(id));
    }

    /**
     * 新增sys_man_list_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:add')")
    @Log(title = "sys_man_list_data", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysManListData sysManListData)
    {
        return toAjax(sysManListDataService.insertSysManListData(sysManListData));
    }

    /**
     * 修改sys_man_list_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:edit')")
    @Log(title = "sys_man_list_data", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysManListData sysManListData)
    {
        return toAjax(sysManListDataService.updateSysManListData(sysManListData));
    }

    /**
     * 删除sys_man_list_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_man_list_data:remove')")
    @Log(title = "sys_man_list_data", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysManListDataService.deleteSysManListDataByIds(ids));
    }
}
