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
import com.ruoyi.system.domain.SysTestTubiaoData;
import com.ruoyi.system.service.ISysTestTubiaoDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 销售数据图表1Controller
 * 
 * @author liu
 * @date 2020-12-13
 */
@RestController
@RequestMapping("/system/sys_test_tubiao_data")
public class SysTestTubiaoDataController extends BaseController
{
    @Autowired
    private ISysTestTubiaoDataService sysTestTubiaoDataService;

    /**
     * 查询销售数据图表1列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysTestTubiaoData sysTestTubiaoData)
    {
        startPage();
        List<SysTestTubiaoData> list = sysTestTubiaoDataService.selectSysTestTubiaoDataList(sysTestTubiaoData);
        return getDataTable(list);
    }
    /**
     * 查询销售数据图表1列表  test/list
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:list')")
    @GetMapping("/test/list")
    public List<SysTestTubiaoData> listtest(SysTestTubiaoData sysTestTubiaoData)
    {
        System.out.println("...........你已经成功请求......................");
        List<SysTestTubiaoData> list = sysTestTubiaoDataService.selectSysTestTubiaoDataList(sysTestTubiaoData);
        System.out.println(list.toArray());
        return list;
    }

    /**
     * 导出销售数据图表1列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:export')")
    @Log(title = "销售数据图表1", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysTestTubiaoData sysTestTubiaoData)
    {
        List<SysTestTubiaoData> list = sysTestTubiaoDataService.selectSysTestTubiaoDataList(sysTestTubiaoData);
        ExcelUtil<SysTestTubiaoData> util = new ExcelUtil<SysTestTubiaoData>(SysTestTubiaoData.class);
        return util.exportExcel(list, "sys_test_tubiao_data");
    }

    /**
     * 获取销售数据图表1详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:query')")
    @GetMapping(value = "/{ordId}")
    public AjaxResult getInfo(@PathVariable("ordId") String ordId)
    {
        return AjaxResult.success(sysTestTubiaoDataService.selectSysTestTubiaoDataById(ordId));
    }

    /**
     * 新增销售数据图表1
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:add')")
    @Log(title = "销售数据图表1", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTestTubiaoData sysTestTubiaoData)
    {
        return toAjax(sysTestTubiaoDataService.insertSysTestTubiaoData(sysTestTubiaoData));
    }

    /**
     * 修改销售数据图表1
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:edit')")
    @Log(title = "销售数据图表1", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTestTubiaoData sysTestTubiaoData)
    {
        return toAjax(sysTestTubiaoDataService.updateSysTestTubiaoData(sysTestTubiaoData));
    }

    /**
     * 删除销售数据图表1
     */
    @PreAuthorize("@ss.hasPermi('system:sys_test_tubiao_data:remove')")
    @Log(title = "销售数据图表1", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ordIds}")
    public AjaxResult remove(@PathVariable String[] ordIds)
    {
        return toAjax(sysTestTubiaoDataService.deleteSysTestTubiaoDataByIds(ordIds));
    }
}
