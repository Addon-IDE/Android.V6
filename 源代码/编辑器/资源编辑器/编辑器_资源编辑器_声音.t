类 编辑器_资源编辑器_声音 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/back/default_backicon.png",水波纹效果=真,可获取焦点=真]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216,可视=真,内容="声音"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局6,宽度=-1,@左外边距DP=10,@右外边距DP=50,高度=-1,背景颜色=-1,提示文本="搜索...",内容="",左内边距DP=5,右内边距DP=5,字体大小=17,可视=假,单行显示=真]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真,纵向布局=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/resource_editor/menu.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,分割线高度=0,上内边距DP=5,下内边距DP=5]])
	变量 自定义列表框1 : 自定义列表框

	//声明
	变量 设置_设定  : 设置_设定

	//变量
	变量 列表数组 : 文本集合
	变量 结果数组 : JSON数组

	事件 编辑器_资源编辑器_声音:创建完毕()
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
				设置_设置.设置布局背景(本对象,线性布局5,设置相关路径)
			结束 如果
		结束 如果
		//退出按钮事件
		事件 退出界面:被单击()
			关闭窗口()
		结束 事件
		//加载列表
		变量 jsonliat : JSON数组 = 读入资源文件(本对象,"resource/sounds/sounds.json")
		加载列表(jsonliat)
		//加载方法
		菜单()
		//订阅事件
		订阅事件()
	结束 事件

	//窗口被重新启动时触发该事件
	事件 编辑器_资源编辑器_声音:被重新启动()
		//窗口切换动画
		播放默认切换动画(2)
	结束 事件

	//菜单
	变量 搜索开关 : 逻辑型 = 假
	方法 菜单()
		事件 线性布局7:被单击()
			变量 XPopup : XPopup附着弹窗
			变量 项目 : 文本[] = {"刷新列表","搜索列表"}
			XPopup.列表项目 = 项目
			XPopup.附着组件 = 线性布局7
			XPopup.动画(XPopup动画.滑动_右上)
			XPopup.半透明(假)
			XPopup.亮色状态栏(真)
			//设置夜间模式
			如果 设置_设定.获取开关("NightMode") 则
				XPopup.暗色主题(真)
			结束 如果
			XPopup.显示()
			//项目被点击
			事件 XPopup:列表被单击(索引 : 整数,文本 : 文本)
				假如 索引
					是 0
						变量 jsonliat : JSON数组 = 读入资源文件(本对象,"resource/sounds/sounds.json")
						加载列表(jsonliat)
					是 1
						编辑框1.内容 = ""
						如果 搜索开关 则
							搜索开关 = 假
							编辑框1.可视 = 假
						否则
							搜索开关 = 真
							编辑框1.可视 = 真
						结束 如果
				结束 假如
			结束 事件
		结束 事件
	结束 方法

	//加载列表
	方法 加载列表(数组内容 : JSON数组)
		//初始化
		列表数组.清空()
		//循环
		循环(i, 0, 数组内容.长度)
			列表数组.添加成员(数组内容.取JSON对象(i).到文本())
		结束 循环
		//加载列表
		事件 自定义列表框1:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
			变量 布局 : 编辑器_资源编辑器_声音_列表?
			如果 项目布局 == 空 则
				布局 = 创建 编辑器_资源编辑器_声音_列表
			否则
				布局 = 项目布局
			结束 如果
			//设置列表内容
			变量 json : JSON对象 = 列表数组[索引]
			布局.文本框1.内容 = json["name"]
			//列表被单击
			事件 布局.线性布局1:被单击()
				其他_其他.写缓存("resource_editor_sounds_type_name",json["name"].到文本())
				其他_其他.写缓存("resource_editor_sounds_type_path",json["path"].到文本())
				切换窗口(编辑器_资源编辑器_声音_选择)
			结束 事件
			返回 布局
		结束 事件
		//更新列表
		自定义列表框1.更新项目(列表数组.长度)
		//搜索
		事件 编辑框1:内容被改变()
			列表数组.清空()
			循环(i, 0, 数组内容.长度)
				如果 数组内容[i].到文本() ? 编辑框1.内容 则
					列表数组.添加成员(数组内容[i].到文本())
				结束 如果
			结束 循环
			自定义列表框1.更新项目(列表数组.长度)
		结束 事件
	结束 方法


	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		编辑框1.背景颜色 = 0XFF333333
		退出界面.图片资源 = 编辑器_资源编辑器_声音_资源.白色返回图标
		图片框1.图片资源 = 编辑器_资源编辑器_声音_资源.白色菜单图标
		文本框2.字体颜色 = 0XFFFFFFFF
		线性布局5.背景颜色 = 0XFF222222
		编辑框1.提示文本颜色 = 0XFF999999
		编辑框1.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类

类 编辑器_资源编辑器_声音_选择 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/back/default_backicon.png",水波纹效果=真,可获取焦点=真]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216,可视=真,内容="声音标题"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局6,宽度=-1,@左外边距DP=10,@右外边距DP=50,高度=-1,背景颜色=-1,提示文本="搜索...",内容="",左内边距DP=5,右内边距DP=5,可视=假,最低补全字数=1]])
	变量 编辑框1 : 自动补全编辑框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真,纵向布局=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/resource_editor/menu.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,始终显示快速滚动条=真,分割线高度=0,下内边距DP=5,上内边距DP=5]])
	变量 自定义列表框1 : 自定义列表框
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388693]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,@左外边距DP=0,@右外边距DP=15,@下外边距DP=5,内容="0 项",字体大小=14,粗体=真,字体颜色=-12477449]])
	变量 文本框1 : 文本框

	//声明
	变量 设置_设定 : 设置_设定
	变量 文件选择器 : 文件选择器

	//变量
	变量 列表数组 : 文本集合
	变量 结果数组 : JSON数组
	变量 音频位置 : 文本

	事件 编辑器_资源编辑器_声音_选择 : 创建完毕()
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
				设置_设置.设置布局背景(本对象,线性布局5,设置相关路径)
			结束 如果
		结束 如果
		//退出按钮事件
		事件 退出界面:被单击()
			关闭窗口()
		结束 事件
		//设定
		文本框1.可视 = 设置_设定.获取开关("ResourceEditorSoundsDisplayQuantity")
		//加载列表
		文本框2.内容 = 其他_其他.读缓存("resource_editor_sounds_type_name")
		变量 json路径 : 文本 = "resource/sounds/" + 其他_其他.读缓存("resource_editor_sounds_type_path")
		变量 jsonliat : JSON数组 = 读入资源文件(本对象,json路径)
		加载列表(jsonliat)
		//加载方法
		菜单()
		//订阅事件
		订阅事件()
	结束 事件

	//菜单
	变量 搜索开关 : 逻辑型 = 假
	方法 菜单()
		事件 线性布局7:被单击()
			变量 XPopup : XPopup附着弹窗
			变量 项目 : 文本[] = {"刷新列表","搜索列表"}
			XPopup.列表项目 = 项目
			XPopup.附着组件 = 线性布局7
			XPopup.动画(XPopup动画.滑动_右上)
			XPopup.半透明(假)
			XPopup.亮色状态栏(真)
			//设置夜间模式
			如果 设置_设定.获取开关("NightMode") 则
				XPopup.暗色主题(真)
			结束 如果
			XPopup.显示()
			//项目被点击
			事件 XPopup:列表被单击(索引 : 整数,文本 : 文本)
				假如 索引
					是 0
						变量 json路径 : 文本 = "resource/sounds/" + 其他_其他.读缓存("resource_editor_sounds_type_path")
						变量 jsonliat : JSON数组 = 读入资源文件(本对象,json路径)
						加载列表(jsonliat)
					是 1
						编辑框1.内容 = ""
						如果 搜索开关 则
							搜索开关 = 假
							编辑框1.可视 = 假
						否则
							搜索开关 = 真
							编辑框1.可视 = 真
						结束 如果
						//设置查找补全
						变量 搜索文件路径 : 文本 = 其他_变量.数据目录 + "resource/sounds/search_record.txt"
						如果 文件是否存在(搜索文件路径) 则
							变量 搜索文件内容 : 文本 = 读入文本文件(搜索文件路径)
							如果 搜索文件内容.替换(" ","") == "" 则
							否则
								变量 补全数组 : 文本[] = 搜索文件内容.分割文本(" ")
								编辑框1.设置补全内容(本对象,补全数组)
							结束 如果
						结束 如果
				结束 假如
			结束 事件
		结束 事件
	结束 方法

	//加载列表
	方法 加载列表(数组内容 : JSON数组)
		//初始化
		列表数组.清空()
		//循环
		循环(i, 0, 数组内容.长度)
			列表数组.添加成员(数组内容.取JSON对象(i).到文本())
		结束 循环
		//获取项目数量
		文本框1.内容 = 列表数组.长度 + " 项"
		//加载列表
		事件 自定义列表框1:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
			变量 布局 : 编辑器_资源编辑器_声音_选择_列表?
			如果 项目布局 == 空 则
				布局 = 创建 编辑器_资源编辑器_声音_选择_列表
			否则
				布局 = 项目布局
			结束 如果
			//设置列表内容
			变量 json : JSON对象 = 列表数组[索引]
			布局.文本框1.内容 = json["path"].到文本()
			布局.文本框2.内容 = 取文件名(json["path"].到文本())
			布局.文本框2.可视 = 设置_设定.获取开关("ResourceEditorSoundsName")
			//列表被单击
			事件 布局.线性布局1:被单击()
				变量 选择对话框 : DX基础对话框
				选择对话框.标题("选择音频")
				选择对话框.内容("已选择：" + json["path"].到文本())
				选择对话框.按钮1("替换")
				选择对话框.按钮2("取消")
				//设置夜间模式
				如果 设置_设定.获取开关("NightMode") 则
					选择对话框.主题(DX主题.暗色)
				结束 如果
				选择对话框.显示()
				//按钮被点击
				事件 选择对话框:按钮1被单击() : 逻辑型
					其他_其他.写缓存("resource_editor_sounds_path",json["path"].到文本())
					文件选择器.选择文件(本对象,1000)
					返回 假
				结束 事件
			结束 事件
			返回 布局
		结束 事件
		//更新列表
		自定义列表框1.更新项目(列表数组.长度)
		//搜索
		事件 编辑框1:内容被改变()
			列表数组.清空()
			循环(i, 0, 数组内容.长度)
				如果 数组内容[i].到文本() ? 编辑框1.内容 则
					列表数组.添加成员(数组内容[i].到文本())
				结束 如果
			结束 循环
			自定义列表框1.更新项目(列表数组.长度)
			//记录搜索内容
			如果 设置_设定.获取开关("ResourceEditorSoundsRecordSearch") 则
				变量 搜索文件路径 : 文本 = 其他_变量.数据目录 + "resource/sounds/search_record.txt"
				如果 文件是否存在(搜索文件路径) 则
					变量 搜索文件内容 : 文本 = 读入文本文件(搜索文件路径)
					变量 搜索文件内容结果 : 文本 = 搜索文件内容 + 编辑框1.内容 + " "
					写出文本文件(搜索文件路径,搜索文件内容结果)
				否则
					写出文本文件(搜索文件路径,"")
				结束 如果
			结束 如果
		结束 事件
	结束 方法

	//回调事件
	事件 编辑器_资源编辑器_声音_选择:获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
		音频位置 = 文件选择器.解析文件地址(本对象,数据)
		如果 取文件后缀名(音频位置).到小写() == "ogg" 则
			变量 菜单S : DX菜单
			变量 路径 : 文本 = 其他_其他.读缓存("resource_editor_sounds_path")
			变量 提示 : 文本 = "提示\n路径：" + 路径 + "\n音频路径：" + 音频位置 + "\n音频大小：" + 其他_转换.转换文件大小(取文件大小(音频位置))
			变量 功能 : 文本[] = {"属性","播放新音频","确定并替换"，"关闭菜单"}
			//设置夜间模式
			如果 设置_设定.获取开关("NightMode") 则
				菜单S.主题(DX主题.暗色)
			结束 如果
			菜单S.菜单列表(功能)
			菜单S.显示()
			//功能
			事件 菜单S:列表被点击(索引 : 整数,内容 : 文本) : 逻辑型
				假如 索引
					是 0
						变量 提示对话框 : DX基础对话框
						提示对话框.标题("选择音频")
						提示对话框.内容(提示)
						提示对话框.按钮1("取消")
						//设置夜间模式
						如果 设置_设定.获取开关("NightMode") 则
							提示对话框.主题(DX主题.暗色)
						结束 如果
						提示对话框.显示()
					是 1
						变量 其他_附件_媒体播放 : 其他_附件_媒体播放
						其他_附件_媒体播放.开始(音频位置)	
					是 2
						变量 输出路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/resource/" + 路径
						如果 复制文件(音频位置,输出路径) 则
							弹出成功提示("保存并替换成功")
							//项目记录
							变量 模块_项目 : 模块_项目
							模块_项目.初始化()
							模块_项目.assets图标 = "icon/item/record.png"
							模块_项目.名称 = 取文件前缀名(输出路径)
							模块_项目.标识符 = 取文件前缀名(输出路径)
							模块_项目.描述 = "这个是资源包ogg"
							模块_项目.种类 = 模块_项目种类.资源包
							模块_项目.分类 = "sound"
							模块_项目.路径 = 输出路径
							模块_项目.保存()
						否则
							弹出错误提示("替换失败！")
						结束 如果
						菜单S.关闭()
					是 3
						菜单S.关闭()
				结束 假如
				返回 真
			结束 事件
		否则
			弹出错误提示("失败，请选择ogg格式的")
		结束 如果
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		编辑框1.背景颜色 = 0XFF333333
		退出界面.图片资源 = 编辑器_资源编辑器_声音_资源.白色返回图标
		图片框1.图片资源 = 编辑器_资源编辑器_声音_资源.白色菜单图标
		文本框2.字体颜色 = 0XFFFFFFFF
		线性布局5.背景颜色 = 0XFF222222
		编辑框1.提示文本颜色 = 0XFF999999
		编辑框1.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类

类 编辑器_资源编辑器_声音_列表 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2,水波纹效果=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,圆角=1,@左外边距DP=5,@右外边距DP=5,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=45,高度=-1,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=30,高度DP=30,图片资源="../../../../资源库/图标/editor/resource_editor/sounds/record.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@左外边距DP=5,字体大小=14,字体颜色=-16777216,单行显示=真]])
	变量 文本框1 : 文本框

	//声明
	变量 设置_设定 : 设置_设定

	事件 编辑器_资源编辑器_声音_列表:创建完毕()
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		卡片布局1.卡片背景颜色 = 0XFF333333
		线性布局2.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类

类 编辑器_资源编辑器_声音_选择_列表 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2,水波纹效果=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,圆角=1,@左外边距DP=5,@右外边距DP=5,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=45,高度=-1,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=30,高度DP=30,图片资源="../../../../资源库/图标/editor/resource_editor/sounds/record.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@左外边距DP=5,字体大小=14,字体颜色=-16777216,单行显示=真]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局4,@左外边距DP=5,字体大小=11,字体颜色=-16777216,单行显示=真,@上外边距DP=2]])
	变量 文本框2 : 文本框

	//声明
	变量 设置_设定 : 设置_设定

	事件 编辑器_资源编辑器_声音_选择_列表:创建完毕()
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		卡片布局1.卡片背景颜色 = 0XFF333333
		线性布局2.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
		文本框2.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类

类 编辑器_资源编辑器_声音_资源

	@静态
	变量 白色返回图标 : 图片资源 =  "../../../../资源库/图标/back/default_backicon2.png"

	@静态
	变量 白色菜单图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu2.png"

结束 类