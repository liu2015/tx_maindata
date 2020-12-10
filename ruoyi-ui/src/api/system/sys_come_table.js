import request from '@/utils/request'

// 查询出入登记列表
export function listSys_come_table(query) {
  return request({
    url: '/system/sys_come_table/list',
    method: 'get',
    params: query
  })
}

// 查询出入登记详细
export function getSys_come_table(id) {
  return request({
    url: '/system/sys_come_table/' + id,
    method: 'get'
  })
}

// 新增出入登记
export function addSys_come_table(data) {
  return request({
    url: '/system/sys_come_table',
    method: 'post',
    data: data
  })
}

// 修改出入登记
export function updateSys_come_table(data) {
  return request({
    url: '/system/sys_come_table',
    method: 'put',
    data: data
  })
}

// 删除出入登记
export function delSys_come_table(id) {
  return request({
    url: '/system/sys_come_table/' + id,
    method: 'delete'
  })
}

// 导出出入登记
export function exportSys_come_table(query) {
  return request({
    url: '/system/sys_come_table/export',
    method: 'get',
    params: query
  })


}

  export function delSys_come_table_text(id) { 

      return request({
    url: '/system/sys_come_table/test/' + id,
    method: 'get'
  })
  }
  