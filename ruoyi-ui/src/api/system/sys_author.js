import request from '@/utils/request'

// 查询sys_author列表
export function listSys_author(query) {
  return request({
    url: '/system/sys_author/list',
    method: 'get',
    params: query
  })
}

// 查询sys_author详细
export function getSys_author(id) {
  return request({
    url: '/system/sys_author/' + id,
    method: 'get'
  })
}

// 新增sys_author
export function addSys_author(data) {
  return request({
    url: '/system/sys_author',
    method: 'post',
    data: data
  })
}

// 修改sys_author
export function updateSys_author(data) {
  return request({
    url: '/system/sys_author',
    method: 'put',
    data: data
  })
}

// 删除sys_author
export function delSys_author(id) {
  return request({
    url: '/system/sys_author/' + id,
    method: 'delete'
  })
}

// 导出sys_author
export function exportSys_author(query) {
  return request({
    url: '/system/sys_author/export',
    method: 'get',
    params: query
  })
}