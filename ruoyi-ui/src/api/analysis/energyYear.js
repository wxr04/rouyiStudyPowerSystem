import request from '@/utils/request'
// 查询【请填写功能名称】列表
export function listEnergyYear(query) {
  return request({
    url: '/analysis/energyYear/list',
    method: 'get',
    params: query
  })
}
// 查询powerEnergy analysis in year列表
export function compareEnergyYear(query) {
  return request({
    url: '/analysis/energyYear/compare',
    method: 'get',
    params: query
  })
}
