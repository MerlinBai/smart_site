import request from '@/utils/request'

// 查询员工管理列表
export function listWorker(query) {
  return request({
    url: '/system/worker/list',
    method: 'get',
    params: query
  })
}

// 查询员工管理详细
export function getWorker(id) {
  return request({
    url: '/system/worker/' + id,
    method: 'get'
  })
}

// 新增员工管理
export function addWorker(data) {
  return request({
    url: '/system/worker',
    method: 'post',
    data: data
  })
}

// 修改员工管理
export function updateWorker(data) {
  return request({
    url: '/system/worker',
    method: 'put',
    data: data
  })
}

// 删除员工管理
export function delWorker(id) {
  return request({
    url: '/system/worker/' + id,
    method: 'delete'
  })
}
