类 登录 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1]])
	变量 线性布局9 : 线性布局
	@布局配置([[父布局=线性布局9,宽度=-1,高度DP=180]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,宽度=-1,高度=-1]])
	变量 视频播放器1 : 高级视频播放器
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,圆角=100,@上外边距DP=150,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,纵向布局=真,背景颜色=-1,对齐方式=49]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,对齐方式=17,字体大小=18,内容="Sign in",粗体=真,@上外边距DP=20,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=45,@上外边距DP=30,右内边距DP=20,左内边距DP=20]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=35,高度DP=45,对齐方式=17]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/module/login_register/account.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-1,提示文本="请输入登录账号",字体大小=15,内容="",右内边距DP=5,左内边距DP=5,单行输入=真]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=45,@上外边距DP=10,右内边距DP=20,左内边距DP=20]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度DP=35,高度DP=45,对齐方式=17]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/module/login_register/password.png"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,提示文本="请输入登录密码",字体大小=15,内容="",右内边距DP=5,左内边距DP=5,单行输入=真,输入方式=129]])
	变量 编辑框2 : 编辑框
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=42,@左外边距DP=20,@右外边距DP=20,@上外边距DP=30,圆角=25,卡片阴影=0]])
	变量 卡片布局2 : 卡片布局
	@布局配置([[父布局=卡片布局2,宽度=-1,高度=-1,背景颜色=-11559425,对齐方式=17,水波纹效果=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,粗体=真,内容="登录",字体颜色=-1]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,@左外边距DP=20,@右外边距DP=20,@上外边距DP=10,内容="密码忘记了？那就找回密码吧!（点击找回密码）",字体颜色=-11163393,水波纹效果=真]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局2,高度DP=42,宽度=-1,@左外边距DP=20,@右外边距DP=20,@上外边距DP=20,对齐方式=17,水波纹效果=真]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,粗体=真,内容="注册",字体颜色=-11559425]])
	变量 文本框4 : 文本框

	变量 设置_设定 : 设置_设定
	变量 视频背景地址 : 文本 = 其他_变量.缓存目录 + "LoginRegister/bg.mp4"

	事件 登录:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//加载夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
		//加载方法
		圆角背景边框()
		加载背景()
		//订阅事件
		订阅事件()
	结束 事件

	//圆角背景边框
	方法 圆角背景边框()
		组件样式操作.置圆角背景边框(线性布局8,0xF0FFFFFF,2,-11559425,25,25,25,25)
	结束 方法

	//加载背景视频
	方法 加载背景()
		视频播放器1.拉伸 = 真
		如果 文件是否存在(视频背景地址) 则
			视频播放器1.置播放路径(视频背景地址,真)
			视频播放器1.开始播放()
			事件 视频播放器1:视频播放完成()
				视频播放器1.重新播放()
			结束 事件
		否则
			如果 写出资源文件(本对象,"mores/login_register/video.mp4",视频背景地址) 则
				视频播放器1.置播放路径(视频背景地址,真)
				视频播放器1.开始播放()
				事件 视频播放器1:视频播放完成()
					视频播放器1.重新播放()
				结束 事件
			否则
				弹出错误提示("初始化背景失败")
			结束 如果
		结束 如果
	结束 方法

	//登录
	事件 线性布局7:被单击()
		
	结束 事件
	
	//找回密码
	事件 文本框3:被单击()
		
	结束 事件

	//注册
	事件 线性布局8:被单击()
		
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		卡片布局1.卡片背景颜色 = 0XFF333333
		线性布局2.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
		编辑框1.提示文本颜色 = 0XFFE0E0E0
		编辑框1.字体颜色 = 0XFFFFFFFF
		编辑框2.提示文本颜色 = 0XFFE0E0E0
		编辑框2.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类