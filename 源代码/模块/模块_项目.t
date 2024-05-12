类 模块_项目

	@隐藏
	变量 item : 文本
	@隐藏
	变量 icon : 文本
	@隐藏
	变量 icon_type : 整数
	@隐藏
	变量 name : 文本
	@隐藏
	变量 identifier : 文本
	@隐藏
	变量 describe : 文本
	@隐藏
	变量 kind : 文本
	@隐藏
	变量 type : 文本
	@隐藏
	变量 uuid : 文本
	@隐藏
	变量 time : 文本
	
	@隐藏
	变量 path_json : JSON数组
	
	方法 初始化()
		//设置变量
		item = 其他_其他.读缓存("ProjectName")
		uuid = 随机类.UUID()
		time = 取格式时间("YYYY-MM-dd hh:mm:ss")
	结束 方法
	
	属性写 图标(路径 : 文本)
		icon = 路径
		icon_type = 0
	结束 属性
	//图标 和 assets图标 只能选择一个
	属性写 assets图标(路径 : 文本)
		icon = 路径
		icon_type = 1
	结束 属性

	属性写 名称(内容 : 文本)
		name = 内容
	结束 属性

	属性写 标识符(ID : 文本)
		identifier = ID
	结束 属性

	属性写 描述(内容 : 文本)
		describe = 内容
	结束 属性

	属性写 种类(内容 : 文本)
		kind = 内容
	结束 属性
	
	属性写 分类(内容 : 文本)
		type = 内容
	结束 属性
	
	属性写 路径(路径 : 文本)
		path_json.置入(路径.到文本())
	结束 属性
	
	方法 保存()
		//路径
		变量 项目路径 : 文本 = 其他_变量.项目目录 + item + "/data/item/"
		变量 项目路径转换 : 文本 = 项目路径 + kind + "_" + 随机类.UUID() + "/"
		//图标
		如果 icon_type == 0 则
			复制文件(icon,项目路径转换 + "icon.png")
			否则
				写出附加资源文件(icon,项目路径转换 + "icon.png")
		结束 如果
		//清单
		变量 json : JSON对象
		json["name"] = name
		json["identifier"] = identifier
		json["describe"] = describe
		json["kind"] = kind
		json["type"] = type
		json["uuid"] = uuid
		json["time"] = time
		写出文本文件(项目路径转换 + "manifest.json",json.到文本(4))
		//路径
		写出文本文件(项目路径转换 + "path.json",path_json.到文本(4))
	结束 方法

结束 类

类 模块_项目种类

	@静态
	变量 资源包 : 文本 = "resource"

	@静态
	变量 行为包 : 文本 = "behaviour"

	@静态
	变量 Addon : 文本 = "addons"

结束 类