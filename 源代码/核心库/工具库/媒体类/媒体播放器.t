@导入Java("android.media.*")
@导入Java("android.os.*")
@导入Java("java.util.*")
@导入Java("java.io.IOException")
@附加权限(安卓权限.网络权限)
@附加权限(安卓权限.文件权限_读取)
类 媒体播放器
	变量 音乐列表:集合
	变量 当前播放:整数 = 0
	@code
	private MediaPlayer mp = new MediaPlayer();
	public #<媒体播放器>(){
		mp.setOnBufferingUpdateListener(new MediaPlayer.OnBufferingUpdateListener(){
			@Override
			public void onBufferingUpdate(MediaPlayer p1, int p2){
				#音乐正在缓冲(p2);
			}
		});
		mp.setOnPreparedListener(new MediaPlayer.OnPreparedListener(){
			@Override
			public void onPrepared(MediaPlayer p1){
				#音乐缓冲完毕();
			}
		});
		mp.setOnCompletionListener(new MediaPlayer.OnCompletionListener(){
            	@Override
				public void onCompletion(MediaPlayer mp) {
					#音乐结束();
				}
		});
	}
	@end
	
	
	方法 添加音乐(音乐:文本)
		@code
		try{
			mp.setDataSource(#音乐);
			mp.prepare();
        } catch (IOException e) {} catch (IllegalStateException e) {} catch (SecurityException e) {} catch (IllegalArgumentException e) {}
		@end
	结束 方法
	
	方法 释放资源()
		code mp.reset();
	结束 方法
	
	方法 开始()
		code mp.start();
	结束 方法
	
	方法 停止()
		code mp.stop();
	结束 方法
	
	方法 暂停()
		code mp.pause();
	结束 方法
	
	
	
	方法 置播放列表(音乐:文本)
		音乐列表.添加成员(音乐);
	结束 方法
	
	方法 是否正在播放():逻辑型
		code return mp.isPlaying();
	结束 方法
	
	//获取音乐总时长
	方法 取音乐总时长() 为 整数
		code return mp.getDuration();
	结束 方法

	//获取当前播放位置
	方法 取当前播放位置() 为 整数
		code return mp.getCurrentPosition();
	结束 方法

	//快进至指定位置
	方法 设置进度(位置 为 整数)
		code mp.seekTo(#位置);
	结束 方法

	//设置播放音乐的音量，分别设置左声道音量和右声道音量
	方法 置音量(左声道音量 为 小数, 右声道音量 为 小数)
		code mp.setVolume((float) #左声道音量, (float) #右声道音量);
	结束 方法
	
	方法 下一曲()
		@code
		#释放资源();
		if(#音乐列表.size()-1==#当前播放){
			#当前播放 = 0;
			#添加音乐(#音乐列表.get(#当前播放)+"");
			#开始();
		}else{
			#当前播放 = #当前播放 + 1;
			#添加音乐(#音乐列表.get((int)#当前播放)+"");
			#开始();
		}
		@end
	结束 方法
	
	方法 上一曲()
		@code
		#释放资源();
		if(#当前播放 == 0){
			#当前播放 = #音乐列表.size()-1;
			#添加音乐(#音乐列表.get(#当前播放)+"");
			#开始();
		}else{
			#当前播放 = #当前播放 - 1;
			#添加音乐(#音乐列表.get((int)#当前播放)+"");
			#开始();
		}
		@end
	结束 方法
	
	方法 取音乐列表():集合
		返回 音乐列表
	结束 方法
	//返回序号，及为索引，相对于整体大小-1
	方法 取当前播放序号():整数
		返回 当前播放;
	结束 方法
	
	方法 播放列表歌曲(序号:整数)
		当前播放 = 序号
		添加音乐(音乐列表[序号].到文本())
		开始()
	结束 方法
	
	定义事件 音乐开始()
	定义事件 音乐结束()
	定义事件 音乐正在缓冲(进度:整数)
	定义事件 音乐缓冲完毕()
结束 类