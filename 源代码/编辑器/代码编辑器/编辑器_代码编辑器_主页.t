类 编辑器_代码编辑器_主页 : 窗口

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
	变量 按钮布局运行 : 线性布局
	@布局配置([[父布局=按钮布局运行,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/editor/code_editor/run.xml"]])
	变量 图片框3 : 图片框
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
	@布局配置([[父布局=线性布局12,宽度=-1,高度=-1,可视=假]])
	变量 CodeEditorView1 : CodeEditorView
	@布局配置([[父布局=线性布局12,宽度=-1,高度=-1,背景颜色=-1,对齐方式=49,纵向布局=真,可视=假]])
	变量 线性布局开始页 : 线性布局
	@布局配置([[父布局=线性布局开始页,宽度DP=120,高度DP=120,@上外边距DP=100,图片资源="../../../../资源库/图标/icon.png"]])
	变量 图片框7 : 图片框
	@布局配置([[父布局=线性布局开始页,宽度=-1,高度=-2,纵向布局=真,对齐方式=17,@上外边距DP=150]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,对齐方式=17,字体颜色=-16777216,字体大小=17,内容="点击左上角菜单打开文件管理器"]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局6,对齐方式=17,字体颜色=-16777216,字体大小=17,@上外边距DP=8,内容="点击右上角菜单可进行不同的操作"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局6,对齐方式=17,字体颜色=-16777216,字体大小=17,@上外边距DP=8,内容="上方功能栏对代码编辑器的操作"]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=线性布局6,对齐方式=17,字体颜色=-16777216,字体大小=17,@上外边距DP=8,内容="编辑器支持多种语言，高性能"]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局12,宽度=-1,高度=-1,背景颜色=-1,对齐方式=49,纵向布局=真,可视=假]])
	变量 线性布局未打开任何文件 : 线性布局
	@布局配置([[父布局=线性布局未打开任何文件,宽度DP=200,高度DP=200,@上外边距DP=150,图片资源="../../../../资源库/图标/editor/code_editor/no_open_file.png"]])
	变量 图片框8 : 图片框
	@布局配置([[父布局=线性布局未打开任何文件,@上外边距DP=20,字体大小=16,内容="没有打开文件",对齐方式=17]])
	变量 文本框7 : 文本框
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
	@布局配置([[父布局=线性布局3,宽度=-1,高度DP=35,显示滚动条=假,完全显示=假,背景颜色=-1]])
	变量 横向滚动布局2 : 横向滚动布局
	@布局配置([[父布局=横向滚动布局2,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局符号栏 : 线性布局


	//声明
	变量 设置_设定 : 设置_设定
	变量 模块 : 编辑器_代码编辑器_模块
	变量 文件菜单 : 编辑器_代码编辑器_文件菜单
	变量 主菜单 : 编辑器_代码编辑器_菜单
	变量 符号栏 : 编辑器_代码编辑器_符号栏
	变量 打开代码 : 编辑器_代码编辑器_打开代码
	//变量
	变量 列表集合 : 文本集合
	变量 结束集合 : 文本集合
	变量 列表集合数量 : 文本集合
	变量 侧滑文件布局 : 编辑器_代码编辑器_文件

	变量 项目路径 : 文本
	变量 活动路径 : 文本
	变量 当前路径 : 文本
	变量 快捷栏路径 : 文本
	变量 当前快捷栏路径 : 文本

	变量 保存锁 : 逻辑型 = 真
	变量 查看或编辑 : 逻辑型 = 假
	变量 查找功能 : 逻辑型 = 假
	变量 替换功能 : 逻辑型 = 假

	//自动保存相关
	变量 自动保存 : 逻辑型 = 真
	变量 自动保存2 : 逻辑型 = 假
	变量 显示自动保存倒计时 : 逻辑型 = 真

	事件 编辑器_代码编辑器_主页:创建完毕()
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
		//加载文件
		变量 主路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName")
		快捷栏路径 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/data/code/SymbolBar/"
		//是否清除快捷栏
		如果 设置_设定.获取开关("CodeEditorFileShortcutBar") 则
		否则
			删除文件(快捷栏路径)
		结束 如果
		//加载文件系统
		项目路径 = 主路径
		文件快捷栏()
		加载列表(主路径)
		//设置自动保存相关设置
		自动保存 = 设置_设定.获取开关("CodeEditorAutoSave")
		自动保存2 = 设置_设定.获取开关("CodeEditorAutoSave2")
		显示自动保存倒计时 = 设置_设定.获取开关("CodeEditorAutoSaveDisplayCountdown")
		//加载符号栏
		变量 符号栏内容 : 文本 = 设置_设定.获取文本("CodeEditorSymbolBar")
		符号栏.加载(符号栏内容,线性布局符号栏,CodeEditorView1,本对象)
		//加载方法
		代码编辑器设置()
		打开文件界面显示(0)
		获取行数光标位置()
		工具栏()
		自动保存()
		//自动打开文件
		如果 文件是否存在(快捷栏路径 + "open_record") 则
			变量 打开文件路径 : 文本 = 读入文本文件(快捷栏路径 + "open_record")
			如果 文件是否存在(打开文件路径) 则
				打开文件(打开文件路径)
			结束 如果
		结束 如果
		//订阅事件
		订阅事件()
	结束 事件

	//设置编辑器的相关设置
	方法 代码编辑器设置()
		//基础
		CodeEditorView1.设置自动换行(设置_设定.获取开关("CodeEditorWordwrap"))
		CodeEditorView1.设置自动补全(设置_设定.获取开关("CodeEditorAutocomplete"))
		//字体
		如果 设置_设定.获取文本("CodeEditorTypeface") == "f1" 则
			CodeEditorView1.设置字体("font/JetBrainsMono-Regular.ttf",假)
			CodeEditorView1.设置行号字体("font/JetBrainsMono-Regular.ttf",假)
		否则 设置_设定.获取文本("CodeEditorTypeface") == "f2"
			CodeEditorView1.设置字体("font/consolas.ttf",假)
			CodeEditorView1.设置行号字体("font/consolas.ttf",假)
		否则
			如果 设置_设定.获取文本("CodeEditorTypeface").替换(" ","") == "" 则
			否则
				如果 文件是否存在(设置_设定.获取文本("CodeEditorTypeface")) 则
					CodeEditorView1.设置字体(设置_设定.获取文本("CodeEditorTypeface"))
					CodeEditorView1.设置行号字体(设置_设定.获取文本("CodeEditorTypeface"))
				结束 如果
			结束 如果	
		结束 如果
		//编辑器背景图片
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("CodeEditorBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(本对象,CodeEditorView1,设置相关路径)
			结束 如果
		结束 如果
		//加载其他设置
		CodeEditorView1.设置放大镜(设置_设定.获取开关("CodeEditorOtherMagnifierEnabled"))
		CodeEditorView1.设置行号固定(设置_设定.获取开关("CodeEditorOtherPinLineNumber"))
		CodeEditorView1.设置第一个行号始终可见(设置_设定.获取开关("CodeEditorOtherFirstLineNumberAlwaysVisible"))
		如果 设置_设定.获取文本("CodeEditorOtherCursorBlinkPeriod") == "" 则
		否则
			CodeEditorView1.设置光标闪烁周期(设置_设定.获取整数("CodeEditorOtherCursorBlinkPeriod"))
		结束 如果
		CodeEditorView1.设置全部全屏(设置_设定.获取开关("CodeEditorOtherAllowFullscreen"))
		CodeEditorView1.设置类型连字(设置_设定.获取开关("CodeEditorOtherLigatureEnabled"))
		CodeEditorView1.设置高亮显示当前块(设置_设定.获取开关("CodeEditorOtherHighlightCurrentBlock"))
		CodeEditorView1.设置高亮显示当前行(设置_设定.获取开关("CodeEditorOtherHighlightCurrentLine"))
		如果 设置_设定.获取文本("CodeEditorOtherBlockLineWidth") == "" 则
		否则
			CodeEditorView1.设置块线宽(设置_设定.获取文本("CodeEditorOtherBlockLineWidth").到单精度小数())
		结束 如果
		CodeEditorView1.设置光标动画(设置_设定.获取开关("CodeEditorOtherCursorAnimationEnabled"))
		CodeEditorView1.设置滚动条(设置_设定.获取开关("CodeEditorOtherScrollBarEnabled"))
		CodeEditorView1.设置滚动显示行号面板(设置_设定.获取开关("CodeEditorOtherDisplayLnPanel"))
		CodeEditorView1.设置滚动行号前提示(设置_设定.获取文本("CodeEditorOtherLnTip"))
		CodeEditorView1.设置自动缩进(设置_设定.获取开关("CodeEditorOtherAutoIndentEnabled"))
		如果 设置_设定.获取文本("CodeEditorOtherTextSize") == "" 则
		否则
			CodeEditorView1.设置字体大小(设置_设定.获取文本("CodeEditorOtherTextSize").到单精度小数())
		结束 如果
		CodeEditorView1.设置硬件加速绘制(设置_设定.获取开关("CodeEditorOtherHardwareAcceleratedDrawAllowed"))
		CodeEditorView1.设置行信息文本(设置_设定.获取开关("CodeEditorOtherVerticalScrollBarEnabled"))
		CodeEditorView1.设置撰写时设置自动完成(设置_设定.获取开关("CodeEditorOtherAutoCompletionOnComposing"))
		如果 设置_设定.获取文本("CodeEditorOtherNonPrintablePaintingFlags") == "" 则
		否则
			CodeEditorView1.设置不可打印的绘画标志(设置_设定.获取文本("CodeEditorOtherNonPrintablePaintingFlags").到整数())
		结束 如果
		CodeEditorView1.设置高亮显示选定文本(设置_设定.获取开关("CodeEditorOtherHighlightSelectedText"))
		如果 设置_设定.获取文本("CodeEditorOtherTabWidth") == "" 则
		否则
			CodeEditorView1.设置制表符宽度(设置_设定.获取文本("CodeEditorOtherTabWidth").到整数())
		结束 如果
		CodeEditorView1.设置是否拖动(设置_设定.获取开关("CodeEditorOtherDrag"))
		如果 设置_设定.获取文本("CodeEditorOtherDividerMargin") == "" 则
		否则
			CodeEditorView1.设置分隔线边距(设置_设定.获取文本("CodeEditorOtherDividerMargin").到单精度小数())
		结束 如果
		如果 设置_设定.获取文本("CodeEditorOtherDividerWidth") == "" 则
		否则
			CodeEditorView1.设置分隔线宽度(设置_设定.获取文本("CodeEditorOtherDividerWidth").到单精度小数())
		结束 如果
		如果 设置_设定.获取文本("CodeEditorOtherCursorWidth") == "" 则
		否则
			CodeEditorView1.设置光标宽度(设置_设定.获取文本("CodeEditorOtherCursorWidth").到单精度小数())
		结束 如果
		CodeEditorView1.设置可缩放(设置_设定.获取开关("CodeEditorOtherScalable"))
		CodeEditorView1.设置代码块线已启用(设置_设定.获取开关("CodeEditorOtherBlockLineEnabled"))
	结束 方法

	/*
	窗口被重新启动时触发该事件
	*/
	事件 编辑器_代码编辑器_主页:被重新启动()
		//重新初始化符号栏
		符号栏.刷新()
	结束 事件

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

	//顶部工具栏
	方法 工具栏()
		//文件列表
		事件 按钮布局文件:被单击()
			//打开侧滑栏
			侧滑布局1.打开左侧滑栏()
			//编辑框搜索
			事件 侧滑文件布局.编辑框1:内容被改变()
				列表集合 = 文件列表搜索(文件操作.取子文件集合(活动路径),侧滑文件布局.编辑框1.内容)
				侧滑文件布局.自定义列表框1.更新项目(列表集合.长度)
			结束 事件
			//线性布局上一级
			事件 侧滑文件布局.线性布局上一级:被单击()
				如果 活动路径 == 项目路径 则
				否则
					变量 wj : 文件 = 活动路径
					变量 flj : 文本 = wj.取父目录路径()
					加载列表(flj,真)
				结束 如果
			结束 事件
			//线性布局创建
			事件 侧滑文件布局.线性布局创建:被单击()
				文件菜单.菜单(侧滑文件布局.线性布局创建,活动路径,本对象)
				//菜单事件
				事件 文件菜单:刷新或成功事件(返回信息 : 文本,返回类型 : 整数=1)
					如果 返回类型 == 1 则
						弹出成功提示(返回信息)
					否则 返回类型 == 0
						弹出错误提示(返回信息)
					结束 如果
					加载列表(活动路径,真)
				结束 事件
			结束 事件
		结束 事件
		//查看或编辑
		事件 按钮布局读写:被单击()
			如果 查看或编辑 则
				查看或编辑 = 假
				CodeEditorView1.可以编辑(真)
				如果 设置_设定.获取开关("NightMode") 则
					图片框2.图片资源 = 编辑器_代码编辑器_资源.编辑白色图片
				否则
					图片框2.图片资源 = 编辑器_代码编辑器_资源.编辑
				结束 如果
			否则
				查看或编辑 = 真
				CodeEditorView1.可以编辑(假)
				如果 设置_设定.获取开关("NightMode") 则
					图片框2.图片资源 = 编辑器_代码编辑器_资源.查看白色图片
				否则
					图片框2.图片资源 = 编辑器_代码编辑器_资源.查看
				结束 如果
			结束 如果
		结束 事件
		//运行
		事件 按钮布局运行:被单击()

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
			主菜单.路径 = 当前路径
			主菜单.菜单(按钮布局菜单,本对象,CodeEditorView1)
			//保存
			事件 主菜单:保存()
				保存文件(当前路径)
			结束 事件
			//查找
			事件 主菜单:查找()
				如果 CodeEditorView1.可视 则
					文本查找()
				结束 如果
			结束 事件
			//替换
			事件 主菜单:替换()
				如果 CodeEditorView1.可视 则
					文本替换()
				结束 如果
			结束 事件
		结束 事件
	结束 方法

	//实时获取行数光标位置
	方法 获取行数光标位置()
		变量 计时器 : 倒计时器
		计时器.开始倒计时(1000l,500l)
		事件 计时器:倒计时结束()
			//获取行数光标位置
			变量 当前行的位置 : 整数 = CodeEditorView1.获取当前行的位置 + 1
			变量 当前行光标的位置 : 整数 = CodeEditorView1.获取当前行的光标位置 + 1
			文本框2.内容 = 当前行的位置.到文本() + ":" + 当前行光标的位置.到文本()
			计时器.开始倒计时(1000l,500l)
		结束 事件
	结束 方法

	//加载文件快捷栏
	方法 文件快捷栏()
		如果 文件是否存在(快捷栏路径) 则
			变量 文件快捷栏 : 文本集合 = 文件操作.取子文件集合(快捷栏路径)
			线性布局快捷栏列表.移除所有组件()
			循环(i, 0, 文件快捷栏.长度)
				//添加进列表里
				变量 快捷栏 : 编辑器_代码编辑器_快捷栏
				快捷栏.标题 = 取文件名(文件快捷栏[i])
				快捷栏.标记2 = 读入文本文件(快捷栏路径 + 取文件名(文件快捷栏[i]))
				线性布局快捷栏列表.添加组件(快捷栏)
				//隐藏系统打开记录
				如果 取文件名(文件快捷栏[i]) == "open_record" 则
					线性布局快捷栏列表.移除组件2(i)
				结束 如果
				//打开文件快捷选项
				事件 快捷栏:列表被点击()
					变量 文本文件路径 : 文本 = 快捷栏.标记2
					//校验是否为文本或者代码文件
					如果 打开代码.校验(文本文件路径) 则
						//是否自动保存
						如果 自动保存 则
							保存文件(当前路径,假)
						结束 如果
					结束 如果
					//打开文件
					打开文件(文本文件路径)
				结束 事件
				//关闭文件快捷选项
				事件 快捷栏:关闭被点击()
					变量 快捷文件路径 : 文本 = 快捷栏路径 + 快捷栏.标题
					变量 文本文件路径 : 文本 = 快捷栏.标记2
					如果 文件是否存在(快捷文件路径) 则
						如果 删除文件(快捷文件路径) 则
							如果 文本文件路径 == 当前路径 则
								保存锁 = 真
								打开文件界面显示(2)
								CodeEditorView1.设置文本("未打开任何文件！")
								CodeEditorView1.设置语言(CodeEditorView_Language.null)
								写出文本文件(快捷栏路径 + "open_record","")
							结束 如果
							文件快捷栏()
						否则
							弹出错误提示("文件快捷删除失败！")
						结束 如果
					否则
						文件快捷栏()
					结束 如果
				结束 事件
			结束 循环
		否则
			写出文本文件(快捷栏路径 + "null","")
			删除文件(快捷栏路径 + "null")
			文件快捷栏()
		结束 如果
	结束 方法

	//添加进文件快捷栏
	方法 添加文件快捷栏(路径 : 文本)
		//重新初始化符号栏
		符号栏.刷新()
		//快捷栏
		变量 输出路径 : 文本 = 快捷栏路径 + 取文件名(路径)
		写出文本文件(输出路径,路径)
		写出文本文件(快捷栏路径 + "open_record",路径)
		文件快捷栏()
	结束 方法

	//加载列表
	方法 加载列表(路径 : 文本,刷新 : 逻辑型 = 假)
		活动路径 = 路径
		如果 刷新 则
			列表集合 = 文件操作.取子文件集合(活动路径)
			侧滑文件布局.自定义列表框1.更新项目(列表集合.长度)
		否则
			//加载自定义列表
			事件 侧滑文件布局.自定义列表框1:加载布局(索引 : 整数,项目布局 : 组件容器) : 组件容器
				变量 布局 : 编辑器_代码编辑器_文件列表?
				如果 项目布局 == 空 则
					布局 = 创建 编辑器_代码编辑器_文件列表
				否则
					布局 = 项目布局
				结束 如果
				//显示到列表
				变量 文件路径 : 文本 = 列表集合[索引]
				//设置布局内容
				如果 是否为目录(文件路径) 则
					布局.图片框1.图片资源 = 编辑器_代码编辑器_资源.文件夹
					布局.文本框1.内容 = 取文件名(文件路径)
					列表集合数量 = 文件操作.取子文件集合(文件路径)
					布局.文本框2.内容 = 取文件修改时间(文件路径) + " - " + 列表集合数量.长度 + "项"
				否则
					模块.文件列表类型图标(布局.图片框1,文件路径)
					布局.文本框1.内容 = 取文件名(文件路径)
					布局.文本框2.内容 = 取文件修改时间(文件路径) + " - " + 其他_转换.转换文件大小(取文件大小(文件路径))
				结束 如果
				//列表被点击
				事件 布局.线性布局1:被单击()
					如果 是否为目录(文件路径) 则
						加载列表(文件路径,真)
					否则
						//校验是否为文本或者代码文件
						如果 打开代码.校验(文件路径) 则
							//是否自动保存
							如果 自动保存 则
								保存文件(当前路径,假)
							结束 如果
						结束 如果
						打开文件(文件路径)
					结束 如果
				结束 事件	
				//列表被长按
				事件 布局.线性布局1:被长按()
					项目被长按(文件路径,布局.线性布局1)
				结束 事件	
				返回 布局
			结束 事件
			列表集合 = 文件操作.取子文件集合(活动路径)
			侧滑文件布局.自定义列表框1.更新项目(列表集合.长度)
		结束 如果
	结束 方法

	//项目被长按
	方法 项目被长按(路径 : 文本,布局 : 线性布局)
		//打开菜单
		文件菜单.列表菜单(布局,路径,本对象)
		//菜单事件
		事件 文件菜单:刷新或成功事件(返回信息 : 文本,返回类型 : 整数=1)
			加载列表(活动路径,真)
		结束 事件
	结束 方法

	//通过间隔时间来进行自动保存
	方法 自动保存()
		变量 计时器 : 倒计时器
		如果 自动保存2 则
			如果 CodeEditorView1.可视 则
				//设置初始值
				变量 总时长 : 长整数 = 设置_设定.获取整数("CodeEditorOtherAutoSaveInterval").到对象().长整数值
				//是否显示保存进度+设置值
				进度条1.最大进度 = 总时长.到对象().整数值
				进度条1.进度 = 总时长.到对象().整数值
				进度条1.可视 = 显示自动保存倒计时
				//实时显示进度
				事件 计时器:正在倒计时(剩余时长 : 长整数)
					变量 转化为整数 : 整数 = 剩余时长.到对象().整数值
					进度条1.进度 = 转化为整数
				结束 事件
				//启动自动保存
				计时器.开始倒计时(总时长,10l)
				事件 计时器:倒计时结束()
					//是否自动保存
					如果 自动保存2 则
						保存文件(当前路径,假)
						计时器.开始倒计时(总时长,10l)
					结束 如果
				结束 事件
			结束 如果
		结束 如果
	结束 方法

	//打开文件
	方法 打开文件(路径 : 文本)
		//打开文件
		如果 打开代码.打开(CodeEditorView1,路径) 则
			添加文件快捷栏(路径)
			设置主题()
			保存锁 = 假
			当前路径 = 路径
			打开文件界面显示(1)
		结束 如果
	结束 方法

	//保存文件
	方法 保存文件(路径 : 文本,提示 : 逻辑型 = 真)
		变量 代码框内容 : 文本 = CodeEditorView1.获取文本()
		如果 保存锁 则
		否则
			如果 CodeEditorView1.可视 则
				写出文本文件(路径,代码框内容)
				如果 提示 则
					弹出成功提示("保存文件成功！")
				结束 如果
			结束 如果
		结束 如果
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
				符号栏.刷新()
				CodeEditorView1.可视 = 真
				横向滚动布局2.可视 = 真
				自动保存()
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

	//设置编辑器主题
	方法 设置主题()
		假如 设置_设定.获取整数("CodeEditorSchemeType")
			是 0
				如果 设置_设定.获取开关("NightMode") 则
					CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeDefaultNight)
				否则
					CodeEditorView1.设置主题(CodeEditorView_Scheme.CodeEditorScheme)
				结束 如果
			是 1
				CodeEditorView1.设置主题(CodeEditorView_Scheme.HTMLScheme)
			是 2
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeDarcula)
			是 3
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeEclipse)
			是 4
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeGitHub)
			是 5
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeNotepadXX)
			是 6
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemePurple)
			是 7
				CodeEditorView1.设置主题(CodeEditorView_Scheme.SchemeVS2019)
			是 8
				如果 设置_设定.获取文本("CodeEditorSchemeName") == "" 则
				否则

				结束 如果
		结束 假如
	结束 方法

	//加载主题
	方法 加载json主题()
		变量 主题配置 : 设置_代码编辑器_主题配置
	结束 方法

	方法 文本颜色值(颜色 : 文本) : 整数
		返回 文本到颜色值(颜色)
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

	//搜索
	方法 文件列表搜索(项目集合 : 文本集合,搜索内容 : 文本) : 文本集合
		结束集合.清空()
		循环(项目集合 -> 项目)
			如果 项目.到文本() ? 搜索内容 则
				结束集合.添加成员(项目)
			结束 如果
		结束 循环
		返回 结束集合
	结束 方法

	//加载夜间模式 0XFF333333 0XFF222222
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		图片框1.图片资源 = 编辑器_代码编辑器_资源.文件菜单白色图片
		图片框2.图片资源 = 编辑器_代码编辑器_资源.编辑白色图片
		图片框3.图片资源 = 编辑器_代码编辑器_资源.运行白色图片
		图片框4.图片资源 = 编辑器_代码编辑器_资源.撤销白色图片
		图片框5.图片资源 = 编辑器_代码编辑器_资源.重做白色图片
		图片框6.图片资源 = 编辑器_代码编辑器_资源.菜单白色图片
		图片框9.图片资源 = 编辑器_代码编辑器_资源.查找上一个白色图片
		图片框10.图片资源 = 编辑器_代码编辑器_资源.查找下一个白色图片
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