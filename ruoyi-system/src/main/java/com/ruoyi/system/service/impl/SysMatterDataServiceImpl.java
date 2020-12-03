package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysMatterDataMapper;
import com.ruoyi.system.domain.SysMatterData;
import com.ruoyi.system.service.ISysMatterDataService;

/**
 * sys_matter_dataService业务层处理
 * 
 * @author liu
 * @date 2020-12-03
 */
@Service
public class SysMatterDataServiceImpl implements ISysMatterDataService {
    @Autowired
    private SysMatterDataMapper sysMatterDataMapper;

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    /**
     * 查询sys_matter_data
     *
     * @param id sys_matter_dataID
     * @return sys_matter_data
     */
    @Override
    public SysMatterData selectSysMatterDataById(Long id) {
        return sysMatterDataMapper.selectSysMatterDataById(id);
    }

    /**
     * 查询sys_matter_data列表
     *
     * @param sysMatterData sys_matter_data
     * @return sys_matter_data
     */
    @Override
    public List<SysMatterData> selectSysMatterDataList(SysMatterData sysMatterData) {
        return sysMatterDataMapper.selectSysMatterDataList(sysMatterData);
    }

    /**
     * 新增sys_matter_data
     *
     * @param sysMatterData sys_matter_data
     * @return 结果
     */
    @Override
    public int insertSysMatterData(SysMatterData sysMatterData) {
        return sysMatterDataMapper.insertSysMatterData(sysMatterData);
    }

    /**
     * 修改sys_matter_data
     *
     * @param sysMatterData sys_matter_data
     * @return 结果
     */
    @Override
    public int updateSysMatterData(SysMatterData sysMatterData) {
        return sysMatterDataMapper.updateSysMatterData(sysMatterData);
    }

    /**
     * 批量删除sys_matter_data
     *
     * @param ids 需要删除的sys_matter_dataID
     * @return 结果
     */
    @Override
    public int deleteSysMatterDataByIds(Long[] ids) {
        return sysMatterDataMapper.deleteSysMatterDataByIds(ids);
    }

    /**
     * 删除sys_matter_data信息
     *
     * @param id sys_matter_dataID
     * @return 结果
     */
    @Override
    public int deleteSysMatterDataById(Long id) {
        return sysMatterDataMapper.deleteSysMatterDataById(id);
    }


    /**
     * 导入物料主数据
     *
     * @param SysMatterDatalist 用户数据列表
     * @param isUpdateSupport   是否更新支持，如果已存在，则进行更新数据
     * @param operName          操作用户
     * @return 结果
     */
    public String insertSysMatterDatatext(List<SysMatterData> SysMatterDatalist, Boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(SysMatterDatalist) || SysMatterDatalist.size() == 0) {
            throw new CustomException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (SysMatterData sysMatterData : SysMatterDatalist) {

            System.out.println("这是导入的user" + sysMatterData.toString());
            try {
                List<SysMatterData> u = sysMatterDataMapper.selectSysMatterDataList(sysMatterData);

                String uunll= String.valueOf(u);
                System.out.println("~~~~~~~~~~~~判断u的属性是不是空"+uunll);

                System.out.println("~~~~~~~~~~~~判断u的属性是不是空"+u);
                if (uunll.equals("[]")) {

                    System.out.println("..........开始导入操作");

                    this.insertSysMatterData(sysMatterData);
                    System.out.println("这是导入的物料——" + sysMatterData.toString());
                    successNum++;
                    successMsg.append("<br/>" + successNum + "物料" + sysMatterData.getOrderId() + "导入成功");

                } else if (isUpdateSupport) {
                    successMsg.append("<br/>" + "暂时不支持更新操作");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、订单和料号~~ " + sysMatterData.getOrderId() + " 已存在");

                }

            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + sysMatterData.getOrderId() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }

            if (failureNum > 0) {
                failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                throw new CustomException(failureMsg.toString());
            } else {
                successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
            }

        }
        return successMsg.toString();
    }
}


            // 验证是否存在这个用户
//                SysUser u = userMapper.selectUserByUserName(user.getUserName());
//                if (StringUtils.isNull(u))
//                {
//                    user.setPassword(SecurityUtils.encryptPassword(password));
//                    user.setCreateBy(operName);
//                    this.insertUser(user);
//
//                    System.out.println("这是导入的user"+user.toString());
//                    successNum++;
//                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
//                }
//                else if (isUpdateSupport)
//                {
//                    user.setUpdateBy(operName);
//                    this.updateUser(user);
//                    successNum++;
//                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 更新成功");
//                }
//                else
//                {
//                    failureNum++;
//                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
//                }
//            }
//            catch (Exception e)
//            {
//                failureNum++;
//                String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
//                failureMsg.append(msg + e.getMessage());
//                log.error(msg, e);
//            }
//        }
//        if (failureNum > 0)
//        {
//            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
//            throw new CustomException(failureMsg.toString());
//        }
//        else
//        {
//            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
//        }
//        return successMsg.toString();
//
//    }



