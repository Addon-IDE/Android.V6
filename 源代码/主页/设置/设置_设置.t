@导入Java("android.graphics.Bitmap")
@导入Java("android.graphics.BitmapFactory")
@导入Java("android.graphics.drawable.BitmapDrawable")
@导入Java("android.os.Bundle")
@导入Java("java.io.IOException")
@导入Java("android.content.res.AssetManager")
@导入Java("java.io.InputStream")
@导入Java("android.graphics.drawable.Drawable")
类 设置_设置 : 组件容器

	//设置布局背景图片
	@静态
	方法 设置布局背景(窗口名 : 安卓窗口,布局名 : 可视化组件,图片路径 : 文本)
		@code
		Bitmap bitmap = BitmapFactory.decodeFile(#图片路径);
        BitmapDrawable drawable = new BitmapDrawable(#窗口名.getResources(),bitmap);
		if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN) {
            #布局名.getView().setBackground(drawable);
        } else {
            #布局名.getView().setBackgroundDrawable(drawable);
        }
		@end
	结束 方法

	@静态
	方法 资源目录显示图片(窗口环境 : 安卓环境,图片名称 : 图片框,图片路径 : 文本)
		@code
		// 使用 AssetManager 加载图片
		try {
 		   // 获取 AssetManager 对象
 		   AssetManager assetManager = #窗口环境.getAssets();
  		  // 打开指定的图片文件
  		  InputStream inputStream = assetManager.open(#图片路径);
  		  // 将输入流转换为 Drawable 并设置给 ImageView
  		  Drawable drawable = Drawable.createFromStream(inputStream, null);
  		  #图片名称.getView().setImageDrawable(drawable);
  		  // 关闭输入流
 		   inputStream.close();
		} catch (IOException e) {
 		   e.printStackTrace();
		}
		@end
	结束 方法


结束 类