import request from '@/utils/request'
/*查询设备树内容*/
export function listDevTree() {
return request({
    url:''
})
}
// 查询powerEnergy analysis in month列表
export function listEnergyMonth(query) {
  return request({
    url: '/analysis/energyMonth/list',
    method: 'get',
    params: query
  })
}

// 查询powerEnergy analysis in month详细
export function getEnergyMonth(id) {
  return request({
    url: '/analysis/energyMonth/' + id,
    method: 'get'
  })
}

// 新增powerEnergy analysis in month
export function addEnergyMonth(data) {
  return request({
    url: '/analysis/energyMonth',
    method: 'post',
    data: data
  })
}

// 修改powerEnergy analysis in month
export function updateEnergyMonth(data) {
  return request({
    url: '/analysis/energyMonth',
    method: 'put',
    data: data
  })
}

// 删除powerEnergy analysis in month
export function delEnergyMonth(id) {
  return request({
    url: '/analysis/energyMonth/' + id,
    method: 'delete'
  })
}
