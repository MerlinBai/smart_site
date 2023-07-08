package com.ruoyi.video.mapper;

import java.util.List;

import com.ruoyi.video.domain.UserLog;
import com.ruoyi.video.domain.VideoDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * 记录视频观看时长Mapper接口
 *
 * @author ruoyi
 * @date 2023-05-18
 */
public interface VideoDetailMapper
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
     * 删除记录视频观看时长
     *
     * @param videoId 记录视频观看时长主键
     * @return 结果
     */
    public int deleteVideoDetailByVideoId(Long videoId);

    /**
     * 批量删除记录视频观看时长
     *
     * @param videoIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVideoDetailByVideoIds(Long[] videoIds);

    @Select("select * from tb_video_detail")
    List<VideoDetail> select();

    @Select("select * from user_video_log where userId = #{userId} and videoId = #{videoId}")
    UserLog selectLog(UserLog userlog);

    @Update("update user_video_log set lastTime = #{lastTime}, allTime = #{allTime} where userId = #{userId} and videoId = #{videoId}")
    void updateLog(UserLog userLog);

    @Insert("insert into user_video_log set lastTime = #{lastTime}, userId = #{userId}, videoId = #{videoId}, allTime = #{allTime}")
    void insertLog(UserLog userlog);

    @Select("select lastTime from user_video_log where userId = #{userId} and videoId = #{videoId}")
    Double getlast(UserLog userLog);
}
