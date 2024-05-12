类 编辑器_项目编辑器_项目_物品 : 窗口

	@布局配置([[根布局=真,宽度=-1,高度=-1]])
	变量 自适应布局1 : 自适应布局
	@布局配置([[父布局=自适应布局1,宽度=-1,高度=-1,@横坐标比例=-9.0E-4,@纵坐标比例=-4.0E-4,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度=-1,高度DP=50,背景颜色=-1,纵向布局=假]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=50,高度DP=50,对齐方式=17]])
	变量 线性布局3 : 线性布局
	@布局配置([[父布局=线性布局3,宽度DP=25,高度DP=25,图片资源="../../../../../资源库/图标/back/default_backicon.png",水波纹效果=真,可获取焦点=真]])
	变量 退出界面 : 图片框
	@布局配置([[父布局=线性布局2,宽度=-1,高度=-1]])
	变量 相对布局1 : 相对布局
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388627,宽度=-1]])
	变量 线性布局6 : 线性布局
	@布局配置([[父布局=线性布局6,字体大小=20,粗体=假,@左外边距DP=10,字体颜色=-16777216,内容="物品"]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=相对布局1,高度DP=50,对齐方式=8388629,宽度=-1]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,宽度DP=50,高度DP=50,对齐方式=17,水波纹效果=真,纵向布局=真]])
	变量 线性布局7 : 线性布局
	@布局配置([[父布局=线性布局7,宽度DP=25,高度DP=25,图片资源="../../../../../资源库/图标/editor/project_editor/save.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局7,字体大小=13,字体颜色=-16777216,内容="保存",对齐方式=17]])
	变量 文本框3 : 文本框
	@布局配置([[父布局=线性布局1,宽度=-1,高度=-1]])
	变量 滚动布局1 : 滚动布局
	@布局配置([[父布局=滚动布局1,宽度=-1,高度=-1,纵向布局=真,内边距DP=10]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度=-1,高度DP=25,卡片阴影=0,圆角=10]])
	变量 卡片布局1 : 卡片布局
	@布局配置([[父布局=卡片布局1,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17]])
	变量 线性布局8 : 线性布局
	@布局配置([[父布局=线性布局8,字体颜色=-16777216,内容="将实验玩法模式打开，才能加载这些内容"]])
	变量 文本框4 : 文本框
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-2,卡片阴影=0,圆角=10,@上外边距DP=10]])
	变量 卡片布局2 : 卡片布局
	@布局配置([[父布局=卡片布局2,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局9 : 线性布局
	@布局配置([[父布局=线性布局9,宽度=-1,类型=0,标题="ID",分割线=假,编辑框提示内容="请输入ID"]])
	变量 编辑器_项目编辑器_列表1 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局9,宽度=-1,类型=0,标题="名称",分割线=真,编辑框提示内容="请输入名称"]])
	变量 编辑器_项目编辑器_列表2 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局9,宽度=-1,类型=3,标题="图标",分割线=真,编辑框提示内容=""]])
	变量 编辑器_项目编辑器_列表3 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-2,卡片阴影=0,圆角=10,@上外边距DP=10]])
	变量 卡片布局3 : 卡片布局
	@布局配置([[父布局=卡片布局3,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局10 : 线性布局
	@布局配置([[父布局=线性布局10,宽度=-1,类型=1,标题="3D 模型",分割线=假,编辑框提示内容="",选中=假]])
	变量 编辑器_项目编辑器_列表4 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局10,宽度=-1,高度=-2,@左外边距DP=10,纵向布局=真,可视=假]])
	变量 线性布局11 : 线性布局
	@布局配置([[父布局=线性布局11,宽度=-1,类型=3,标题="皮肤",分割线=真,编辑框提示内容=""]])
	变量 编辑器_项目编辑器_列表5 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局11,宽度=-1,类型=2,分割线=真,标题="模型编辑器",按钮内容="操作",按钮旁文本内容="default"]])
	变量 编辑器_项目编辑器_列表6 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局11,宽度=-1,类型=2,分割线=真,标题="动画编辑器",按钮内容="操作",按钮旁文本内容="default"]])
	变量 编辑器_项目编辑器_列表7 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-2,卡片阴影=0,圆角=10,@上外边距DP=10]])
	变量 卡片布局4 : 卡片布局
	@布局配置([[父布局=卡片布局4,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局12 : 线性布局
	@布局配置([[父布局=线性布局12,宽度=-1,类型=1,标题="1.16.100 等于或者大于",分割线=假,编辑框提示内容="",选中=假]])
	变量 编辑器_项目编辑器_列表8 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局12,宽度=-1,高度=-2,@左外边距DP=10,纵向布局=真,可视=假]])
	变量 线性布局13 : 线性布局
	@布局配置([[父布局=线性布局13,宽度=-1,类型=1,标题="燃料",分割线=真,编辑框提示内容="",选中=假,高度DP=50]])
	变量 编辑器_项目编辑器_列表9 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局13,宽度=-1,高度=-2,@左外边距DP=10,纵向布局=真,可视=假]])
	变量 线性布局14 : 线性布局
	@布局配置([[父布局=线性布局14,宽度=-1,类型=0,标题="值",分割线=真,编辑框提示内容="请输入值",编辑框输入数字=真,编辑框内容="32"]])
	变量 编辑器_项目编辑器_列表10 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局13,宽度=-1,类型=1,标题="使用函数",分割线=真,编辑框提示内容="",选中=假,高度DP=50]])
	变量 编辑器_项目编辑器_列表11 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局13,宽度=-1,高度=-2,@左外边距DP=10,纵向布局=真,可视=假]])
	变量 线性布局15 : 线性布局
	@布局配置([[父布局=线性布局15,宽度=-1,类型=1,标题="随机化",分割线=真,编辑框提示内容="",选中=假,高度DP=50]])
	变量 编辑器_项目编辑器_列表12 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局15,宽度=-1,类型=2,标题="函数",按钮内容="选择函数",按钮旁文本内容="空",分割线=真]])
	变量 编辑器_项目编辑器_列表13 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局15,宽度=-1,类型=0,标题="执行延迟(s/10)",分割线=真,编辑框提示内容="请输入...",编辑框输入数字=真,编辑框内容="1"]])
	变量 编辑器_项目编辑器_列表14 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-2,卡片阴影=0,圆角=10,@上外边距DP=10]])
	变量 卡片布局5 : 卡片布局
	@布局配置([[父布局=卡片布局5,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局16 : 线性布局
	@布局配置([[父布局=线性布局16,宽度=-1,类型=1,标题="手动装备",分割线=假]])
	变量 编辑器_项目编辑器_列表15 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局16,宽度=-1,类型=1,标题="附魔闪光特效",分割线=真]])
	变量 编辑器_项目编辑器_列表16 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局16,宽度=-1,类型=0,标题="最大堆叠数量",分割线=真,编辑框内容="64",编辑框提示内容="请输入最大堆叠数...",编辑框输入数字=真]])
	变量 编辑器_项目编辑器_列表17 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局5,宽度=-1,高度=-2,卡片阴影=0,圆角=10,@上外边距DP=10]])
	变量 卡片布局6 : 卡片布局
	@布局配置([[父布局=卡片布局6,宽度=-1,高度=-1,背景颜色=-1,对齐方式=17,纵向布局=真]])
	变量 线性布局17 : 线性布局
	@布局配置([[父布局=线性布局17,宽度=-1,类型=1,标题="合成制作",分割线=假]])
	变量 编辑器_项目编辑器_列表18 : 编辑器_项目编辑器_列表
	@布局配置([[父布局=线性布局17,宽度=-1,高度=-2,@左外边距DP=10,纵向布局=真,可视=假]])
	变量 线性布局18 : 线性布局
	@布局配置([[父布局=线性布局18,宽度=-1,类型=0,标题="1",分割线=真,编辑框内容="64",编辑框提示内容="请输入数量...",编辑框输入数字=真]])
	变量 编辑器_项目编辑器_列表19 : 编辑器_项目编辑器_列表

	//声明
	变量 设置_设定 : 设置_设定
	变量 图片选择 : 文件选择器
	变量 文件选择 : 文件选择器
	变量 模块_项目 : 模块_项目

	//json
	变量 json : JSON对象
	变量 resource_items : JSON对象
	变量 behavior_items : JSON对象

	变量 语法版本 : 文本 = "1.10"

	//RB PATH
	变量 R_path : 文本
	变量 B_path : 文本
	//JSON
	变量 editor_id : 文本 = ""
	变量 editor_name : 文本 = ""
	变量 editor_icon : 文本 = ""
	变量 threed_icon : 文本 = ""
	变量 threed_model : 文本 = ""
	变量 threed_animation : 文本 = ""
	变量 highversion_fuel : 整数 = 32
	变量 highversion_function : 文本 = ""
	变量 highversion_time : 整数 = 0
	变量 max_number_stack : 整数 = 0
	变量 recipe_number : 整数 = 0
	变量 hand_equipped : 逻辑型 = 假
	变量 enchant_effects_foil : 逻辑型 = 假
	//动画编辑器
	变量 动画JSON : 文本 = ""
	变量 first_person : 文本 = ""
	变量 third_person : 文本 = ""

	事件 编辑器_项目编辑器_项目_物品:创建完毕()
		//设置主题
		本对象.显示标题栏 = 假
		本对象.状态栏颜色 = 0XFFFFFFFF
		本对象.状态栏字体黑色 = 真
		//窗口切换动画
		播放默认切换动画(2)
		//退出
		事件 退出界面:被单击()
			关闭窗口()
		结束 事件
		//设置夜间模式
		如果 设置_设定.获取开关("NightMode") 则
			设置夜间模式()
		结束 如果
		//设置背景
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("PersonalityBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(本对象,线性布局5,设置相关路径)
			结束 如果
		结束 如果
		//设置变量
		变量 item_name : 文本 = 其他_其他.读缓存("ProjectName")
		R_path = 其他_变量.项目目录 + item_name + "/resource/"
		B_path = 其他_变量.项目目录 + item_name + "/behaviour/"
		编辑器_项目编辑器_列表6.标记值 = 读入附加资源文件("editor/project_editor/models_default.json")
		动画JSON = 读入附加资源文件("editor/project_editor/animation_default.json")
		//初始化
		模块_项目.初始化()
		//设置图片
		编辑器_项目编辑器_列表3.图片框路径 = 其他_变量.根目录 + "icon.png"
		//设置模型皮肤
		变量 模型皮肤图片路径 : 文本 = 其他_变量.缓存目录 + "editor/project_editor/models_default_icon.png"
		写出附加资源文件("editor/project_editor/models_default_icon.png",模型皮肤图片路径)
		编辑器_项目编辑器_列表5.图片框路径 = 模型皮肤图片路径
		//随机数操作
		变量 随机ID : 文本 = "pde:addonitem_" + 取随机数(0,10000)
		//设置编辑框内容
		编辑器_项目编辑器_列表1.编辑框内容 = 随机ID
		编辑器_项目编辑器_列表2.编辑框内容 = "物品名称" + 取随机数(0,10000)
		//设置动画变量
		first_person = "animation." + 随机ID.替换(":","_") + ".first_person"
		third_person = "animation." + 随机ID.替换(":","_") + ".third_person"
		//加载方法
		设置编辑框事件()
		设置按钮事件()
		设置开关事件()

		隐藏一些布局()
		//订阅事件
		订阅事件()
	结束 事件

	//
	方法 隐藏一些布局()
		编辑器_项目编辑器_列表18.可视 = 假
	结束 方法

	//保存
	事件 线性布局7:被单击()
		//变量
		设置全局变量()
		//主
		resource_items()
		resource_textures()
		resource_texts()
		model_items()
		behavior_items()
		//项目记录生成
		项目记录生成()
		//关闭并提示
		弹出提示("保存成功！")
		关闭窗口()
	结束 事件

	方法 设置编辑框事件()
		//ID
		事件 编辑器_项目编辑器_列表1:编辑框被改变()
			变量 ID : 文本 = 编辑器_项目编辑器_列表1.编辑框内容
			first_person = "animation." + ID.替换(":","_") + ".first_person"
			third_person = "animation." + ID.替换(":","_") + ".third_person"
		结束 事件
	结束 方法

	方法 设置按钮事件()
		//选择物品图标
		事件 编辑器_项目编辑器_列表3:图标选择按钮被点击()
			文件选择.选择图片(本对象,1000)
		结束 事件
		//选择函数
		事件 编辑器_项目编辑器_列表13:按钮被点击()
			变量 item_name : 文本 = 其他_其他.读缓存("ProjectName")
			变量 path : 文本 = 其他_变量.项目目录 + item_name + "/behaviour/functions/"
			变量 选择文件 : 其他_选择_文件
			选择文件.普通文本框(假)
			选择文件.项目编辑器列表相关 = 编辑器_项目编辑器_列表13
			选择文件.清除后缀 = 真
			选择文件.允许进入文件夹 = 真
			选择文件.打开("函数选择",path)
		结束 事件
		//选择皮肤
		事件 编辑器_项目编辑器_列表5:图标选择按钮被点击()
			文件选择.选择图片(本对象,1020)
		结束 事件
		//选择模型
		事件 编辑器_项目编辑器_列表6:按钮被点击()
			切换窗口2(编辑器_项目编辑器_附属_模型编辑器, 2000)
		结束 事件
		//选择动画
		事件 编辑器_项目编辑器_列表7:按钮被点击()
			其他_其他.写缓存("project_editor_animation_id",编辑器_项目编辑器_列表1.编辑框内容)
			切换窗口2(编辑器_项目编辑器_附属_动画编辑器, 4000)
		结束 事件
	结束 方法

	方法 设置开关事件()
		//3D 模型开关
		事件 编辑器_项目编辑器_列表4:开关状态改变(选中 : 逻辑型)
			线性布局11.可视 = 选中
		结束 事件
		//1.16.100 版本
		事件 编辑器_项目编辑器_列表8:开关状态改变(选中 : 逻辑型)
			线性布局13.可视 = 选中
			如果 选中 则
				语法版本 = "1.16.0"
			否则
				语法版本 = "1.10"
			结束 如果
		结束 事件
		//燃料
		事件 编辑器_项目编辑器_列表9:开关状态改变(选中 : 逻辑型)
			线性布局14.可视 = 选中
		结束 事件
		//使用函数
		事件 编辑器_项目编辑器_列表11:开关状态改变(选中 : 逻辑型)
			线性布局15.可视 = 选中
			如果 选中 则
				语法版本 = "1.16.100"
			否则
				语法版本 = "1.16.0"
			结束 如果
		结束 事件
		//合成表
		事件 编辑器_项目编辑器_列表18:开关状态改变(选中 : 逻辑型)
			线性布局18.可视 = 选中
		结束 事件
	结束 方法

	方法 设置全局变量()
		//编辑框
		editor_id = 编辑器_项目编辑器_列表1.编辑框内容
		editor_name = 编辑器_项目编辑器_列表2.编辑框内容
		editor_icon = 编辑器_项目编辑器_列表3.图片框路径
		//3D
		threed_icon = 编辑器_项目编辑器_列表5.图片框路径
		threed_model = 编辑器_项目编辑器_列表6.按钮旁文本内容
		threed_animation = 编辑器_项目编辑器_列表7.按钮旁文本内容
		//1.16.100
		highversion_fuel = 编辑器_项目编辑器_列表10.编辑框内容.到整数()
		highversion_function = 编辑器_项目编辑器_列表13.按钮旁文本内容
		highversion_time = 编辑器_项目编辑器_列表14.编辑框内容.到整数()
		//
		max_number_stack = 编辑器_项目编辑器_列表17.编辑框内容.到整数()
		recipe_number = 编辑器_项目编辑器_列表19.编辑框内容.到整数()
		hand_equipped = 编辑器_项目编辑器_列表15.选中
		enchant_effects_foil = 编辑器_项目编辑器_列表16.选中
	结束 方法

	方法 resource_textures()
		//复制图标
		变量 目标路径 : 文本 = R_path + "textures/items/addonide/" + editor_id.替换(":","_") + ".png"
		变量 当前路径 : 文本 = 编辑器_项目编辑器_列表3.图片框路径
		如果 复制文件(当前路径,目标路径) 则
		否则
			弹出错误提示("图标复制失败！")
		结束 如果
		//生成item_texture.json
		编辑器_项目编辑器_功能.resource_item_texture(editor_id)
		//添加进项目记录
		模块_项目.图标 = 目标路径
		模块_项目.路径 = 目标路径
	结束 方法

	方法 resource_texts()
		//item.*.name
		变量 key1 : 文本 = "item." + editor_id + ".name"
		其他_其他.写入语言文件("en_US.lang",key1,editor_name)
		//item.*
		变量 key2 : 文本 = "item." + editor_id
		其他_其他.写入语言文件("en_US.lang",key2,editor_name)
	结束 方法

	方法 resource_items()
		//format_version
		resource_items["format_version"] = "1.10"
		//minecraft:item
		变量 minecraft_item : JSON对象
		//description
		变量 description : JSON对象
		description["identifier"] = editor_id
		description["category"] = "Equipment"
		minecraft_item["description"] = description
		//components
		变量 components : JSON对象
		components["minecraft:icon"] = editor_id
		components["minecraft:render_offsets"] = "miscellaneous"
		minecraft_item["components"] = components
		//
		resource_items["minecraft:item"] = minecraft_item
		//写出
		变量 id_out : 文本 = editor_id.替换(":","_")
		变量 id_path_out : 文本 = R_path + "items/" + id_out + ".json"
		写出文本文件(id_path_out,resource_items.到文本(4))
		//添加进项目记录
		模块_项目.路径 = id_path_out
	结束 方法

	方法 model_items()
		如果 编辑器_项目编辑器_列表4.选中 则
			变量 id_out : 文本 = editor_id.替换(":","_")
			//attachables
			编辑器_项目编辑器_功能.resource_attachables(editor_id,first_person,third_person)
			//复制皮肤
			变量 文件路径0 : 文本 = 编辑器_项目编辑器_列表5.图片框路径
			变量 最终路径0 : 文本 = R_path + "textures/entity/addonide/" + id_out + ".png" 
			如果 文件路径0.替换(" ","") == "" 则
				如果 写出资源文件(本对象,"editor/project_editor/models_default_icon.png",最终路径0) 则
				否则
					弹出错误提示("由于没有选择任何皮肤，开始复制默认皮肤时发生的错误！")
				结束 如果
			否则
				如果 复制文件(文件路径0,最终路径0) 则
				否则
					弹出错误提示("在复制皮肤文件的时候发生了错误！")
				结束 如果
			结束 如果
			//复制模型
			变量 文件JSON1 : 文本 = 编辑器_项目编辑器_列表6.标记值
			变量 json1 : 文本 = 编辑器_项目编辑器_功能.模型文件内ID编辑(文件JSON1,editor_id)
			变量 最终路径1 : 文本 = R_path + "models/entity/" + id_out + ".json" 
			如果 编辑器_项目编辑器_列表6.按钮旁文本内容 == "default" 则
				变量 json_co : 文本 = 读入资源文件(本对象,"editor/project_editor/models_default.json")
				变量 json_cos : 文本 = 编辑器_项目编辑器_功能.模型文件内ID编辑(json_co,editor_id)
				写出文本文件(最终路径1,json_cos)
			否则
				写出文本文件(最终路径1,json1)
			结束 如果
			//复制动画
			变量 json2 : 文本 = 编辑器_项目编辑器_功能.动画文件属性编辑(动画JSON,first_person,third_person)
			变量 最终路径2 : 文本 = R_path + "animations/" + id_out + ".json"
			写出文本文件(最终路径2,json2)
		结束 如果
	结束 方法

	方法 behavior_items()
		//format_version
		behavior_items["format_version"] = 语法版本
		//minecraft_item
		变量 minecraft_item : JSON对象
		//description
		变量 description : JSON对象
		description["identifier"] = editor_id
		description["category"] = "items"
		minecraft_item["description"] = description
		//components
		变量 components : JSON对象
		components["minecraft:hand_equipped"] = hand_equipped
		components["minecraft:max_stack_size"] = max_number_stack
		components["minecraft:foil"] = enchant_effects_foil
		//1.16.100
		如果 编辑器_项目编辑器_列表8.选中 则
			//minecraft:icon
			变量 minecraft_icon : JSON对象
			minecraft_icon["texture"] = editor_id
			components["minecraft:icon"] = minecraft_icon
			//minecraft:display_name
			变量 minecraft_display_name : JSON对象
			minecraft_display_name["value"] = editor_name
			components["minecraft:display_name"] = minecraft_display_name
			//minecraft:fuel
			如果 编辑器_项目编辑器_列表9.选中 则
				变量 minecraft_fuel : JSON对象
				minecraft_fuel["duration"] = highversion_fuel
				components["minecraft:fuel"] = minecraft_fuel
			结束 如果
			//使用函数
			如果 编辑器_项目编辑器_列表11.选中 则
				//minecraft:cooldown
				变量 minecraft_cooldown : JSON对象
				minecraft_cooldown["category"] = 编辑器_项目编辑器_功能.删除ID冒号前面(editor_id)
				minecraft_cooldown["duration"] = highversion_time
				components["minecraft:cooldown"] = minecraft_cooldown
				//minecraft:on_use
				变量 minecraft_on_use : JSON对象
				变量 on_use : JSON对象
				on_use["event"] = "on_use_event"
				minecraft_on_use["on_use"] = on_use
				components["minecraft:on_use"] = minecraft_on_use
			结束 如果
		结束 如果
		minecraft_item["components"] = components
		//1.16.100
		如果 编辑器_项目编辑器_列表8.选中 则
			//command
			变量 command : JSON数组
			command.置入("function " + highversion_function)
			//run_command
			变量 run_command : JSON对象
			run_command["command"] = command
			//on_use_event
			变量 swing : JSON对象
			变量 on_use_event : JSON对象
			on_use_event["swing"] = swing
			如果 highversion_function == "空" 则
			否则
				如果 编辑器_项目编辑器_列表12.选中 则
					变量 randomize : JSON数组
					变量 randomizes : JSON对象
					randomizes["run_command"] = command
					randomizes["weight"] = 1
					randomize.置入(randomizes)
					on_use_event["randomize"] = randomize
				否则
					on_use_event["run_command"] = run_command
				结束 如果
			结束 如果
			//events
			变量 events : JSON对象
			events["on_use_event"] = on_use_event
			minecraft_item["events"] = events
		结束 如果
		behavior_items["minecraft:item"] = minecraft_item
		//写出
		变量 id_out : 文本 = editor_id.替换(":","_")
		变量 id_path_out : 文本 = B_path + "items/" + id_out + ".json"
		写出文本文件(id_path_out,behavior_items.到文本(4))
		//添加进项目记录
		模块_项目.路径 = id_path_out
	结束 方法

	方法 项目记录生成()
		模块_项目.名称 = editor_name
		模块_项目.标识符 = editor_id
		模块_项目.描述 = "这个是Addon"
		模块_项目.种类 = 模块_项目种类.Addon
		模块_项目.分类 = "items"
		模块_项目.保存()
	结束 方法

	//设置夜间模式
	方法 设置夜间模式()
		本对象.状态栏颜色 = 0XFF333333
		本对象.状态栏字体黑色 = 假
		线性布局2.背景颜色 = 0XFF333333
		滚动布局1.背景颜色 = 0XFF222222
		退出界面.图片资源 = 其他_资源.白色默认返回图标
		图片框1.图片资源 = 编辑器_项目编辑器_资源.白色保存图标
		文本框3.字体颜色 = 0XFFFFFFFF
		文本框2.字体颜色 = 0XFFFFFFFF

		文本框4.字体颜色 = 0XFFFFFFFF
		卡片布局1.背景颜色 = 0XFF333333
		卡片布局2.背景颜色 = 0XFF333333
		卡片布局3.背景颜色 = 0XFF333333
		卡片布局4.背景颜色 = 0XFF333333
		卡片布局5.背景颜色 = 0XFF333333
		卡片布局6.背景颜色 = 0XFF333333
		线性布局8.背景颜色 = 0XFF333333
		线性布局9.背景颜色 = 0XFF333333
		线性布局10.背景颜色 = 0XFF333333
		线性布局12.背景颜色 = 0XFF333333
		线性布局16.背景颜色 = 0XFF333333
		线性布局17.背景颜色 = 0XFF333333
	结束 方法

	//事件回调
	/*
	当窗口要求另一个窗口返回数据成功时，会触发该事件用于接收返回数据
	*/
	事件 编辑器_项目编辑器_项目_物品:获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
		假如 请求码
			是 1000
				变量 icon_path : 文本 = 图片选择.解析图片地址(本对象,数据)
				编辑器_项目编辑器_列表3.图片框路径 = icon_path
			是 1020
				变量 icon_path : 文本 = 图片选择.解析图片地址(本对象,数据)
				编辑器_项目编辑器_列表5.图片框路径 = icon_path	
			是 2000
				如果 (请求码 == 2000) 且 (结果码 == 2001) 且 (数据 != 空)
					变量 path : 文本 = 数据.取文本("path")
					变量 json : 文本 = 数据.取文本("json")
					编辑器_项目编辑器_列表6.标记值 = json
					编辑器_项目编辑器_列表6.按钮旁文本内容 = 取文件名(path)
				结束 如果	
			是 4000
				如果 (请求码 == 4000) 且 (结果码 == 4001) 且 (数据 != 空)
					变量 name : 文本 = 数据.取文本("name")
					变量 first : 文本 = 数据.取文本("first_person")
					变量 third : 文本 = 数据.取文本("third_person")
					动画JSON = 数据.取文本("json2")
					first_person = first
					third_person = third
					编辑器_项目编辑器_列表7.按钮旁文本内容 = name
				结束 如果	
		结束 假如
	结束 事件

结束 类