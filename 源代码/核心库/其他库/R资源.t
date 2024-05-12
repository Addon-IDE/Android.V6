@全局应用
类 R资源 : 安卓应用
	
	code private static android.content.Context mcontext;
	
	事件 R资源:创建完毕()
		code mcontext = getApplicationContext();
	结束 事件	
	
	@静态
	方法 取安卓环境():安卓环境
		 code return mcontext;
	结束 方法
	
	@静态
	方法 取布局id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "layout",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取图片id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "drawable",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取文本id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "string",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取风格id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "style",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取ID(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "id",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取颜色id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "color",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取动画id(资源名称:文本):整数
		code return mcontext.getResources().getIdentifier(#资源名称, "anim",mcontext.getPackageName());
	结束 方法
	
	@静态
	方法 取可绘制对象(资源id:整数):可绘制对象
		code return mcontext.getResources().getDrawable(#资源id);
	结束 方法
	
	@静态
	方法 取位图对象(资源id:整数):位图对象
		code return android.graphics.BitmapFactory.decodeResource(mcontext.getResources(), #资源id);
	结束 方法
	
	@静态
	方法 取文本(资源id:整数):文本
		code return mcontext.getResources().getString(#资源id);
	结束 方法
	
结束 类