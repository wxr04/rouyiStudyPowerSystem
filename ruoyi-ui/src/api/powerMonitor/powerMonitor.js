import request from '@/utils/request'

// 查询电力监控列表
export function listPowerMonitor(query) {
  return request({
    url: '/powerMonitor/powerMonitor/list',
    method: 'get',
    params: query
  })
}

// 查询电力监控详细
export function getPowerMonitor(devId) {
  return request({
    url: '/powerMonitor/powerMonitor/' + devId,
    method: 'get'
  })
}

// 新增电力监控
export function addPowerMonitor(data) {
  return request({
    url: '/powerMonitor/powerMonitor',
    method: 'post',
    data: data
  })
}

// 修改电力监控
export function updatePowerMonitor(data) {
  return request({
    url: '/powerMonitor/powerMonitor',
    method: 'put',
    data: data
  })
}

// 删除电力监控
export function delPowerMonitor(devId) {
  return request({
    url: '/powerMonitor/powerMonitor/' + devId,
    method: 'delete'
  })
}
