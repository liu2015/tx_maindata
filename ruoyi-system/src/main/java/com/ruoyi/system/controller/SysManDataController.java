package com.ruoyi.system.controller;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.SysManListData;
import com.ruoyi.system.service.ISysManListDataService;
import com.ruoyi.system.wxmessage.service.Wxservice;
import com.ruoyi.system.wxmessage.service.Wxserviceinfo;
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
    @Autowired
    private ISysManListDataService sysManListDataService;

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


    /**
     *  递交操作，递交更新，然后生成 订单id
     *  单个递交
     *  id组 时间+uuid
     *  增加一个 状态写入到man_list 表内更新状态为已经递交 状态，并且记录递交几个店
     */
    @PreAuthorize("@ss.hasPermi('system:man_data:edit')")
    @Log(title = "man_data", businessType = BusinessType.UPDATE)
    @GetMapping("/updateuuid/{id}")
    public AjaxResult updateuuid(@PathVariable Long[] id){
// 成成一个uuid
//        记录成功次数
        int jilu=0;

        System.out.println("接受到请求");
        String uuid= IdUtils.simpleUUID();
        String dateTime= DateUtils.dateTime();

        StringBuilder stringBuilder=new StringBuilder();
        stringBuilder.append(dateTime);
        stringBuilder.append(uuid);

//        成成一个uuid

        for (Long idd:id
             ) {
            System.out.println("遍历id"+idd);

            SysManData sysManData1=new SysManData();
            sysManData1.setId(idd);
            sysManData1.setOrderId(String.valueOf(stringBuilder));
         toAjax(sysManDataService.updateSysManData(sysManData1));

            jilu++;

        }
        System.out.println("请求成功+++"+jilu);
//        通知 ，发送企业微信通知
//        后期通过调度 做获得token
        if (jilu>0)
        {
            Wxservice wx=new Wxservice();
//           获得token
            wx.Wxrequest();
            Wxserviceinfo info=new Wxserviceinfo();
            String sd="开始发送消息准备";
            info.Wxserviceinfopost(sd);

//            递交到信息到main_list
            String text_list="申请人确认总计"+jilu+"数据";
            SysManListData listdata=new SysManListData();
            listdata.setOrderId(String.valueOf(stringBuilder));
            listdata.setGu1(text_list);


            sysManListDataService.insertSysManListData(listdata);


        }


        return toAjax(jilu);


//       获得uui

//        SysManData sysManData1=new SysManData();
//        sysManData1=sysManData;
//        System.out.println("接受到请求");
//       String uuid= IdUtils.randomUUID();
//       String dateTime= DateUtils.dateTime();
//       StringBuilder stringBuilder=new StringBuilder();
//       stringBuilder.append(dateTime);
//       stringBuilder.append(uuid);
        //自动添加递交订单
//       sysManData.setOrderId(String.valueOf(stringBuilder));
//       System.out.println("请求成功");

//        return toAjax(sysManDataService.updateSysManData(sysManData));
//        return "街道请求，返回测试";


    }

}





