@导入Java("android.view.inputmethod.InputMethodManager")
@导入Java("android.view.WindowManager")

类 编辑器_代码编辑器_模块

	//设置文件类型列表图标
	方法 文件列表类型图标(图片框名称 : 图片框,路径 : 文本)
		//变量
		变量 文件后缀 : 文本 = 文件操作.取文件后缀名(路径)
		变量 路径后缀 : 文本 = 文件后缀.到小写()
		//设置图标
		如果 路径后缀 == "png" || 路径后缀 == "jpg"
			图片框名称.图片路径 = 路径
		否则 路径后缀 == "txt"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.文本文件
		否则 路径后缀 == "mp3" || 路径后缀 == "ogg"	
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.音频
		否则 路径后缀 == "zip"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.压缩包
		否则 路径后缀 == "ttf"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.字体文件
		否则 路径后缀 == "jar"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.jar
		否则 路径后缀 == "js"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.js
		否则 路径后缀 == "json"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.json
		否则 路径后缀 == "css"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.css
		否则 路径后缀 == "html"	
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.html
		否则 路径后缀 == "java"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.java
		否则 路径后缀 == "php"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.php
		否则 路径后缀 == "py"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.python
		否则 路径后缀 == "c" || 路径后缀 == "h"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.c
		否则 路径后缀 == "cpp" || 路径后缀 == "cc"
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.cpp
		否则
			图片框名称.图片资源 = 编辑器_代码编辑器_资源.未知文件
		结束 如果
	结束 方法
	
	方法 判断输入法是否打开(安卓窗口名 : 安卓窗口) : 逻辑型
		@code
  	  if (#安卓窗口名.getWindow().getAttributes().softInputMode == WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE) {
  		  InputMethodManager imm = (InputMethodManager) #安卓窗口名.getSystemService(#安卓窗口名.INPUT_METHOD_SERVICE);
			imm.toggleSoftInput(0, InputMethodManager.HIDE_NOT_ALWAYS);
			return true;
		}
		return false;
		@end
	结束 方法

结束 类