package com.ruoyi.video.service;

import java.util.List;

import com.ruoyi.video.domain.UserLog;
import com.ruoyi.video.domain.VideoDetail;

/**
 * 记录视频观看时长Service接口
 *
 * @author ruoyi
 * @date 2023-05-18
 */
public interface IVideoDetailService
{
    /**
     * 查询记录视频观看时长
     *
     * @param videoId 记录视频观看时长主键
     * @return 记录视频观看时长
     */
    public VideoDetail selectVideoDetailByVideoId(Long videoId);

    /**
     * 查询记录视频观看时长列表
     *
     * @param videoDetail 记录视频观看时长
     * @return 记录视频观看时长集合
     */
    public List<VideoDetail> selectVideoDetailList(VideoDetail videoDetail);

    /**
     * 新增记录视频观看时长
     *
     * @param videoDetail 记录视频观看时长
     * @return 结果
     */
    public int insertVideoDetail(VideoDetail videoDetail);

    /**
     * 修改记录视频观看时长
     *
     * @param videoDetail 记录视频观看时长
     * @return 结果
     */
    public int updateVideoDetail(VideoDetail videoDetail);

    /**
     * 批量删除记录视频观看时长
     *
     * @param videoIds 需要删除的记录视频观看时长主键集合
     * @return 结果
     */
    public int deleteVideoDetailByVideoIds(Long[] videoIds);

    /**
     * 删除记录视频观看时长信息
     *
     * @param videoId 记录视频观看时长主键
     * @return 结果
     */
    public int deleteVideoDetailByVideoId(Long videoId);

    List<VideoDetail> select();

    void lasttime(UserLog userlog);

    Double getlast(UserLog userLog);
}





