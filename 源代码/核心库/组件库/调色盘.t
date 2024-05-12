@外部依赖库("../../../../依赖库/AarLib/palette/checkerboarddrawable-1.0.2.aar")
@外部依赖库("../../../../依赖库/AarLib/palette/colorpicker-1.1.6.aar")
@外部依赖库("../../../../依赖库/AarLib/palette/logger-1.0.0.aar")
类 调色盘:可视化组件
	@code
    public #<调色盘>(android.content.Context context) {
        super(context);
		getView() .subscribe(new top.defaults.colorpicker.ColorObserver() {
         @Override
         public void onColor(int color, boolean fromUser, boolean shouldPropagate) {
            #调色盘被触摸(color,fromUser,shouldPropagate);
         }
      });
    }

    @Override
    public top.defaults.colorpicker.ColorPickerView onCreateView(android.content.Context context) {
        top.defaults.colorpicker.ColorPickerView view = new top.defaults.colorpicker.ColorPickerView(context);
	    return view;
    }


    @Override
    public top.defaults.colorpicker.ColorPickerView getView() {
        return (top.defaults.colorpicker.ColorPickerView) view;
    }
    @end
	
	
属性写 设置初始颜色(颜色 为 整数)
     code getView().setInitialColor(#颜色);
   结束 属性

   属性写 显示明暗拖动条(是否显示 为 逻辑型)
     code getView().setEnabledBrightness(#是否显示);
   结束 属性

   属性写 显示透明度拖动条(是否显示 为 逻辑型)
     code getView().setEnabledAlpha(#是否显示);
   结束 属性

   属性读 当前颜色值() 为 整数
      code return getView().getColor();
   结束 属性

   方法 重置颜色()
     code  getView().reset();
   结束 方法
   
   @虚拟事件
   定义事件 调色盘被触摸(颜色:整数,用户触摸:逻辑型,来自应用:逻辑型)
	
结束 类