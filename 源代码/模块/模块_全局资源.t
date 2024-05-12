类 模块_全局资源 : 组件容器

	//变量
	变量 运行弹窗 : 模块_全局资源_弹窗
	变量 运行缓存路径 : 文本 = 其他_变量.缓存目录 + "project/" + 其他_其他.读缓存("ProjectName") + "/"
	变量 项目运行路径R : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/addon_bin/" + 其他_其他.读缓存("ProjectName") + "_resource_pack/"
	变量 设置_设定 : 设置_设定
	变量 游戏路径 : 文本

	方法 检测()
		//设置世界路径
		如果 设置_设定.获取开关("BasicOldMimecraft") 则
			游戏路径 = 其他_变量.内部存储目录 + "games/com.mojang/"
		否则
			游戏路径 = 其他_变量.内部存储目录 + "Android/data/" + 设置_设定.获取文本("BasicGamePackName") + "/files/games/com.mojang/"
		结束 如果
		//
		复制模组(游戏路径)
	结束 方法

	方法 复制模组(路径 : 文本)
		如果 ZIP压缩(项目运行路径R,运行缓存路径 + "R_Global.zip") 则
			如果 ZIP解压(运行缓存路径 + "R_Global.zip",路径 + "resource_packs/" + "addonide_global_RP") 则
				复制JSON(路径)
			否则
				运行弹窗.错误弹窗("在复制的时候发生错误，错误代码：R(0)")
			结束 如果
		否则
			运行弹窗.错误弹窗("在复制的时候发生了错误，错误代码：R")
		结束 如果
	结束 方法

	方法 复制JSON(路径 : 文本)
		如果 写出资源文件(取安卓环境(),"data/bins/global_resource_packs.json",路径 + "minecraftpe/global_resource_packs.json") 则
			写入JSON(路径)
		否则
			运行弹窗.错误弹窗("生成global_resource_packs.json时发生了错误")
		结束 如果
	结束 方法
	
	方法 写入JSON(路径 : 文本)
		//world
		变量 jsonA : JSON数组 = 读入文本文件(路径 + "minecraftpe/global_resource_packs.json")
		//world_resource_packs.json
		变量 json_A : JSON对象
		json_A["pack_id"] = 读取清单_UUID()
		json_A["version"] = 读取清单_version()
		jsonA.置入(json_A)
		写出文本文件(路径 + "minecraftpe/global_resource_packs.json",jsonA.到文本())
		//方法
		结束相关操作()
	结束 方法
	
	方法 结束相关操作()
		//提示
		弹出成功提示("成功运行全局资源，开始打开游戏！")
		//打开应用
		如果 设置_设定.获取文本("BasicGamePackName").替换(" ","") == "" 则
		否则
			如果 打开应用(取安卓环境(),设置_设定.获取文本("BasicGamePackName")) 则
			否则
				弹出错误提示("尝试启动游戏：" + 设置_设定.获取文本("BasicGamePackName") + "包名时发生异常，有可能游戏不存在或者包名填写错误")
			结束 如果
		结束 如果
	结束 方法
	
	方法 读取清单_version() : JSON数组
		变量 R清单路径 : 文本 = 项目运行路径R + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 version : JSON数组 = header["version"]
		返回 version
	结束 方法
	
	方法 读取清单_UUID() : 文本
		变量 R清单路径 : 文本 = 项目运行路径R + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 uuid : 文本 = header["uuid"]
		返回 uuid
	结束 方法


结束 类

类 模块_全局资源_弹窗 : 组件容器

	变量 设置_设定 : 设置_设定

	变量 错误对话框 : 对话框
	变量 错误框布局 : 模块_全局资源_弹窗布局


	方法 错误弹窗(内容 : 文本)
		//加载对话框
		错误对话框.自定义布局 = 错误框布局
		错误对话框.背景颜色 = 0X00000000
		错误对话框.显示()
		//修改布局
		错误框布局.文本框3.内容 = 内容
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			错误框布局.卡片布局1.卡片背景颜色 = 0XFF262626
			错误框布局.线性布局2.背景颜色 = 0XFF262626
			错误框布局.文本框1.字体颜色 = 0XFFFFFFFF
			错误框布局.文本框3.字体颜色 = 0XFFFF0000
		结束 如果
	结束 方法

结束 类

类 模块_全局资源_弹窗布局 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=150,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="失败！",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="Manifest File 丢失",字体颜色=-2145469]])
	变量 文本框3 : 文本框

结束 类