类 模块_打包 : 组件容器

	变量 设置_设定 : 设置_设定
	变量 模块_打包_功能 : 模块_打包_弹窗

	//变量
	变量 项目路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/"
	变量 bin路径 : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/"
	变量 项目打包路径R : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/addon_bin/" + 其他_其他.读缓存("ProjectName") + "_resource_pack/"
	变量 项目打包路径B : 文本 = 其他_变量.项目目录 + 其他_其他.读缓存("ProjectName") + "/bin/addon_bin/" + 其他_其他.读缓存("ProjectName") + "_behavior_pack/"

	变量 Time : 长整数
	变量 Switch : 逻辑型

	//检验
	变量 项目图标R : 逻辑型 = 假
	变量 项目图标B : 逻辑型 = 假
	变量 项目清单R : 逻辑型 = 假
	变量 项目清单B : 逻辑型 = 假

	方法 开始()
		//初始化用时
		Time = 取当前时间戳()
		//初始化
		模块_打包_功能.初始化()
		Switch = 真
		//执行方法
		如果 Switch 则
			开始s()
		结束 如果
	结束 方法

	@异步方法
	方法 开始s()
		//自动清理缓存
		如果 设置_设定.获取开关("BasicRunPackAutoClearCache") 则
			模块_打包_功能.普通对话("开始清理缓存！")
			模块_打包_功能.正常("开始清理缓存！")
			模块_打包_功能.普通对话("清理addon_bin缓存中")
			模块_打包_功能.正常("清理addon_bin缓存中")
			等待 删除文件(bin路径 + "addon_bin")
			如果 文件是否存在(bin路径 + "addon_bin") 则
				模块_打包_功能.错误弹窗("addon_bin清理失败！")
				模块_打包_功能.错误("addon_bin清理失败！")
			否则
				模块_打包_功能.普通对话("addon_bin缓存清理完毕")
				模块_打包_功能.正常("addon_bin缓存清理完毕！")
			结束 如果
			模块_打包_功能.普通对话("清理R.zip缓存中")
			模块_打包_功能.正常("清理R.zip缓存中")
			等待 删除文件(bin路径 + "R.zip")
			如果 文件是否存在(bin路径 + "R.zip") 则
				模块_打包_功能.错误弹窗("R.zip清理失败！")
				模块_打包_功能.错误("R.zip清理失败！")
			否则
				模块_打包_功能.普通对话("R.zip缓存清理完毕")
				模块_打包_功能.正常("R.zip缓存清理完毕！")
			结束 如果
			模块_打包_功能.普通对话("清理B.zip缓存中")
			模块_打包_功能.正常("清理B.zip缓存中")
			等待 删除文件(bin路径 + "B.zip")
			如果 文件是否存在(bin路径 + "B.zip") 则
				模块_打包_功能.错误弹窗("B.zip清理失败！")
				模块_打包_功能.错误("B.zip清理失败！")
			否则
				模块_打包_功能.普通对话("B.zip缓存清理完毕")
				模块_打包_功能.正常("B.zip缓存清理完毕！")
			结束 如果
			如果 文件是否存在(bin路径 + "addon_bin") 则
			否则
				如果 文件是否存在(bin路径 + "R.zip") 则
				否则
					如果 文件是否存在(bin路径 + "B.zip") 则
					否则
						开始ss()
					结束 如果
				结束 如果
			结束 如果
		否则
			开始ss()
		结束 如果
	结束 方法

	方法 开始ss()
		//检查图标
		如果 文件是否存在(项目路径 + "icon.png") 则
			如果 复制文件(项目路径 + "icon.png",项目打包路径R + "pack_icon.png") 则
				模块_打包_功能.普通对话("资源包图标复制完毕！")
				模块_打包_功能.正常("资源包图标复制完毕！")
				项目图标R = 真
			否则
				模块_打包_功能.错误弹窗("资源包图标复制失败！")
				模块_打包_功能.错误("资源包图标复制失败！")
			结束 如果
			如果 复制文件(项目路径 + "icon.png",项目打包路径B + "pack_icon.png") 则
				模块_打包_功能.普通对话("行为包图标复制完毕！")
				模块_打包_功能.正常("行为包图标复制完毕！")
				项目图标B = 真
			否则
				模块_打包_功能.错误弹窗("行为包图标复制失败！")
				模块_打包_功能.错误("行为包图标复制失败！")
			结束 如果
		否则
			模块_打包_功能.错误弹窗("项目图标丢失！")
			模块_打包_功能.错误("项目图标丢失！")
		结束 如果
		//清单文件
		如果 项目图标R || 项目图标B 则
			模块_打包_功能.正常("开始检查项目的清单文件")
			如果 文件是否存在(项目路径 + "manifest.json") 则
				模块_打包_功能.普通对话("清单文件存在通过，开始进行下一步，读取清单")
				模块_打包_功能.正常("清单文件存在通过，开始进行下一步，读取清单")
				开始俘获异常()
				变量 json : JSON对象 = 读入文本文件(项目路径 + "manifest.json")
				打包(json)
				俘获所有异常()
				模块_打包_功能.错误弹窗("清单文件读取失败，详细日志：" + 取俘获异常().取异常信息())
				模块_打包_功能.错误("清单文件读取失败，详细日志：" + 取俘获异常().取异常信息())
				结束俘获异常()
			否则
				模块_打包_功能.错误弹窗("构建失败，项目清单文件丢失！")
				模块_打包_功能.错误("构建失败，项目清单文件丢失！")
			结束 如果
		结束 如果
	结束 方法

	方法 打包(json : JSON对象)
		//json变量
		变量 Icon : 文本 = json["Icon"]
		变量 Name : 文本 = json["Name"]
		变量 Author : 文本 = json["Author"]
		变量 Version : 文本 = json["Version"]
		变量 Describe : 文本 = json["Describe"]
		变量 Type : 文本 = json["Type"]
		//Edition
		变量 Edition : JSON对象 = json["Edition"]
		变量 format_version : 文本 = Edition["format_version"]
		变量 vanilla : 文本 = Edition["vanilla"]
		变量 base_game_version : 文本 = Edition["base_game_version"]
		变量 min_engine_version : 文本 = Edition["min_engine_version"]
		//Metadata
		变量 Metadata : JSON对象 = json["Metadata"]
		变量 authors : 文本 = Metadata["authors"]
		变量 license : 文本 = Metadata["license"]
		变量 url : 文本 = Metadata["url"]
		变量 generated_with : JSON对象 = Metadata["generated_with"]
		变量 example_tool : 文本 = generated_with["example_tool"]
		//JavaScript
		变量 JavaScript : JSON对象 = json["JavaScript"]
		变量 description : 文本 = JavaScript["description"]
		变量 type : 文本 = JavaScript["type"]
		变量 uuid : 文本 = JavaScript["uuid"]
		变量 version : 文本 = JavaScript["version"]
		变量 entry : 文本 = JavaScript["entry"]
		//UUID
		变量 UUID : JSON对象 = json["UUID"]
		变量 uuid1 : 文本 = UUID["uuid1"]
		变量 uuid2 : 文本 = UUID["uuid2"]
		变量 uuid3 : 文本 = UUID["uuid3"]
		变量 uuid4 : 文本 = UUID["uuid4"]
		//Option
		变量 Option : JSON对象 = json["Option"]
		变量 Dependence : 逻辑型 = Option["Dependence"]
		变量 JavaScripts : 逻辑型 = Option["JavaScript"]
		变量 Metadatas : 逻辑型 = Option["Metadata"]

		变量 Version数组 : 文本[] = Version.替换(" ","").分割文本(",")
		变量 vanilla数组 : 文本[] = vanilla.替换(" ","").分割文本(",")
		变量 min_engine_version数组 : 文本[] = min_engine_version.替换(" ","").分割文本(",")
		变量 jsVersion : 文本[] = version.替换(" ","").分割文本(",")

		//生成资源包清单文件
		变量 根对象 : JSON对象
		根对象["format_version"] = format_version.到整数()
		变量 header : JSON对象
		header["name"] = 项目中文转Unicode(Name)
		header["author"] = 项目中文转Unicode(Author)
		变量 versions : JSON数组
		versions[0] = Version数组[0].到整数()
		versions[1] = Version数组[1].到整数()
		versions[2] = Version数组[2].到整数()
		header["version"] = versions
		header["description"] = 项目中文转Unicode(Describe)
		header["uuid"] = uuid1
		变量 vanillas : JSON数组
		vanillas[0] = vanilla数组[0].到整数()
		vanillas[1] = vanilla数组[1].到整数()
		vanillas[2] = vanilla数组[2].到整数()
		header["vanilla"] = vanillas
		变量 min_engine_versions : JSON数组
		min_engine_versions[0] = min_engine_version数组[0].到整数()
		min_engine_versions[1] = min_engine_version数组[1].到整数()
		min_engine_versions[2] = min_engine_version数组[2].到整数()
		header["min_engine_version"] = min_engine_versions
		根对象["header"] = header
		变量 modules : JSON数组
		变量 modules_1 : JSON对象
		modules_1["description"] = 项目中文转Unicode(Describe)
		modules_1["type"] = "resources"
		modules_1["uuid"] = uuid2
		变量 Versions : JSON数组
		Versions[0] = Version数组[0].到整数()
		Versions[1] = Version数组[1].到整数()
		Versions[2] = Version数组[2].到整数()
		modules_1["version"] = Versions
		modules[0] = modules_1
		根对象["modules"] = modules

		//附加包依赖
		如果 Dependence 则
			变量 dependencies : JSON数组
			变量 dependencies_1 : JSON对象
			dependencies_1["uuid"] = uuid3
			变量 version : JSON数组
			version[0] = Version数组[0].到整数()
			version[1] = Version数组[1].到整数()
			version[2] = Version数组[2].到整数()
			dependencies_1["version"] = version
			dependencies[0] = dependencies_1
			根对象["dependencies"] = dependencies
		结束 如果
		写出文本文件(项目打包路径R + "manifest.json",根对象.到文本(4))
		如果 文件是否存在(项目打包路径R + "manifest.json") 则
			模块_打包_功能.普通对话("成功在资源包中生成清单！")
			模块_打包_功能.正常("成功在资源包中生成清单！")
			项目清单R = 真
		否则
			模块_打包_功能.错误弹窗("资源包生成清单失败！")
			模块_打包_功能.错误("资源包生成清单失败！")
		结束 如果

		//生成行为包清单文件
		变量 根对象2 : JSON对象
		根对象2["format_version"] = format_version.到整数()
		变量 header2 : JSON对象
		header2["name"] = 项目中文转Unicode(Name)
		header2["author"] = 项目中文转Unicode(Author)
		变量 version2 : JSON数组
		version2[0] = Version数组[0].到整数()
		version2[1] = Version数组[1].到整数()
		version2[2] = Version数组[2].到整数()

		header2["version"] = version2
		header2["description"] = 项目中文转Unicode(Describe)
		header2["uuid"] = uuid3
		变量 min_engine_version2 : JSON数组
		min_engine_version2[0] = min_engine_version数组[0].到整数()
		min_engine_version2[1] = min_engine_version数组[1].到整数()
		min_engine_version2[2] = min_engine_version数组[2].到整数()

		header2["min_engine_version"] = min_engine_version2

		根对象2["header"] = header2

		变量 modules2 : JSON数组

		//modules_描述
		变量 modules_12 : JSON对象
		modules_12["description"] = 项目中文转Unicode(Describe)
		modules_12["type"] = "data"
		modules_12["uuid"] = uuid4
		变量 versions2 : JSON数组
		versions2[0] = Version数组[0].到整数()
		versions2[1] = Version数组[1].到整数()
		versions2[2] = Version数组[2].到整数()
		modules_12["version"] = versions2
		modules2.置入(modules_12)

		//modules_js
		如果 JavaScripts 则
			变量 modules_js : JSON对象
			modules_js["language"] = "javascript"
			modules_js["type"] = "script"
			modules_js["description"] = 项目中文转Unicode(description)
			modules_js["uuid"] = uuid
			modules_js["entry"] = entry
			变量 versionsjs : JSON数组
			versionsjs[0] = jsVersion[0].到整数()
			versionsjs[1] = jsVersion[1].到整数()
			versionsjs[2] = jsVersion[2].到整数()
			modules_js["version"] = versionsjs
			modules2.置入(modules_js)
		结束 如果

		根对象2["modules"] = modules2

		如果 Dependence 则
			变量 dependencies2 : JSON数组
			变量 dependencies_12 : JSON对象
			dependencies_12["uuid"] = uuid1
			变量 versionss2 : JSON数组
			versionss2[0] = Version数组[0].到整数()
			versionss2[1] = Version数组[1].到整数()
			versionss2[2] = Version数组[2].到整数()
			dependencies_12["version"] = versionss2
			dependencies2[0] = dependencies_12
			根对象2["dependencies"] = dependencies2
		结束 如果

		//JavaScript - description
		如果 JavaScripts 则
			变量 pathname : 文本 = "data/bins/javascript_description.json"
			变量 description : JSON数组 = 读入资源文件(取安卓环境(),pathname)
			根对象2["description"] = description
		结束 如果

		如果 Metadatas 则
			变量 example_tool数组 : 文本[] = example_tool.替换(" ","").替换("【","").替换("】","").分割文本(",")
			变量 metadata2 : JSON对象
			变量 authors2 : JSON数组
			authors2[0] = authors
			metadata2["authors"] = authors2
			metadata2["license"] = license
			metadata2["url"] = url
			变量 generated_with2 : JSON对象
			变量 example_tool2 : JSON数组
			example_tool2[0] = example_tool数组[0]
			example_tool2[1] = example_tool数组[1]
			generated_with2["example_tool"] = example_tool2
			metadata2["generated_with"] = generated_with2
			根对象2["metadata"] = metadata2
		结束 如果

		写出文本文件(项目打包路径B + "manifest.json",根对象2.到文本(4))
		如果 文件是否存在(项目打包路径B + "manifest.json") 则
			模块_打包_功能.普通对话("成功在行为包中生成清单！")
			模块_打包_功能.正常("成功在行为包中生成清单！")
			项目清单B = 真
		否则
			模块_打包_功能.错误弹窗("行为包生成清单失败！")
			模块_打包_功能.错误("行为包生成清单失败！")
		结束 如果

		//打包
		如果 项目清单R || 项目清单B 则
			//检查json
			写出文本文件(项目路径 + "resource/null","")
			写出文本文件(项目路径 + "behaviour/null","")
			删除文件(项目路径 + "resource/null")
			删除文件(项目路径 + "behaviour/null")
			检查json文件(项目路径 + "resource")
			检查json文件(项目路径 + "behaviour")
			//开始执行
			开始俘获异常()
			打包2()
			俘获所有异常()
			变量 错误日志 : 文本 = 取俘获异常().取异常信息()
			模块_打包_功能.错误弹窗("出现了错误，错误日志：" + 错误日志)
			模块_打包_功能.错误("出现了错误，错误日志：" + 错误日志)
			结束俘获异常()
		结束 如果

	结束 方法

	@异步方法
	方法 打包2()
		//复制资源包
		模块_打包_功能.普通对话("开始复制resource")
		模块_打包_功能.正常("开始复制resource")
		等待 ZIP压缩(项目路径 + "resource",项目路径 + "bin/R.zip")
		等待 ZIP解压(项目路径 + "bin/R.zip",项目打包路径R)
		//复制行为包
		模块_打包_功能.普通对话("开始复制behaviour")
		模块_打包_功能.正常("开始复制behaviour")
		等待 ZIP压缩(项目路径 + "behaviour",项目路径 + "bin/B.zip")
		等待 ZIP解压(项目路径 + "bin/B.zip",项目打包路径B)
		//打包RB
		如果 设置_设定.获取开关("BasicPackRB") 则
			//打包资源包
			模块_打包_功能.普通对话("开始打包resource pack")
			模块_打包_功能.正常("开始打包resource pack")
			等待 ZIP压缩(项目打包路径R,项目路径 + "bin/" + 其他_其他.读缓存("ProjectName") + "_resource.mcpack")
			模块_打包_功能.普通对话("资源包打包结束，开始打包行为包！")
			模块_打包_功能.正常("资源包打包结束，开始打包行为包！")
			//打包行为包
			模块_打包_功能.普通对话("开始打包behaviour pack")
			模块_打包_功能.正常("开始打包behaviour pack")
			等待 ZIP压缩(项目打包路径B,项目路径 + "bin/" + 其他_其他.读缓存("ProjectName") + "_behavior.mcpack")
			模块_打包_功能.普通对话("行为包打包结束，开始打包Addons-on！")
			模块_打包_功能.正常("行为包打包结束，开始打包Addons-on！")
		结束 如果
		//打包addons包
		模块_打包_功能.普通对话("开始打包Addons-on")
		模块_打包_功能.正常("开始打包Addons-on")
		等待 ZIP压缩(项目路径 + "bin/addon_bin",项目路径 + "bin/" + 其他_其他.读缓存("ProjectName") + ".mcaddon")
		模块_打包_功能.普通对话("打包结束，开始检查资源完整！")
		模块_打包_功能.正常("打包结束，开始检查资源完整！")
		//结束打包
		模块_打包_功能.关闭普通对话()
		结束打包()
	结束 方法

	方法 结束打包()
		//变量
		变量 结束打包对话框 : 对话框
		变量 结束打包对话框布局 : 模块_打包_弹窗布局3
		变量 成功打包 : 逻辑型 = 假
		//加载对话框
		结束打包对话框.自定义布局 = 结束打包对话框布局 
		结束打包对话框.背景颜色 = 0X00000000
		结束打包对话框.显示()
		//修改布局
		结束打包对话框布局 .按钮1.阴影 = 0
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			结束打包对话框布局.卡片布局1.卡片背景颜色 = 0XFF262626
			结束打包对话框布局.线性布局2.背景颜色 = 0XFF262626
			结束打包对话框布局.文本框1.字体颜色 = 0XFFFFFFFF
			结束打包对话框布局.按钮1.背景颜色 = 0XFF262626
			结束打包对话框布局.按钮1.字体颜色 = 0XFFFFFFFF
		结束 如果
		//检查打包后的文件完整性
		如果 文件是否存在(bin路径 + 其他_其他.读缓存("ProjectName") + ".mcaddon") 则
			结束打包对话框布局.文本框2.内容 = "Addons-on 生成成功！"
			结束打包对话框布局.文本框2.字体颜色 = 0XFF64AD68
			成功打包 = 真
			模块_打包_功能.正常("Addons-on 生成成功！")
		否则
			结束打包对话框布局.文本框2.内容 = "Addons-on 生成失败！"
			结束打包对话框布局.文本框2.字体颜色 = 0XFFE14040
			模块_打包_功能.错误("Addons-on 生成失败！")
		结束 如果
		如果 文件是否存在(bin路径 + 其他_其他.读缓存("ProjectName") + "_resource.mcpack") 则
			结束打包对话框布局.文本框3.内容 = "resource_pack 生成成功！"
			结束打包对话框布局.文本框3.字体颜色 = 0XFF64AD68
			模块_打包_功能.正常("resource_pack 生成成功！")
		否则
			结束打包对话框布局.文本框3.内容 = "resource_pack 生成失败！"
			结束打包对话框布局.文本框3.字体颜色 = 0XFFE14040
			模块_打包_功能.错误("resource_pack 生成失败！")
		结束 如果
		如果 文件是否存在(bin路径 + 其他_其他.读缓存("ProjectName") + "_behavior.mcpack") 则
			结束打包对话框布局.文本框4.内容 = "behaviour_pack 生成成功！"
			结束打包对话框布局.文本框4.字体颜色 = 0XFF64AD68
			模块_打包_功能.正常("behaviour_pack 生成成功！")
		否则
			结束打包对话框布局.文本框4.内容 = "behaviour_pack 生成失败！"
			结束打包对话框布局.文本框4.字体颜色 = 0XFFE14040
			模块_打包_功能.错误("behaviour_pack 生成失败！")
		结束 如果
		如果 设置_设定.获取开关("BasicPackRB") 则
			结束打包对话框布局.文本框3.可视 = 真
			结束打包对话框布局.文本框4.可视 = 真
		否则
			结束打包对话框布局.文本框3.可视 = 假
			结束打包对话框布局.文本框4.可视 = 假
		结束 如果
		//开始退出
		如果 成功打包 则
			//获取打包用时
			变量 获取最终时间 : 长整数 = 取当前时间戳() - Time
			变量 转化为文本 : 文本 =  时间戳到文本(获取最终时间,"ss.ms") + " 秒"
			//提示
			弹出成功提示("打包结束！")
			弹出成功通知("打包结束，用时：" + 转化为文本)
			模块_打包_功能.正常("打包结束，用时：" + 转化为文本)
			//保存日志
			模块_打包_功能.保存日志()
			//关闭当前弹窗
			结束打包对话框布局.按钮1.内容 = "关闭弹窗，用时：" + 转化为文本
		否则
			结束打包对话框布局.按钮1.内容 = "未找到打包后的Addon-on.mcaddon，判断为失败，关闭当前弹窗，重新打包"
		结束 如果
		//加载退出按钮事件
		事件 结束打包对话框布局.按钮1:被单击()
			结束打包对话框.关闭()
		结束 事件
	结束 方法

	方法 项目中文转Unicode(内容 : 文本) : 文本
		变量 项目名称 : 文本 = 其他_其他.读缓存("ProjectName")
		变量 清单文件内容 : 文本 = 读入文本文件(其他_变量.项目目录 + 项目名称 + "/manifest.json","utf-8")
		变量 json清单文件内容 : JSON对象 = 清单文件内容
		变量 json清单文件内容Option : JSON对象 = json清单文件内容["Option"]
		如果 json清单文件内容Option["Unicode"].到文本().到逻辑值() 则
			返回 中文转Unicode(内容)
		否则
			返回 内容
		结束 如果
	结束 方法

	方法 检查json文件(folderPath:文本)
		变量 列表数组 : 文本集合
		列表数组 = 取子文件集合(folderPath)
		循环(i, 0, 列表数组.长度)
			如果 是否为目录(列表数组[i]) 则
				检查json文件(列表数组[i])
			否则
				如果 取文件后缀名(列表数组[i]).到小写() == "json" 则
					开始俘获异常()
					变量 json : JSON对象 = 读入文本文件(列表数组[i])
					调试输出(json.到文本(4))
					俘获所有异常()
					模块_打包_功能.错误(取文件名(列表数组[i]) + "出现了错误，可能会在游戏中失效，错误日志：" + 取俘获异常().取异常信息())
					结束俘获异常()
				结束 如果
			结束 如果
		结束 循环
	结束 方法

结束 类

类 模块_打包_弹窗 : 组件容器

	变量 日志 : 文本 = ""
	变量 项目名 : 文本 = 其他_其他.读缓存("ProjectName")

	变量 设置_设定 : 设置_设定

	变量 构建对话框 : 对话框
	变量 对话框布局 : 模块_打包_弹窗布局

	变量 错误对话框 : 对话框
	变量 错误框布局 : 模块_打包_弹窗布局2

	方法 初始化()
		//加载对话框
		构建对话框.自定义布局 = 对话框布局
		构建对话框.背景颜色 = 0X00000000
		构建对话框.可取消 = 假
		构建对话框.显示()
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
		构建对话框.关闭()
	结束 方法

	方法 错误弹窗(内容 : 文本)
		//关闭普通对话框
		构建对话框.关闭()
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
			错误框布局.文本框2.字体颜色 = 0XFF878787
			错误框布局.文本框3.字体颜色 = 0XFFFF0000
		结束 如果
	结束 方法

	//正常
	方法 正常(内容 : 文本)
		变量 初始内容 : 文本 = 日志
		变量 内容2 : 文本 = "normal>" + 取格式时间("yyyy-MM-dd hh:mm:ss:ms") + "(" + "任务：" + 项目名 + " ==> " + 内容 + ")"
		变量 输出内容 : 文本 = 初始内容 + 内容2 + "\n"
		日志 = 输出内容
	结束 方法
	//警告
	方法 警告(内容 : 文本)
		变量 初始内容 : 文本 = 日志
		变量 内容2 : 文本 = "alert>" + 取格式时间("yyyy-MM-dd hh:mm:ss:ms") + "(" + "任务：" + 项目名 + " ==> " + 内容 + ")"
		变量 输出内容 : 文本 = 初始内容 + 内容2 + "\n"
		日志 = 输出内容
	结束 方法
	//错误
	方法 错误(内容 : 文本)
		变量 初始内容 : 文本 = 日志
		变量 内容2 : 文本 = "mistake>" + 取格式时间("yyyy-MM-dd hh:mm:ss:ms") + "(" + "任务：" + 项目名 + " ==> " + 内容 + ")"
		变量 输出内容 : 文本 = 初始内容 + 内容2 + "\n"
		日志 = 输出内容
	结束 方法

	方法 保存日志()
		如果 设置_设定.获取开关("BasicRunPackSaveLog") 则
			变量 日志目录 : 文本 = 其他_变量.数据目录 + "logs/pack_logs/"
			写出文本文件(日志目录 + 取格式时间("YYYY-MM-dd hh:mm:ss:ms") + ".logs",日志)
		结束 如果
	结束 方法

结束 类

类 模块_打包_弹窗布局 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=300,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=150,高度DP=150]])
	变量 GIF动画框1 : GIF动画框
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="项目打包中",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,对齐方式=17,@上外边距DP=10,字体大小=13,内容="构建详细会保存到 [xxx.logs] 日志文件中\n日志路径：Addons_Makes/data/logs/pack_logs"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="正在构建中清单文件..."]])
	变量 文本框3 : 文本框

结束 类

类 模块_打包_弹窗布局2 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=200,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="打包失败！",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,对齐方式=17,@上外边距DP=10,字体大小=13,内容="构建详细会保存到 [xxx.logs] 日志文件中\n日志路径：Addons_Makes/data/logs/pack_logs"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="Manifest File 丢失",字体颜色=-2145469]])
	变量 文本框3 : 文本框

结束 类

类 模块_打包_弹窗布局3 : 组件容器

	@布局配置([[根布局=真,宽度=-1,高度=-2]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=220,圆角=25,卡片阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,对齐方式=17,内容="打包完毕！",字体大小=20,粗体=真,@上外边距DP=10,字体颜色=-16777216]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,@上外边距DP=10,粗体=真,内容="内容1",字体颜色=-2145469]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,粗体=真,内容="内容1",字体颜色=-2145469]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局2,字体大小=15,对齐方式=17,粗体=真,内容="内容1",字体颜色=-2145469]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局2,@上外边距DP=15,背景颜色=-1,阴影=0,@左外边距DP=10,@右外边距DP=10]])
	变量 按钮1 : 按钮

结束 类