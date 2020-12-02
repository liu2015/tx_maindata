import request from '@/utils/request'

// 查询消息管理列表
export function listMsg_text(query) {
  return request({
    url: '/system/msg_text/list',
    method: 'get',
    params: query
  })
}

// 查询消息管理详细
export function getMsg_text(id) {
  return request({
    url: '/system/msg_text/' + id,
    method: 'get'
  })
}

// 新增消息管理
export function addMsg_text(data) {
  return request({
    url: '/system/msg_text',
    method: 'post',
    data: data
  })
}

// 修改消息管理
export function updateMsg_text(data) {
  return request({
    url: '/system/msg_text',
    method: 'put',
    data: data
  })
}

// 删除消息管理
export function delMsg_text(id) {
  return request({
    url: '/system/msg_text/' + id,
    method: 'delete'
  })
}

// 导出消息管理
export function exportMsg_text(query) {
  return request({
    url: '/system/msg_text/export',
    method: 'get',
    params: query
  })
}