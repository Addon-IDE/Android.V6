@导入Java("android.media.*")
@导入Java("java.io.File")
@导入Java("android.content.res.AssetFileDescriptor")
@导入Java("java.io.*")
@导入Java("java.io.InputStream")
类 媒体操作
	@code
   private static int MAX_VOLUME = 100;
   private static int Progress;
   private static MediaPlayer mp;
   private static boolean over;
   @end

	//播放指定路径的音乐，可以:网络路径，也可以是sdcard路径
	@静态
	方法 播放音乐(路径 : 文本)
		@code
      Progress = 0;
      mp = new MediaPlayer();
      over = false;
      try {
         if (#路径.startsWith("/")) {
            if (new File(#路径).exists()) {
               mp.setDataSource(#路径);
            }
         } else if (#路径.startsWith("http://")) {
            mp.setDataSource(#路径);
            mp.setOnBufferingUpdateListener(new MediaPlayer.OnBufferingUpdateListener() {
               @Override
               public void onBufferingUpdate(MediaPlayer mp, int percent) {
                  setProgress(percent);
               }
            });
         }
         mp.prepareAsync();
      } catch (Exception e) {
         e.printStackTrace();
         throw new RuntimeException("播放音频文件地址不正确");
      }
      mp.setOnPreparedListener(new MediaPlayer.OnPreparedListener(){
         @Override
         public void onPrepared(MediaPlayer p1) {
            mp.start();
         }
      });
      mp.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
         public void onCompletion(MediaPlayer mp) {
            mp.release();
         }
      });
      @end
	结束 方法

	@静态
	方法 播放assets音频(窗口环境 : 安卓窗口,音频名称 : 文本)
		@code
      try {
         String privatePath = #窗口环境.getFilesDir().getAbsolutePath() + "/assets/" + #音频名称;
         if (!new File(privatePath).exists()) {
            #写出资源文件(#窗口环境, #音频名称, privatePath);
         }
         #播放音乐(privatePath);
      } catch (Exception e) {
         e.printStackTrace();
         throw new RuntimeException("播放音频文件地址不正确");
      }
      @end
	结束 方法

	@静态
	方法 写出资源文件(窗口环境 为 安卓环境, 文件名称 为 文本, 欲写到路径 为 文本) 为 逻辑型
		@code
		try {
			InputStream stream = #窗口环境.getAssets().open(#文件名称);
			File file = new File(#欲写到路径);
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			if (stream != null && writeStreamToFile(stream, file)) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("写出资源文件( "  + #文件名称 + "或" + #欲写到路径);
		}
		@end
	结束 方法

	//获取缓冲的进度
	@静态
	方法 取缓冲进度() : 整数
		code return Progress;
	结束 方法

	//停止播放
	@静态
	方法 停止播放()
		@code
      if (!over && mp != null) {
         try {
            over = true;
            mp.stop();
            mp.release();
         } catch (IllegalArgumentException e) {
            e.printStackTrace();
         }
      }
      @end
	结束 方法

	//暂停播放
	@静态
	方法 暂停播放()
		@code
      if (!over && mp != null) {
         try {
            mp.pause();
         } catch (IllegalArgumentException e) {
            e.printStackTrace();
         }
      }
      @end
	结束 方法

	//继续播放
	@静态
	方法 继续播放()
		@code
      if (!over && mp != null) {
         try {
            mp.start();
         } catch (IllegalArgumentException e) {
            e.printStackTrace();
         }
      }
      @end
	结束 方法

	//判断是否循环播放，循环播放则返回真，否则:假
	@静态
	方法 是否循环播放() : 逻辑型
		@code
      if (over && mp == null) {
         return false;
      }
      return mp.isLooping();
      @end
	结束 方法

	//设置是否循环播放，循环播放则设置真，否则:假
	@静态
	方法 置循环播放(值 : 逻辑型)
		@code
      if (!over && mp != null) {
         mp.setLooping(#值);
      }
      @end
	结束 方法

	//获取音乐的时长，单位毫秒(ms)
	@静态
	方法 取音乐时长() : 整数
		@code
      if (over && mp == null) {
         return 0;
      }
      return mp.getDuration();
      @end
	结束 方法

	//获取正在播放的位置，单位毫秒(ms)
	@静态
	方法 取播放位置() : 整数
		@code
      if (over && mp == null) {
         return 0;
      }
      return mp.getCurrentPosition();
      @end
	结束 方法

	//设置播放的位置，单位毫秒(ms)
	@静态
	方法 置播放位置(值 : 整数)
		@code
      if (!over && mp != null) {
         mp.seekTo(#值);
      }
      @end
	结束 方法

	//设置播放的音量
	@静态
	方法 置播放音量(音量 : 整数)
		@code
      if (!over && mp != null) {
         float vol = (float)(1.0d - (Math.log((double) (MAX_VOLUME - #音量)) / Math.log((double) MAX_VOLUME)));
         mp.setVolume(vol, vol);
      }
      @end
	结束 方法

	//获取是否在播放，返回真:正在播放，假:没有在播放
	@静态
	方法 取播放状态() : 逻辑型
		@code
      if (over && mp == null) {
         return false;
      }
      return mp.isPlaying();
      @end
	结束 方法

	@code
   private static void setProgress(int value) {
      Progress = value;
   }
   
   private static boolean writeStreamToFile(InputStream stream, File file) throws FileNotFoundException, IOException {
		OutputStream output = new FileOutputStream(file);
		byte[] buffer = new byte[1024];
		while (true) {
			int read = stream.read(buffer);
			if (read != -1) {
				output.write(buffer, 0, read);
			} else {
				output.flush();
				output.close();
				stream.close();
				return true;
			}
		}
	}
	@end
结束 类