//附加资源
@附加资源("../../资源库/资源")

类 启动窗口 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=81,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,内容="",宽度DP=-1]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,内容="",宽度DP=-1]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,内容="雨晨的清风©",宽度DP=-1]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局2,@下外边距DP=10,内容="2022-10-29 v6",宽度DP=-1]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=17]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度DP=100,高度DP=100,图片资源="../../资源库/图标/icon.png"]])
	变量 图片框1 : 图片框

	//声明
	变量 启动倒计时 : 倒计时器
	变量 设置_设定 : 设置_设定
	变量 其他_功能 : 其他_功能

	//变量
	变量 日志目录 : 文本 = 其他_变量.数据目录 + "logs/"
	变量 应用版本号 : 整数 = 3

	事件 启动窗口:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//全局异常处理
		全局异常处理.初始化(本对象,本对象,日志目录 + 取格式时间("YYYY-MM-dd hh:mm:ss:ms") + ".logs")
		//DX初始化
		DX全局设置.初始化(本对象)
		//加载桌面长按菜单
		桌面长按菜单()
		//检查权限
		如果 XX权限.是否授予权限组(本对象, 安卓权限组定义.存储权限) 则
			检测测试版本()
		否则
			变量 权限对话框 : 对话框
			权限对话框.标题 = "申请权限"
			权限对话框.信息 = "点击按钮申请权限"
			权限对话框.按钮1 = "确定"
			权限对话框.可取消 = 假
			权限对话框.显示()
			事件 权限对话框:按钮1被单击()
				应用申请权限()
			结束 事件
		结束 如果
		//订阅事件
		订阅事件()
	结束 事件

	//申请权限
	方法 应用申请权限()
		//变量
		变量 申请权限对话框 : DX基础对话框
		变量 权限申请回调测试 : 权限申请回调
		//对话框
		申请权限对话框.样式(DX样式.MIUI)
		申请权限对话框.标题("申请权限")
		申请权限对话框.内容("作为一个模组制作器,你需要文件管理权限,才能正常使用")
		申请权限对话框.按钮1("申请权限")
		申请权限对话框.按钮2("退出应用")
		申请权限对话框.可取消(假)
		申请权限对话框.显示()
		//对话框事件
		事件 申请权限对话框:按钮1被单击() : 逻辑型
			XX权限.设置请求对象(本对象).添加权限组(安卓权限组定义.存储权限).请求权限(权限申请回调测试)
			返回 假
		结束 事件
		事件 申请权限对话框:按钮2被单击() : 逻辑型
			关闭窗口()
			返回 假
		结束 事件
		//申请权限事件
		事件 权限申请回调测试:已授予权限(授予权限集合 : 文本集合, 已全部获取 : 逻辑型)
			如果 已全部获取
				检测测试版本()
			否则
				变量 申请权限对话框 : DX基础对话框
				申请权限对话框.样式(DX样式.MIUI)
				申请权限对话框.标题("提示")
				申请权限对话框.内容("你未授予全部权限,可能会造成部分应用异常")
				申请权限对话框.按钮1("转到设置中授予")
				申请权限对话框.按钮2("关闭")
				申请权限对话框.显示()
				//对话框事件
				事件 申请权限对话框:按钮1被单击() : 逻辑型
					XX权限.跳转到应用权限设置页(本对象)
					返回 假
				结束 事件
			结束 如果
		结束 事件
		事件 权限申请回调测试:已拒绝权限(拒绝权限集合 : 文本集合, 已永远拒绝 : 逻辑型)
			如果 已永远拒绝
				申请权限错误()
			否则
				申请权限错误()
			结束 如果
		结束 事件
	结束 方法

	//申请权限错误
	方法 申请权限错误()
		//对话框
		变量 申请权限对话框 : DX基础对话框
		申请权限对话框.样式(DX样式.MIUI)
		申请权限对话框.标题("权限错误")
		申请权限对话框.内容("作为一个模组制作器,存储权限是不可或缺的,请在设置中勾选")
		申请权限对话框.按钮1("跳转到设置")
		申请权限对话框.按钮2("退出")
		申请权限对话框.可取消(假)
		申请权限对话框.显示()
		//对话框事件
		事件 申请权限对话框:按钮1被单击() : 逻辑型
			XX权限.跳转到应用权限设置页(本对象)
			返回 假
		结束 事件
		事件 申请权限对话框:按钮2被单击() : 逻辑型
			关闭窗口()
			返回 假
		结束 事件
	结束 方法

	//检测测试版本
	方法 检测测试版本()
		如果 其他_其他.数据是否存在("NewVersion") 则
			检测版本()
		否则
			如果 文件是否存在(其他_变量.根目录 + "options.json") 则
				变量 弹窗 : AlertDialog
				弹窗.初始化 = 本对象
				弹窗.标题 = "测试版残留提示"
				弹窗.内容 = "检测到文件中还有测试版本的残留，为了防止崩溃，重新生成相关文件，此操作，并不会将你的项目删掉"
				弹窗.按钮1 = "确定"
				弹窗.按钮2 = "退出应用"
				弹窗.可取消 = 假
				弹窗.按钮颜色 = 0XFFF62121
				弹窗.显示()
				//确定
				事件 弹窗:按钮1被点击()
					写出资源文件(本对象,"data/options.json",其他_变量.根目录 + "options.json")
					其他_其他.写数据("NewVersion","")
					启动应用()
				结束 事件
				//退出应用
				事件 弹窗:按钮2被点击()
					关闭窗口()
				结束 事件
			否则
				启动应用()
			结束 如果
		结束 如果
	结束 方法

	//检测版本
	方法 检测版本()
		如果 其他_其他.数据是否存在("Version_Code") 则
			变量 转换为整数 : 整数 = 其他_其他.读数据("Version_Code").到整数()
			如果 转换为整数 >= 应用版本号 则
				启动应用()
			否则
				变量 弹窗 : AlertDialog
				弹窗.初始化 = 本对象
				弹窗.标题 = "新版本提示"
				弹窗.内容 = "检测到文件中还有旧版本的残留，为了防止崩溃，重新生成设置文件，此操作并不会将你的项目删掉"
				弹窗.按钮1 = "确定"
				弹窗.按钮2 = "退出应用"
				弹窗.可取消 = 假
				弹窗.按钮颜色 = 0XFFF62121
				弹窗.显示()
				//确定
				事件 弹窗:按钮1被点击()
					如果 写出资源文件(本对象,"data/options.json",其他_变量.根目录 + "options.json") 则
						否则
							弹出提示("复制软件文件时失败！")
							关闭窗口()
					结束 如果
					其他_其他.写数据("Version_Code",应用版本号.到文本())
					启动应用()
				结束 事件
				//退出应用
				事件 弹窗:按钮2被点击()
					关闭窗口()
				结束 事件
			结束 如果
		否则
			其他_其他.写数据("Version_Code","0")
			检测版本()
		结束 如果
	结束 方法

	//启动应用
	方法 启动应用()
		//生成文件夹
		创建文件夹(其他_变量.项目目录)
		创建文件夹(其他_变量.数据目录)
		创建文件夹(其他_变量.缓存目录)
		创建文件夹(其他_变量.备份目录)
		创建文件夹(其他_变量.插件目录)
		//软件系统文件创建
		软件系统文件创建()
		生成其他的配置文件()
		//生成.nomedia
		写出文本文件(其他_变量.根目录 + ".nomedia","")
		//检查设置文件是否存在
		如果 文件是否存在(其他_变量.根目录 + "options.json") 则
			//设置启动页背景
			变量 设置相关路径 : 文本 = 设置_设定.获取文本("PersonalityStartupBackground")
			如果 设置相关路径.替换(" ","") == "" 则
			否则
				如果 文件是否存在(设置相关路径) 则
					本对象.全屏模式 = 真
					图片框1.可视 = 假
					文本框3.可视 = 假
					文本框4.可视 = 假
					设置_设置.设置布局背景(本对象,线性布局2,设置相关路径)
				结束 如果
			结束 如果
			//是否快速启动
			如果 设置_设定.获取开关("BasicQuick_Start") 则
				使用须知()
				关闭窗口()
			否则
				//设置夜间模式
				如果 设置_设定.获取开关("NightMode") 则
					本对象.状态栏颜色 = 0XFF333333
					本对象.状态栏字体黑色 = 假
					线性布局2.背景颜色 = 0XFF333333
					文本框1.字体颜色 = 0XFFFFFFFF
					文本框2.字体颜色 = 0XFFFFFFFF
					文本框3.字体颜色 = 0XFFFFFFFF
					文本框4.字体颜色 = 0XFFFFFFFF
				结束 如果
				//开始倒计时
				启动倒计时.开始倒计时(500L,500L)
				//倒计时结束后切换窗口
				事件 启动倒计时:倒计时结束()
					使用须知()
					关闭窗口()
				结束 事件
			结束 如果
		否则
			//软件系统文件创建
			软件系统文件创建()
		结束 如果
	结束 方法

	//是否通过了使用须知
	方法 使用须知()
		如果 其他_其他.数据是否存在("Instructionsforuse") 则
			切换窗口(主界面)
		否则
			切换窗口(使用须知)
		结束 如果
	结束 方法

	//软件系统文件创建
	方法 软件系统文件创建()
		//设置文件
		如果 文件是否存在(其他_变量.根目录 + "options.json") 则
		否则
			写出资源文件(本对象,"data/options.json",其他_变量.根目录 + "options.json")
		结束 如果
		//生成图标
		如果 文件是否存在(其他_变量.根目录 + "icon.png") 则
		否则
			写出资源文件(本对象,"icon.png",其他_变量.根目录 + "icon.png")
		结束 如果
		//生成identifier
		变量 其他_管理_标识管理器_方法 : 其他_管理_标识管理器_方法
		其他_管理_标识管理器_方法.批量生成identifier()
	结束 方法

	//生成一些其他的配置文件
	方法 生成其他的配置文件()
		变量 path1 : 文本 = 其他_变量.数据目录 + "code/schemes/default_scheme.json"
		如果 文件是否存在(path1) 则
		否则
			写出资源文件(本对象,"editor/code_editor/default_scheme.json",path1)
		结束 如果
	结束 方法

	//其他的一些功能
	方法 桌面长按菜单()
		//桌面长按菜单
		变量 图标 : 图片资源 = "../../资源库/图标/icon.png"
		桌面长按菜单.添加菜单(本对象,图标,"function1","打开应用",取类信息())
		桌面长按菜单.添加菜单(本对象,图标,"function2","修复应用",(创建 主页_修复).取类信息())
		桌面长按菜单.添加菜单(本对象,图标,"function3","音乐可视化",(创建 应用_音乐可视化).取类信息())
	结束 方法

	//创建文件夹
	方法 创建文件夹(文件夹路径 : 文本)
		变量 文件夹路径S : 文本 = 文件夹路径 + "null"
		写出文本文件(文件夹路径S,"")
		删除文件(文件夹路径S)
	结束 方法

结束 类

类 使用须知 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=49,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度DP=100,高度DP=100,图片资源="../../资源库/图标/icon.png",@上外边距DP=80]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,@上外边距DP=30,内容="使用须知",字体大小=28,粗体=真,对齐方式=17,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,@上外边距DP=20,对齐方式=17,字体颜色=-16777216,字体大小=17,内容="在使用Addon IDE (模组制作器)之前，请你仔细阅读本软件的用户协议和隐私政策",@左外边距DP=20,@右外边距DP=20]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局1,宽度=-1,高度=-1,对齐方式=81,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度=-1,高度DP=45,@下外边距DP=30,@左外边距DP=20,@右外边距DP=20,卡片阴影=0,圆角=60]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,对齐方式=17,背景颜色=-2735293,水波纹效果=真]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,字体大小=16,字体颜色=-1,内容="开始制作"]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-2,@下外边距DP=8,对齐方式=17]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,字体大小=15,字体颜色=-16777216,内容="我已阅读AddonIDE"]])
	变量 多选框1 : 多选框
	@布局配置([[父布局=线性布局4,字体大小=15,字体颜色=-13128449,内容="用户协议"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局4,字体大小=15,字体颜色=-16777216,内容="并同意"]])
	变量 文本框5 : 文本框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-2,@下外边距DP=80,对齐方式=17]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,字体大小=15,字体颜色=-16777216,内容="我已阅读AddonIDE"]])
	变量 多选框2 : 多选框
	@布局配置([[父布局=线性布局5,字体大小=15,字体颜色=-13128449,内容="隐私政策"]])
	变量 文本框6 : 文本框
	@布局配置([[父布局=线性布局5,字体大小=15,字体颜色=-16777216,内容="并知悉"]])
	变量 文本框7 : 文本框

	变量 信息 : 启动信息

	事件 使用须知:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0X00FFFFFF
		本对象.状态栏字体黑色 = 真
		//订阅事件
		订阅事件()
	结束 事件

	//"开始制作" 的按钮被点击
	事件 线性布局3:被单击()
		如果 多选框1.选中 则
			如果 多选框2.选中 则
				其他_其他.写数据("Instructionsforuse","true")
				关闭窗口()
				切换窗口(主界面)
			否则
				弹出提示("请勾选下面的两个选项，并阅读！")
			结束 如果
		否则
			弹出提示("请勾选下面的两个选项，并阅读！")
		结束 如果
	结束 事件

	//用户协议
	事件 文本框4:被单击()
		信息.置入("链接","file:///android_asset/web/user-scheme.html")
		切换窗口(浏览器,信息)
	结束 事件

	//隐私政策
	事件 文本框6:被单击()
		信息.置入("链接","file:///android_asset/web/user-privacy.html")
		切换窗口(浏览器,信息)
	结束 事件

结束 类


类 窗口模板 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,对齐方式=8388627,背景颜色=-1]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=15,高度DP=15,图片资源="../../资源库/图标/back/Back_black.png",@左外边距DP=10]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局2,字体大小=15,内容="项目",字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,宽度DP=2,高度DP=12,@左外边距DP=10,卡片阴影=0]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-526087]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局2,@左外边距DP=10,粗体=真,字体大小=16,内容="标题",字体颜色=-16777216]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1,纵向布局=真]])
	变量 线性布局4 : 线性布局

结束 类


类 窗口模板2 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,图片资源="../../资源库/图标/back/default_backicon.png",水波纹效果=真,可获取焦点=真]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 线性布局5 : 线性布局

结束 类

类 窗口模板3 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,图片资源="../../资源库/图标/back/default_backicon.png",水波纹效果=真,可获取焦点=真]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真,纵向布局=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局7,字体大小=13,字体颜色=-16777216,内容="保存",对齐方式=17]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 线性布局5 : 线性布局

结束 类