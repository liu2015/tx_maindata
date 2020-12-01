import request from '@/utils/request'

// 查询SysAppmanid列表
export function listAppmanid(query) {
  return request({
    url: '/system/appmanid/list',
    method: 'get',
    params: query
  })
}

// 查询SysAppmanid详细
export function getAppmanid(id) {
  return request({
    url: '/system/appmanid/' + id,
    method: 'get'
  })
}

// 新增SysAppmanid
export function addAppmanid(data) {
  return request({
    url: '/system/appmanid',
    method: 'post',
    data: data
  })
}

// 修改SysAppmanid
export function updateAppmanid(data) {
  return request({
    url: '/system/appmanid',
    method: 'put',
    data: data
  })
}

// 删除SysAppmanid
export function delAppmanid(id) {
  return request({
    url: '/system/appmanid/' + id,
    method: 'delete'
  })
}

// 导出SysAppmanid
export function exportAppmanid(query) {
  return request({
    url: '/system/appmanid/export',
    method: 'get',
    params: query
  })
}