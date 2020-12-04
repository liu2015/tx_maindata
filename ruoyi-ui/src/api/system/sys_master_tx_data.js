import request from '@/utils/request'

// 查询sd主数据列表
export function listSys_master_tx_data(query) {
  return request({
    url: '/system/sys_master_tx_data/list',
    method: 'get',
    params: query
  })
}

// 查询sd主数据详细
export function getSys_master_tx_data(id) {
  return request({
    url: '/system/sys_master_tx_data/' + id,
    method: 'get'
  })
}

// 新增sd主数据
export function addSys_master_tx_data(data) {
  return request({
    url: '/system/sys_master_tx_data',
    method: 'post',
    data: data
  })
}

// 修改sd主数据
export function updateSys_master_tx_data(data) {
  return request({
    url: '/system/sys_master_tx_data',
    method: 'put',
    data: data
  })
}

// 删除sd主数据
export function delSys_master_tx_data(id) {
  return request({
    url: '/system/sys_master_tx_data/' + id,
    method: 'delete'
  })
}

// 导出sd主数据
export function exportSys_master_tx_data(query) {
  return request({
    url: '/system/sys_master_tx_data/export',
    method: 'get',
    params: query
  })
}