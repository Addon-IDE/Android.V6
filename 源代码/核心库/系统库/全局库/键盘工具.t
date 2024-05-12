@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("com.blankj.utilcode.util.KeyboardUtils")
@指代类("KeyboardUtils")
类 键盘工具
	
	@静态
	方法 显示软输入(环境:安卓窗口)
		code KeyboardUtils.showSoftInput(#环境);
	结束 方法
	
	@静态
	方法 隐藏软输入(环境:安卓窗口)
		code KeyboardUtils.hideSoftInput(#环境);
	结束 方法
	
	@静态
	方法 显示软键盘输入(组件:可视化组件)
		code KeyboardUtils.showSoftInput(#组件.getView());
	结束 方法
	
	@静态
	方法 隐藏软键盘输入(组件:可视化组件)
		code KeyboardUtils.hideSoftInput(#组件.getView());
	结束 方法
	
	@静态
	方法 切换输入法()
		code KeyboardUtils.toggleSoftInput();
	结束 方法
	
	
结束 类