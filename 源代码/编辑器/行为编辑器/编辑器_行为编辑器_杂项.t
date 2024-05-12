类 编辑器_行为编辑器_资源

	@静态
	变量 白色返回图标 : 图片资源 =  "../../../../资源库/图标/back/default_backicon2.png"

	@静态
	变量 白色菜单图标 : 图片资源 =  "../../../../资源库/图标/editor/resource_editor/menu2.png"

	@静态
	变量 文件 : 图片资源 = "../../../../资源库/图标/editor/behavior_editor/types/json.png"

	@静态
	变量 文件夹 : 图片资源 = "../../../../资源库/图标/editor/behavior_editor/types/folder.png"

	@静态
	变量 未知 : 图片资源 = "../../../../资源库/图标/editor/behavior_editor/types/file.png"

结束 类

类 编辑器_行为编辑器_功能

	//生成行为操作记录
	@静态
	方法 生成操作记录(path : 文本)
		//变量
		变量 项目名称 : 文本 = 其他_其他.读缓存("ProjectName")
		变量 输出路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/behaviour/" + path
		变量 操作输出路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/data/behaviour/behavior_record.json"
		如果 文件是否存在(操作输出路径) 则
			变量 根数组 : JSON数组 = 读入文本文件(操作输出路径)
			如果 筛选(path) == -1 则
			否则
				根数组.移除(筛选(path))
			结束 如果
			变量 根对象 : JSON对象
			根对象["name"] = 取文件名(输出路径)
			根对象["type"] = "write"
			根对象["path"] = path
			根对象["time"] = 取格式时间("yyyy-MM-dd HH:mm:ss")
			根数组.置入(根对象)
			写出文本文件(操作输出路径,根数组.到文本(4))
		否则
			写出文本文件(操作输出路径,"[]")
			生成操作记录(path)
		结束 如果
	结束 方法

	@静态
	方法 删除(path : 文本)
		变量 项目名称 : 文本 = 其他_其他.读缓存("ProjectName")
		变量 操作输出路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/data/behaviour/behavior_record.json"
		变量 jsonliat : JSON数组 = 读入文本文件(操作输出路径)
		如果 筛选(path) == -1 则
		否则
			jsonliat.移除(筛选(path))
		结束 如果
		写出文本文件(操作输出路径,jsonliat.到文本(4))
	结束 方法

	@静态
	方法 筛选(path : 文本) : 整数
		变量 项目名称 : 文本 = 其他_其他.读缓存("ProjectName")
		变量 操作输出路径 : 文本 = 其他_变量.项目目录 + 项目名称 + "/data/behaviour/behavior_record.json"
		变量 jsonliat : JSON数组 = 读入文本文件(操作输出路径)
		循环(i, 0, jsonliat.长度)
			变量 json : JSON对象 = jsonliat[i]
			如果 json["path"].到文本() ? path 则
				返回 i
			结束 如果
		结束 循环
		返回 -1
	结束 方法

结束 类