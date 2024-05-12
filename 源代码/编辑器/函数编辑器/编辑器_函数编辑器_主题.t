类 编辑器_函数编辑器_主题
	
	变量 设置_设定 : 设置_设定
	
	//设置编辑器主题
	方法 设置主题(代码框名称 : CodeEditorView)
		假如 设置_设定.获取整数("CodeEditorSchemeType")
			是 0
				如果 设置_设定.获取开关("NightMode") 则
					代码框名称.设置主题(CodeEditorView_Scheme.SchemeDefaultNight)
				否则
					代码框名称.设置主题(CodeEditorView_Scheme.CodeEditorScheme)
				结束 如果
			是 1
				代码框名称.设置主题(CodeEditorView_Scheme.HTMLScheme)
			是 2
				代码框名称.设置主题(CodeEditorView_Scheme.SchemeDarcula)
			是 3
				代码框名称.设置主题(CodeEditorView_Scheme.SchemeEclipse)
			是 4
				代码框名称.设置主题(CodeEditorView_Scheme.SchemeGitHub)
			是 5
				代码框名称.设置主题(CodeEditorView_Scheme.SchemeNotepadXX)
			是 6
				代码框名称.设置主题(CodeEditorView_Scheme.SchemePurple)
			是 7
				代码框名称.设置主题(CodeEditorView_Scheme.SchemeVS2019)
			是 8
				如果 设置_设定.获取文本("CodeEditorSchemeName") == "" 则
				否则

				结束 如果
		结束 假如
	结束 方法
	
结束 类