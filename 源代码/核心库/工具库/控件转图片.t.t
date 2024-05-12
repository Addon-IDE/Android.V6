@导入Java("android.graphics.*")
@导入Java("android.view.*")
@导入Java("java.io.*")
@附加权限(安卓权限.文件权限_读取)
@附加权限(安卓权限.文件权限_写入)
类 控件转图片
	//不可在窗口的创建完毕事件调用
	方法 控件转图片(控件 : 可视化组件, 保存路径 : 文本, 色深 : 图片色深 = 图片色深.ARGB_8888, 保存质量 : 整数 = 100, 保存格式 : 图片格式 = 图片格式.JPEG格式) : 逻辑型
		@code
	    try {
        	View view = #控件.getView();
            Bitmap bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), #色深);
            Canvas canvas = new Canvas(bitmap);
            view.draw(canvas);
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(#保存路径));
            bitmap.compress(#保存格式, #保存质量, bos);
            bos.close();
            return true;
        } catch(Exception e) {
            return false;
	    }
	    @end
	结束 方法
结束 类

@指代类("Bitmap.Config")
@导入Java("android.graphics.Bitmap")
@禁止创建对象
类 图片色深
	@静态
	常量 RGBA_F16 : 图片色深?
	@静态
	常量 ARGB_8888 : 图片色深?
	@静态
	常量 ARGB_4444 : 图片色深?
	@静态
	常量 RGB_565 : 图片色深?

	@code
	static {
		#RGBA_F16 = Bitmap.Config.RGBA_F16;
		#ARGB_8888 = Bitmap.Config.ARGB_8888;
		#ARGB_4444 = Bitmap.Config.ARGB_4444;
		#RGB_565 = Bitmap.Config.RGB_565;
	}
	@end
结束 类

@指代类("Bitmap.CompressFormat")
@导入Java("android.graphics.Bitmap")
@禁止创建对象
类 图片格式
	@静态
	常量 JPEG格式 : 图片格式?
	@静态
	常量 PNG格式 : 图片格式?
	@静态
	常量 WEBP格式 : 图片格式?
	
	@code
	static {
		#JPEG格式 = Bitmap.CompressFormat.JPEG;
		#PNG格式 = Bitmap.CompressFormat.PNG;
		#WEBP格式 = Bitmap.CompressFormat.WEBP;
	}
	@end
结束 类