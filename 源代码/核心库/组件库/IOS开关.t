@外部依赖库("../../../../依赖库/JarLib/ios_switch.jar")
@导入Java("com.suke.widget.SwitchButton")
类 IOS开关:可视化组件
	@code
	public #<IOS开关>(android.content.Context context) {
        super(context);
		getView().setOnCheckedChangeListener(new SwitchButton.OnCheckedChangeListener(){
			@Override
			public void onCheckedChanged(SwitchButton switchButton, boolean checked) {
				#选中状态改变(checked);
			}
		});
    }

    @Override
    public com.suke.widget.SwitchButton onCreateView(android.content.Context context) {
        com.suke.widget.SwitchButton view = new com.suke.widget.SwitchButton(context);
		return view;
    }
	
	@Override
    public com.suke.widget.SwitchButton getView() {
        return (com.suke.widget.SwitchButton) view;
    }
	
	@end

	//设置按钮的选中状态
	属性写 选中(是否选中 为 逻辑型)
		code getView().setChecked(#是否选中);
	结束 属性

	//获取按钮的选中状态
	属性读 选中() 为 逻辑型
		code return getView().isChecked();
	结束 属性

	//设置按钮的选中状态
	方法 阴影效果(阴影效果 为 逻辑型)
		code getView().setShadowEffect(#阴影效果);
	结束 方法

	//切换按钮的选中状态
	方法 切换状态()
		code getView().toggle();
	结束 方法

	/*
	开关选中状态发生变化时触发该事件
	*/
	定义事件 选中状态改变(选中 为 逻辑型)

结束 类