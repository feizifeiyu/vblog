package com.feizifeiyu.vblog.admin.controller;

import com.feizifeiyu.vblog.admin.annotation.Log;
import com.feizifeiyu.vblog.admin.dto.QueryPage;
import com.feizifeiyu.vblog.admin.dto.ResponseCode;
import com.feizifeiyu.vblog.admin.entity.Links;
import com.feizifeiyu.vblog.admin.exception.GlobalException;
import com.feizifeiyu.vblog.admin.service.LinksService;
import com.feizifeiyu.vblog.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 非子非鱼
 * @date 2018/10/18
 */
@RestController
@SuppressWarnings("all")
@RequestMapping("/links")
public class LinksController extends BaseController {

    @Autowired
    private LinksService linkService;

    @GetMapping(value = "/findAllCount")
    public ResponseCode findAllCount() {
        return ResponseCode.success(linkService.findAllCount());
    }

    @GetMapping(value = "/findAll")
    public ResponseCode findAll() {
        return ResponseCode.success(linkService.findAllCount());
    }

    @PostMapping(value = "/findByPage")
    public ResponseCode findByPage(QueryPage queryPage, Links link) {
        return ResponseCode.success(super.selectByPageNumSize(queryPage, () -> linkService.findByPage(link)));
    }

    @GetMapping(value = "/findById")
    public ResponseCode findById(@RequestParam("id") Long id) {
        return ResponseCode.success(linkService.findById(id));
    }

    @PostMapping(value = "/save")
    @Log("新增友链")
    public ResponseCode save(@RequestBody Links link) {
        try {
            linkService.save(link);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping(value = "/update")
    @Log("更新友链")
    public ResponseCode update(@RequestBody Links link) {
        try {
            linkService.update(link);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @PostMapping(value = "/delete")
    @Log("删除友链")
    public ResponseCode delete(@RequestBody List<Long> ids) {
        try {
            linkService.delete(ids);
            return ResponseCode.success();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
