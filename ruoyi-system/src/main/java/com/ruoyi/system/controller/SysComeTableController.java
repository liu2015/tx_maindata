package com.ruoyi.system.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.ruoyi.system.domain.SysComeTable;
import com.ruoyi.system.service.ISysComeTableService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出入登记Controller
 * 
 * @author ruoyi
 * @date 2020-12-10
 */
@RestController
@RequestMapping("/system/sys_come_table")
public class SysComeTableController extends BaseController
{
    @Autowired
    private ISysComeTableService sysComeTableService;

    /**
     * 查询出入登记列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysComeTable sysComeTable)
    {
        startPage();
        List<SysComeTable> list = sysComeTableService.selectSysComeTableList(sysComeTable);
        return getDataTable(list);
    }

    /**
     * 导出出入登记列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:export')")
    @Log(title = "出入登记", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysComeTable sysComeTable)
    {
        List<SysComeTable> list = sysComeTableService.selectSysComeTableList(sysComeTable);
        ExcelUtil<SysComeTable> util = new ExcelUtil<SysComeTable>(SysComeTable.class);
        return util.exportExcel(list, "sys_come_table");
    }

    /**
     * 获取出入登记详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysComeTableService.selectSysComeTableById(id));
    }

    /**
     * 新增出入登记
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:add')")
    @Log(title = "出入登记", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysComeTable sysComeTable)
    {
        return toAjax(sysComeTableService.insertSysComeTable(sysComeTable));
    }

    /**
     * 修改出入登记
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:edit')")
    @Log(title = "出入登记", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysComeTable sysComeTable)
    {



        return toAjax(sysComeTableService.updateSysComeTable(sysComeTable));
    }

    /**
     * 删除出入登记
     */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:remove')")
    @Log(title = "出入登记", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysComeTableService.deleteSysComeTableByIds(ids));
    }
/**
 *  实现离开厂区的定义
 */
    @PreAuthorize("@ss.hasPermi('system:sys_come_table:remove')")
    @Log(title = "出入登记", businessType = BusinessType.UPDATE)
    @GetMapping("/test/{ids}")
    public  AjaxResult delSys_come_table_text(@PathVariable long[] ids){
        System.out.println("...................");
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("...................");
        Date time =null;
        try {
            time=date.parse(date.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("..................."+time.toString());
        SysComeTable sysComeTable=new SysComeTable();
        for (Long idstext: ids
             ) {
            sysComeTable.setId(idstext);
            sysComeTable.setLeaweTime(time);
             toAjax(sysComeTableService.updateSysComeTable(sysComeTable));
        }
        return toAjax(ids.length);

    }
}
