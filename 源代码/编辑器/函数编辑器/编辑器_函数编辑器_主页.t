类 编辑器_函数编辑器_主页 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 侧滑布局1 : 侧滑布局
	@布局配置([[父布局=侧滑布局1,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 按钮布局文件 : 线性布局
	@布局配置([[父布局=按钮布局文件,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/code_editor/file_menu.xml"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,宽度DP=100,高度DP=50,对齐方式=8388627]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,内容="编辑",粗体=真,字体大小=16,@左外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局4,@左外边距DP=10,内容="0:0",字体大小=13]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度DP=40,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 按钮布局读写 : 线性布局
	@布局配置([[父布局=按钮布局读写,宽度DP=23,高度DP=23,图片资源="../../../../资源库/图标/editor/code_editor/write.xml"]])
	变量 图片框2 : 图片框
	@布局配置([[父布局=线性布局5,宽度DP=40,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 按钮布局撤销 : 线性布局
	@布局配置([[父布局=按钮布局撤销,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/editor/code_editor/undo.xml"]])
	变量 图片框4 : 图片框
	@布局配置([[父布局=线性布局5,宽度DP=40,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 按钮布局重做 : 线性布局
	@布局配置([[父布局=按钮布局重做,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/editor/code_editor/redo.xml"]])
	变量 图片框5 : 图片框
	@布局配置([[父布局=线性布局5,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真]])
	变量 按钮布局菜单 : 线性布局
	@布局配置([[父布局=按钮布局菜单,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/code_editor/menu.xml"]])
	变量 图片框6 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=1,可视=假]])
	变量 进度条1 : 进度条
	@布局配置([[父布局=线性布局1,宽度=-1,高度=1]])
	变量 文本框10 : 文本框
	@布局配置([[父布局=线性布局1,背景颜色=-1,@上外边距=0,宽度=-1,高度DP=45,显示滚动条=假,完全显示=假]])
	变量 横向滚动布局1 : 横向滚动布局
	@布局配置([[父布局=横向滚动布局1,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局快捷栏列表 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 线性布局12 : 线性布局
	@布局配置([[父布局=线性布局12,宽度=-1,高度=-1]])
	变量 相对布局01 : 相对布局
	@布局配置([[父布局=相对布局01,宽度=-1,高度=-1]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-1]])
	变量 CodeEditorView1 : CodeEditorView
	@布局配置([[父布局=相对布局01,宽度=-1,高度=-1]])
	变量 CodeAutoPanelView1 : CodeAutoPanelView
	@布局配置([[父布局=相对布局01,宽度=-1,高度=-1,对齐方式=17,纵向布局=真,可视=假]])
	变量 线性布局开始页 : 线性布局
	@布局配置([[父布局=线性布局开始页,字体大小=16,粗体=真,内容="Function Editor",对齐方式=17,字体颜色=-16777216]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局开始页,@上外边距DP=8,字体颜色=-14510849,内容="右滑 打开文件列表",字体大小=13,对齐方式=17]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局开始页,@上外边距DP=5,字体颜色=-14510849,内容="左上角 打开菜单",字体大小=13,对齐方式=17]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=相对布局01,宽度=-1,高度=-1,对齐方式=17,纵向布局=真,可视=假]])
	变量 线性布局未打开任何文件 : 线性布局
	@布局配置([[父布局=线性布局未打开任何文件,字体大小=16,粗体=真,内容="未打开任何文件！",对齐方式=17,字体颜色=-16777216]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局未打开任何文件,@上外边距DP=8,字体颜色=-14510849,内容="No files are open!",字体大小=13,对齐方式=17]])
	变量 文本框7 : 文本框
	@布局配置([[父布局=线性布局未打开任何文件,@上外边距DP=5,字体颜色=-14510849,内容="如有问题或者意见请提交给官方",字体大小=13,对齐方式=17]])
	变量 文本框11 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=81,可视=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度=-1,高度=-2,纵向布局=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,纵向布局=真,对齐方式=17,背景颜色=-1,可视=真]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,宽度=-1,高度DP=40,可视=假]])
	变量 相对布局3 : 相对布局
	@布局配置([[父布局=相对布局3,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,@左外边距DP=0,左内边距DP=5,右内边距DP=5,宽度=-1,高度=-1,背景颜色=16777215,字体大小=15,@右外边距DP=80]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=相对布局3,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局11 : 线性布局
	@布局配置([[父布局=线性布局11,宽度DP=40,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局13 : 线性布局
	@布局配置([[父布局=线性布局13,宽度DP=24,高度DP=24,图片资源="../../../../资源库/图标/editor/code_editor/find_replace/up.xml"]])
	变量 图片框9 : 图片框
	@布局配置([[父布局=线性布局11,宽度DP=40,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局14 : 线性布局
	@布局配置([[父布局=线性布局14,宽度DP=24,高度DP=24,图片资源="../../../../资源库/图标/editor/code_editor/find_replace/down.xml"]])
	变量 图片框10 : 图片框
	@布局配置([[父布局=线性布局8,宽度=-1,高度DP=40,可视=假]])
	变量 相对布局4 : 相对布局
	@布局配置([[父布局=相对布局4,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局15 : 线性布局
	@布局配置([[父布局=线性布局15,左内边距DP=5,右内边距DP=5,宽度=-1,高度=-1,背景颜色=16777215,字体大小=15,@右外边距DP=100]])
	变量 编辑框2 : 编辑框
	@布局配置([[父布局=相对布局4,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局16 : 线性布局
	@布局配置([[父布局=线性布局16,宽度DP=50,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局17 : 线性布局
	@布局配置([[父布局=线性布局17,内容="替换",字体颜色=-16777216,字体大小=14]])
	变量 文本框8 : 文本框
	@布局配置([[父布局=线性布局16,宽度DP=50,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局18 : 线性布局
	@布局配置([[父布局=线性布局18,内容="全部",字体颜色=-16777216,字体大小=14]])
	变量 文本框9 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度DP=30,显示滚动条=假,完全显示=假,背景颜色=-1]])
	变量 横向滚动布局2 : 横向滚动布局
	@布局配置([[父布局=横向滚动布局2,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局符号栏 : 线性布局

	//声明
	变量 代码补全 : 编辑器_函数编辑器_补全
	变量 符号栏 : 编辑器_函数编辑器_符号栏
	变量 菜单板 : 编辑器_函数编辑器_菜单
	变量 模块组 : 编辑器_函数编辑器_文件模块
	变量 快捷栏 : 编辑器_函数编辑器_快捷栏
	变量 主题 : 编辑器_函数编辑器_主题
	变量 API : 编辑器_函数编辑器_API
	变量 编辑器 : 编辑器_函数编辑器_编辑器
	变量 辅助 : 编辑器_函数编辑器_辅助
	变量 设置组 : 编辑器_函数编辑器_设置

	变量 设置_设定 : 设置_设定

	变量 侧滑文件布局 : 编辑器_函数编辑器_文件

	//变量
	变量 查看或编辑 : 逻辑型 = 假
	变量 查找功能 : 逻辑型 = 假
	变量 替换功能 : 逻辑型 = 假

	变量 活动路径PATH : 文本 = ""

	变量 自动保存 : 逻辑型 = 真

	事件 编辑器_函数编辑器_主页:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
		//窗口切换动画
		播放默认切换动画(2)
		//初始化侧滑布局
		侧滑布局1.左侧布局 = 侧滑文件布局
		//加载符号栏
		变量 符号栏内容 = 设置_设定.获取文本("FunctionEditorSymbolBar")
		符号栏.加载(符号栏内容,线性布局符号栏,CodeEditorView1,本对象)
		//进行初始化
		初始化()
		//加载工具栏
		工具栏()
		//加载事件
		菜单事件()
	结束 事件

	方法 初始化()
		//设置启动页
		打开文件界面显示(0)
		//设置补全
		如果 设置_设定.获取开关("FunctionEditorAutocomplete") 则
			CodeAutoPanelView1.设置窗口(本对象)
			CodeAutoPanelView1.设置环境(本对象)
			CodeAutoPanelView1.设置代码框(CodeEditorView1)
			代码补全.设置代码补全视图(CodeAutoPanelView1)
		结束 如果
		//加载代码编辑器设置
		自动保存 = 设置_设定.获取开关("FunctionEditorAutoSave")
		设置组.代码编辑器设置(本对象,CodeEditorView1)
		//实时获取行数光标位置
		变量 计时器 : 倒计时器
		计时器.开始倒计时(1000l,500l)
		事件 计时器:倒计时结束()
			变量 当前行的位置 : 整数 = CodeEditorView1.获取当前行的位置 + 1
			变量 当前行光标的位置 : 整数 = CodeEditorView1.获取当前行的光标位置 + 1
			文本框2.内容 = 当前行的位置.到文本() + ":" + 当前行光标的位置.到文本()
			计时器.开始倒计时(1000l,500l)
		结束 事件
		//加载文件系统
		变量 主路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/behaviour/functions"
		如果 文件是否存在(主路径) 则
			文件系统()
		否则
			写出文本文件(主路径 + "/null","")
			删除文件(主路径 + "/null")
			文件系统()
		结束 如果
		//加载快捷栏
		快捷栏.设置环境(本对象)
		快捷栏.设置列表(线性布局快捷栏列表)
		事件 快捷栏:被点击(路径 : 文本)
			//打开文件
			打开文件(路径)
		结束 事件
		事件 快捷栏:被长按(路径 : 文本)
			//打开界面
			打开文件界面显示(2)
			//
			快捷栏.删除(路径)
			快捷栏.加载()
		结束 事件
		快捷栏.添加("主页")
		快捷栏.加载()
	结束 方法

	//上方工具栏
	方法 工具栏()
		//文件侧滑栏
		事件 按钮布局文件:被单击()
			//打开侧滑栏
			侧滑布局1.打开左侧滑栏()
		结束 事件
		//查看或编辑
		事件 按钮布局读写:被单击()
			如果 查看或编辑 则
				查看或编辑 = 假
				CodeEditorView1.可以编辑(真)
				如果 设置_设定.获取开关("NightMode") 则
					图片框2.图片资源 = 编辑器_函数编辑器_资源.编辑白色图片
				否则
					图片框2.图片资源 = 编辑器_函数编辑器_资源.编辑
				结束 如果
			否则
				查看或编辑 = 真
				CodeEditorView1.可以编辑(假)
				如果 设置_设定.获取开关("NightMode") 则
					图片框2.图片资源 = 编辑器_函数编辑器_资源.查看白色图片
				否则
					图片框2.图片资源 = 编辑器_函数编辑器_资源.查看
				结束 如果
			结束 如果
		结束 事件
		//撤销
		事件 按钮布局撤销:被单击()
			CodeEditorView1.撤销()
		结束 事件
		//重做
		事件 按钮布局重做:被单击()
			CodeEditorView1.重做()
		结束 事件
		//菜单
		事件 按钮布局菜单:被单击()
			菜单板.设置环境名(本对象)
			菜单板.设置代码框(CodeEditorView1)
			菜单板.设置位置(按钮布局菜单)
			菜单板.菜单()
		结束 事件
	结束 方法

	//执行菜单的一些事件
	方法 菜单事件()
		//保存
		事件 菜单板:主菜单_保存()
			保存文件()
		结束 事件
		//查找
		事件 菜单板:主菜单_查找()
			文本查找()
		结束 事件
		//替换
		事件 菜单板:主菜单_替换()
			文本替换()
		结束 事件
		//API
		事件 菜单板:主菜单_API()
			API.菜单()
		结束 事件
		//编辑器
		事件 菜单板:主菜单_编辑器()
			编辑器.设置窗口名(本对象)
			编辑器.设置环境名(本对象)
			编辑器.设置位置(按钮布局菜单)
			编辑器.菜单()
		结束 事件
		//编辑器调用
		事件 菜单板:主菜单_编辑器调用()
			编辑器.调用()
		结束 事件
		//辅助
		事件 菜单板:主菜单_辅助()
			辅助.设置环境名(本对象)
			辅助.设置位置(按钮布局菜单)
			辅助.设置代码框(CodeEditorView1)
			辅助.菜单()
		结束 事件
	结束 方法

	//文本查找
	变量 文本查找锁 : 逻辑型 = 真
	方法 文本查找()
		//设置样式
		如果 设置_设定.获取开关("NightMode") 则
			置圆角边框2(相对布局3,1,0XFF222222,0)
		否则
			置圆角边框2(相对布局3,1,0XFFBEC0C1,0)
		结束 如果
		//显示
		如果 查找功能 则
			CodeEditorView1.搜索文本_停止()
			查找功能 = 假
			相对布局3.可视 = 假
		否则
			查找功能 = 真
			相对布局3.可视 = 真
		结束 如果
		//编辑框
		事件 编辑框1:内容被改变()
			如果 编辑框1.内容 == "" 则
				文本查找锁 = 真
			否则
				文本查找锁 = 假
				CodeEditorView1.搜索文本(编辑框1.内容)
			结束 如果
		结束 事件
		//上一个
		事件 线性布局13:被单击()
			如果 文本查找锁 则
			否则
				CodeEditorView1.搜索文本_上一个()
			结束 如果
		结束 事件
		//下一个
		事件 线性布局14:被单击()
			如果 文本查找锁 则
			否则
				CodeEditorView1.搜索文本_下一个()
			结束 如果
		结束 事件
	结束 方法

	//文本替换()
	方法 文本替换()
		//设置样式
		如果 设置_设定.获取开关("NightMode") 则
			置圆角边框2(相对布局3,1,0XFF222222,0)
		否则
			置圆角边框2(相对布局3,1,0XFFBEC0C1,0)
		结束 如果
		//显示
		如果 替换功能 则
			替换功能 = 假
			相对布局4.可视 = 假
		否则
			替换功能 = 真
			相对布局4.可视 = 真
		结束 如果
		//替换
		事件 线性布局17:被单击()
			如果 相对布局3.可视 则
				如果 编辑框1.内容 == "" 则
				否则
					CodeEditorView1.搜索文本_替换(编辑框2.内容)
				结束 如果
			结束 如果
		结束 事件
		//全部替换
		事件 线性布局18:被单击()
			如果 相对布局3.可视 则
				如果 编辑框1.内容 == "" 则
				否则
					CodeEditorView1.搜索文本_全部替换(编辑框2.内容)
				结束 如果
			结束 如果
		结束 事件
	结束 方法

	//返回键被触发
	@虚拟方法
	方法 返回键被按下()
		//关闭已打开的搜索替换功能
		如果 查找功能 则
			CodeEditorView1.搜索文本_停止()
			查找功能 = 假
			相对布局3.可视 = 假
		否则 相对布局4.可视
			替换功能 = 假
			相对布局4.可视 = 假
		否则
			关闭窗口()
		结束 如果
	结束 方法

	//加载文件相关系统
	方法 文件系统()
		//设置文件组
		变量 路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/behaviour/functions"
		模块组.设置路径输出(侧滑文件布局.文本框4)
		模块组.设置列表框(侧滑文件布局.自定义列表框1)
		模块组.设置路径(路径,路径)
		模块组.编辑框搜索(侧滑文件布局.编辑框1)
		模块组.文件列表()
		//上一级
		事件 侧滑文件布局.线性布局上一级:被单击()
			模块组.返回上一级()
		结束 事件
		//创建
		事件 侧滑文件布局.线性布局10:被单击()
			模块组.新建()
		结束 事件
		//列表被点击
		事件 模块组:文件被点击(路径 : 文本)
			//添加进快捷栏
			快捷栏.添加(路径)
			快捷栏.加载()
			//打开文件
			打开文件(路径)
		结束 事件
	结束 方法

	//打开文件界面显示
	方法 打开文件界面显示(类型 : 整数)
		CodeEditorView1.可视 = 假
		线性布局开始页.可视 = 假
		线性布局未打开任何文件.可视 = 假
		假如 类型
			是 0
				线性布局开始页.可视 = 真
				横向滚动布局2.可视 = 假
			是 1
				CodeEditorView1.可视 = 真
				横向滚动布局2.可视 = 真
				快捷栏.删除("主页")
				快捷栏.加载()
			是 2
				//显示视图
				线性布局未打开任何文件.可视 = 真
				//关闭符号栏
				横向滚动布局2.可视 = 假
				//关闭正在查找或者替换的功能框
				CodeEditorView1.搜索文本_停止()
				查找功能 = 假
				相对布局3.可视 = 假
				替换功能 = 假
				相对布局4.可视 = 假
		结束 假如
	结束 方法

	//打开文件
	方法 打开文件(路径 : 文本)
		如果 文件是否存在(路径) 则
			如果 取文件后缀名(路径).到小写() == "mcfunction" 则
				//自动保存
				如果 自动保存 则
					保存文件()
				结束 如果
				//设置主题
				主题.设置主题(CodeEditorView1)
				//打开文件界面显示
				打开文件界面显示(1)
				//关闭侧滑栏
				侧滑布局1.关闭所有侧滑栏()
				//
				活动路径PATH = 路径
				变量 文件内容 : 文本 = 读入文本文件(路径)
				CodeEditorView1.设置语言(CodeEditorView_Language.McFunction)
				CodeEditorView1.设置文本(文件内容)
			否则
			结束 如果
		否则
			弹出警告提示("文件不存在！")
		结束 如果
	结束 方法

	//保存文件
	方法 保存文件()
		如果 文件是否存在(活动路径PATH) 则
			写出文本文件(活动路径PATH,CodeEditorView1.获取文本())
		结束 如果
	结束 方法

	//加载夜间模式 
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		图片框1.图片资源 = 编辑器_函数编辑器_资源.文件菜单白色图片
		图片框2.图片资源 = 编辑器_函数编辑器_资源.编辑白色图片
		图片框4.图片资源 = 编辑器_函数编辑器_资源.撤销白色图片
		图片框5.图片资源 = 编辑器_函数编辑器_资源.重做白色图片
		图片框6.图片资源 = 编辑器_函数编辑器_资源.菜单白色图片
		图片框9.图片资源 = 编辑器_函数编辑器_资源.查找上一个白色图片
		图片框10.图片资源 = 编辑器_函数编辑器_资源.查找下一个白色图片
		相对布局2.背景颜色 = 0XFF333333
		文本框10.背景颜色 = 0XFF222222
		线性布局8.背景颜色 = 0XFF333333
		文本框8.字体颜色 =  0XFFFFFFFF
		文本框9.字体颜色 = 0XFFFFFFFF
		编辑框1.字体颜色 = 0XFFFFFFFF
		编辑框1.提示文本颜色 = 0XFF989898
		编辑框2.字体颜色 = 0XFFFFFFFF
		编辑框2.提示文本颜色 = 0XFF989898
		横向滚动布局1.背景颜色 = 0XFF333333
		文本框3.字体颜色 = 0XFFFFFFFF
		文本框4.字体颜色 = 0XFFFFFFFF
		文本框5.字体颜色 = 0XFFFFFFFF
		文本框6.字体颜色 = 0XFFFFFFFF
		线性布局开始页.背景颜色 = 0XFF333333
		文本框7.字体颜色 = 0XFFFFFFFF
		线性布局未打开任何文件.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
		文本框2.字体颜色 = 0XFFA2A2A2
		横向滚动布局2.背景颜色 = 0XFF333333
	结束 方法

结束 类