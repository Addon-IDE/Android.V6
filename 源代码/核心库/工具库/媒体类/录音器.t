@附加权限(安卓权限.录音权限)
@附加权限(安卓权限.文件权限_写入)
@附加权限(安卓权限.文件权限_读取)
@导入Java("java.io.*")
@导入Java("android.media.MediaRecorder")
类 录音器
	@code
   private MediaRecorder mr;
   private int 录音源 = 0;
   private File createFile(String path) {
      try {
         File file = new File(path);
         if (!file.exists()) {
            File parent = file.getParentFile();
            if (!parent.exists()) {
               parent.mkdirs();
            }

            file.createNewFile();
         } else {
            file.delete();
         }

         return file;
      } catch (IOException e) {
         e.printStackTrace();
         return null;
      }
   }
   @end

   属性读 录音源() 为 整数
      code return this.录音源;
   结束 属性

   //在开始录音前调用此命令设置录音源：0、默认，1、麦克风，2、上行，3、下行，4、双向。
   属性写 设置录音源(参数 为 整数)
      code this.录音源 = #参数;
   结束 属性

   //开始录音，保存路径必须提供完整路径。
   方法 开始录音(保存路径 为 文本)
      @code
      this.mr = new MediaRecorder();
      File file = this.createFile(#保存路径);
      this.mr.setAudioSource(this.录音源);
      this.mr.setOutputFormat(0);
      this.mr.setAudioEncoder(0);
      this.mr.setOutputFile(file.getAbsolutePath());
      try {
         this.mr.prepare();
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      this.mr.start();
      @end
   结束 方法

   //停止录音，录音文件会自动保存至指定路径。
	方法 停止录音()
		@code
		if(this.mr != null){
         this.mr.stop();
         this.mr.release();
         this.mr = null;
		 }
		 @end
	结束 方法
结束 类