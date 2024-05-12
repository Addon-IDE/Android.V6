@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("com.blankj.utilcode.util.SizeUtils")
类 组件测量工具
	
	@静态
	方法 取组件宽度(组件 : 可视化组件) : 整数
		code return SizeUtils.getMeasuredWidth(#组件.getView());
	结束 方法
	
	@静态
	方法 取组件高度(组件 : 可视化组件) : 整数
		code return SizeUtils.getMeasuredHeight(#组件.getView());
	结束 方法
	
	@静态
	方法 测量组件(组件 : 可视化组件) : 整数[]
		code return SizeUtils.measureView(#组件.getView());
	结束 方法
	
结束 类