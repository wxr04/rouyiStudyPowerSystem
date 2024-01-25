import request from '@/utils/request'

// 查询报警查询列表
export function listAlarm(query) {
  return request({
    url: '/powerMonitor/alarm/list',
    method: 'get',
    params: query
  })
}

// 查询报警查询详细
export function getAlarm(id) {
  return request({
    url: '/powerMonitor/alarm/' + id,
    method: 'get'
  })
}

// 新增报警查询
export function addAlarm(data) {
  return request({
    url: '/powerMonitor/alarm',
    method: 'post',
    data: data
  })
}

// 修改报警查询
export function updateAlarm(data) {
  return request({
    url: '/powerMonitor/alarm',
    method: 'put',
    data: data
  })
}

// 删除报警查询
export function delAlarm(id) {
  return request({
    url: '/powerMonitor/alarm/' + id,
    method: 'delete'
  })
}
