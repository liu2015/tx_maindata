import request from '@/utils/request'

// 查询SysAuthorUser列表
export function listSysAuthorUser(query) {
  return request({
    url: '/system/SysAuthorUser/list',
    method: 'get',
    params: query
  })
}

// 查询SysAuthorUser详细
export function getSysAuthorUser(id) {
  return request({
    url: '/system/SysAuthorUser/' + id,
    method: 'get'
  })
}

// 新增SysAuthorUser
export function addSysAuthorUser(data) {
  return request({
    url: '/system/SysAuthorUser',
    method: 'post',
    data: data
  })
}

// 修改SysAuthorUser
export function updateSysAuthorUser(data) {
  return request({
    url: '/system/SysAuthorUser',
    method: 'put',
    data: data
  })
}

// 删除SysAuthorUser
export function delSysAuthorUser(id) {
  return request({
    url: '/system/SysAuthorUser/' + id,
    method: 'delete'
  })
}

// 导出SysAuthorUser
export function exportSysAuthorUser(query) {
  return request({
    url: '/system/SysAuthorUser/export',
    method: 'get',
    params: query
  })
}