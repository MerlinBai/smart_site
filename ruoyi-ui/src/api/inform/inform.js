import request from '@/utils/request'

// 查询通知列表
export function listInform(query) {
  return request({
    url: '/inform/inform/list',
    method: 'get',
    params: query
  })
}

// 查询通知详细
export function getInform(informId) {
  return request({
    url: '/inform/inform/' + informId,
    method: 'get'
  })
}

// 新增通知
export function addInform(data) {
  return request({
    url: '/inform/inform',
    method: 'post',
    data: data
  })
}

// 修改通知
export function updateInform(data) {
  return request({
    url: '/inform/inform',
    method: 'put',
    data: data
  })
}

// 删除通知
export function delInform(informId) {
  return request({
    url: '/inform/inform/' + informId,
    method: 'delete'
  })
}
