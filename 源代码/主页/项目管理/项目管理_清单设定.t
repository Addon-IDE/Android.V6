类 项目管理_清单设定 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局01 : 线性布局
	@布局配置([[父布局=线性布局01,高度DP=50,宽度=-1]])
	变量 相对布局01 : 相对布局
	@布局配置([[父布局=相对布局01,宽度=-1,高度DP=50,对齐方式=8388627,背景颜色=-1]])
	变量 线性布局02 : 线性布局
	@布局配置([[父布局=线性布局02,宽度DP=15,高度DP=15,图片资源="../../../../资源库/图标/back/Back_black.png",@左外边距DP=10]])
	变量 图片框01 : 图片框
	@布局配置([[父布局=线性布局02,字体大小=15,内容="项目",字体颜色=-16777216]])
	变量 文本框02 : 文本框
	@布局配置([[父布局=线性布局02,宽度DP=2,高度DP=12,@左外边距DP=10,卡片阴影=0]])
	变量 卡片布局01 : 卡片布局
	@布局配置([[父布局=卡片布局01,宽度=-1,高度=-1,背景颜色=-526087]])
	变量 线性布局03 : 线性布局
	@布局配置([[父布局=线性布局02,@左外边距DP=10,粗体=真,字体大小=16,内容="清单设定",字体颜色=-16777216]])
	变量 文本框03 : 文本框
	@布局配置([[父布局=相对布局01,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,高度DP=50,宽度DP=50,纵向布局=真,对齐方式=17,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/management/res/manifest_save.png"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=线性布局2,字体大小=12,字体颜色=-16777216,内容="保存",对齐方式=17]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局01,宽度=-1,高度=-1,纵向布局=真,左内边距DP=10,右内边距DP=10,上内边距DP=10,下内边距DP=10]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,高度=-1,宽度=-1,背景颜色=16777215,显示滚动条=假]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度DP=-2,背景颜色=-1,纵向布局=真,左内边距DP=0]])
	变量 线性布局14 : 线性布局
	@布局配置([[父布局=线性布局14,宽度=-1,高度DP=25,对齐方式=8388627]])
	变量 线性布局15 : 线性布局
	@布局配置([[父布局=线性布局15,@左外边距DP=10,粗体=真,字体颜色=-16079635,内容="我的项目---清单设定"]])
	变量 文本框8 : 文本框
	@布局配置([[父布局=线性布局14,宽度=-1,对齐方式=49,纵向布局=真,高度=-2]])
	变量 线性布局16 : 线性布局
	@布局配置([[父布局=线性布局16,宽度=-1,阴影=0,高度DP=45]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局17 : 线性布局
	@布局配置([[父布局=线性布局17,@左外边距DP=10,粗体=真,字体大小=16,内容="中文转unicode",字体颜色=-16777216]])
	变量 文本框9 : 文本框
	@布局配置([[父布局=线性布局17,@左外边距DP=10,字体大小=13,字体颜色=-10197916,内容="将项目中的名称、作者、描述转换为unicode编码"]])
	变量 文本框38 : 文本框
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局18 : 线性布局
	@布局配置([[父布局=线性布局18,@右外边距DP=10,宽度DP=38,高度DP=20]])
	变量 开关1 : SwitchButton
	@布局配置([[父布局=线性布局16,宽度=-1,阴影=0,高度DP=45]])
	变量 相对布局3 : 相对布局
	@布局配置([[父布局=相对布局3,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局19 : 线性布局
	@布局配置([[父布局=线性布局19,@左外边距DP=10,粗体=真,字体大小=16,内容="附加包依赖",字体颜色=-16777216]])
	变量 文本框10 : 文本框
	@布局配置([[父布局=线性布局19,@左外边距DP=10,字体大小=13,字体颜色=-10197916,内容="允许附加包中的资源包和行为包互相依赖"]])
	变量 文本框11 : 文本框
	@布局配置([[父布局=相对布局3,宽度=-1,高度=-1,对齐方式=8388629,水波纹效果=真]])
	变量 线性布局20 : 线性布局
	@布局配置([[父布局=线性布局20,@右外边距DP=10,宽度DP=38,高度DP=20]])
	变量 开关2 : SwitchButton
	@布局配置([[父布局=线性布局16,宽度=-1,阴影=0,高度DP=45,水波纹效果=真]])
	变量 相对布局6 : 相对布局
	@布局配置([[父布局=相对布局6,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局28 : 线性布局
	@布局配置([[父布局=线性布局28,@左外边距DP=10,粗体=真,字体大小=16,内容="JavaScript",字体颜色=-16777216]])
	变量 文本框17 : 文本框
	@布局配置([[父布局=线性布局28,@左外边距DP=10,字体大小=13,字体颜色=-10197916,内容="让附加包支持JavaScript"]])
	变量 文本框18 : 文本框
	@布局配置([[父布局=相对布局6,宽度=-1,高度=-1,对齐方式=8388629,水波纹效果=真]])
	变量 线性布局29 : 线性布局
	@布局配置([[父布局=线性布局29,@右外边距DP=10,宽度DP=38,高度DP=20]])
	变量 开关3 : SwitchButton
	@布局配置([[父布局=线性布局16,宽度=-1,阴影=0,高度DP=45,水波纹效果=真]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,@左外边距DP=10,粗体=真,字体大小=16,内容="Metadate",字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局3,@左外边距DP=10,字体大小=13,字体颜色=-10197916,内容="允许附加包在打包的时候添加元数据"]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388629,水波纹效果=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@右外边距DP=10,宽度DP=38,高度DP=20]])
	变量 开关4 : SwitchButton

	//声明
	变量 设置_设定 : 设置_设定

	//变量
	变量 项目名称 : 文本


	事件 项目管理_清单设定:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//加载夜间模试
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
		//设置背景
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("PersonalityBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(本对象,线性布局5,设置相关路径)
			结束 如果
		结束 如果
		//退出按钮
		事件 图片框01:被单击()
			关闭窗口()
		结束 事件
		事件 文本框02:被单击()
			关闭窗口()
		结束 事件
		//获取项目名称
		项目名称 = 其他_其他.读缓存("ProjectName")
		//读取设定文件
		变量 清单路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/manifest.json"
		变量 json清单文件内容 : JSON对象 = 读入文本文件(清单路径)
		变量 json清单文件内容Option : JSON对象 = json清单文件内容["Option"].到文本()
		//设置开关状态
		开关1.选中 = json清单文件内容Option["Unicode"]
		开关2.选中 = json清单文件内容Option["Dependence"]
		开关3.选中 = json清单文件内容Option["JavaScript"]
		开关4.选中 = json清单文件内容Option["Metadata"]
		//订阅事件
		订阅事件()
	结束 事件

	//窗口被重新启动时触发该事件
	事件 项目管理_清单设定:被重新启动()
		//窗口切换动画
		播放默认切换动画(2)
	结束 事件

	//保存按钮
	事件 线性布局2:被单击()
		//变量
		变量 清单路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/manifest.json"
		变量 json : JSON对象 = 读入文本文件(清单路径)
		变量 option : JSON对象 = [[{}]]
		//取
		option["Unicode"] = 开关1.选中
		option["Dependence"] = 开关2.选中
		option["JavaScript"] = 开关3.选中
		option["Metadata"] = 开关4.选中
		//设置JSON对象变量
		变量 新对象option : JSON对象 = option
		//添加
		json["Option"] = 新对象option
		变量 jsonout = json.到文本(4)
		写出文本文件(清单路径,jsonout)
		//提示
		弹出成功提示("保存成功")
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局02.背景颜色 = 0XFF333333
		线性布局03.背景颜色 = 0XFF222222
		卡片布局01.卡片背景颜色 = 0XFF222222
		文本框02.字体颜色 = 0XFFFFFFFF
		文本框03.字体颜色 = 0XFFFFFFFF
		图片框01.图片资源 = 其他_资源.白色返回图标
		图片框2.图片资源 = 项目管理_资源.白色图标保存清单
		文本框1.字体颜色 = 0XFFFFFFFF
		线性布局5.背景颜色 = 0XFF222222
		线性布局14.背景颜色 = 0XFF333333
		文本框9.字体颜色 = 0XFFFFFFFF
		文本框10.字体颜色 = 0XFFFFFFFF
		文本框17.字体颜色 = 0XFFFFFFFF
		文本框2.字体颜色 = 0XFFFFFFFF
		文本框38.字体颜色 = 0XFFE0E0E0
		文本框11.字体颜色 = 0XFFE0E0E0
		文本框18.字体颜色 = 0XFFE0E0E0
		文本框3.字体颜色 = 0XFFE0E0E0
	结束 方法


结束 类