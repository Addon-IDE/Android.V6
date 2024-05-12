@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("com.blankj.utilcode.util.ScreenUtils")
类 屏幕工具
	
	@静态
	方法 获取屏幕宽度() : 整数
		code return ScreenUtils.getScreenWidth();
	结束 方法
	
	@静态
	方法 获取屏幕高度() : 整数
		code return ScreenUtils.getScreenHeight();
	结束 方法
	
	@静态
	方法 获取屏幕高度_不含导航栏和状态栏() : 整数
		code return ScreenUtils.getAppScreenHeight();
	结束 方法
	
	@静态
	方法 获取屏幕密度() : 单精度小数
		code return ScreenUtils.getScreenDensity();
	结束 方法
	
	@静态
	方法 取屏幕密度Dpi() : 整数
		code return ScreenUtils.getScreenDensityDpi();
	结束 方法
	
	@静态
	方法 取屏幕旋转方向(窗口:安卓窗口) : 文本
		@code
		if(ScreenUtils.getScreenRotation(#窗口)==0)
		{
		  return "竖屏";
	    }
		else if(ScreenUtils.getScreenRotation(#窗口)==90)
		{
		  return "横屏";
		 }
		return null;
		@end
	结束 方法
	
结束 类