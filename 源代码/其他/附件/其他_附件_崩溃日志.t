类 其他_附件_崩溃日志 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,对齐方式=8388627,背景颜色=-1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=15,高度DP=15,图片资源="../../../../资源库/图标/back/Back_black.png",@左外边距DP=10]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,字体大小=15,内容="项目",字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,宽度DP=2,高度DP=12,@左外边距DP=10,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-526087]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,粗体=真,字体大小=16,内容="崩溃日志",字体颜色=-16777216]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,纵向布局=真,内边距DP=5]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度=-1,高度=-1,分割线高度=0]])
	变量 自定义列表框1 : 自定义列表框

	变量 文件路径 : 文本
	变量 列表集合 : 文本集合
	变量 设置_设定 : 设置_设定

	事件 其他_附件_崩溃日志:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
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
		//加载
		文件路径 = 其他_变量.数据目录 + "logs"
		如果 文件是否存在(文件路径) 则
			加载列表(文件路径)
		否则
			写出文本文件(文件路径 + "/null","")
			删除文件(文件路径 + "/null")
			加载列表(文件路径)
		结束 如果
		//订阅事件
		订阅事件()
	结束 事件

	//窗口被重新启动时触发该事件
	事件 其他_附件_崩溃日志:被重新启动()
		//窗口切换动画
		播放默认切换动画(2)
	结束 事件

	//退出界面
	事件 图片框1:被单击()
		关闭窗口()
	结束 事件
	事件 文本框2:被单击()
		关闭窗口()
	结束 事件

	方法 加载列表(路径 : 文本)
		//加载自定义列表
		事件 自定义列表框1:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
			变量 布局 : 其他_附件_崩溃日志_列表?
			如果 项目布局 == 空 则
				布局 = 创建 其他_附件_崩溃日志_列表
			否则
				布局 = 项目布局
			结束 如果
			//显示到列表
			变量 文件路径 : 文本 = 列表集合[索引]
			如果 是否为目录(文件路径) 则
				布局.线性布局1.可视 = 假
			否则
				布局.线性布局1.可视 = 真
				布局.文本框1.内容 = "崩溃日志" + 索引
				布局.文本框2.内容 = 取文件名(文件路径)
			结束 如果
			//列表被点击
			事件 布局.线性布局2:被单击()
				变量 路径S : 启动信息
				变量 文件内容 : 文本 = 读入文本文件(文件路径)
				路径S.置入("内容",文件内容)
				切换窗口(其他_附件_崩溃日志_查看,路径S)
			结束 事件
			返回 布局
		结束 事件
		//转换为集合
		列表集合 = 文件操作.取子文件集合(路径)
		自定义列表框1.更新项目(列表集合.长度)
	结束 方法

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
	结束 方法


结束 类

类 其他_附件_崩溃日志_查看 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,对齐方式=8388627,背景颜色=-1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=15,高度DP=15,图片资源="../../../../资源库/图标/back/Back_black.png",@左外边距DP=10]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,字体大小=15,内容="项目",字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,宽度DP=2,高度DP=12,@左外边距DP=10,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-526087]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,粗体=真,字体大小=16,内容="崩溃日志查看",字体颜色=-16777216]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-1,纵向布局=真,内边距DP=5]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,字体颜色=-16777216,字体大小=12]])
	变量 文本框1 : 文本框

	变量 设置_设定 : 设置_设定

	事件 其他_附件_崩溃日志_查看:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
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
		//加载
		变量 路径信息 : 启动信息 = 取启动信息()
		文本框1.内容 = 路径信息.取文本("内容")
		//订阅事件
		订阅事件()
	结束 事件
	
	//复制文本
	事件 文本框1:被长按()
		置剪切板文本(本对象,文本框1.内容)
		弹出通知("己复制")
	结束 事件
	
	//退出界面
	事件 图片框1:被单击()
		关闭窗口()
	结束 事件
	事件 文本框2:被单击()
		关闭窗口()
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
		滚动布局1.背景颜色 = 0XFF222222
		文本框1.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类

类 其他_附件_崩溃日志_列表 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2,背景颜色=-1]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=35,高度DP=35]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1,纵向布局=真,对齐方式=8388627]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@左外边距DP=5,字体大小=15,字体颜色=-16777216,单行显示=真]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局4,@左外边距DP=5,字体大小=13,跑马灯效果=真]])
	变量 文本框2 : 文本框

	变量 设置_设定 : 设置_设定

	事件 其他_附件_崩溃日志_列表:创建完毕()
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			线性布局1.背景颜色 = 0XFF333333
			文本框1.字体颜色 = 0XFFFFFFFF
			文本框2.字体颜色 = 0XFFFFFFFF
		结束 如果
	结束 事件

结束 类