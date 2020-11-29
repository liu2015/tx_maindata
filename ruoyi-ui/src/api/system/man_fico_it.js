import request from '@/utils/request'

// 查询man_fico_it列表
export function listMan_fico_it(query) {
  return request({
    url: '/system/man_data/list',
    method: 'get',
    params: query
  })
}

// 查询man_fico_it详细
export function getMan_fico_it(id) {
  return request({
    url: '/system/man_data/' + id,
    method: 'get'
  })
}

// 新增man_fico_it
export function addMan_fico_it(data) {
  return request({
    url: '/system/man_data',
    method: 'post',
    data: data
  })
}

// 修改man_fico_it
export function updateMan_fico_it(data) {
  return request({
    url: '/system/man_data',
    method: 'put',
    data: data
  })
}

// 删除man_fico_it
export function delMan_fico_it(id) {
  return request({
    url: '/system/man_data/' + id,
    method: 'delete'
  })
}

// 导出man_fico_it
export function exportMan_fico_it(query) {
  return request({
    url: '/system/man_data/export',
    method: 'get',
    params: query
  })
}