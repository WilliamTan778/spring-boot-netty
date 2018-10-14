package com.ruoyi.common.utils;

import org.springframework.context.MessageSource;
import com.ruoyi.common.utils.spring.SpringUtils;

/**
 * 获取i18n资源文件
 *
 * @author ruoyi
 */
public class MessageUtils
{

    /**
     * 根据消息键和参数 获取消息 委托给spring messageSource
     *
     * @param code 消息键
     * @param args 参数
     * @return
     */
    public static String message(String code, Object... args)
    {
        MessageSource messageSource = SpringUtils.getBean(MessageSource.class);
        return messageSource.getMessage(code, args, null);
    }



    //CRC校验
    public static int CalCrc(int crc, byte[] buf, int len)
    {
        char k;
        short ACC,TOPBIT;
        short remainder = (short) crc;
        TOPBIT = (short) 0x8000;
        for (int b=0;b< len; b++)
        {
            ACC = buf[b];
            remainder ^= (ACC <<8);
            for (k = 8; k > 0; --k)
            {
                if ((remainder & TOPBIT)!=0){
                    remainder = (short) ((remainder << 1) ^0x8005);
                }
                else
                {
                    remainder = (short) (remainder << 1);
                }
            }
        }
        remainder= (short) (remainder^0x0000);
        return remainder;
    }

    public static byte[] getCRC( byte[] str){
        byte[] buffer = null;
        buffer = addBytes(str,new byte[2]);
        int crc = CalCrc(0, buffer, buffer.length-2);//计算得到的 16 位 CRC 校验码
        buffer[buffer.length-1] = (byte) crc;//取校验码低八位
        buffer[buffer.length-2] = (byte)(crc >> 8);//取校验码高八位
        return buffer;
    }


    public static boolean chechCRC(byte[] buffer)
    {
        int result = CalCrc(0, buffer, buffer.length);
        if(result == 0)
        {
            return true;
        }else {
            return false;
        }
    }

    public static byte[] addBytes(byte[] data1,byte[] data2){
        byte[] data3 = new byte[data1.length + data2.length];
        System.arraycopy(data1,0,data3,0,data1.length);
        System.arraycopy(data2,0,data3,data1.length,data2.length);
        return data3;
    }



    public static boolean getBit(byte bt, int i)
    {
        return ((bt & (1 << i)) != 0);//true 表示第i位为1,否则为0
    }

}