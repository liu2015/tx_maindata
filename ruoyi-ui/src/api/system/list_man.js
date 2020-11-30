import request from '@/utils/request'

// 查询list_man列表
export function listList_man(query) {
  return request({
    url: '/system/list_man/list',
    method: 'get',
    params: query
  })
}

// 查询list_man详细
export function getList_man(id) {
  return request({
    url: '/system/list_man/' + id,
    method: 'get'
  })
}

// 新增list_man
export function addList_man(data) {
  return request({
    url: '/system/list_man',
    method: 'post',
    data: data
  })
}

// 修改list_man
export function updateList_man(data) {
  return request({
    url: '/system/list_man',
    method: 'put',
    data: data
  })
}

// 删除list_man
export function delList_man(id) {
  return request({
    url: '/system/list_man/' + id,
    method: 'delete'
  })
}

// 导出list_man
export function exportList_man(query) {
  return request({
    url: '/system/list_man/export',
    method: 'get',
    params: query
  })
}