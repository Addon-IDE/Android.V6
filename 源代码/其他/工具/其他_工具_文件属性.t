类 其他_工具_文件属性 : 组件容器

	//声明
	变量 设置_设定 : 设置_设定

	方法 打开(路径 : 文本)
		变量 对话框 : 对话框
		变量 对话框布局 : 其他_组件_文件属性布局
		对话框.自定义布局 = 对话框布局
		对话框.背景颜色 = 0X00FFFFFF
		对话框.显示()
		//加载
		如果 是否为目录(路径) 则
			对话框布局.文本框3.内容 = 文件操作.取文件名(路径)
			对话框布局.文本框5.内容 = "当前文件是文件夹，无法获取"
			对话框布局.文本框12.内容 = 其他_转换.转换文件大小(文件操作.取文件大小(路径))
			对话框布局.文本框13.内容 = " (" + 文件操作.取文件大小(路径).到文本() + "字节)"
			对话框布局.文本框7.内容 = 文件操作.取文件修改时间(路径)
			对话框布局.文本框15.内容 = "当前文件是文件夹，无法获取"
			对话框布局.文本框17.内容 = 文件操作.是否为目录(路径).到文本()
			对话框布局.文本框19.内容 = 文件操作.是否为隐藏文件(路径).到文本()
			对话框布局.文本框9.内容 = 路径
			对话框布局.文本框21.内容 = "当前文件是文件夹，无法获取"
			对话框布局.文本框25.内容 = "当前文件是文件夹，无法获取"
			对话框布局.文本框24.内容 = "当前文件是文件夹，无法获取"
		否则
			对话框布局.文本框3.内容 = 文件操作.取文件名(路径)
			对话框布局.文本框5.内容 = 文件操作.取文件后缀名(路径)
			对话框布局.文本框12.内容 = 其他_转换.转换文件大小(文件操作.取文件大小(路径))
			对话框布局.文本框13.内容 = " (" + 文件操作.取文件大小(路径).到文本() + "字节)"
			对话框布局.文本框7.内容 = 文件操作.取文件修改时间(路径)
			对话框布局.文本框15.内容 = 文件操作.取文件编码(路径)
			对话框布局.文本框17.内容 = 文件操作.是否为目录(路径).到文本()
			对话框布局.文本框19.内容 = 文件操作.是否为隐藏文件(路径).到文本()
			对话框布局.文本框9.内容 = 路径
			对话框布局.文本框21.内容 = 文件操作.取文件MD5(路径)
			对话框布局.文本框25.内容 = 文件操作.取文件SHA1(路径)
			对话框布局.文本框24.内容 = 文件操作.取文件CRC32(路径)
		结束 如果
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			对话框布局.线性布局1.背景颜色 = 0XFF333333
			对话框布局.文本框1.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框2.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框3.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框4.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框5.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框6.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框7.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框8.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框9.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框10.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框11.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框12.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框13.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框14.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框15.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框16.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框17.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框18.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框19.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框20.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框21.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框22.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框23.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框24.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框25.字体颜色 = 0XFFFFFFFF
		结束 如果
		//关闭
		事件 对话框布局.线性布局9:被单击()
			对话框.关闭()
		结束 事件
	结束 方法

结束 类


类 其他_组件_文件属性布局 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2,纵向布局=真,背景颜色=-1]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=45,对齐方式=8388627]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,字体大小=18,内容="属性",粗体=真,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-2,左内边距DP=10,右内边距DP=10,上内边距DP=10,下内边距DP=10,纵向布局=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,字体颜色=-16777216,内容="文件名称："]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局4,单行显示=真]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,内容="文件格式：",字体颜色=-16777216]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局5,单行显示=真]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,字体颜色=-16777216,内容="文件大小："]])
	变量 文本框11 : 文本框
	@布局配置([[父布局=线性布局8,单行显示=真]])
	变量 文本框12 : 文本框
	@布局配置([[父布局=线性布局8,单行显示=真]])
	变量 文本框13 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体颜色=-16777216,内容="文件日期："]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局6,单行显示=真]])
	变量 文本框7 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,字体颜色=-16777216,内容="文件编码："]])
	变量 文本框14 : 文本框
	@布局配置([[父布局=线性布局10,单行显示=真]])
	变量 文本框15 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局11 : 线性布局
	@布局配置([[父布局=线性布局11,字体颜色=-16777216,内容="是否目录："]])
	变量 文本框16 : 文本框
	@布局配置([[父布局=线性布局11,单行显示=真]])
	变量 文本框17 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局12 : 线性布局
	@布局配置([[父布局=线性布局12,字体颜色=-16777216,内容="隐藏文件："]])
	变量 文本框18 : 文本框
	@布局配置([[父布局=线性布局12,单行显示=真]])
	变量 文本框19 : 文本框
	@布局配置([[父布局=线性布局3,宽度=-1,高度=-2,@上外边距DP=3]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,字体颜色=-16777216,内容="文件路径："]])
	变量 文本框8 : 文本框
	@布局配置([[父布局=线性布局7,单行显示=真]])
	变量 文本框9 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-2,左内边距DP=10,右内边距DP=10,上内边距DP=5,下内边距DP=5,纵向布局=真]])
	变量 线性布局13 : 线性布局
	@布局配置([[父布局=线性布局13,宽度=-1,高度=-2]])
	变量 线性布局14 : 线性布局
	@布局配置([[父布局=线性布局14,字体颜色=-16777216,内容="MD5："]])
	变量 文本框20 : 文本框
	@布局配置([[父布局=线性布局14,单行显示=真]])
	变量 文本框21 : 文本框
	@布局配置([[父布局=线性布局13,宽度=-1,高度=-2]])
	变量 线性布局15 : 线性布局
	@布局配置([[父布局=线性布局15,字体颜色=-16777216,内容="SHA1："]])
	变量 文本框22 : 文本框
	@布局配置([[父布局=线性布局15,单行显示=真]])
	变量 文本框25 : 文本框
	@布局配置([[父布局=线性布局13,宽度=-1,高度=-2]])
	变量 线性布局16 : 线性布局
	@布局配置([[父布局=线性布局16,字体颜色=-16777216,内容="CRC32："]])
	变量 文本框23 : 文本框
	@布局配置([[父布局=线性布局16,单行显示=真]])
	变量 文本框24 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=40,对齐方式=17,水波纹效果=真]])
	变量 线性布局9 : 线性布局
	@布局配置([[父布局=线性布局9,内容="关闭",粗体=真,字体大小=18,字体颜色=-16777216]])
	变量 文本框10 : 文本框

结束 类