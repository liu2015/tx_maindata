import request from '@/utils/request'

// 查询sys_matter_data列表
export function listSys_matter_data(query) {
  return request({
    url: '/system/sys_matter_data/list',
    method: 'get',
    params: query
  })
}

// 查询sys_matter_data详细
export function getSys_matter_data(id) {
  return request({
    url: '/system/sys_matter_data/' + id,
    method: 'get'
  })
}

// 新增sys_matter_data
export function addSys_matter_data(data) {
  return request({
    url: '/system/sys_matter_data',
    method: 'post',
    data: data
  })
}

// 修改sys_matter_data
export function updateSys_matter_data(data) {
  return request({
    url: '/system/sys_matter_data',
    method: 'put',
    data: data
  })
}

// 删除sys_matter_data
export function delSys_matter_data(id) {
  return request({
    url: '/system/sys_matter_data/' + id,
    method: 'delete'
  })
}

// 导出sys_matter_data
export function exportSys_matter_data(query) {
  return request({
    url: '/system/sys_matter_data/export',
    method: 'get',
    params: query
  })
}


// 下载用户导入模板
export function importTemplate() {
  return request({
    url: '/system/sys_matter_data/importTemplate',
    method: 'get'
  })
}
