@外部Java文件("../../../../依赖库/Java/ColorPickerView/AlphaPatternDrawable.java")
@外部Java文件("../../../../依赖库/Java/ColorPickerView/ColorPickerView.java")
@导入Java("com.kandan.music.aa.ColorPickerView")
类 颜色选择器视图:可视化组件
	@code
	public #<颜色选择器视图>(android.content.Context context) {
        super(context);
		
		getView().setOnColorChangedListener(new ColorPickerView.OnColorChangedListener(){
				@Override
			public void onColorChanged(int color) {
				#颜色被更改(color);
			}
		});
    }

    @Override
    public com.kandan.music.aa.ColorPickerView onCreateView(android.content.Context context) {
        com.kandan.music.aa.ColorPickerView view = new com.kandan.music.aa.ColorPickerView(context);
		return view;
    }
	
	@Override
    public com.kandan.music.aa.ColorPickerView getView() {
        return (com.kandan.music.aa.ColorPickerView) view;
    }
	
	@end
	
	方法 获取颜色() : 整数
		code return getView()getColor();
	结束 方法
	
	方法 设置颜色(颜色 : 整数)
		code getView().setColor(#颜色);
	结束 方法
	
	
	定义事件 颜色被更改(颜色 : 整数)
	
结束 类