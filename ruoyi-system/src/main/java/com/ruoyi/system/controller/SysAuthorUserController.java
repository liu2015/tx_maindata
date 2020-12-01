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
import com.ruoyi.system.domain.SysAuthorUser;
import com.ruoyi.system.service.ISysAuthorUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * SysAuthorUserController
 * 
 * @author ruoyi
 * @date 2020-12-01
 */
@RestController
@RequestMapping("/system/SysAuthorUser")
public class SysAuthorUserController extends BaseController
{
    @Autowired
    private ISysAuthorUserService sysAuthorUserService;

    /**
     * 查询SysAuthorUser列表
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAuthorUser sysAuthorUser)
    {
        startPage();
        List<SysAuthorUser> list = sysAuthorUserService.selectSysAuthorUserList(sysAuthorUser);
        return getDataTable(list);
    }

    /**
     * 导出SysAuthorUser列表
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:export')")
    @Log(title = "SysAuthorUser", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysAuthorUser sysAuthorUser)
    {
        List<SysAuthorUser> list = sysAuthorUserService.selectSysAuthorUserList(sysAuthorUser);
        ExcelUtil<SysAuthorUser> util = new ExcelUtil<SysAuthorUser>(SysAuthorUser.class);
        return util.exportExcel(list, "SysAuthorUser");
    }

    /**
     * 获取SysAuthorUser详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysAuthorUserService.selectSysAuthorUserById(id));
    }

    /**
     * 新增SysAuthorUser
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:add')")
    @Log(title = "SysAuthorUser", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAuthorUser sysAuthorUser)
    {
        return toAjax(sysAuthorUserService.insertSysAuthorUser(sysAuthorUser));
    }

    /**
     * 修改SysAuthorUser
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:edit')")
    @Log(title = "SysAuthorUser", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAuthorUser sysAuthorUser)
    {
        return toAjax(sysAuthorUserService.updateSysAuthorUser(sysAuthorUser));
    }

    /**
     * 删除SysAuthorUser
     */
    @PreAuthorize("@ss.hasPermi('system:SysAuthorUser:remove')")
    @Log(title = "SysAuthorUser", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAuthorUserService.deleteSysAuthorUserByIds(ids));
    }
}
