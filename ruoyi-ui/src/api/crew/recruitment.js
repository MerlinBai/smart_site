import request from '@/utils/request'

// 查询招聘公告列表
export function listRecruitment(query) {
  return request({
    url: '/recruitment/recruitment/list',
    method: 'get',
    params: query
  })
}

// 查询招聘公告详细
export function getRecruitment(itemId) {
  return request({
    url: '/recruitment/recruitment/' + itemId,
    method: 'get'
  })
}

// 新增招聘公告
export function addRecruitment(data) {
  return request({
    url: '/recruitment/recruitment',
    method: 'post',
    data: data
  })
}

// 修改招聘公告
export function updateRecruitment(data) {
  return request({
    url: '/recruitment/recruitment',
    method: 'put',
    data: data
  })
}

// 删除招聘公告
export function delRecruitment(itemId) {
  return request({
    url: '/recruitment/recruitment/' + itemId,
    method: 'delete'
  })
}
