类 JSON与XML互转 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,对齐方式=8388627,背景颜色=-1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=15,高度DP=15,图片资源="../../../../../资源库/图标/back/Back_black.png",@左外边距DP=10]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,字体大小=15,内容="项目",字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,宽度DP=2,高度DP=12,@左外边距DP=10,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-526087]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,粗体=真,字体大小=16,内容="JSON与XML互转",字体颜色=-16777216]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度=-1,高度DP=40,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,@左外边距DP=10,字体颜色=-16777216,字体大小=16,内容="转换类型：JSON转XML"]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局4,宽度=-1,高度DP=40,对齐方式=8388627,水波纹效果=真,背景颜色=-1]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,@左外边距DP=10,字体颜色=-16777216,字体大小=16,内容="开始转换"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局4,宽度=-1,高度DP=40,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,@左外边距DP=10,字体颜色=-16777216,字体大小=16,内容="重置"]])
	变量 文本框7 : 文本框
	@布局配置([[父布局=线性布局4,宽度=-1,高度=-1,背景颜色=-1,@上外边距DP=1]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-1,对齐方式=81,纵向布局=真]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,@左外边距DP=10,@上外边距DP=10,字体颜色=-16777216,内容="输入"]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=线性布局6,@左外边距DP=10,@右外边距DP=10,宽度=-1,高度=-2,提示文本="",内容="",@上外边距DP=5,左内边距DP=5,右内边距DP=5,字体大小=14]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=线性布局6,@左外边距DP=10,@上外边距DP=10,字体颜色=-16777216,内容="输出"]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局6,@左外边距DP=10,@右外边距DP=10,宽度=-1,高度=-2,提示文本="",内容="",@上外边距DP=5,左内边距DP=5,右内边距DP=5,字体大小=14]])
	变量 编辑框2 : 编辑框

	//声明
	变量 设置_设定 : 设置_设定
	变量 其他_功能 : 其他_功能

	//变量
	变量 类型 : 整数 = 0
	变量 缓存类型 : 整数 = 0
	变量 分类列表 : 文本[] = {"JSON转XML","XML转JSON"}

	事件 JSON与XML互转:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//退出按钮
		事件 图片框1:被单击()
			关闭窗口()
		结束 事件
		事件 文本框2:被单击()
			关闭窗口()
		结束 事件
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
		//设置背景
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("PersonalityBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(本对象,线性布局4,设置相关路径)
			结束 如果
		结束 如果
		//订阅事件
		订阅事件()
	结束 事件

	//打开选择类型对话框
	事件 线性布局5:被单击()
		变量 对话 : AlertDialog
		对话.初始化 = 本对象
		对话.标题 = "选择类型"
		对话.按钮1 = "确定"
		对话.按钮2 = "关闭"
		对话.按钮颜色 = 0XFF2575F6
		对话.置单选列表项(分类列表,类型)
		对话.显示()
		缓存类型 = 0
		事件 对话:项目被单击(索引 : 整数)
			缓存类型 = 索引
		结束 事件
		事件 对话:按钮1被点击()
			类型 = 缓存类型
			如果 类型 == 0 则
				文本框1.内容 = "转换类型：JSON转XML"
			否则
				文本框1.内容 = "转换类型：XML转JSON"
			结束 如果
		结束 事件
	结束 事件

	//开始转换
	事件 线性布局7:被单击()
		变量 内容1 : 文本 = 编辑框1.内容
		如果 类型 == 0 则
			如果 其他_功能.JSON是否合法(内容1) 则
				编辑框2.内容 = JsonAndXml.JSOM到XML(内容1)
			否则
				弹出错误提示("json不合法！")
			结束 如果
		否则
			如果 内容1.替换(" ","") == "" 则
				弹出警告通知("编辑框内不能为空！")
			否则
				开始俘获异常()
				编辑框2.内容 = JsonAndXml.XML到JSON(内容1)
				俘获所有异常()
				变量 对话 : AlertDialog
				对话.初始化 = 本对象
				对话.标题 = "发生了错误"
				对话.内容 = "错误详细：\n" + 取俘获异常().到文本() + "\n错误信息：" + 取俘获异常().取异常信息()
				对话.按钮1 = "关闭"
				对话.按钮颜色 = 0XFFE12222
				对话.显示()
				结束俘获异常()
			结束 如果
		结束 如果
	结束 事件

	//重置
	事件 线性布局8:被单击()
		变量 模拟加载过程 : 倒计时器
		变量 加载弹窗 : ProgressDialog
		模拟加载过程.开始倒计时(1000l,1000l)
		加载弹窗.初始化 = 本对象
		加载弹窗.标题 = "正在处理与重置中..."
		加载弹窗.显示进度文本 = 假
		加载弹窗.模糊进度 = 真
		加载弹窗.可取消 = 假
		加载弹窗.显示()
		事件 模拟加载过程:倒计时结束()
			编辑框1.内容 = ""
			编辑框2.内容 = ""
			加载弹窗.关闭()
		结束 事件
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		线性布局3.背景颜色 = 0XFF222222
		卡片布局1.卡片背景颜色 = 0XFF222222
		文本框2.字体颜色 = 0XFFFFFFFF
		文本框3.字体颜色 = 0XFFFFFFFF
		图片框1.图片资源 = 其他_资源.白色返回图标
		线性布局4.背景颜色 = 0XFF222222
		滚动布局1.背景颜色 = 0XFF333333
		线性布局7.背景颜色 = 0XFF333333
		线性布局5.背景颜色 = 0XFF333333
		线性布局8.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
		文本框4.字体颜色 = 0XFFFFFFFF
		文本框5.字体颜色 = 0XFFFFFFFF
		文本框6.字体颜色 = 0XFFFFFFFF
		文本框7.字体颜色 = 0XFFFFFFFF
		编辑框1.字体颜色 = 0XFFFFFFFF
		编辑框2.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类