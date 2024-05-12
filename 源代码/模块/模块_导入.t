@导入Java("android.content.Intent")
@导入Java("android.os.Bundle")
@导入Java("android.widget.Toast")
@导入Java("java.io.File")
@导入Java("android.content.ActivityNotFoundException")
@导入Java("android.net.Uri")
类 模块_导入 : 组件容器

	变量 设置_设定 : 设置_设定

	方法 导入(文件路径 : 文本)
		//初始化
		变量 选择框 : XPopup列表弹窗
		选择框.标题 = "选择你要导入的文件"
		变量 list : 文本[] = {"附加包(mcaddon) -- 推荐","资源包(mcpack)","行为包(mcpack)"}
		选择框.列表项目 = list
		选择框.动画(XPopup动画.平移透明_下进入)
		如果 设置_设定.获取开关("NightMode") 则
			选择框.暗色主题(真)
		结束 如果
		选择框.显示()
		//选择
		事件 选择框:列表被单击(索引 : 整数,文本 : 文本)
			假如 索引 
				是 0
					变量 path : 文本 = 文件路径 + ".mcaddon"
					如果 文件是否存在(path) 则
						导入游戏(取安卓环境(),path)
					结束 如果
				是 1
					变量 path : 文本 = 文件路径 + "_resource.mcpack"
					如果 文件是否存在(path) 则
						导入游戏(取安卓环境(),path)
					结束 如果
				是 2
					变量 path : 文本 = 文件路径 + "_behavior.mcpack"
					如果 文件是否存在(path) 则
						导入游戏(取安卓环境(),path)
					结束 如果		
			结束 假如
		结束 事件
	结束 方法

	方法 导入游戏(环境名称 : 安卓环境,路径 : 文本)
		文件打开方式.打开文件(环境名称,路径)
	结束 方法

结束 类