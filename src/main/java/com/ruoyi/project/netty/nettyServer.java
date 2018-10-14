package com.ruoyi.project.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import org.springframework.stereotype.Component;

import java.net.InetSocketAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component("nettyServer")
public class nettyServer {
    static HashMap<String,NioEventLoopGroup> hash = new HashMap<>();

    //nettyServer服务 守护进程
    public void start(String port){
        NioEventLoopGroup group = new NioEventLoopGroup();
        try {
            if(hash.containsKey(port)){
                System.out.println("Netty服务端已经启动，无需启动" + port);
                return;
            }
            ServerBootstrap b = new ServerBootstrap();
            b.group(group).channel(NioServerSocketChannel.class).localAddress(new InetSocketAddress(new Integer(port)))
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel ch) throws Exception {
                            ch.pipeline().addLast(new nettyServerHandler());
                        }
                    });
            ChannelFuture f = b.bind().sync();
            System.out.println("Netty服务端启动成功,开始监听端口:" + port);
            hash.put(port,group);
            f.channel().closeFuture().sync();
            group.shutdownGracefully().sync();
        }catch (Exception e){
            try {
                group.shutdownGracefully().sync();
                hash.get(port).shutdownGracefully().sync();
                hash.remove(port);
            }catch (Exception e1){
                e1.printStackTrace();
            }
            System.out.println("Netty服务端报错关闭:" + port);
            e.printStackTrace();
            return;
        }
    }
    //终止nettyServer服务
    public void delete(String port){
        String msg = "";
        try {
            if(hash.containsKey(port)){
                hash.get(port).shutdownGracefully().sync();
                msg = "Netty服务端关闭成功"+port;
            }else {
                msg = "Netty服务端未开启"+port;
            }
        }catch (Exception e){
            System.out.println("Netty服务端关闭失败:" + port);
            e.printStackTrace();
            return;
        }
        System.out.println(msg);
        hash.remove(port);
    }

   //守护线程操作,清除不正常链接
   public void checkConn()
   {
       // 读写锁，性能更高，且不会发生Delete线程一直占用资源
       nettyConnectionManager.connectionManage.getConnectionLock().readLock().lock();
       for (Map.Entry<ChannelHandlerContext,HashMap<String,String>> entry :  nettyConnectionManager.connectionManage.getHashTcpId().entrySet()) {
           try {
               if (!nettyConnectionManager.connectionManage.isCtxActive(entry.getKey())){
                   nettyConnectionManager.connectionManage.remove(entry.getKey());
                   entry.getKey().close();
                   System.out.println("设备异常链接关闭：derviceId= " + entry.getKey());
               }
           } catch (Exception e){
               e.printStackTrace();
           }
       }
       nettyConnectionManager.connectionManage.getConnectionLock().readLock().unlock();
   }

   //同步mysql与链接的操作




}
