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
import com.ruoyi.system.domain.SysAppmanid;
import com.ruoyi.system.service.ISysAppmanidService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * SysAppmanidController
 * 
 * @author liu
 * @date 2020-12-01
 */
@RestController
@RequestMapping("/system/appmanid")
public class SysAppmanidController extends BaseController
{
    @Autowired
    private ISysAppmanidService sysAppmanidService;

    /**
     * 查询SysAppmanid列表
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAppmanid sysAppmanid)
    {
        startPage();
        List<SysAppmanid> list = sysAppmanidService.selectSysAppmanidList(sysAppmanid);
        return getDataTable(list);
    }

    /**
     * 导出SysAppmanid列表
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:export')")
    @Log(title = "SysAppmanid", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysAppmanid sysAppmanid)
    {
        List<SysAppmanid> list = sysAppmanidService.selectSysAppmanidList(sysAppmanid);
        ExcelUtil<SysAppmanid> util = new ExcelUtil<SysAppmanid>(SysAppmanid.class);
        return util.exportExcel(list, "appmanid");
    }

    /**
     * 获取SysAppmanid详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysAppmanidService.selectSysAppmanidById(id));
    }

    /**
     * 新增SysAppmanid
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:add')")
    @Log(title = "SysAppmanid", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAppmanid sysAppmanid)
    {
        return toAjax(sysAppmanidService.insertSysAppmanid(sysAppmanid));
    }

    /**
     * 修改SysAppmanid
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:edit')")
    @Log(title = "SysAppmanid", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAppmanid sysAppmanid)
    {
        return toAjax(sysAppmanidService.updateSysAppmanid(sysAppmanid));
    }

    /**
     * 删除SysAppmanid
     */
    @PreAuthorize("@ss.hasPermi('system:appmanid:remove')")
    @Log(title = "SysAppmanid", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAppmanidService.deleteSysAppmanidByIds(ids));
    }
}
