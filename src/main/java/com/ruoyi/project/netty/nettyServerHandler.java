package com.ruoyi.project.netty;

import com.ruoyi.common.utils.MessageUtils;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandler.Sharable;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.util.CharsetUtil;

@Sharable
public class nettyServerHandler extends ChannelInboundHandlerAdapter {

	@Override
	public void channelInactive(ChannelHandlerContext ctx){
		nettyConnectionManager.connectionManage.getConnectionLock().readLock().lock();
		nettyConnectionManager.connectionManage.remove(ctx);
		ctx.close();
		nettyConnectionManager.connectionManage.getConnectionLock().readLock().unlock();
		System.out.println("关闭了一个现有的连接。");
	}

	//上行数据处理业务逻辑处
	@Override
	public void channelRead(ChannelHandlerContext ctx,Object msg) {
		ByteBuf in = (ByteBuf)msg;
		//得到字节数组
		byte[] req = new byte[in.readableBytes()];
		in.readBytes(req);
		for(int i =0 ;i<req.length;i++){
			System.out.println(req[i]);
		}


		//检查CRC
		if(MessageUtils.chechCRC(req)){
			String derviceId = req[1]+""+req[2];
			if(req[1]==0x41){
				System.out.println("连接基站设备"+derviceId);
			}else if(req[1]==0x42){
				System.out.println("连接采集终端"+derviceId);
			}else if(req[1]==0x43){
				System.out.println("连接控制终端"+derviceId);
			}
			//处理完成数据放入TCP管理器中
			nettyConnectionManager.connectionManage.getConnectionLock().readLock().lock();
			if (!nettyConnectionManager.connectionManage.getHashIdTcp().containsKey(derviceId)) {
				nettyConnectionManager.connectionManage.add(derviceId,ctx);
				System.out.println("TCP链接管理器添加设备链接 deviceId" + derviceId);
			}
			nettyConnectionManager.connectionManage.getConnectionLock().readLock().unlock();
			//增减设备回答
			if(req[0]==0x3A){
				System.out.println(derviceId+"增减设备回答"+ (req[3]==0x01?"操作成功":req[3]==0x02?"操作失败":"无此状态"));
			}else
				//查看数据
				if(req[0]==0x3B){
					byte bt = req[req.length-3];
					for (int i =1 ;i<=8 ;i++) {
						if (MessageUtils.getBit(bt, i)) {
							System.out.println(derviceId+"数据查看回答：第"+i +"位正常工作" );
						}else{
							System.out.println(derviceId+"数据查看回答：第"+i +"位非正常工作");
						}
					}
					System.out.println("信号强度为:");
					System.out.print(req[3]);
					System.out.println("电量为:");
					System.out.print(req[4]*4+"%");
					System.out.println("温度:");
					System.out.print(req[5]+"c");
					System.out.println("湿度:");
					System.out.print(req[6]);
					System.out.println("土壤湿度:");
					System.out.print(req[7]);
					System.out.println("光照:");
					System.out.print(req[8]);
					System.out.println("二氧化碳:");
					System.out.print(req[9]);
					System.out.println("酸碱度:");
					System.out.print(req[10]+" "+req[11]+" "+req[12]+" "+req[13]);
				}
				else if(req[0]==0x3C){

				}
				else if(req[0]==0x3D){

				}
				else if(req[0]==0x3E){

				}else{
					System.out.println("识别不了的信息");
				}
		}else{
			System.out.println("CRC校验不通过");
		}

	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx,Throwable cause) {
		cause.printStackTrace();
		nettyConnectionManager.connectionManage.getConnectionLock().readLock().lock();
		nettyConnectionManager.connectionManage.remove(ctx);
		ctx.close();
		nettyConnectionManager.connectionManage.getConnectionLock().readLock().unlock();
		System.out.println("关闭了一个现有的连接。");
	}
}
