package com.ruoyi.project.netty;

import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.module.device.domain.Device;
import io.netty.buffer.Unpooled;
import io.netty.util.CharsetUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.nio.Buffer;
import java.util.List;

@Controller
@RequestMapping("/module/test1")
public class test1Controller extends BaseController {


    /**
     * @param deviceId A 基站 B采集终端 C控制终端
     * @param status 1添加 0删除
     * @return
     */
    @RequiresPermissions("module:test:add")
    @RequestMapping("/dervice")
    @ResponseBody
    public AjaxResult dervice(String deviceId,int status){
            if (!nettyConnectionManager.connectionManage.checkDerviceId(deviceId)) {
                return error("基站不在线");
            } else {
                System.out.println("基站在线");
            }
            if (nettyConnectionManager.connectionManage.isCtxActive(nettyConnectionManager.connectionManage.getConn(deviceId))) {
                System.out.println("基站在线，并且设备链接正常");
                // A 基站 B采集终端 C控制终端
                if(status==1) {
                    byte[] bt = new byte[4];
                    bt[0] = 0x3A;
                    String dev = deviceId.substring(0,2);
                    bt[1] = Integer.valueOf(dev).byteValue();
                    dev = deviceId.substring(2);
                    bt[2] = Integer.valueOf(dev).byteValue();
                    System.out.println(bt[1]+" "+bt[2]);
                    bt[3] = 0x01;
                    nettyConnectionManager.connectionManage.getConn(deviceId).writeAndFlush(Unpooled.copiedBuffer( MessageUtils.getCRC(bt)));
                    return success("添加设备成功");
                }else{
                    byte[] bt = new byte[4];
                    bt[0] = 0x3A;

                    String dev = deviceId.substring(0,2);
                    bt[1] = Integer.valueOf(dev).byteValue();
                    dev = deviceId.substring(2);
                    bt[2] = Integer.valueOf(dev).byteValue();
                    System.out.println(bt[1]+" "+bt[2]);
                    bt[3] = 0x02;
                    nettyConnectionManager.connectionManage.getConn(deviceId).writeAndFlush(Unpooled.copiedBuffer(MessageUtils.getCRC(bt)));
                    return success("删除设备成功");
                }
            } else {
                System.out.println("基站在线，链接不正常");
                return error("基站在线，链接不可用");
            }
    }


    /**
     * @param deviceId A 基站 B采集终端 C控制终端
     * @return
     */
    @RequiresPermissions("module:test:add")
    @RequestMapping("/look")
    @ResponseBody
    public AjaxResult look(String deviceId){
        if (!nettyConnectionManager.connectionManage.checkDerviceId(deviceId)) {
            return error("基站不在线");
        } else {
            System.out.println("基站在线");
        }
        if (nettyConnectionManager.connectionManage.isCtxActive(nettyConnectionManager.connectionManage.getConn(deviceId))) {
            System.out.println("基站在线，并且设备链接正常");
            // A 基站 B采集终端 C控制终端
            byte[] bt = new byte[3];
            bt[0] = 0x3B;
            String dev = deviceId.substring(0,2);
            bt[1] = Integer.valueOf(dev).byteValue();
            dev = deviceId.substring(2);
            bt[2] = Integer.valueOf(dev).byteValue();
            System.out.println(bt[1]+" "+bt[2]);
            nettyConnectionManager.connectionManage.getConn(deviceId).writeAndFlush(Unpooled.copiedBuffer( MessageUtils.getCRC(bt)));
            return success("查看设备成功");
        } else {
            System.out.println("基站在线，链接不正常");
            return error("基站在线，链接不可用");
        }
    }







}
