类 编辑器_函数编辑器_编辑

	变量 安卓环境名 : 安卓环境?
	变量 代码框名称 : CodeEditorView?

	方法 设置环境名(环境名 : 安卓环境)
		安卓环境名 = 环境名
	结束 方法
	方法 设置代码框(代码框 : CodeEditorView)
		代码框名称 = 代码框
	结束 方法

	方法 复制当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		置剪切板文本(安卓环境名,代码框名称.获取当前行的文本(当前行的位置))
	结束 方法

	方法 剪切当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		置剪切板文本(安卓环境名,代码框名称.获取当前行的文本(当前行的位置))
		代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
	结束 方法

	方法 删除当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		如果 当前行的位置-1 >= 0 则
			变量 记录 : 文本 = ""
			记录 = 代码框名称.获取当前行的文本(当前行的位置-1)
			代码框名称.删除字符2(当前行的位置-1,0,当前行的位置,获取当前行的文字数量)
			代码框名称.文本插入(当前行的位置-1,0,记录)
		否则
			代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
		结束 如果
	结束 方法

	方法 清空当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
	结束 方法

	方法 替换当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
		代码框名称.文本插入(当前行的位置,0,取剪切板文本(安卓环境名))
	结束 方法

	方法 重复当前行()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字内容 : 文本 = 代码框名称.获取当前行的文本(当前行的位置)
		代码框名称.文本插入(当前行的位置,0,获取当前行的文字内容 + "\n")
	结束 方法

	方法 转为大写()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		变量 获取当前行的文字内容 : 文本 = 代码框名称.获取当前行的文本(当前行的位置)
		代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
		代码框名称.文本插入(当前行的位置,0,获取当前行的文字内容.到大写())
	结束 方法

	方法 转为小写()
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		变量 获取当前行的文字数量 : 整数 = 代码框名称.获取当前行的文字数量(当前行的位置)
		变量 获取当前行的文字内容 : 文本 = 代码框名称.获取当前行的文本(当前行的位置)
		代码框名称.删除字符2(当前行的位置,0,当前行的位置,获取当前行的文字数量)
		代码框名称.文本插入(当前行的位置,0,获取当前行的文字内容.到小写())
	结束 方法

	方法 粘贴()
		开始俘获异常()
		代码框名称.插入文本(取剪切板文本(安卓环境名))
		俘获所有异常()
		代码框名称.插入文本("粘贴文本时出错了！")
		结束俘获异常()
	结束 方法
	
	方法 格式化(内容 : 文本)
		变量 转换为列表 : 文本[] = 内容.分割文本("\n")
		变量 转换后结果 : 文本 = ""
		循环(i, 0, 取数组长度(转换为列表))
			变量 Text : 文本 = 转换为列表[i].删首尾空()
			转换后结果 = 转换后结果 + Text + "\n"
		结束 循环
		//关闭撤销功能
		代码框名称.设置开启撤销(假)
		//清空
		代码框名称.删除字符(0,内容.长度)
		//开启撤销功能
		代码框名称.设置开启撤销(真)
		//插入格式化后的结果
		变量 当前行的位置 : 整数 = 代码框名称.获取当前行的位置
		代码框名称.文本插入(当前行的位置,0,转换后结果)
	结束 方法

结束 类