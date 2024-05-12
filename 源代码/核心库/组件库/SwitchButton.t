@安卓资源("../../../../资源库/核心库资源/SwitchButton")
@外部依赖库("../../../../依赖库/JarLib/android/annotation_NonNull.jar")
@外部Java文件("../../../../依赖库/Java/SwitchButton.java")
@导入Java("com.mundane.likewechatswitchbutton.SwitchButton")
类 SwitchButton:可视化组件
	@code
	public #<SwitchButton>(android.content.Context context) {
        super(context);
		getView().setOnCheckedChangeListener(new SwitchButton.OnCheckedChangeListener(){
			@Override
			public void onCheckedChanged(SwitchButton buttonView, boolean isChecked) {
				#选中状态改变(isChecked);
			}
		});
    }

    @Override
    public com.mundane.likewechatswitchbutton.SwitchButton onCreateView(android.content.Context context) {
        com.mundane.likewechatswitchbutton.SwitchButton view = new com.mundane.likewechatswitchbutton.SwitchButton(context);
		return view;
    }
	
	@Override
    public com.mundane.likewechatswitchbutton.SwitchButton getView() {
        return (com.mundane.likewechatswitchbutton.SwitchButton) view;
    }
	
	@end
	
	//设置复合类按钮的选中状态
	属性写 选中(选中 为 逻辑型)
		code getView().setChecked(#选中);
	结束 属性

	//获取复合类按钮的选中状态
	属性读 选中() 为 逻辑型
		code return getView().isChecked();
	结束 属性
	
	定义事件 选中状态改变(状态 : 逻辑型)

结束 类