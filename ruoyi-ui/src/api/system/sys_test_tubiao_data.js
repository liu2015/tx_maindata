import request from '@/utils/request'

// 查询销售数据图表1列表
export function listSys_test_tubiao_data(query) {
  return request({
    url: '/system/sys_test_tubiao_data/list',
    method: 'get',
    params: query
  })
}
// 查询销售数据图表1列表
export function listSys_test_tubiao_data_test(query) {
  return request({
    url: '/system/sys_test_tubiao_data/test/list',
    method: 'get',
    params: query
  })
}

// 查询销售数据图表1详细
export function getSys_test_tubiao_data(ordId) {
  return request({
    url: '/system/sys_test_tubiao_data/' + ordId,
    method: 'get'
  })
}

// 新增销售数据图表1
export function addSys_test_tubiao_data(data) {
  return request({
    url: '/system/sys_test_tubiao_data',
    method: 'post',
    data: data
  })
}

// 修改销售数据图表1
export function updateSys_test_tubiao_data(data) {
  return request({
    url: '/system/sys_test_tubiao_data',
    method: 'put',
    data: data
  })
}

// 删除销售数据图表1
export function delSys_test_tubiao_data(ordId) {
  return request({
    url: '/system/sys_test_tubiao_data/' + ordId,
    method: 'delete'
  })
}

// 导出销售数据图表1
export function exportSys_test_tubiao_data(query) {
  return request({
    url: '/system/sys_test_tubiao_data/export',
    method: 'get',
    params: query
  })
}