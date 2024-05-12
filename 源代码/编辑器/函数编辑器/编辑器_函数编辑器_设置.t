类 编辑器_函数编辑器_设置
	
	变量 设置_设定 : 设置_设定
	
	方法 代码编辑器设置(窗口名 : 安卓窗口,代码框名称 : CodeEditorView)
		//基础
		代码框名称.设置自动换行(设置_设定.获取开关("FunctionEditorWordWrap"))
		代码框名称.设置自动补全(设置_设定.获取开关("FunctionEditorOldAutocomplete"))
		//字体
		如果 设置_设定.获取文本("CodeEditorTypeface") == "f1" 则
			代码框名称.设置字体("font/JetBrainsMono-Regular.ttf",假)
			代码框名称.设置行号字体("font/JetBrainsMono-Regular.ttf",假)
		否则 设置_设定.获取文本("CodeEditorTypeface") == "f2"
			代码框名称.设置字体("font/consolas.ttf",假)
			代码框名称.设置行号字体("font/consolas.ttf",假)
		否则
			如果 设置_设定.获取文本("CodeEditorTypeface").替换(" ","") == "" 则
			否则
				如果 文件是否存在(设置_设定.获取文本("CodeEditorTypeface")) 则
					代码框名称.设置字体(设置_设定.获取文本("CodeEditorTypeface"))
					代码框名称.设置行号字体(设置_设定.获取文本("CodeEditorTypeface"))
				结束 如果
			结束 如果	
		结束 如果
		//编辑器背景图片
		变量 设置相关路径 : 文本 = 设置_设定.获取文本("CodeEditorBackground")
		如果 设置相关路径.替换(" ","") == "" 则
		否则
			如果 文件是否存在(设置相关路径) 则
				设置_设置.设置布局背景(窗口名,代码框名称,设置相关路径)
			结束 如果
		结束 如果
		//加载其他设置
		代码框名称.设置放大镜(设置_设定.获取开关("CodeEditorOtherMagnifierEnabled"))
		代码框名称.设置行号固定(设置_设定.获取开关("CodeEditorOtherPinLineNumber"))
		代码框名称.设置第一个行号始终可见(设置_设定.获取开关("CodeEditorOtherFirstLineNumberAlwaysVisible"))
		如果 设置_设定.获取文本("CodeEditorOtherCursorBlinkPeriod") == "" 则
		否则
			代码框名称.设置光标闪烁周期(设置_设定.获取整数("CodeEditorOtherCursorBlinkPeriod"))
		结束 如果
		代码框名称.设置全部全屏(设置_设定.获取开关("CodeEditorOtherAllowFullscreen"))
		代码框名称.设置类型连字(设置_设定.获取开关("CodeEditorOtherLigatureEnabled"))
		代码框名称.设置高亮显示当前块(设置_设定.获取开关("CodeEditorOtherHighlightCurrentBlock"))
		代码框名称.设置高亮显示当前行(设置_设定.获取开关("CodeEditorOtherHighlightCurrentLine"))
		如果 设置_设定.获取文本("CodeEditorOtherBlockLineWidth") == "" 则
		否则
			代码框名称.设置块线宽(设置_设定.获取文本("CodeEditorOtherBlockLineWidth").到单精度小数())
		结束 如果
		代码框名称.设置光标动画(设置_设定.获取开关("CodeEditorOtherCursorAnimationEnabled"))
		代码框名称.设置滚动条(设置_设定.获取开关("CodeEditorOtherScrollBarEnabled"))
		代码框名称.设置滚动显示行号面板(设置_设定.获取开关("CodeEditorOtherDisplayLnPanel"))
		代码框名称.设置滚动行号前提示(设置_设定.获取文本("CodeEditorOtherLnTip"))
		代码框名称.设置自动缩进(设置_设定.获取开关("CodeEditorOtherAutoIndentEnabled"))
		如果 设置_设定.获取文本("CodeEditorOtherTextSize") == "" 则
		否则
			代码框名称.设置字体大小(设置_设定.获取文本("CodeEditorOtherTextSize").到单精度小数())
		结束 如果
		代码框名称.设置硬件加速绘制(设置_设定.获取开关("CodeEditorOtherHardwareAcceleratedDrawAllowed"))
		代码框名称.设置行信息文本(设置_设定.获取开关("CodeEditorOtherVerticalScrollBarEnabled"))
		代码框名称.设置撰写时设置自动完成(设置_设定.获取开关("CodeEditorOtherAutoCompletionOnComposing"))
		如果 设置_设定.获取文本("CodeEditorOtherNonPrintablePaintingFlags") == "" 则
		否则
			代码框名称.设置不可打印的绘画标志(设置_设定.获取文本("CodeEditorOtherNonPrintablePaintingFlags").到整数())
		结束 如果
		代码框名称.设置高亮显示选定文本(设置_设定.获取开关("CodeEditorOtherHighlightSelectedText"))
		如果 设置_设定.获取文本("CodeEditorOtherTabWidth") == "" 则
		否则
			代码框名称.设置制表符宽度(设置_设定.获取文本("CodeEditorOtherTabWidth").到整数())
		结束 如果
		代码框名称.设置是否拖动(设置_设定.获取开关("CodeEditorOtherDrag"))
		如果 设置_设定.获取文本("CodeEditorOtherDividerMargin") == "" 则
		否则
			代码框名称.设置分隔线边距(设置_设定.获取文本("CodeEditorOtherDividerMargin").到单精度小数())
		结束 如果
		如果 设置_设定.获取文本("CodeEditorOtherDividerWidth") == "" 则
		否则
			代码框名称.设置分隔线宽度(设置_设定.获取文本("CodeEditorOtherDividerWidth").到单精度小数())
		结束 如果
		如果 设置_设定.获取文本("CodeEditorOtherCursorWidth") == "" 则
		否则
			代码框名称.设置光标宽度(设置_设定.获取文本("CodeEditorOtherCursorWidth").到单精度小数())
		结束 如果
		代码框名称.设置可缩放(设置_设定.获取开关("CodeEditorOtherScalable"))
		代码框名称.设置代码块线已启用(设置_设定.获取开关("CodeEditorOtherBlockLineEnabled"))
	结束 方法
	
结束 类