package com.ruoyi.web.controller.video;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.video.domain.UserLog;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.video.domain.VideoDetail;
import com.ruoyi.video.service.IVideoDetailService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 记录视频观看时长Controller
 *
 * @author ruoyi
 * @date 2023-05-18
 */
@Anonymous
@RestController
@RequestMapping("/systevideom/detail")
public class VideoDetailController extends BaseController
{
    @Autowired
    private IVideoDetailService videoDetailService;

    /**
     * 查询记录视频观看时长列表
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:list')")
    @GetMapping("/list")
    public TableDataInfo list(VideoDetail videoDetail)
    {
        startPage();
        List<VideoDetail> list = videoDetailService.selectVideoDetailList(videoDetail);
        return getDataTable(list);
    }

    /**
     * 导出记录视频观看时长列表
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:export')")
    @Log(title = "记录视频观看时长", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VideoDetail videoDetail)
    {
        List<VideoDetail> list = videoDetailService.selectVideoDetailList(videoDetail);
        ExcelUtil<VideoDetail> util = new ExcelUtil<VideoDetail>(VideoDetail.class);
        util.exportExcel(response, list, "记录视频观看时长数据");
    }

    /**
     * 获取记录视频观看时长详细信息
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:query')")
    @GetMapping(value = "/{videoId}")
    public AjaxResult getInfo(@PathVariable("videoId") Long videoId)
    {
        return success(videoDetailService.selectVideoDetailByVideoId(videoId));
    }

    @GetMapping("/getlist")
    public AjaxResult getlist() {
        return success(videoDetailService.select());
    }

    /**
     * 新增记录视频观看时长
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:add')")
    @Log(title = "记录视频观看时长", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VideoDetail videoDetail)
    {
        return toAjax(videoDetailService.insertVideoDetail(videoDetail));
    }

    /**
     * 修改记录视频观看时长
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:edit')")
    @Log(title = "记录视频观看时长", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VideoDetail videoDetail)
    {
        return toAjax(videoDetailService.updateVideoDetail(videoDetail));
    }


    @PostMapping("/lasttime")
    public AjaxResult LastTime(@RequestBody UserLog userlog) {
        System.out.println(userlog.getUserId());
        videoDetailService.lasttime(userlog);
        return success();
    }

    @GetMapping("/gl")
    public AjaxResult getLastTime(UserLog userlog) {
        return success(videoDetailService.getlast(userlog));
    }

    /**
     * 删除记录视频观看时长
     */
    //@PreAuthorize("@ss.hasPermi('systevideom:detail:remove')")
    @Log(title = "记录视频观看时长", businessType = BusinessType.DELETE)
    @DeleteMapping("/{videoIds}")
    public AjaxResult remove(@PathVariable Long[] videoIds)
    {
        return toAjax(videoDetailService.deleteVideoDetailByVideoIds(videoIds));
    }
}
