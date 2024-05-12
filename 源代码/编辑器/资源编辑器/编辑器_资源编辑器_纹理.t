类 编辑器_资源编辑器_纹理 : 窗口

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
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216,可视=真,内容="标题"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局6,宽度=-1,@左外边距DP=10,@右外边距DP=50,高度=-1,背景颜色=-1,提示文本="搜索图标名称",内容="",左内边距DP=5,右内边距DP=5,字体大小=17,可视=假]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真,纵向布局=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/resource_editor/menu.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,列数=4]])
	变量 自定义宫格列表框1 : 自定义宫格列表框

	//声明
	变量 列表集合 : 文本集合
	变量 结束集合 : 文本集合
	变量 设置_设定 : 设置_设定
	变量 分类活动路径 : 文本
	变量 分类路径 : 文本
	变量 是否为横屏 : 逻辑型 = 假

	事件 编辑器_资源编辑器_纹理:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//设置标题
		文本框2.内容 = 其他_其他.读缓存("resource_editor_textures_name")
		//加载方法
		如果 文件是否存在(其他_其他.读缓存("resource_editor_textures_path")) 则
			项目搜索列表(其他_其他.读缓存("resource_editor_textures_path"))
			分类路径 = 其他_其他.读缓存("resource_editor_textures_path")
		否则
			变量 提示对话框 : DX基础对话框
			提示对话框.标题("提示")
			//设置夜间模式
			如果 设置_设定.获取开关("NightMode") 则
				提示对话框.主题(DX主题.暗色)
			结束 如果
			提示对话框.内容("资源图标文件夹丢失，无法加载，请在主页点击修复")
			提示对话框.按钮1("关闭")
			提示对话框.显示()
		结束 如果
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
		//设定自定义宫格列表框列数
		自定义宫格列表框1.列数 = 设置_设定.获取整数("ResourceEditorListNumber")
		//订阅事件
		订阅事件()
	结束 事件

	//窗口被重新启动时触发该事件
	事件 编辑器_资源编辑器_纹理:被重新启动()
		//窗口切换动画
		播放默认切换动画(2)
	结束 事件

	//打开菜单
	变量 搜索开关 : 逻辑型 = 假
	事件 线性布局7:被单击()
		变量 菜单A : DX菜单
		变量 菜单布局 : 编辑器_资源编辑器_纹理_菜单
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			菜单A.主题(DX主题.暗色)
			菜单布局.线性布局1.背景颜色 = 0XFF333333
			菜单布局.线性布局2.背景颜色 = 0XFF333333
			菜单布局.线性布局3.背景颜色 = 0XFF333333
			菜单布局.线性布局4.背景颜色 = 0XFF333333
			菜单布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.白色刷新图标
			菜单布局.图片框2.图片资源 = 编辑器_资源编辑器_纹理_资源.白色搜索图标
			菜单布局.图片框3.图片资源 = 编辑器_资源编辑器_纹理_资源.白色切换横屏图标
			菜单布局.文本框1.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框2.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框3.字体颜色 = 0XFFFFFFFF
			编辑框1.提示文本颜色 = 0XFF999999
			编辑框1.字体颜色 = 0XFFFFFFFF
		结束 如果
		菜单A.依附组件(线性布局7)
		菜单A.依附位置(DX对齐方式.下)
		菜单A.自定义布局(菜单布局)
		菜单A.宽度(400)
		菜单A.高度(350)
		菜单A.显示()
		//刷新
		事件 菜单布局.线性布局2:被单击()
			如果 文件是否存在(其他_其他.读缓存("resource_editor_textures_path")) 则
				项目搜索列表(其他_其他.读缓存("resource_editor_textures_path"))
				弹出成功提示("刷新成功")
			否则
				弹出错误提示("刷新失败")
			结束 如果
			菜单A.关闭()
		结束 事件
		//搜索
		事件 菜单布局.线性布局3:被单击()
			编辑框1.内容 = ""
			如果 搜索开关 则
				搜索开关 = 假
				编辑框1.可视 = 假
			否则
				搜索开关 = 真
				编辑框1.可视 = 真
			结束 如果
			菜单A.关闭()
		结束 事件
		//横屏模式
		事件 菜单布局.线性布局4:被单击()
			//设定自定义宫格列表框列数
			自定义宫格列表框1.列数 = 设置_设定.获取整数("ResourceEditorTransverseListNumber")
			是否为横屏 = 真
			项目搜索列表(其他_其他.读缓存("resource_editor_textures_path"),真)
			菜单A.关闭()
		结束 事件
	结束 事件

	//返回键被按下
	@虚拟方法
	方法 返回键被按下()
		如果 分类路径 == 分类活动路径 则
			关闭窗口()
		否则
			变量 wj : 文件 = 分类活动路径
			变量 flj : 文本 = wj.取父目录路径()
			项目搜索列表(flj,真)
		结束 如果
	结束 方法

	方法 项目搜索列表(路径:文本,刷新:逻辑型=假)
		分类活动路径 = 路径
		如果 刷新 则
			列表集合 = 文件操作.取子文件集合(路径)
			自定义宫格列表框1.更新项目(列表集合.长度)
		否则
			//变量
			变量 项目路径 : 文本 = 路径
			//加载自定义列表
			事件 自定义宫格列表框1:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
				变量 布局 : 编辑器_资源编辑器_纹理_列表?
				如果 项目布局 == 空 则
					布局 = 创建 编辑器_资源编辑器_纹理_列表
				否则
					布局 = 项目布局
				结束 如果
				//显示到列表
				变量 文件路径 : 文本 = 列表集合[索引]
				如果 是否为目录(文件路径) 则
					布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.文件夹图标
					布局.文本框1.内容 = 取文件名(文件路径)
					布局.文本框2.内容 = 文件路径
				否则
					布局.文本框1.内容 = 取文件名(文件路径)
					布局.文本框2.内容 = 文件路径
					布局.文本框3.内容 = 其他_转换.转换文件大小(取文件大小(文件路径))
					如果 取文件后缀名(文件路径).到小写() == "png" || 取文件后缀名(文件路径).到小写() == "jpg"  则
						布局.图片框1.图片路径 = 文件路径
					否则 取文件后缀名(文件路径).到小写() == "json"
						布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.文件json图标
					否则 取文件后缀名(文件路径).到小写() == "tga"
						布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.文件file_tga图标
					否则
						布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.未知文件图标		
					结束 如果
				结束 如果
				//设置大小
				如果 是否为横屏 则
					布局.卡片布局1.高度DP = 设置_设定.获取整数("ResourceEditorTransverseListSize")
				否则
					布局.卡片布局1.高度DP = 设置_设定.获取整数("ResourceEditorListSize")
				结束 如果
				//设置显示名称和大小
				布局.文本框1.可视 = 设置_设定.获取开关("ResourceEditorListPictureName")
				布局.文本框3.可视 = 设置_设定.获取开关("ResourceEditorListPictureSize")
				//列表被单击
				事件 布局.线性布局2:被单击()
					变量 文件路径2 : 文本 = 布局.文本框2.内容
					如果 是否为目录(文件路径2) 则
						项目搜索列表(文件路径2,真)
					否则
						变量 结果路径 : 文本 = 其他_其他.读缓存("resource_editor_textures_id") + 分类活动路径.替换(分类路径,"") + "/" + 布局.文本框1.内容
						如果 取文件后缀名(文件路径2).到小写() == "png" || 取文件后缀名(文件路径2).到小写() == "jpg" 则
							PNG文件替换方法(结果路径,布局)
						否则 取文件后缀名(文件路径2).到小写() == "json"
							其他_其他.写缓存("resource_editor_textures_path_json",结果路径)
							其他_其他.写缓存("resource_editor_textures_path_json2",文件路径2)
							切换窗口(编辑器_资源编辑器_纹理_JSON编辑)
						否则 取文件后缀名(文件路径2).到小写() == "tga"
							TGA文件替换方法(结果路径)
						否则
							弹出错误提示("未知文件，无法读取！")
						结束 如果
					结束 如果
				结束 事件
				//列表被长按
				事件 布局.线性布局2:被长按()
					置剪切板文本(本对象,布局.文本框1.内容)
					弹出成功提示("复制成功")
				结束 事件
				返回 布局
			结束 事件
			//转换为集合
			列表集合 = 文件操作.取子文件集合(项目路径)
			自定义宫格列表框1.更新项目(列表集合.长度)
			//编辑框搜索
			事件 编辑框1:内容被改变()
				列表集合 = 搜索(文件操作.取子文件集合(分类活动路径),编辑框1.内容)
				自定义宫格列表框1.更新项目(列表集合.长度)
			结束 事件
		结束 如果
	结束 方法

	变量 文件选择器:文件选择器

	//当文件为PNG格式时执行的方法
	方法 PNG文件替换方法(路径 : 文本,布局 : 编辑器_资源编辑器_纹理_列表)
		变量 菜单A : DX菜单
		变量 菜单布局 : 编辑器_资源编辑器_纹理_图片方式菜单
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			菜单A.主题(DX主题.暗色)
			菜单布局.线性布局1.背景颜色 = 0XFF333333
			菜单布局.线性布局2.背景颜色 = 0XFF333333
			菜单布局.线性布局3.背景颜色 = 0XFF333333
			菜单布局.线性布局4.背景颜色 = 0XFF333333
			菜单布局.图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.白色图片替换图标
			菜单布局.图片框2.图片资源 = 编辑器_资源编辑器_纹理_资源.白色图片修改图标
			菜单布局.图片框3.图片资源 = 编辑器_资源编辑器_纹理_资源.白色图片修改图标
			//菜单布局.图片框3.图片资源 = 
			菜单布局.文本框1.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框2.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框3.字体颜色 = 0XFFFFFFFF
			编辑框1.提示文本颜色 = 0XFF999999
			编辑框1.字体颜色 = 0XFFFFFFFF
		结束 如果
		菜单A.依附组件(布局.线性布局1)
		菜单A.依附位置(DX对齐方式.下)
		菜单A.自定义布局(菜单布局)
		菜单A.宽度(380)
		菜单A.高度(440)
		菜单A.显示()
		//替换图片
		事件 菜单布局.线性布局2:被单击()
			变量 对话框2 : DX基础对话框
			如果 设置_设定.获取开关("NightMode") 则
				对话框2.主题(DX主题.暗色)
			结束 如果
			对话框2.标题("替换提示")
			对话框2.内容(取文件名(路径) + "\n请确认此文件是需要替换的文件")
			对话框2.按钮1("选择文件并替换")
			对话框2.按钮2("取消")
			对话框2.显示()
			事件 对话框2:按钮1被单击() : 逻辑型
				其他_其他.写缓存("resource_editor_textures_path2",路径)
				文件选择器.选择文件(本对象,1)
				对话框2.关闭()
				返回 假
			结束 事件
		结束 事件
		//修改图片
		事件 菜单布局.线性布局3:被单击()
			变量 项目的路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/" + "resource/textures/"
			变量 项目的最终路径 : 文本 = 项目的路径 + 路径
			其他_工具_图片编辑_加载.加载图片(布局.文本框2.内容,项目的最终路径)
			切换窗口(其他_工具_图片编辑)
		结束 事件
		//修改图片 +
		事件 菜单布局.线性布局4:被单击()
			变量 项目的路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/" + "resource/textures/"
			变量 项目的最终路径 : 文本 = 项目的路径 + 路径
			其他_工具_图片编辑2_加载.加载图片(布局.文本框2.内容,项目的最终路径)
			切换窗口(其他_工具_图片编辑2)
		结束 事件
	结束 方法

	//当文件为tga格式时执行的方法
	方法 TGA文件替换方法(路径 : 文本)
		变量 对话框2 : DX基础对话框
		如果 设置_设定.获取开关("NightMode") 则
			对话框2.主题(DX主题.暗色)
		结束 如果
		对话框2.标题("TGA 提示")
		对话框2.内容("tga格式的文件无法修改，你只能用新的tga文件来进行替换")
		对话框2.按钮1("选择文件并替换")
		对话框2.按钮2("取消")
		对话框2.显示()
		事件 对话框2:按钮1被单击() : 逻辑型
			其他_其他.写缓存("resource_editor_textures_path2",路径)
			文件选择器.选择文件(本对象,0)
			对话框2.关闭()
			返回 假
		结束 事件
	结束 方法


	/*
	当窗口要求另一个窗口返回数据成功时，会触发该事件用于接收返回数据
	*/
	事件 编辑器_资源编辑器_纹理:获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
		假如 请求码
			是 0
				变量 新的文件路径 : 文本 = 文件选择器.解析文件地址(本对象,数据)
				如果 取文件后缀名(新的文件路径).到小写() == "tga" 则
					变量 最终提示 : DX基础对话框
					如果 设置_设定.获取开关("NightMode") 则
						最终提示.主题(DX主题.暗色)
					结束 如果
					最终提示.标题("提示")
					最终提示.内容(取文件名(新的文件路径) + "请确认这个是不是你要替换的新文件，如果是点击确定")
					最终提示.按钮1("确定")
					最终提示.按钮2("取消")
					最终提示.显示()
					事件 最终提示:按钮1被单击() : 逻辑型
						变量 项目的路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/" + "resource/textures/"
						变量 项目的最终路径 : 文本 = 项目的路径 + 其他_其他.读缓存("resource_editor_textures_path2")
						如果 复制文件(新的文件路径,项目的最终路径) 则
							//
							变量 模块_项目 : 模块_项目
							模块_项目.初始化()
							模块_项目.assets图标 = "icon/item/file_tga.png"
							模块_项目.名称 = 取文件前缀名(项目的最终路径)
							模块_项目.标识符 = 取文件前缀名(项目的最终路径)
							模块_项目.描述 = "这个是资源包tga文件"
							模块_项目.种类 = 模块_项目种类.资源包
							模块_项目.分类 = "tga"
							模块_项目.路径 = 项目的最终路径
							模块_项目.保存()
							//
							弹出成功提示("替换成功")
							最终提示.关闭()
						否则
							弹出错误提示("替换失败")
							最终提示.关闭()
						结束 如果
						返回 假
					结束 事件
				否则
					弹出警告提示("你选择的文件不是tga格式")
				结束 如果
			是 1
				变量 新的文件路径 : 文本 = 文件选择器.解析文件地址(本对象,数据)
				如果 取文件后缀名(新的文件路径).到小写() == "png" || 取文件后缀名(新的文件路径).到小写() == "jpg" 则
					变量 最终提示 : DX基础对话框
					如果 设置_设定.获取开关("NightMode") 则
						最终提示.主题(DX主题.暗色)
					结束 如果
					最终提示.标题("提示")
					最终提示.内容(取文件名(新的文件路径) + "请确认这个是不是你要替换的新文件，如果是点击确定")
					最终提示.按钮1("确定")
					最终提示.按钮2("取消")
					最终提示.显示()
					事件 最终提示:按钮1被单击() : 逻辑型
						变量 项目的路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/" + "resource/textures/"
						变量 项目的最终路径 : 文本 = 项目的路径 + 其他_其他.读缓存("resource_editor_textures_path2")
						如果 复制文件(新的文件路径,项目的最终路径) 则
							//
							变量 模块_项目 : 模块_项目
							模块_项目.初始化()
							模块_项目.图标 = 项目的最终路径
							模块_项目.名称 = 取文件前缀名(项目的最终路径)
							模块_项目.标识符 = 取文件前缀名(项目的最终路径)
							模块_项目.描述 = "这个是资源包贴图"
							模块_项目.种类 = 模块_项目种类.资源包
							模块_项目.分类 = "icon"
							模块_项目.路径 = 项目的最终路径
							模块_项目.保存()
							//
							弹出成功提示("替换成功")
							最终提示.关闭()
						否则
							弹出错误提示("替换失败")
							最终提示.关闭()
						结束 如果
						返回 假
					结束 事件
				否则
					弹出警告提示("你选择的文件不是jpg或png格式")
				结束 如果
		结束 假如
	结束 事件


	//搜索
	方法 搜索(项目集合 : 文本集合,搜索内容 : 文本) : 文本集合
		结束集合.清空()
		循环(项目集合 -> 项目)
			如果 项目.到文本() ? 搜索内容 则
				结束集合.添加成员(项目)
			结束 如果
		结束 循环
		返回 结束集合
	结束 方法

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		编辑框1.背景颜色 = 0XFF333333
		退出界面.图片资源 = 编辑器_资源编辑器_纹理_资源.白色返回图标
		图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.白色菜单图标
		文本框2.字体颜色 = 0XFFFFFFFF
		线性布局5.背景颜色 = 0XFF222222
	结束 方法

结束 类

类 编辑器_资源编辑器_纹理_JSON编辑 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,水波纹效果=真,可获取焦点=真,图片资源="../../../../资源库/图标/back/default_backicon.png"]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216,内容="xxx.json"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/resource_editor/menu.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度=2]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,背景颜色=-1]])
	变量 代码框1 : 代码框

	//声明
	变量 设置_设定 : 设置_设定

	//变量

	事件 编辑器_资源编辑器_纹理_JSON编辑:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//设置标题
		文本框2.内容 = 取文件名(其他_其他.读缓存("resource_editor_textures_path_json2"))
		//设置内容
		代码框1.设置内容(读入文本文件(其他_其他.读缓存("resource_editor_textures_path_json2"),"utf-8"))
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
			代码框1.夜间模式 = 真
		结束 如果
		//设置背景
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("PersonalityBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(本对象,线性布局5,设置相关路径)
			结束 如果
		结束 如果
		//订阅事件
		订阅事件()
	结束 事件

	//菜单
	事件 线性布局7:被单击()
		变量 菜单A : DX菜单
		变量 菜单布局 : 编辑器_资源编辑器_纹理_JSON编辑菜单
		菜单A.依附组件(线性布局7)
		菜单A.依附位置(DX对齐方式.右)
		菜单A.自定义布局(菜单布局)
		菜单A.宽度(400)
		菜单A.高度(800)
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			菜单A.主题(DX主题.暗色)
			菜单布局.线性布局2.背景颜色 = 0XFF333333
			菜单布局.线性布局3.背景颜色 = 0XFF333333
			菜单布局.线性布局4.背景颜色 = 0XFF333333
			菜单布局.线性布局5.背景颜色 = 0XFF333333
			菜单布局.线性布局6.背景颜色 = 0XFF333333
			菜单布局.线性布局7.背景颜色 = 0XFF333333
			菜单布局.线性布局8.背景颜色 = 0XFF333333
			菜单布局.线性布局9.背景颜色 = 0XFF333333
			菜单布局.线性布局10.背景颜色 = 0XFF333333
			菜单布局.文本框1.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框2.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框3.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框4.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框5.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框6.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框7.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框8.字体颜色 = 0XFFFFFFFF
			菜单布局.文本框9.字体颜色 = 0XFFFFFFFF
		结束 如果
		菜单A.显示()
		//功能
		事件 菜单布局.线性布局2:被单击()
			//保存
			变量 项目的路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/" + "resource/textures/"
			变量 项目的最终路径 : 文本 = 项目的路径 + 其他_其他.读缓存("resource_editor_textures_path_json")
			写出文本文件(项目的最终路径,代码框1.获取内容())
			弹出成功提示("json 已被保存在项目中")
			菜单A.关闭()
			//项目记录
			变量 模块_项目 : 模块_项目
			模块_项目.初始化()
			模块_项目.assets图标 = "icon/item/json.png"
			模块_项目.名称 = 取文件前缀名(项目的最终路径)
			模块_项目.标识符 = 取文件前缀名(项目的最终路径)
			模块_项目.描述 = "这个是资源包JSON"
			模块_项目.种类 = 模块_项目种类.资源包
			模块_项目.分类 = "json"
			模块_项目.路径 = 项目的最终路径
			模块_项目.保存()
		结束 事件
		事件 菜单布局.线性布局3:被单击()
			代码框1.撤销()
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局4:被单击()
			代码框1.重做()
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局5:被单击()
			变量 json : JSON对象 = 代码框1.获取内容()
			代码框1.设置内容(json.到文本(0))
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局6:被单击()
			变量 json : JSON对象 = 代码框1.获取内容()
			代码框1.设置内容(json.到文本(4))
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局7:被单击()
			变量 当前文件名 : 文本 = 取文件名(其他_其他.读缓存("resource_editor_textures_path_json2"))
			写出文本文件(其他_变量.内部存储目录 + 当前文件名,代码框1.获取内容())
			弹出成功通知("已经被导出到: " + 其他_变量.内部存储目录 + 当前文件名)
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局8:被单击()
			分享操作.分享文本(本对象,代码框1.获取内容())
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局9:被单击()
			代码框1.转到行(1)
			菜单A.关闭()
		结束 事件
		事件 菜单布局.线性布局10:被单击()
			关闭窗口()
			菜单A.关闭()
		结束 事件

	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		退出界面.图片资源 = 编辑器_资源编辑器_纹理_资源.白色返回图标
		图片框1.图片资源 = 编辑器_资源编辑器_纹理_资源.白色菜单图标
		文本框2.字体颜色 = 0XFFFFFFFF
		线性布局5.背景颜色 = 0XFF222222
	结束 方法

	//退出界面
	事件 退出界面:被单击()
		关闭窗口()
	结束 事件

结束 类

类 编辑器_资源编辑器_纹理_列表 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=80,圆角=25,卡片阴影=0,@左外边距DP=5,@上外边距DP=5,@右外边距DP=5,@下外边距DP=5]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,对齐方式=17,纵向布局=真,背景颜色=-1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=40,高度DP=40]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,对齐方式=17,字体大小=12,@上外边距DP=3,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,对齐方式=17,字体大小=12,字体颜色=-16777216,可视=假]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,对齐方式=17,字体大小=11,可视=真,字体颜色=-15296769]])
	变量 文本框3 : 文本框

	//声明
	变量 设置_设定 : 设置_设定

	事件 编辑器_资源编辑器_纹理_列表:创建完毕()
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

类 编辑器_资源编辑器_纹理_菜单 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-2,纵向布局=真,水波纹效果=假]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/menu_refresh.xml"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,@左外边距DP=10,内容="刷新",字体大小=16,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/menu_magnify.xml"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=线性布局3,@左外边距DP=10,内容="搜索",字体大小=16,字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/menu_comfy.xml"]])
	变量 图片框3 : 图片框
	@布局配置([[父布局=线性布局4,@左外边距DP=10,内容="横屏模式",字体大小=16,字体颜色=-16777216]])
	变量 文本框3 : 文本框

结束 类

类 编辑器_资源编辑器_纹理_图片方式菜单 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-2,纵向布局=真,水波纹效果=假]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/picture/replace.xml"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,@左外边距DP=10,内容="替换图片",字体大小=16,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/picture/image_editor.xml"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=线性布局3,@左外边距DP=10,内容="修改图片",字体大小=16,字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627,背景颜色=-1,水波纹效果=真,可视=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=25,高度DP=25,@左外边距DP=10,图片资源="../../../../资源库/图标/editor/resource_editor/picture/image_editor.xml"]])
	变量 图片框3 : 图片框
	@布局配置([[父布局=线性布局4,@左外边距DP=10,内容="修改图片 +",字体大小=16,字体颜色=-16777216]])
	变量 文本框3 : 文本框

结束 类

类 编辑器_资源编辑器_纹理_JSON编辑菜单 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-2,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="保存",粗体=真]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="撤回"]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="恢复"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="压缩"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="格式化"]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="导出"]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="分享"]])
	变量 文本框7 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局9 : 线性布局
	@布局配置([[父布局=线性布局9,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="首行"]])
	变量 文本框8 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,水波纹效果=真,背景颜色=-1,对齐方式=8388627]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,@左外边距DP=10,字体大小=15,字体颜色=-16777216,内容="退出"]])
	变量 文本框9 : 文本框

结束 类

类 编辑器_资源编辑器_纹理_资源

	@静态
	变量 文件夹图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/folder.png"

	@静态
	变量 文件file_tga图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/file_tga.png"

	@静态
	变量 文件json图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/json.png"

	@静态
	变量 未知文件图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/no.png"

	@静态
	变量 白色返回图标 : 图片资源 =  "../../../../资源库/图标/back/default_backicon2.png"

	@静态
	变量 白色菜单图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu2.png"

	@静态
	变量 白色搜索图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu_magnify2.xml"

	@静态
	变量 白色刷新图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu_refresh2.xml"

	@静态
	变量 白色切换横屏图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu_comfy2.xml"

	@静态
	变量 白色图片替换图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/picture/replace2.xml"

	@静态
	变量 白色图片修改图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/picture/image_editor2.xml"

结束 类