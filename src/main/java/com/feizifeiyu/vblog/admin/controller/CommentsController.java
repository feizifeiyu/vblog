package com.feizifeiyu.vblog.admin.controller;

import com.feizifeiyu.vblog.admin.annotation.Log;
import com.feizifeiyu.vblog.admin.dto.QueryPage;
import com.feizifeiyu.vblog.admin.dto.ResponseCode;
import com.feizifeiyu.vblog.admin.entity.Comments;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.service.CommentsService;
import com.feizifeiyu.vblog.admin.utils.AddressUtil;
import com.feizifeiyu.vblog.admin.utils.IPUtil;
import com.feizifeiyu.vblog.common.controller.BaseController;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/17
 */
@RestController
@SuppressWarnings("all")
@RequestMapping("/comments")
public class CommentsController extends BaseController {

    @Autowired
    private CommentsService commentService;

    @GetMapping(value = "/findAllCount")
    public ResponseCode findAllCount() {
        return ResponseCode.success(commentService.findAllCount());
    }

    @GetMapping(value = "/findAll")
    public ResponseCode findAll() {
        return ResponseCode.success(commentService.findAll());
    }

    @PostMapping(value = "/findByPage")
    public ResponseCode findByPage(QueryPage queryPage, Comments comment) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage, () -> commentService.findByPage(comment)));
    }

    /**
     * 根据文章ID查询其下的评论数量
     *
     * @param articleId
     * @return
     */
    @GetMapping(value = "/findCountByArticleId")
    public ResponseCode findCountByArticleId(@RequestParam("articleId") Long articleId) {
        return ResponseCode.success(commentService.findCountByArticle(articleId));
    }

    /**
     * 分页查询并过滤留言数据
     *
     * @param pageCode  当前页
     * @param pageSize  每页显示的记录数
     * @param articleId 当前访问的文章ID
     * @param sort      分类，规定：sort=0表示文章详情页的评论信息；sort=1表示友链页的评论信息；sort=2表示关于我页的评论信息
     * @return
     */
    @GetMapping(value = "/findCommentsList")
    public ResponseCode findCommentsList(QueryPage queryPage, Integer articleId) {
        return ResponseCode.success(commentService.findCommentsList(queryPage.getPageCode(), queryPage.getPageSize(), articleId, 0));
    }

    @GetMapping(value = "/findById")
    public ResponseCode findById(@RequestParam("id") Long id) {
        return ResponseCode.success(commentService.findById(id));
    }

    @PostMapping(value = "/save")
    @Log("新增评论")
    public ResponseCode save(@RequestBody Comments comment, HttpServletRequest request) {
        try {
            String ip = IPUtil.getIpAddr(request);
            comment.setTime(new Date());
            comment.setIp(ip);
            comment.setAddress(AddressUtil.getAddress(ip));
            String header = request.getHeader("User-Agent");
            UserAgent userAgent = UserAgent.parseUserAgentString(header);
            Browser browser = userAgent.getBrowser();
            OperatingSystem operatingSystem = userAgent.getOperatingSystem();
            comment.setDevice(browser.getName() + "," + operatingSystem.getName());
            commentService.save(comment);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping(value = "/update")
    @Log("更新评论")
    public ResponseCode update(@RequestBody Comments comment) {
        try {
            commentService.update(comment);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PostMapping(value = "/delete")
    @Log("删除评论")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            commentService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
