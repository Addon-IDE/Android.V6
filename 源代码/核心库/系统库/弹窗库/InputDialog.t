类 InputDialog

	@隐藏
	变量 安卓环境名 : 安卓环境?
	@隐藏
	变量 dialog : 对话框?
	@隐藏
	变量 Layout : AlertInputDialogLayout?
	@隐藏
	变量 NumberButton : 整数
	@隐藏
	变量 AutomaticCancellation : 逻辑型 = 真
	@隐藏
	变量 Title : 逻辑型 = 假

	属性写 初始化(环境名 : 安卓环境)
		//设置环境名
		安卓环境名 = 环境名
		//创建组件
		dialog = 新建窗口组件(对话框,安卓环境名)
		Layout = 新建窗口组件(AlertInputDialogLayout,安卓环境名)
		//设置组件
		dialog.自定义布局 = Layout
		dialog.背景颜色 = 0X00000000
		//隐藏按钮
		Layout.线性布局1.可视 = 假
		Layout.线性布局3.可视 = 假
		Layout.卡片布局2.可视 = 假
		Layout.卡片布局3.可视 = 假
		Layout.卡片布局4.可视 = 假
		//隐藏/显示编辑框
		Layout.编辑框1.可视 = 真
		Layout.编辑框2.可视 = 假
		Layout.编辑框3.可视 = 假
		Layout.编辑框4.可视 = 假
		Layout.编辑框5.可视 = 假
		//设置值
		NumberButton = 0
	结束 属性

	属性写 标题(内容 : 文本)
		Title = 真
		Layout.线性布局1.可视 = 真
		Layout.文本框1.内容 = 内容
	结束 属性

	属性写 内容(内容 : 文本)
		Layout.线性布局3.可视 = 真
		Layout.文本框2.内容 = 内容
	结束 属性

	属性写 图标(图标 : 图片资源)
		Layout.图片框1.可视 = 真
		Layout.图片框1.图片资源 = 图标
	结束 属性

	属性写 编辑框数量(数量 : 整数 = 1)
		如果 数量 == 1 则
			Layout.编辑框1.可视 = 真
			Layout.编辑框2.可视 = 假
			Layout.编辑框3.可视 = 假
			Layout.编辑框4.可视 = 假
			Layout.编辑框5.可视 = 假
		否则 数量 == 2
			Layout.编辑框1.可视 = 真
			Layout.编辑框2.可视 = 真
			Layout.编辑框3.可视 = 假
			Layout.编辑框4.可视 = 假
			Layout.编辑框5.可视 = 假
		否则 数量 == 3
			Layout.编辑框1.可视 = 真
			Layout.编辑框2.可视 = 真
			Layout.编辑框3.可视 = 真
			Layout.编辑框4.可视 = 假
			Layout.编辑框5.可视 = 假
		否则 数量 == 4
			Layout.编辑框1.可视 = 真
			Layout.编辑框2.可视 = 真
			Layout.编辑框3.可视 = 真
			Layout.编辑框4.可视 = 真
			Layout.编辑框5.可视 = 假
		否则 数量 == 5
			Layout.编辑框1.可视 = 真
			Layout.编辑框2.可视 = 真
			Layout.编辑框3.可视 = 真
			Layout.编辑框4.可视 = 真
			Layout.编辑框5.可视 = 真	
		结束 如果
	结束 属性

	属性写 按钮1(内容 : 文本)
		NumberButton = NumberButton + 1
		Layout.文本框5.内容 = 内容
		Layout.卡片布局4.可视 = 真
		事件 Layout.线性布局8:被单击()
			按钮1被点击()
			如果 AutomaticCancellation 则
				dialog.关闭()
			结束 如果
		结束 事件
	结束 属性

	属性写 按钮2(内容 : 文本)
		NumberButton = NumberButton + 1
		Layout.文本框3.内容 = 内容
		Layout.卡片布局3.可视 = 真
		事件 Layout.线性布局5:被单击()
			按钮2被点击()
			如果 AutomaticCancellation 则
				dialog.关闭()
			结束 如果
		结束 事件
	结束 属性

	属性写 按钮3(内容 : 文本)
		NumberButton = NumberButton + 1
		Layout.文本框4.内容 = 内容
		Layout.卡片布局2.可视 = 真
		事件 Layout.线性布局7:被单击()
			按钮3被点击()
			如果 AutomaticCancellation 则
				dialog.关闭()
			结束 如果
		结束 事件
	结束 属性

	属性写 按钮颜色(颜色 : 整数)
		Layout.文本框3.字体颜色 = 颜色
		Layout.文本框4.字体颜色 = 颜色
		Layout.文本框5.字体颜色 = 颜色
		置水波纹样式(Layout.线性布局5,15,0XFFFFFFFF,颜色变浅(颜色,60))
		置水波纹样式(Layout.线性布局7,15,0XFFFFFFFF,颜色变浅(颜色,60))
		置水波纹样式(Layout.线性布局8,15,0XFFFFFFFF,颜色变浅(颜色,60))
	结束 属性

	属性写 自动取消(状态 : 逻辑型)
		AutomaticCancellation = 状态
	结束 属性

	属性写 可取消(状态 : 逻辑型)
		dialog.可取消 = 状态
	结束 属性

	属性写 背景颜色(颜色 : 整数)
		Layout.卡片布局1.卡片背景颜色 = 颜色
		Layout.线性布局2.背景颜色 = 颜色
	结束 属性

	属性读 是否显示() : 逻辑型
		返回 dialog.正在显示
	结束 属性

	方法 获取内容(编辑框序号 : 整数 = 1) : 文本
		变量 内容 : 文本
		假如 编辑框序号
			是 1
				内容 = Layout.编辑框1.内容
			是 2
				内容 = Layout.编辑框2.内容
			是 3
				内容 = Layout.编辑框3.内容
			是 4
				内容 = Layout.编辑框4.内容
			是 5
				内容 = Layout.编辑框5.内容
		结束 假如
		返回 内容
	结束 方法

	方法 全部编辑框样式(提示文本颜色 : 整数 = 0XFF8C8C8C,
		字体大小 : 整数 = 16,
		文本颜色 : 整数 = 0XFF000000,
		输入方式 : 整数 = 1,
		单行输入 : 逻辑型 = 真)
		//提示文本颜色
		Layout.编辑框1.提示文本颜色 = 提示文本颜色
		Layout.编辑框2.提示文本颜色 = 提示文本颜色
		Layout.编辑框3.提示文本颜色 = 提示文本颜色
		Layout.编辑框4.提示文本颜色 = 提示文本颜色
		Layout.编辑框5.提示文本颜色 = 提示文本颜色
		//字体大小
		Layout.编辑框1.字体大小 = 字体大小
		Layout.编辑框2.字体大小 = 字体大小
		Layout.编辑框3.字体大小 = 字体大小
		Layout.编辑框4.字体大小 = 字体大小
		Layout.编辑框5.字体大小 = 字体大小
		//文本颜色
		Layout.编辑框1.字体颜色 = 文本颜色
		Layout.编辑框2.字体颜色 = 文本颜色
		Layout.编辑框3.字体颜色 = 文本颜色
		Layout.编辑框4.字体颜色 = 文本颜色
		Layout.编辑框5.字体颜色 = 文本颜色
		//输入类型
		Layout.编辑框1.输入方式 = 输入方式
		Layout.编辑框2.输入方式 = 输入方式
		Layout.编辑框3.输入方式 = 输入方式
		Layout.编辑框4.输入方式 = 输入方式
		Layout.编辑框5.输入方式 = 输入方式
		//是否单行
		Layout.编辑框1.单行输入 = 单行输入
		Layout.编辑框2.单行输入 = 单行输入
		Layout.编辑框3.单行输入 = 单行输入
		Layout.编辑框4.单行输入 = 单行输入
		Layout.编辑框5.单行输入 = 单行输入
	结束 方法

	方法 单独编辑框样式(
		编辑框序号 : 整数 = 1,
		提示文本 : 文本 = "",
		提示文本颜色 : 整数 = 0XFF8C8C8C,
		字体大小 : 整数 = 16,
		文本颜色 : 整数 = 0XFF000000,
		输入方式 : 整数 = 1,
		单行输入 : 逻辑型 = 真)
		假如 编辑框序号
			是 1
				//提示内容
				Layout.编辑框1.提示文本 = 提示文本
				//提示文本颜色
				Layout.编辑框1.提示文本颜色 = 提示文本颜色
				//字体大小
				Layout.编辑框1.字体大小 = 字体大小
				//文本颜色
				Layout.编辑框1.字体颜色 = 文本颜色
				//输入类型
				Layout.编辑框1.输入方式 = 输入方式
				//是否单行
				Layout.编辑框1.单行输入 = 单行输入
			是 2
				//提示内容
				Layout.编辑框2.提示文本 = 提示文本
				//提示文本颜色
				Layout.编辑框2.提示文本颜色 = 提示文本颜色
				//字体大小
				Layout.编辑框2.字体大小 = 字体大小
				//文本颜色
				Layout.编辑框2.字体颜色 = 文本颜色
				//输入类型
				Layout.编辑框2.输入方式 = 输入方式
				//是否单行
				Layout.编辑框2.单行输入 = 单行输入
			是 3
				//提示内容
				Layout.编辑框3.提示文本 = 提示文本
				//提示文本颜色
				Layout.编辑框3.提示文本颜色 = 提示文本颜色
				//字体大小
				Layout.编辑框3.字体大小 = 字体大小
				//文本颜色
				Layout.编辑框3.字体颜色 = 文本颜色
				//输入类型
				Layout.编辑框3.输入方式 = 输入方式
				//是否单行
				Layout.编辑框3.单行输入 = 单行输入
			是 4
				//提示内容
				Layout.编辑框4.提示文本 = 提示文本
				//提示文本颜色
				Layout.编辑框4.提示文本颜色 = 提示文本颜色
				//字体大小
				Layout.编辑框4.字体大小 = 字体大小
				//文本颜色
				Layout.编辑框4.字体颜色 = 文本颜色
				//输入类型
				Layout.编辑框4.输入方式 = 输入方式
				//是否单行
				Layout.编辑框4.单行输入 = 单行输入
			是 5
				//提示内容
				Layout.编辑框5.提示文本 = 提示文本
				//提示文本颜色
				Layout.编辑框5.提示文本颜色 = 提示文本颜色
				//字体大小
				Layout.编辑框5.字体大小 = 字体大小
				//文本颜色
				Layout.编辑框5.字体颜色 = 文本颜色
				//输入类型
				Layout.编辑框5.输入方式 = 输入方式
				//是否单行
				Layout.编辑框5.单行输入 = 单行输入
		结束 假如
	结束 方法

	方法 隐藏编辑框下横条(编辑框序号 : 整数 = 1)
		假如 编辑框序号
			是 1
				Layout.编辑框1.背景颜色 = 0X00FFFFFF
			是 2
				Layout.编辑框2.背景颜色 = 0X00FFFFFF
			是 3
				Layout.编辑框3.背景颜色 = 0X00FFFFFF
			是 4
				Layout.编辑框4.背景颜色 = 0X00FFFFFF
			是 5
				Layout.编辑框5.背景颜色 = 0X00FFFFFF
		结束 假如
	结束 方法

	方法 隐藏全部编辑框下横条()
		Layout.编辑框1.背景颜色 = 0X00FFFFFF
		Layout.编辑框2.背景颜色 = 0X00FFFFFF
		Layout.编辑框3.背景颜色 = 0X00FFFFFF
		Layout.编辑框4.背景颜色 = 0X00FFFFFF
		Layout.编辑框5.背景颜色 = 0X00FFFFFF
	结束 方法

	方法 显示()
		如果 NumberButton == 0 则
			Layout.相对布局1.高度DP = 10
			Layout.卡片布局2.可视 = 假
			Layout.卡片布局3.可视 = 假
			Layout.卡片布局4.可视 = 假
		否则
			Layout.相对布局1.高度DP = 50
		结束 如果
		如果 Title 则
			Layout.文本框1.可视 = 真
			Layout.线性布局1.可视 = 真
			Layout.线性布局1.高度DP = 50
		否则
			Layout.文本框1.可视 = 假
			Layout.线性布局1.可视 = 真
			Layout.线性布局1.高度DP = 10
		结束 如果
		dialog.显示()
	结束 方法

	方法 隐藏()
		dialog.隐藏()
	结束 方法

	方法 关闭()
		dialog.关闭()
	结束 方法

	定义事件 按钮1被点击()
	定义事件 按钮2被点击()
	定义事件 按钮3被点击()

	定义事件 项目被单击(索引 为 整数)

结束 类

类 AlertInputDialogLayout : 组件容器

	@布局配置([[根布局=真,宽度=-2,高度=-2]])
	变量 线性布局0 : 线性布局
	@布局配置([[父布局=线性布局0,宽度=-1,高度=-2,圆角=20,卡片阴影=0,@左外边距DP=20,@右外边距DP=20]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=50,对齐方式=8388627]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度DP=25,高度DP=25,@左外边距DP=20,可视=假]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,@左外边距DP=20,@右外边距DP=20,内容="标题",字体大小=18,粗体=假,字体颜色=-16777216,宽度=-1]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,@左外边距DP=20,@右外边距DP=20,内容="标题",字体大小=15,粗体=假,@下外边距DP=10,@上外边距DP=5,字体颜色=-16777216,宽度=-1]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-2,纵向布局=真]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,宽度=-1,@左外边距DP=15,@右外边距DP=15,左内边距DP=5,右内边距DP=5,内容=""]])
	变量 编辑框1 : 编辑框
	@布局配置([[父布局=线性布局10,宽度=-1,@左外边距DP=15,@右外边距DP=15,左内边距DP=5,右内边距DP=5,内容=""]])
	变量 编辑框2 : 编辑框
	@布局配置([[父布局=线性布局10,宽度=-1,@左外边距DP=15,@右外边距DP=15,左内边距DP=5,右内边距DP=5,内容=""]])
	变量 编辑框3 : 编辑框
	@布局配置([[父布局=线性布局10,宽度=-1,@左外边距DP=15,@右外边距DP=15,左内边距DP=5,右内边距DP=5,内容=""]])
	变量 编辑框4 : 编辑框
	@布局配置([[父布局=线性布局10,宽度=-1,@左外边距DP=15,@右外边距DP=15,左内边距DP=5,右内边距DP=5,内容=""]])
	变量 编辑框5 : 编辑框
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=50]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388627]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,宽度=-2,高度DP=36,@左外边距DP=10,卡片阴影=0,圆角=15]])
	变量 卡片布局2 : 卡片布局
	@布局配置([[父布局=卡片布局2,宽度=-1,高度=-1,对齐方式=17,水波纹效果=真,背景颜色=-1]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,字体颜色=-16777216,@左外边距DP=15,@右外边距DP=15,字体大小=15,内容="中立"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=8388629]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度=-2,高度DP=36,卡片阴影=0,圆角=15,@右外边距DP=2]])
	变量 卡片布局3 : 卡片布局
	@布局配置([[父布局=卡片布局3,宽度=-1,高度=-1,对齐方式=17,水波纹效果=真,背景颜色=-1]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,字体颜色=-16777216,@左外边距DP=16,@右外边距DP=16,字体大小=15,内容="取消"]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局4,宽度=-2,高度DP=36,卡片阴影=0,圆角=15,@右外边距DP=10]])
	变量 卡片布局4 : 卡片布局
	@布局配置([[父布局=卡片布局4,宽度=-1,高度=-1,对齐方式=17,水波纹效果=真,背景颜色=-1]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,字体颜色=-16777216,@左外边距DP=16,@右外边距DP=16,字体大小=15,内容="确定"]])
	变量 文本框5 : 文本框

结束 类