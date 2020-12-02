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
import com.ruoyi.system.domain.SysMsgText;
import com.ruoyi.system.service.ISysMsgTextService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 消息管理Controller
 * 
 * @author liu
 * @date 2020-12-02
 */
@RestController
@RequestMapping("/system/msg_text")
public class SysMsgTextController extends BaseController
{
    @Autowired
    private ISysMsgTextService sysMsgTextService;

    /**
     * 查询消息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysMsgText sysMsgText)
    {
        startPage();
        List<SysMsgText> list = sysMsgTextService.selectSysMsgTextList(sysMsgText);
        return getDataTable(list);
    }

    /**
     * 导出消息管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:export')")
    @Log(title = "消息管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysMsgText sysMsgText)
    {
        List<SysMsgText> list = sysMsgTextService.selectSysMsgTextList(sysMsgText);
        ExcelUtil<SysMsgText> util = new ExcelUtil<SysMsgText>(SysMsgText.class);
        return util.exportExcel(list, "msg_text");
    }

    /**
     * 获取消息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysMsgTextService.selectSysMsgTextById(id));
    }

    /**
     * 新增消息管理
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:add')")
    @Log(title = "消息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysMsgText sysMsgText)
    {
        return toAjax(sysMsgTextService.insertSysMsgText(sysMsgText));
    }

    /**
     * 修改消息管理
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:edit')")
    @Log(title = "消息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysMsgText sysMsgText)
    {
        return toAjax(sysMsgTextService.updateSysMsgText(sysMsgText));
    }

    /**
     * 删除消息管理
     */
    @PreAuthorize("@ss.hasPermi('system:msg_text:remove')")
    @Log(title = "消息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysMsgTextService.deleteSysMsgTextByIds(ids));
    }
}
