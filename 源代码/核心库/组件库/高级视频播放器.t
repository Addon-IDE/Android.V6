@导入Java("android.widget.VideoView")
@导入Java("android.media.MediaPlayer")
类 高级视频播放器 : 可视化组件
	@code
	private boolean autoPlay;
	private boolean isStretch;
	
    public #<高级视频播放器>(#<@安卓环境> context) {
        super(context);
		getView().setOnPreparedListener(new MediaPlayer.OnPreparedListener(){
			@Override
			public void onPrepared(MediaPlayer p1) {
				if (autoPlay) {
					getView().start();
				}
				#视频加载完成();
			}
		});
		getView().setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
			@Override
			public void onCompletion(MediaPlayer mp) {
				#视频播放完成();
			}
		});
		getView().setOnErrorListener(new MediaPlayer.OnErrorListener() {
			@Override
			public boolean onError(MediaPlayer mp, int what, int extra) {
				#视频播放错误();
				return true;
			}
		});
    }

   @Override
    public VideoView onCreateView(android.content.Context context) {
        VideoView view = new VideoView(context) {
			@Override
			protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
				super.onMeasure(widthMeasureSpec, heightMeasureSpec);
				if (isStretch) {
					int width = getDefaultSize(0, widthMeasureSpec);
					int height = getDefaultSize(0, heightMeasureSpec);
					setMeasuredDimension(width, height);
				}
			}
		};
        return view;
    }
	
    @Override
    public VideoView getView() {
        return (VideoView) view;
    }
	
	@end
	
	//视频是否拉伸
	属性读 拉伸() 为 逻辑型
		code return isStretch;
	结束 属性
	
	//视频是否可以拉伸
	属性写 拉伸(是否拉伸 为 逻辑型)
		code isStretch = #是否拉伸;
	结束 属性

	//设置播放视频的路径，可以为本地路径，也可以为网络路径,第二个参数为是否自动播放，表示视频加载完成后是否自动播放
	@附加权限(安卓权限.文件权限_读取)
	@附加权限(安卓权限.网络权限)
	方法 置播放路径(路径 为 文本, 是否自动播放 为 逻辑型 = 真)
		@code
		if (#路径.startsWith("http")) {
			getView().setVideoURI(android.net.Uri.parse(#路径));
		} else if (#路径.startsWith("/")) {
			getView().setVideoPath(#路径);
		}
		autoPlay = #是否自动播放;
		@end
	结束 方法

	//开始播放视频
	方法 开始播放()
		code getView().start();
	结束 方法

	//暂停播放视频
	方法 暂停播放()
		code getView().pause();
	结束 方法

	//停止播放视频
	方法 停止播放()
		code getView().stopPlayback();
	结束 方法

	//获取视频总时长
	方法 取视频总时长() 为 整数
		code return getView().getDuration();
	结束 方法

	//获取当前播放位置
	方法 取当前播放位置() 为 整数
		code return getView().getCurrentPosition();
	结束 方法

	//快进至指定位置
	方法 快进至(位置 为 整数)
		code getView().seekTo(#位置);
	结束 方法

	//重新播放
	方法 重新播放()
		code getView().resume();
	结束 方法

	//判断视频播放器是否在播放视频
	方法 是否在播放() 为 逻辑型
		code return getView().isPlaying();
	结束 方法

	//视频加载完成时触发该事件
	定义事件 视频加载完成()

	//视频播放完成时触发该事件
	定义事件 视频播放完成()

	//视频播放错误时触发该事件
	定义事件 视频播放错误()
	
结束 类