import request from '@/utils/request'

// 查询应聘人信息列表
export function listApply(query) {
  return request({
    url: '/apply/apply/list',
    method: 'get',
    params: query
  })
}

// 查询应聘人信息详细
export function getApply(applyId) {
  return request({
    url: '/apply/apply/' + applyId,
    method: 'get'
  })
}

// 新增应聘人信息
export function addApply(data) {
  return request({
    url: '/apply/apply',
    method: 'post',
    data: data
  })
}

// 修改应聘人信息
export function updateApply(data) {
  return request({
    url: '/apply/apply',
    method: 'put',
    data: data
  })
}


// 删除应聘人信息
export function delApply(applyId) {
  return request({
    url: '/apply/apply/' + applyId,
    method: 'delete'
  })
}
