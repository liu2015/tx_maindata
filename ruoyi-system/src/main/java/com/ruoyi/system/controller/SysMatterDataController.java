package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysManData;
import com.ruoyi.system.domain.SysMatterData;
import com.ruoyi.system.service.ISysMatterDataService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

/**
 * sys_matter_dataController
 * 
 * @author liu
 * @date 2020-12-03
 */
@RestController
@RequestMapping("/system/sys_matter_data")
public class SysMatterDataController extends BaseController
{
    @Autowired
    private ISysMatterDataService sysMatterDataService;
//    @Autowired
//    private TokenService tokenService;
    @Autowired
    private ISysUserService userService;

    /**
     * 查询sys_matter_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysMatterData sysMatterData)
    {
        startPage();
        List<SysMatterData> list = sysMatterDataService.selectSysMatterDataList(sysMatterData);
        return getDataTable(list);
    }

    /**
     * 导出sys_matter_data列表
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:export')")
    @Log(title = "sys_matter_data", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysMatterData sysMatterData)
    {
        List<SysMatterData> list = sysMatterDataService.selectSysMatterDataList(sysMatterData);
        ExcelUtil<SysMatterData> util = new ExcelUtil<SysMatterData>(SysMatterData.class);
        return util.exportExcel(list, "sys_matter_data");
    }

    /**
     * 获取sys_matter_data详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysMatterDataService.selectSysMatterDataById(id));
    }

    /**
     * 新增sys_matter_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:add')")
    @Log(title = "sys_matter_data", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysMatterData sysMatterData)
    {
        return toAjax(sysMatterDataService.insertSysMatterData(sysMatterData));
    }

    /**
     * 修改sys_matter_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:edit')")
    @Log(title = "sys_matter_data", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysMatterData sysMatterData)
    {
        return toAjax(sysMatterDataService.updateSysMatterData(sysMatterData));
    }

    /**
     * 删除sys_matter_data
     */
    @PreAuthorize("@ss.hasPermi('system:sys_matter_data:remove')")
    @Log(title = "sys_matter_data", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysMatterDataService.deleteSysMatterDataByIds(ids));
    }

//    importTemplate
    /**
     * 导出模板
     */


    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<SysMatterData> util = new ExcelUtil<SysMatterData>(SysMatterData.class);
        return util.importTemplateExcel("物料数据");
    }

/**
 * 导入物料
 * 使用excle工具 然后转换成对象list
 * 遍历循环插入到数据库
 */

    @Log(title = "物料导入", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:user:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SysMatterData> util = new ExcelUtil<SysMatterData>(SysMatterData.class);
        List<SysMatterData> SysMatterDatalist = util.importExcel(file.getInputStream());


//        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
//        String operName = loginUser.getUsername();
        String operName="导入操作专用";
        String message1=sysMatterDataService.insertSysMatterDatatext(SysMatterDatalist,updateSupport,operName);

//        String message = userService.importUser(userList, updateSupport, operName);
        return AjaxResult.success(message1);
    }


}
