package com.ruoyi.project.netty;

import io.netty.channel.ChannelHandlerContext;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
public class nettyConnectionManager{

        private ReadWriteLock connectionLock = new ReentrantReadWriteLock();
        static nettyConnectionManager connectionManage = new nettyConnectionManager();
        public ArrayList<ChannelHandlerContext> array = new ArrayList();
        public HashMap<String,ChannelHandlerContext> hashIdTcp = new HashMap<>();
        public HashMap<ChannelHandlerContext,HashMap<String,String>> hashTcpId = new HashMap<>();

        //读写锁
        public ReadWriteLock getConnectionLock() {
            return connectionLock;
        }
        //删除TCP链接
        public void remove(ChannelHandlerContext ctx){
                for (Map.Entry<String, String> entry :  hashTcpId.get(ctx).entrySet()) {
                    hashIdTcp.remove(entry.getKey());
                }
                hashTcpId.remove(ctx);
        }
        //增加TCP链接
        public void add(String derviceId,ChannelHandlerContext ctx){
            hashIdTcp.put(derviceId,ctx);
            if(hashTcpId.get(ctx)==null){
                hashTcpId.put(ctx,new HashMap<>());
            }
            hashTcpId.get(ctx).put(derviceId,derviceId);
        }

        //获取dervideID 与 链接信息
        public HashMap<String,ChannelHandlerContext> getHashIdTcp(){
            return hashIdTcp;
        }
        //检查tcp链接是否生效
        public boolean isCtxActive(ChannelHandlerContext ctx){
            if(ctx==null){ return false;}
            return  ctx.channel().isActive();
        }
        //获取链接信息通过 设备ID
        public ChannelHandlerContext getConn(String derviceId){
            return  hashIdTcp.get(derviceId);
        }
        //检查设备是否在线
        public boolean checkDerviceId(String derviceId){
            return hashIdTcp.containsKey(derviceId);
        }

        public HashMap<ChannelHandlerContext,HashMap<String,String>> getHashTcpId(){
        return hashTcpId;
    }

        public void setConn(String derviceId,ChannelHandlerContext ctx){
            hashIdTcp.put(derviceId,ctx);
        }

        public ArrayList<ChannelHandlerContext> getConnList()
        {
            return this.array;
        }



        public void addConnList(ChannelHandlerContext ctx)
        {
            this.array.add(ctx);
        }



    }

