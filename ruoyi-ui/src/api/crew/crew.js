import request from '@/utils/request'

// 查询施工队信息列表
export function listCrew(query) {
  return request({
    url: '/crew/crew/list',
    method: 'get',
    params: query
  })
}

// 查询施工队信息详细
export function getCrew(crewId) {
  return request({
    url: '/crew/crew/' + crewId,
    method: 'get'
  })
}

// 新增施工队信息
export function addCrew(data) {
  return request({
    url: '/crew/crew',
    method: 'post',
    data: data
  })
}

// 修改施工队信息
export function updateCrew(data) {
  return request({
    url: '/crew/crew',
    method: 'put',
    data: data
  })
}

// 删除施工队信息
export function delCrew(crewId) {
  return request({
    url: '/crew/crew/' + crewId,
    method: 'delete'
  })
}
