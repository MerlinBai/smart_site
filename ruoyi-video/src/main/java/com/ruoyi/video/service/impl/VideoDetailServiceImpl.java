package com.ruoyi.video.service.impl;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.ruoyi.video.domain.UserLog;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.video.mapper.VideoDetailMapper;
import com.ruoyi.video.domain.VideoDetail;
import com.ruoyi.video.service.IVideoDetailService;

import javax.annotation.Resource;

/**
 * 记录视频观看时长Service业务层处理
 *
 * @author ruoyi
 * @date 2023-05-18
 */
@Service
public class VideoDetailServiceImpl implements IVideoDetailService
{
    @Autowired
    private VideoDetailMapper videoDetailMapper;

    /**
     * 查询记录视频观看时长
     *
     * @param videoId 记录视频观看时长主键
     * @return 记录视频观看时长
     */
    @Override
    public VideoDetail selectVideoDetailByVideoId(Long videoId)
    {
        return videoDetailMapper.selectVideoDetailByVideoId(videoId);
    }

    /**
     * 查询记录视频观看时长列表
     *
     * @param videoDetail 记录视频观看时长
     * @return 记录视频观看时长
     */
    @Override
    public List<VideoDetail> selectVideoDetailList(VideoDetail videoDetail)
    {
        List<VideoDetail> videoDetails = videoDetailMapper.selectVideoDetailList(videoDetail);

        Collections.sort(videoDetails, new Comparator<VideoDetail>() {
            @Override
            public int compare(VideoDetail o1, VideoDetail o2) {
                return o2.getCreateTime().compareTo(o1.getCreateTime());
            }
        });

        return videoDetails;
    }

    /**
     * 新增记录视频观看时长
     *
     * @param videoDetail 记录视频观看时长
     * @return 结果
     */
    @Override
    public int insertVideoDetail(VideoDetail videoDetail){
        String videoViewTime = videoDetail.getVideoViewTime();
        String progressBar = videoDetail.getProgressBar();
        if(videoViewTime!=null&&progressBar!=null) {
            long videoViewTimeLong = Long.parseLong(videoViewTime);
            long progressBarLong = Long.parseLong(progressBar);
            Long realTime = videoDetail.getRealTime();

            Long flag1 = videoViewTimeLong / realTime;
            Long flag2 = progressBarLong / realTime;
            if (flag1 >= 0.8 && flag2 >= 0.8) {
                videoDetail.setDone(1L);
            }
        }
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());

        videoDetail.setCreateTime(date);
        return videoDetailMapper.insertVideoDetail(videoDetail);
    }

    /**
     * 修改记录视频观看时长
     *
     * @param videoDetail 记录视频观看时长
     * @return 结果
     */
    @Override
    public int updateVideoDetail(VideoDetail videoDetail)
    {
        String videoViewTime = videoDetail.getVideoViewTime();
        String progressBar = videoDetail.getProgressBar();
        if(videoViewTime!=null&&progressBar!=null){
            long videoViewTimeLong = Long.parseLong(videoViewTime);
            long progressBarLong = Long.parseLong(progressBar);
            Long realTime = videoDetail.getRealTime();

            Long flag1=videoViewTimeLong/realTime;
            Long flag2=progressBarLong/realTime;
            if (flag1>=0.8&&flag2>=0.8){
                videoDetail.setDone(1L);
            return videoDetailMapper.updateVideoDetail(videoDetail);

            }

        }

            return videoDetailMapper.updateVideoDetail(videoDetail);



    }

    /**
     * 批量删除记录视频观看时长
     *
     * @param videoIds 需要删除的记录视频观看时长主键
     * @return 结果
     */
    @Override
    public int deleteVideoDetailByVideoIds(Long[] videoIds)
    {
        return videoDetailMapper.deleteVideoDetailByVideoIds(videoIds);
    }

    /**
     * 删除记录视频观看时长信息
     *
     * @param videoId 记录视频观看时长主键
     * @return 结果
     */
    @Override
    public int deleteVideoDetailByVideoId(Long videoId)
    {
        return videoDetailMapper.deleteVideoDetailByVideoId(videoId);
    }

    @Override
    public List<VideoDetail> select() {
        return videoDetailMapper.select();
    }

    @Override
    public void lasttime(UserLog userlog) {
        UserLog ul = videoDetailMapper.selectLog(userlog);
        if(ul != null) {
            if(userlog.getLastTime() < ul.getLastTime())
                userlog.setLastTime(ul.getLastTime());
            videoDetailMapper.updateLog(userlog);
        }
        else {
            videoDetailMapper.insertLog(userlog);
        }
    }

    @Override
    public Double getlast(UserLog userLog) {
        return videoDetailMapper.getlast(userLog);
    }
}
