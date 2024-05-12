@外部依赖库("../../../../依赖库/JarLib/PaletteView.jar")
类 画板视图:可视化组件
	@code
	public #<画板视图>(android.content.Context context) {
        super(context);
    }

    @Override
    public ecloudw.canva.PaletteView onCreateView(android.content.Context context) {
        ecloudw.canva.PaletteView view = new ecloudw.canva.PaletteView(context);
		return view;
    }
	
	@Override
    public ecloudw.canva.PaletteView getView() {
        return (ecloudw.canva.PaletteView) view;
    }
	
	@end
	
	方法 模式(设置模式:文本)
		code getView().setMode(#设置模式); 
	结束 方法
	
	方法 撤销()
		code getView().undo(); 
	结束 方法
	
	方法 重做()
		code getView().redo(); 
	结束 方法
	
	方法 清空()
		code getView().clear(); 
	结束 方法
	
	方法 画笔颜色(颜色:文本)
		code getView().setPenColor(#颜色); 
	结束 方法
	
	方法 画笔透明度(颜色 : 整数)
		code getView().setPenAlpha(#颜色); 
	结束 方法
	
	方法 画笔大小(大小:单精度小数)
		code getView().setPenRawSize(#大小); 
	结束 方法
	
	方法 橡皮擦大小(大小:单精度小数)
		code getView().setEraserSize(#大小); 
	结束 方法
	
	方法 保存()
		//这个jar库由于没有提供保存的方法，可以使用群文件中的 《控件转图片 》来进行保存
	结束 方法
	
结束 类

类 设置模式
	
	@静态
	变量 画笔模式 : 文本 = "draw"
	
	@静态
	变量 橡皮擦模式 : 文本 = "eraser"
	
结束 类