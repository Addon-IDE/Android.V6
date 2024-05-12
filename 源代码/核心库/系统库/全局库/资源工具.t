@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("android.content.res.AssetManager")
@导入Java("java.io.InputStream")
@导入Java("com.blankj.utilcode.util.Utils")
@导入Java("com.blankj.utilcode.util.ResourceUtils")
@附加权限(安卓权限.文件权限_写入)
@附加权限(安卓权限.管理外部文件权限)
类 资源工具
	
	@静态
	方法 取id(名称 : 文本) : 整数
		code return ResourceUtils.getIdByName(#名称);
	结束 方法
	
	@静态
	方法 取文本id(名称 : 文本) : 整数
		code return ResourceUtils.getStringIdByName(#名称);
	结束 方法
	
	@静态
	方法 取颜色id(名称 : 文本) : 整数
		code return ResourceUtils.getColorIdByName(#名称);
	结束 方法
	
	@静态
	方法 取图片id(名称 : 文本) : 整数
		code return ResourceUtils.getDrawableIdByName(#名称);
	结束 方法
	
	@静态
	方法 取尺寸id(名称 : 文本) : 整数
		code return ResourceUtils.getDimenIdByName(#名称);
	结束 方法
	
	@静态
	方法 取应用图标id(名称 : 文本) : 整数
		code return ResourceUtils.getMipmapIdByName(#名称);
	结束 方法
	
	@静态
	方法 取布局id(名称 : 文本) : 整数
		code return ResourceUtils.getLayoutIdByName(#名称);
	结束 方法
	@静态
	方法 取样式id(名称 : 文本) : 整数
		code return ResourceUtils.getStyleIdByName(#名称);
	结束 方法
	
	@静态
	方法 取动画id(名称 : 文本) : 整数
		code return ResourceUtils.getAnimIdByName(#名称);
	结束 方法
	
	@静态
	方法 取菜单id(名称 : 文本) : 整数
		code return ResourceUtils.getStringIdByName(#名称);
	结束 方法
	
	@静态
	方法 取原始资源id(名称 : 文本) : 整数
		code return Utils.getApp().getResources().getIdentifier(#名称, "raw", Utils.getApp().getPackageName());
	结束 方法
	
	@静态
	方法 取可绘制对象(名称:文本):可绘制对象
		变量 资源id : 整数=取图片id(名称)
		code return Utils.getApp().getResources().getDrawable(#资源id);
	结束 方法
	
	@静态
	方法 取位图对象(名称:文本):位图对象
		变量 资源id : 整数=取图片id(名称)
		code return android.graphics.BitmapFactory.decodeResource(Utils.getApp().getResources(), #资源id);
	结束 方法
	
	@静态
	方法 取文本(名称:文本):文本
		变量 资源id : 整数=取文本id(名称)
		code return Utils.getApp().getResources().getString(#资源id);
	结束 方法
	
	@静态
	方法 取原始资源可绘制对象(名称 : 文本) : 可绘制对象
		变量 资源id : 整数=取原始资源id(名称)
		code return Utils.getApp().getResources().getDrawable(#资源id);
	结束 方法
	
	@静态
	方法 取原始资源位图对象(名称:文本) : 位图对象
		变量 资源id : 整数=取原始资源id(名称)
		code return android.graphics.BitmapFactory.decodeResource(Utils.getApp().getResources(), #资源id);
	结束 方法
	
	@静态
	方法 取附加资源可绘制对象(资源名称:文本) : 可绘制对象
		@code
		try {
		   AssetManager assetManager = Utils.getApp().getAssets();
		   InputStream inputStream = assetManager.open(#资源名称);
		   android.graphics.drawable.Drawable drawable = android.graphics.drawable.Drawable.createFromStream(inputStream, null);
           return drawable;
		   }catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	@静态
	方法 取附加资源位图对象(资源名称:文本) : 位图对象
		@code
		try {
		   AssetManager assetManager = Utils.getApp().getAssets();
		   InputStream inputStream = assetManager.open(#资源名称);
		   android.graphics.Bitmap bitmap = android.graphics.BitmapFactory.decodeStream(inputStream);
           return bitmap;
		   }catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	@静态
	方法 读入原始资源文件(名称:文本) : 文本
		变量 资源id : 整数=取原始资源id(名称)
		code return ResourceUtils.readRaw2String(#资源id);
	结束 方法
	
	@静态
	方法 读入附加资源文件(名称:文本) : 文本
		code return ResourceUtils.readAssets2String(#名称);
	结束 方法
	
	@静态
	方法 写出原始资源文件(名称:文本,路径:文本)
		变量 资源id : 整数=取原始资源id(名称)
		code ResourceUtils.copyFileFromRaw(#资源id,#路径);
	结束 方法
	
	@静态
	方法 写出附加资源文件(名称:文本,路径:文本)
		code ResourceUtils.copyFileFromAssets(#名称,#路径);
	结束 方法
	
结束 类