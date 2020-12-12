import request from '@/utils/request'

// 查询销售图表列表
export function listTubiao_data(query) {
  return request({
    url: '/system/tubiao_data/list',
    method: 'get',
    params: query
  })
}

// 查询销售图表详细
export function getTubiao_data(digndanId) {
  return request({
    url: '/system/tubiao_data/' + digndanId,
    method: 'get'
  })
}

// 新增销售图表
export function addTubiao_data(data) {
  return request({
    url: '/system/tubiao_data',
    method: 'post',
    data: data
  })
}

// 修改销售图表
export function updateTubiao_data(data) {
  return request({
    url: '/system/tubiao_data',
    method: 'put',
    data: data
  })
}

// 删除销售图表
export function delTubiao_data(digndanId) {
  return request({
    url: '/system/tubiao_data/' + digndanId,
    method: 'delete'
  })
}

// 导出销售图表
export function exportTubiao_data(query) {
  return request({
    url: '/system/tubiao_data/export',
    method: 'get',
    params: query
  })
}