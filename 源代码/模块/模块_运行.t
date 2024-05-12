类 模块_运行 : 组件容器

	变量 日志 : 文本 = ""
	变量 运行弹窗 : 模块_运行_弹窗
	变量 设置_设定 : 设置_设定
	变量 运行缓存路径 : 文本 = 其他_变量.缓存目录 + "project/" + 其他_其他.读缓存("ProjectName") + "/"
	变量 项目运行路径R : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/addon_bin/" + 其他_其他.读缓存("ProjectName") + "_resource_pack/"
	变量 项目运行路径B : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/addon_bin/" + 其他_其他.读缓存("ProjectName") + "_behavior_pack/"
	变量 世界路径 : 文本

	方法 检测()
		//初始化
		运行弹窗.初始化()
		//是否重置世界
		变量 run_world_path : 文本 = 世界路径 + "addonide_adddon_run_world" + "/"
		如果 设置_设定.获取开关("BasicRunResetWorld") 则
			如果 文件是否存在(run_world_path) 则
				如果 删除文件(run_world_path) 则
				否则
					弹出警告提示("无法重置世界！")
				结束 如果
			结束 如果
		结束 如果
		//打开应用
		如果 设置_设定.获取文本("BasicRunOtherApps").替换(" ","") == "" 则
		否则
			如果 打开应用(取安卓环境(),设置_设定.获取文本("BasicRunOtherApps")) 则
			否则
				弹出错误提示("尝试打开：" + 设置_设定.获取文本("BasicRunOtherApps") + "应用报名的时候发生了错误，有可能应用不存在！")
			结束 如果
		结束 如果
		//检测
		如果 文件是否存在(项目运行路径R) 则
			如果 文件是否存在(项目运行路径B) 则
				//设置世界路径
				如果 设置_设定.获取开关("BasicOldMimecraft") 则
					世界路径 = 其他_变量.内部存储目录 + "games/com.mojang/minecraftWorlds/"
				否则
					世界路径 = 其他_变量.内部存储目录 + "Android/data/" + 设置_设定.获取文本("BasicGamePackName") + "/files/games/com.mojang/minecraftWorlds/"
				结束 如果
				生成世界()
			否则
				运行弹窗.错误弹窗("请先打包运行")
			结束 如果
		否则
			运行弹窗.错误弹窗("请先打包运行")
		结束 如果
	结束 方法

	方法 生成世界()
		变量 世界资源路径 : 文本
		变量 类型 : 整数 = 设置_设定.获取整数("BasicRunWorldType")
		假如 类型
			是 0
				世界资源路径 = "data/world/adddon_run_private_world.zip"
			是 1
				世界资源路径 = "data/world/adddon_run_dedicated_world_flatness.zip"
			是 2
				世界资源路径 = "data/world/adddon_run_world_0.zip"
			是 3
				世界资源路径 = "data/world/adddon_run_world_1.zip"
		结束 假如
		如果 写出资源文件(取安卓环境(),世界资源路径,运行缓存路径 + "world.zip") 则
			变量 worldpath : 文本 = 世界路径 + "addonide_adddon_run_world" + "/"
			如果 ZIP解压(运行缓存路径 + "world.zip",worldpath) 则
				复制模组(worldpath)
				其他_其他.写缓存("run_world_path",worldpath)
			否则
				运行弹窗.错误弹窗("解压世界的时候发生了错误！")
			结束 如果
		否则
			运行弹窗.错误弹窗("在复制世界资源的时候发生了错误！")
		结束 如果
	结束 方法

	方法 复制模组(路径 : 文本)
		如果 ZIP压缩(项目运行路径R,运行缓存路径 + "R.zip") 则
			如果 ZIP压缩(项目运行路径B,运行缓存路径 + "B.zip") 则
				如果 ZIP解压(运行缓存路径 + "R.zip",路径 + "resource_packs/" + 随机类.UUID()) 则
					如果 ZIP解压(运行缓存路径 + "B.zip",路径 + "behavior_packs/" + 随机类.UUID()) 则
						复制JSON(路径)
					否则
						运行弹窗.错误弹窗("在复制的时候发生错误，错误代码：B(0)")
					结束 如果
				否则
					运行弹窗.错误弹窗("在复制的时候发生错误，错误代码：R(0)")
				结束 如果
			否则
				运行弹窗.错误弹窗("在复制的时候发生错误，错误代码：B")	
			结束 如果
		否则
			运行弹窗.错误弹窗("在复制的时候发生了错误，错误代码：R")
		结束 如果
	结束 方法

	方法 复制JSON(路径 : 文本)
		//world_resource_packs
		如果 写出资源文件(取安卓环境(),"data/world/world_resource_packs.json",路径 + "world_resource_packs.json") 则
			如果 写出资源文件(取安卓环境(),"data/world/world_behavior_packs.json",路径 + "world_behavior_packs.json") 则
				如果 写出资源文件(取安卓环境(),"data/world/world_resource_pack_history.json",路径 + "world_resource_pack_history.json") 则
					如果 写出资源文件(取安卓环境(),"data/world/world_behavior_packs_history.json",路径 + "world_behavior_packs_history.json") 则
						写入JSON_world(路径)
					否则
						运行弹窗.错误弹窗("生成world_behavior_packs_history失败！")
					结束 如果
				否则
					运行弹窗.错误弹窗("生成world_resource_pack_history失败！")
				结束 如果
			否则
				运行弹窗.错误弹窗("生成world_behavior_packs失败！")
			结束 如果
		否则
			运行弹窗.错误弹窗("生成world_resource_packs失败！")
		结束 如果
	结束 方法

	方法 写入JSON_world(路径 : 文本)
		//world
		变量 json_0 : JSON数组 = 读入文本文件(路径 + "world_resource_packs.json")
		变量 json_1 : JSON数组 = 读入文本文件(路径 + "world_behavior_packs.json")
		//world_resource_packs.json
		变量 json_A : JSON对象
		json_A["pack_id"] = 读取清单_1_UUID()
		json_A["version"] = 读取清单_1_version()
		json_0.置入(json_A)
		写出文本文件(路径 + "world_resource_packs.json",json_0.到文本())
		//world_behavior_packs.json
		变量 json_B : JSON对象
		json_B["pack_id"] = 读取清单_2_UUID()
		json_B["version"] = 读取清单_2_version()
		json_1.置入(json_B)
		写出文本文件(路径 + "world_behavior_packs.json",json_1.到文本())
		//加载方法
		写入JSON_world_history(路径)
	结束 方法

	方法 写入JSON_world_history(路径 : 文本)
		//world
		变量 json_0 : JSON对象 = 读入文本文件(路径 + "world_resource_pack_history.json")
		变量 json_1 : JSON对象 = 读入文本文件(路径 + "world_behavior_packs_history.json")
		变量 json_0_A : JSON数组 = json_0["packs"]
		变量 json_0_B : JSON数组 = json_1["packs"]
		//
		变量 json_A : JSON对象
		json_A["can_be_redownloaded"] = 假
		json_A["name"] = 读取清单_NAME()
		json_A["uuid"] = 读取清单_1_UUID()
		json_A["version"] = 读取清单_1_version()
		//
		变量 json_B : JSON对象
		json_B["can_be_redownloaded"] = 假
		json_B["name"] = 读取清单_NAME()
		json_B["uuid"] = 读取清单_2_UUID()
		json_B["version"] = 读取清单_2_version()
		//
		json_0_A.置入(json_A)
		json_0_B.置入(json_B)
		//
		json_0["packs"] = json_0_A
		json_1["packs"] = json_0_B
		//
		写出文本文件(路径 + "world_resource_pack_history.json",json_0.到文本())
		写出文本文件(路径 + "world_behavior_packs_history.json",json_1.到文本())
		//方法
		结束相关操作()
	结束 方法

	方法 结束相关操作()
		//关闭弹窗
		运行弹窗.关闭普通对话()
		//提示
		弹出成功提示("成功运行，开始打开游戏！")
		//打开应用
		如果 设置_设定.获取文本("BasicGamePackName").替换(" ","") == "" 则
		否则
			如果 打开应用(取安卓环境(),设置_设定.获取文本("BasicGamePackName")) 则
			否则
				弹出错误提示("尝试启动游戏：" + 设置_设定.获取文本("BasicGamePackName") + "包名时发生异常，有可能游戏不存在或者包名填写错误")
			结束 如果
		结束 如果
	结束 方法

	方法 读取清单_NAME() : 文本
		变量 R清单路径 : 文本 = 项目运行路径R + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 name : 文本 = header["name"]
		返回 name
	结束 方法

	方法 读取清单_1_UUID() : 文本
		变量 R清单路径 : 文本 = 项目运行路径R + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 uuid : 文本 = header["uuid"]
		返回 uuid
	结束 方法

	方法 读取清单_2_UUID() : 文本
		变量 R清单路径 : 文本 = 项目运行路径B + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 uuid : 文本 = header["uuid"]
		返回 uuid
	结束 方法

	方法 读取清单_1_version() : JSON数组
		变量 R清单路径 : 文本 = 项目运行路径R + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 version : JSON数组 = header["version"]
		返回 version
	结束 方法

	方法 读取清单_2_version() : JSON数组
		变量 R清单路径 : 文本 = 项目运行路径B + "manifest.json"
		变量 json : JSON对象 = 读入文本文件(R清单路径)
		变量 header : JSON对象 = json["header"]
		变量 version : JSON数组 = header["version"]
		返回 version
	结束 方法

结束 类

类 模块_运行_弹窗 : 组件容器

	变量 设置_设定 : 设置_设定

	变量 运行对话框 : 对话框
	变量 对话框布局 : 模块_运行_弹窗布局

	变量 错误对话框 : 对话框
	变量 错误框布局 : 模块_运行_弹窗布局2

	方法 初始化()
		//加载对话框
		运行对话框.自定义布局 = 对话框布局
		运行对话框.背景颜色 = 0X00000000
		运行对话框.可取消 = 假
		运行对话框.显示()
		//加载图片
		如果 写出资源文件(取安卓环境(),"icon/gif/bin_pack.gif",其他_变量.缓存目录 + "bin/bin_pack.gif") 则
			对话框布局.GIF动画框1.动画路径 = 其他_变量.缓存目录 + "bin/bin_pack.gif"
		结束 如果
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			对话框布局.卡片布局1.卡片背景颜色 = 0XFF262626
			对话框布局.线性布局2.背景颜色 = 0XFF262626
			对话框布局.文本框1.字体颜色 = 0XFFFFFFFF
			对话框布局.文本框2.字体颜色 = 0XFF878787
			对话框布局.文本框3.字体颜色 = 0XFF878787
		结束 如果
	结束 方法

	方法 普通对话(内容 : 文本)
		对话框布局.文本框3.内容 = 内容
	结束 方法

	方法 关闭普通对话()
		运行对话框.关闭()
	结束 方法

	方法 错误弹窗(内容 : 文本)
		//关闭普通对话框
		运行对话框.关闭()
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

类 模块_运行_弹窗布局 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=300,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=150,高度DP=150]])
	变量 GIF动画框1 : GIF动画框
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="项目打包运行中",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,对齐方式=17,@上外边距DP=10,字体大小=13,内容="构建详细会保存到 [xxx.logs] 日志文件中\n日志路径：Addons_Makes/data/logs/pack_logs"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="正在运行中清单文件..."]])
	变量 文本框3 : 文本框

结束 类

类 模块_运行_弹窗布局2 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=150,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="运行失败！",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="Manifest File 丢失",字体颜色=-2145469]])
	变量 文本框3 : 文本框

结束 类