@安卓资源("../../../../资源库/核心库资源/App/AudioVisualize")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualize.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualizeOpenGLView.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualizeSurfaceView.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualizeUsers.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualizeView.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/ExceptionHandler.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/FloatingWindowService.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/Id.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/ListContentAdapter.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/ListItemContent.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/LocalDataUtil.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/AudioVisualizeActivity.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/ScreenBroadcastReceiver.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/SpannableStringUtil.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/SplashActivity.java")
@外部Java文件("../../../../依赖库/Java/AudioVisualize/TileService.java")
//唤醒锁
@附加权限("android.permission.WAKE_LOCK")
@附加权限("android.permission.DEVICE_POWER")
//忽略电池优化
@附加权限("android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
//录音
@附加权限("android.permission.RECORD_AUDIO")
@附加权限("android.permission.CAPTURE_AUDIO_HOTWORD")
@附加权限("android.permission.CAPTURE_AUDIO_OUTPUT")
//更改音频设置
@附加权限("android.permission.MODIFY_AUDIO_SETTINGS")
@附加权限("android.permission.MANAGE_VOICE_KEYPHRASES")
//显示在应用上层
@附加权限("android.permission.SYSTEM_ALERT_WINDOW")
@附加权限("android.permission.SYSTEM_OVERLAY_WINDOW")
@附加权限("android.permission.PERSISTENT_ACTIVITY")
//震动
@附加权限("android.permission.VIBRATE")
//Android 9.0 前台服务权限
@附加权限("android.permission.FOREGROUND_SERVICE")
//Android 11 所有文件访问权限
@附加权限("android.permission.MANAGE_EXTERNAL_STORAGE")
@附加清单([[
		<activity
			android:name="com.mcyi.mcaddon.make.AudioVisualizeActivity"
			>
</activity>]])

类 应用_音乐可视化 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局1 : 线性布局

	变量 列表 : 文本[] = {"主菜单","进入主页","提示相关","使用权限","开源地址"}

	事件 应用_音乐可视化:创建完毕()
		对话框()
	结束 事件
	
	方法 对话框()
		//对话框
		变量 Dialog : AlertDialog
		Dialog.初始化 = 本对象
		Dialog.标题 = "音乐可视化"
		Dialog.按钮1 = "退出"
		Dialog.可取消 = 假
		Dialog.置单选列表项(列表,0)
		Dialog.显示()
		//
		事件 Dialog:项目被单击(索引 : 整数)
			假如 索引
				是 0
					Dialog.关闭()
					对话框()
				是 1
					进入主页()
				是 2
					提示相关()
				是 3
					使用权限()	
				是 4
					开源地址()
			结束 假如
		结束 事件
		//关闭
		事件 Dialog:按钮1被点击()
			关闭窗口()
		结束 事件
	结束 方法
	
	方法 进入主页()
		code #<安卓窗口>.newActivity(this, AudioVisualizeActivity.class);
	结束 方法
	
	方法 提示相关()
		变量 Dialog : AlertDialog
		Dialog.初始化 = 本对象
		Dialog.标题 = "提示相关"
		Dialog.内容 = ""
		Dialog.按钮1 = "关闭"
		Dialog.显示()
	结束 方法
	
	方法 使用权限()
		变量 Dialog : AlertDialog
		Dialog.初始化 = 本对象
		Dialog.标题 = "使用到的权限"
		Dialog.内容 = "唤醒锁\n忽略电池优化\n录音\n更改音频设置\n显示在应用上层\n震动\nAndroid 9.0 前台服务权限\nAndroid 11 所有文件访问权限"
		Dialog.按钮1 = "关闭"
		Dialog.显示()
	结束 方法
	
	方法 开源地址()
		变量 Dialog : AlertDialog
		Dialog.初始化 = 本对象
		Dialog.标题 = "开源地址&作者"
		Dialog.内容 = "By：NTX\n\n\n本项目基于 @啊哈hi 的开源作品：Audio-V 打造\n\nAudio-V 开源链接：\nhttps://github.com/EdrowsLuo/audio-v \nhttps://github.com/EdrowsLuo/audio-v/releases \n\n本项目开源链接：\nhttps://github.com/nitianxia/AudioVisualize"
		Dialog.按钮1 = "关闭"
		Dialog.显示()
	结束 方法
	
结束 类