import request from '@/utils/request'

// 查询满意度检查列表
export function listSurvey(query) {
  return request({
    url: '/satisfaction/survey/list',
    method: 'get',
    params: query
  })
}

// 查询满意度检查详细
export function getSurvey(surveyId) {
  return request({
    url: '/satisfaction/survey/' + surveyId,
    method: 'get'
  })
}

// 新增满意度检查
export function addSurvey(data) {
  return request({
    url: '/satisfaction/survey',
    method: 'post',
    data: data
  })
}

// 修改满意度检查
export function updateSurvey(data) {
  return request({
    url: '/satisfaction/survey',
    method: 'put',
    data: data
  })
}

// 删除满意度检查
export function delSurvey(surveyId) {
  return request({
    url: '/satisfaction/survey/' + surveyId,
    method: 'delete'
  })
}
