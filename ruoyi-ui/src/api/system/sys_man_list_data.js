import request from '@/utils/request'

// 查询sys_man_list_data列表
export function listSys_man_list_data(query) {
  return request({
    url: '/system/sys_man_list_data/list',
    method: 'get',
    params: query
  })
}

// 查询sys_man_list_data详细
export function getSys_man_list_data(id) {
  return request({
    url: '/system/sys_man_list_data/' + id,
    method: 'get'
  })
}

// 新增sys_man_list_data
export function addSys_man_list_data(data) {
  return request({
    url: '/system/sys_man_list_data',
    method: 'post',
    data: data
  })
}

// 修改sys_man_list_data
export function updateSys_man_list_data(data) {
  return request({
    url: '/system/sys_man_list_data',
    method: 'put',
    data: data
  })
}

// 删除sys_man_list_data
export function delSys_man_list_data(id) {
  return request({
    url: '/system/sys_man_list_data/' + id,
    method: 'delete'
  })
}

// 导出sys_man_list_data
export function exportSys_man_list_data(query) {
  return request({
    url: '/system/sys_man_list_data/export',
    method: 'get',
    params: query
  })
}