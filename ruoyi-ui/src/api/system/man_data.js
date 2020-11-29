import request from '@/utils/request'

// 查询man_data列表
export function listMan_data(query) {
  return request({
    url: '/system/man_data/list',
    method: 'get',
    params: query
  })
}

// 查询man_data详细
export function getMan_data(id) {
  return request({
    url: '/system/man_data/' + id,
    method: 'get'
  })
}

// 新增man_data
export function addMan_data(data) {
  return request({
    url: '/system/man_data',
    method: 'post',
    data: data
  })
}

// 修改man_data
export function updateMan_data(data) {
  return request({
    url: '/system/man_data',
    method: 'put',
    data: data
  })
}

// 删除man_data
export function delMan_data(id) {
  return request({
    url: '/system/man_data/' + id,
    method: 'delete'
  })
}

// 导出man_data
export function exportMan_data(query) {
  return request({
    url: '/system/man_data/export',
    method: 'get',
    params: query
  })
}

// 修改man_data 递交按钮，自动生成uid
export function updateuuid(id) {
  return request({
    url: '/system/man_data/updateuuid/'+id,
    method: 'get',
    // data: id
  })
}