@外部依赖库("../../../../依赖库/JarLib/numeric_bubble_drag_bar.jar")
@导入Java("com.xw.repo.BubbleSeekBar")
类 数值气泡拖动条:可视化组件
	@code
	public #<数值气泡拖动条>(android.content.Context context) {
        super(context);
		getView().setOnProgressChangedListener(new BubbleSeekBar.OnProgressChangedListener() {
 		   @Override
 		   public void onProgressChanged(BubbleSeekBar bubbleSeekBar, int progress, float progressFloat, boolean fromUser) {
  		      #进度被改变(progress, fromUser);
  		  }

 		   @Override
		    public void getProgressOnActionUp(BubbleSeekBar bubbleSeekBar, int progress, float progressFloat) {
  		      #结束拖动(progress,progressFloat);
    		}

		    @Override
  		  public void getProgressOnFinally(BubbleSeekBar bubbleSeekBar, int progress, float progressFloat, boolean fromUser) {
    		    #开始拖动(progress, fromUser);
    		}
		});
    }

    @Override
    public com.xw.repo.BubbleSeekBar onCreateView(android.content.Context context) {
        com.xw.repo.BubbleSeekBar view = new com.xw.repo.BubbleSeekBar(context);
		return view;
    }
	
	@Override
    public com.xw.repo.BubbleSeekBar getView() {
        return (com.xw.repo.BubbleSeekBar) view;
    }
	
	@end

	//设置拇指按钮颜色
	方法 设置拇指颜色(颜色:整数)
		code getView().setThumbColor(#颜色);
	结束 方法

	//设置第二轨道颜色
	方法 设置第二轨道颜色(颜色:整数)
		code getView().setSecondTrackColor(#颜色);
	结束 方法

	//设置跟踪颜色
	方法 设置跟踪颜色(颜色:整数)
		code getView().setTrackColor(#颜色);
	结束 方法

	//设置气泡颜色
	方法 设置气泡颜色(颜色:整数)
		code getView().setBubbleColor(#颜色);
	结束 方法

	//设置进度
	方法 设置进度(进度:整数)
		code getView().setProgress(#进度);
	结束 方法

	//获取进度
	方法 获取进度() : 整数
		code return getView().getProgress();
	结束 方法


	定义事件 进度被改变(当前进度 为 整数, 是否人为改变 : 逻辑型)
	
	定义事件 开始拖动(当前进度 为 整数, 是否人为改变 : 逻辑型)

	定义事件 结束拖动(当前进度 为 整数,当前进度2 为 单精度小数)


结束 类