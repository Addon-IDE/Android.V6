类 组件截图工具
	
	/*
	 * 截取一个可视化组件的界面
	 * @参数 欲截图对象 要截图的可视化组件
	 * @参数 宽度 设置组件的宽度，可留空
	 * @参数 高度 设置组件的高度，可留空
	 * @返回 截图结果
	 */
	@静态
	@导入Java("android.view.View")
	@导入Java("android.graphics.Bitmap")
	@导入Java("android.graphics.Canvas")
	@导入Java("android.graphics.drawable.Drawable")
	@导入Java("android.graphics.drawable.BitmapDrawable")
	@导入Java("android.content.res.Resources")
	方法 截图(欲截图对象 : 可视化组件, 宽度 : 整数 = 0, 高度 : 整数 = 0) : 可绘制对象
		@code
		View view = #欲截图对象.getView();
		int v_width = view.getWidth();
        int v_height = view.getHeight();
        if (v_width <= 0 || v_height <= 0) {
            // View尚未显示或者大小为0，无法进行截图操作
            v_width = #宽度;
            v_height = #高度;
            view.measure(View.MeasureSpec.makeMeasureSpec(v_width, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(v_height, View.MeasureSpec.EXACTLY));
            view.layout(0, 0, v_width, v_height);
        }
        // 创建一个空白的Bitmap对象，大小与View相同
        Bitmap screenshot = Bitmap.createBitmap(v_width, v_height, Bitmap.Config.ARGB_8888);
        // 利用Canvas将View画在Bitmap上
        Canvas canvas = new Canvas(screenshot);
        view.draw(canvas);
        // 将Bitmap转换为Drawable，并检查是否为空或没有内容
        Drawable drawable = new BitmapDrawable(Resources.getSystem(), screenshot);
        return drawable;
		@end
	结束 方法
	
结束 类