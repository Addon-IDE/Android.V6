@外部依赖库("../../../../依赖库/JarLib/CircularDragBar.jar")
@导入Java("com.mus.ArcSeekBar")
类 漂亮的圆形拖动条:可视化组件
	@code
	public #<漂亮的圆形拖动条>(android.content.Context context) {
        super(context);
    }

    @Override
    public com.mus.ArcSeekBar onCreateView(android.content.Context context) {
        com.mus.ArcSeekBar view = new com.mus.ArcSeekBar(context);
		return view;
    }
	
	@Override
    public com.mus.ArcSeekBar getView() {
        return (com.mus.ArcSeekBar) view;
    }
	
	@end

	//拖动条背景颜色
	方法 拖动条背景颜色(颜色:文本)
		code getView().setNormalColor(#颜色);
	结束 方法
	
	//拖动球颜色
	方法 拖动球颜色(颜色:文本)
		code getView().setButtonColor(#颜色);
	结束 方法
	
	//进度条颜色
	方法 进度条颜色(颜色:文本)
		code getView().setProgressColor(#颜色);
	结束 方法
	
	//字体大小
	方法 字体大小(大小:整数)
		code getView().setLabelTextSize(#大小);
	结束 方法
	
	//字体颜色
	方法 字体颜色(颜色:文本)
		code getView().setLabelTextColor(#颜色);
	结束 方法
	
	//是否可拖拽
	方法 是否可拖拽(状态:逻辑型)
		code getView().setEnabledDrag(#状态);
	结束 方法
	
	//是否显示外环刻度
	方法 是否显示外环刻度(状态:逻辑型)
		code getView().setShowTick(#状态);
	结束 方法
	
	//设置当前进度
	方法 设置当前进度(进度:整数)
		code getView().setProgress(#进度);
	结束 方法
	
	//获取当前进度
	方法 获取当前进度() : 整数
		code return getView().getProgress();
	结束 方法
	
	//设置最大进度
	方法 设置最大进度(进度:整数)
		code getView().setMax(#进度);
	结束 方法
	
	//获取最大进度
	方法 获取最大进度() : 整数
		code return getView().getMax();
	结束 方法
	

	/*
	开关选中状态发生变化时触发该事件
	*/
	定义事件 选中状态改变(选中 为 逻辑型)

结束 类