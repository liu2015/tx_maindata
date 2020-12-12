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
import com.ruoyi.system.domain.SysTubiaoData;
import com.ruoyi.system.service.ISysTubiaoDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 销售图表Controller
 * 
 * @author liu
 * @date 2020-12-12
 */
@RestController
@RequestMapping("/system/tubiao_data")
public class SysTubiaoDataController extends BaseController
{
    @Autowired
    private ISysTubiaoDataService sysTubiaoDataService;

    /**
     * 查询销售图表列表
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysTubiaoData sysTubiaoData)
    {
        startPage();
        List<SysTubiaoData> list = sysTubiaoDataService.selectSysTubiaoDataList(sysTubiaoData);
        return getDataTable(list);
    }

    /**
     * 导出销售图表列表
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:export')")
    @Log(title = "销售图表", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysTubiaoData sysTubiaoData)
    {
        List<SysTubiaoData> list = sysTubiaoDataService.selectSysTubiaoDataList(sysTubiaoData);
        ExcelUtil<SysTubiaoData> util = new ExcelUtil<SysTubiaoData>(SysTubiaoData.class);
        return util.exportExcel(list, "tubiao_data");
    }

    /**
     * 获取销售图表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:query')")
    @GetMapping(value = "/{digndanId}")
    public AjaxResult getInfo(@PathVariable("digndanId") String digndanId)
    {
        return AjaxResult.success(sysTubiaoDataService.selectSysTubiaoDataById(digndanId));
    }

    /**
     * 新增销售图表
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:add')")
    @Log(title = "销售图表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTubiaoData sysTubiaoData)
    {
        return toAjax(sysTubiaoDataService.insertSysTubiaoData(sysTubiaoData));
    }

    /**
     * 修改销售图表
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:edit')")
    @Log(title = "销售图表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTubiaoData sysTubiaoData)
    {
        return toAjax(sysTubiaoDataService.updateSysTubiaoData(sysTubiaoData));
    }

    /**
     * 删除销售图表
     */
    @PreAuthorize("@ss.hasPermi('system:tubiao_data:remove')")
    @Log(title = "销售图表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{digndanIds}")
    public AjaxResult remove(@PathVariable String[] digndanIds)
    {
        return toAjax(sysTubiaoDataService.deleteSysTubiaoDataByIds(digndanIds));
    }
}
