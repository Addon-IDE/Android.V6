类 编辑器_函数编辑器_文件 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,圆角=25,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=49]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=45,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,内容="函数文件",字体大小=16,粗体=真,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=49]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度=-1,高度=-1,@上外边距DP=45,@下外边距DP=0,纵向布局=真]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,@左外边距DP=0,@上外边距DP=0,@右外边距DP=0,@下外边距DP=0]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,@左外边距DP=10,@上外边距DP=10,@右外边距DP=10,@下外边距DP=10,字体大小=13,内容="root/path"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局5,宽度=-1,高度DP=40]])
	变量 相对布局2 : 相对布局
	@布局配置([[父布局=相对布局2,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局9 : 线性布局
	@布局配置([[父布局=线性布局9,宽度DP=40,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局上一级 : 线性布局
	@布局配置([[父布局=线性布局上一级,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/code_editor/file/arrow_up.xml"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局9,宽度=-1,高度DP=40]])
	变量 线性布局11 : 线性布局
	@布局配置([[父布局=线性布局11,宽度=-1,高度=-1,@右外边距DP=0,水波纹效果=假,背景颜色=16777215,提示文本="搜索...",字体大小=15,左内边距DP=5,右内边距DP=5]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-1,分割线高度=0]])
	变量 自定义列表框1 : 自定义列表框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388693]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=50,高度DP=50,圆角=30,卡片阴影=0,@下外边距DP=40,@右外边距DP=40]])
	变量 卡片布局2 : 卡片布局
	@布局配置([[父布局=卡片布局2,宽度=-1,高度=-1,背景颜色=-12205339,对齐方式=17,水波纹效果=真]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,宽度DP=25,高度DP=25,图片资源="../../../../资源库/图标/editor/function_editor/file_add.xml"]])
	变量 图片框3 : 图片框

	//声明
	变量 设置_设定 : 设置_设定

	事件 编辑器_函数编辑器_文件:创建完毕()
		如果 设置_设定.获取开关("NightMode") 则
			图片框1.图片资源 = 编辑器_函数编辑器_资源.上一级白色图片
			卡片布局1.卡片背景颜色 = 0XFF333333
			相对布局1.背景颜色 = 0XFF333333
			文本框4.字体颜色 = 0XFFFFFFFF
			自定义列表框1.背景颜色 = 0XFF333333
			文本框1.字体颜色 = 0XFFFFFFFF
			编辑框1.字体颜色 = 0XFFFFFFFF
			编辑框1.提示文本颜色 = 0XFF989898
		结束 如果
	结束 事件

结束 类

类 编辑器_函数编辑器_文件列表 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度DP=50,背景颜色=-1,水波纹效果=真]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388627,@左外边距DP=10,@右外边距DP=10,水波纹效果=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度DP=45,高度DP=45,对齐方式=17]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=35,高度DP=35]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,对齐方式=8388627,纵向布局=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,字体颜色=-16777216,字体大小=15,内容="文件名称",@左外边距DP=5,@右外边距DP=20]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局3,字体大小=12,内容="文件相关信息",@上外边距DP=3,@左外边距DP=5,@右外边距DP=20]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=20,高度DP=20,@右外边距DP=10]])
	变量 图片框2 : 图片框

	//声明
	变量 设置_设定 : 设置_设定

	事件 编辑器_函数编辑器_文件列表 : 创建完毕()
		//加载夜间模试
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
	结束 事件

	//设置功能按钮颜色
	方法 设置夜间模式()
		相对布局1.背景颜色 = 0XFF333333
		文本框1.字体颜色 = 0XFFFFFFFF
		文本框2.字体颜色 = 0XFFFFFFFF
	结束 方法

结束 类