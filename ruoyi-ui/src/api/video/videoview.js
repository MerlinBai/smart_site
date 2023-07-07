import request from '@/utils/request'

// 查询视频观看列表
export function listDetail(query) {
  return request({
    url: '/systevideom/detail/list',
    method: 'get',
    params: query
  })
}

// 查询视频观看详细
export function getDetail(videoId) {
  return request({
    url: '/systevideom/detail/' + videoId,
    method: 'get'
  })
}

// 新增视频观看
export function addDetail(data) {
  return request({
    url: '/systevideom/detail',
    method: 'post',
    data: data
  })
}

// 修改视频观看
export function updateDetail(data) {
  return request({
    url: '/systevideom/detail',
    method: 'put',
    data: data
  })
}

// 删除视频观看
export function delDetail(videoId) {
  return request({
    url: '/systevideom/detail/' + videoId,
    method: 'delete'
  })
}
