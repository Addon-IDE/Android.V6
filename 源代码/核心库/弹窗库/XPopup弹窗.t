
/*
*    结绳封装： 阿杰  @Meng
*
*    Github： li-xiaojun   
*    https://github.com/li-xiaojun/XPopup
*
*    基于 2.6.0 封装 部分方法需要等后续更新
*/

@导入Java("com.lxj.xpopup.XPopup")
类 XPopup弹窗全局设置 

	@静态
   方法 背景阴影色(颜色 为 文本)
      code XPopup.setShadowBgColor(android.graphics.Color.parseColor(#颜色));
   结束 方法

	@静态
   方法 状态栏背景色(颜色 为 文本)
      code XPopup.setStatusBarBbgColor(android.graphics.Color.parseColor(#颜色));
   结束 方法

	@静态
   方法 导航栏背景色(颜色 为 文本)
      code XPopup.setNavigationBarColor(android.graphics.Color.parseColor(#颜色));
   结束 方法

	@静态
   方法 亮色状态栏(是否 为 逻辑型)
      code XPopup.setIsLightStatusBar(#是否);
   结束 方法

	@静态
   方法 亮色导航栏(是否 为 逻辑型)
      code XPopup.setIsLightNavigationBar(#是否);
   结束 方法
   
   @静态
   方法 动画时长(值 为 整数)
      code XPopup.setAnimationDuration(#值);
   结束 方法
   
   @静态
   方法 主色调(颜色 为 文本)
      code XPopup.setPrimaryColor(android.graphics.Color.parseColor(#颜色));
   结束 方法

结束 类

类 XPopup附着弹窗 : XPopup基础
	
	@code
	public #<XPopup附着弹窗>(android.content.Context context) {
        super(context);
    }
	String[] 列表项目 = new String[0];
	int[] 列表图标 = new int[0];
	android.view.View v;
	@end

	属性写 列表项目(项目 为 文本[])
		code this.列表项目 = #项目;
	结束 属性
	
	属性读 列表项目() 为 文本[]
		code return this.列表项目;
	结束 属性

	属性写 列表图标(列表图标 为 整数[])
		code this.列表图标 = #列表图标
	结束 属性
	
	属性读 列表图标() 为 整数[]
		code return 列表图标
	结束 属性

	属性写 附着组件(组件 为 可视化组件)
		@code
		v = #组件.getView();
		xp.atView(v);
		xp.watchView(v);
		@end
	结束 属性

	方法 显示()
		@code 
		if(v==null) return;
		bpv = xp.asAttachList(列表项目,列表图标,
		new com.lxj.xpopup.interfaces.OnSelectListener() {
			@Override
			public void onSelect(int position, String text) {
				#列表被单击(position,text);
			}
		})
		.show();
		@end
	结束 方法
	
	定义事件 列表被单击(索引 为 整数, 文本 为 文本)
	
结束 类

类 XPopup对话弹窗 : XPopup基础
	
	@code
	public #<XPopup对话弹窗>(android.content.Context context) {
        super(context);
    }
	String 标题 = "",内容 = "";
	@end

   属性写 标题(文本 为 文本)
      code this.标题 = #文本;
   结束 属性

   //为空则不显示
   属性写 内容(文本 为 文本)
      code this.内容 = #文本;
   结束 属性

   方法 显示()
      @code 
      bpv = xp.asConfirm(标题, 内容,
      new com.lxj.xpopup.interfaces.OnConfirmListener() {
         @Override
         public void onConfirm() {
            #确定();
         }
      },
      new com.lxj.xpopup.interfaces.OnCancelListener(){
         @Override
         public void onCancel(){
            #取消();
         }
      }).show();
      @end
   结束 方法

   定义事件 确定()

   定义事件 取消()
	
结束 类

类 XPopup输入弹窗 : XPopup对话弹窗
	
	@code
	public #<XPopup输入弹窗>(android.content.Context context) {
        super(context);
    }
	String 初始="", 提示="";
	@end
	
	属性写 初始文本(文本 为 文本)
      code this.初始 = #文本;
   结束 属性

   属性写 提示文本(文本 为 文本)
      code this.提示 = #文本;
   结束 属性

   方法 显示()
      @code 
      bpv = xp.asInputConfirm(标题, 内容, 初始, 提示,
      new com.lxj.xpopup.interfaces.OnInputConfirmListener() {
         @Override
         public void onConfirm(String text) {
            #确定(text);
         }
      },
      new com.lxj.xpopup.interfaces.OnCancelListener(){
         @Override
         public void onCancel(){
            #取消();
         }
      },0)
      .show();
      @end
   结束 方法

   定义事件 确定(内容 为 文本)
	
结束 类

类 XPopup列表弹窗 : XPopup基础
	
	@code
	public #<XPopup列表弹窗>(android.content.Context context) {
        super(context);
    }
	String 标题="";
	String[] 项目 = new String[0];
	int[] 图标 = new int[0];
	int 选中 = -1;
	@end

   属性写 标题(文本 为 文本)
      code 标题 = #文本;
   结束 属性

   属性写 列表项目(项目 为 文本[])
      code this.项目 = #项目;
   结束 属性

   属性写 列表图标(项目图标 为 整数[])
      code 图标 = #项目图标;
   结束 属性

   属性写 选中位置(位置 为 整数)
      code 选中 = #位置;
   结束 属性

   方法 显示()
      @code 
      bpv = xp.asCenterList(标题,项目,图标,选中,
      new com.lxj.xpopup.interfaces.OnSelectListener() {
         @Override
         public void onSelect(int position, String text) {
            #列表被单击(position,text);
         }
      })
      .show();
      @end
   结束 方法

   定义事件 列表被单击(索引 为 整数, 文本 为 文本)
   
结束 类

类 XPopup底部列表弹窗 : XPopup列表弹窗
	
	@code
	public #<XPopup底部列表弹窗>(android.content.Context context) {
        super(context);
    }
	boolean 拖拽 = true;
	@end
	
	属性写 允许拖拽(是否 为 逻辑型)
      code 拖拽 = 是否;
    结束 属性

   方法 显示()
      @code 
      // 这种弹窗从 1.0.0版本开始实现了优雅的手势交互和智能嵌套滚动
      bpv = xp.asBottomList(标题, 项目,图标,选中,
      new com.lxj.xpopup.interfaces.OnSelectListener() {
         @Override
         public void onSelect(int position, String text) {
            #列表被单击(position,text);
         }
      })
      .show();
      @end
   结束 方法
	
结束 类

类 XPopup加载弹窗 : XPopup基础
	
	@code
	public #<XPopup加载弹窗>(android.content.Context context) {
        super(context);
    }
	@end

   方法 更新文本(文本 为 文本)
      code if (bpv != null) ((com.lxj.xpopup.impl.LoadingPopupView)bpv).setTitle(#文本);
   结束 方法
   
   方法 进度样式(是否 : 逻辑型)
      code if (bpv == null) return;
	  code bpv = #是否 ? ((com.lxj.xpopup.impl.LoadingPopupView)bpv).setStyle(com.lxj.xpopup.impl.LoadingPopupView.Style.ProgressBar) : ((com.lxj.xpopup.impl.LoadingPopupView)bpv).setStyle(com.lxj.xpopup.impl.LoadingPopupView.Style.Spinner);
   结束 方法

   方法 显示(文本 为 文本)
      code bpv = xp.asLoading(#文本).show();
   结束 方法
	
结束 类

类 XPopup自定义弹窗 : XPopup基础
	
	@code
	public #<XPopup自定义弹窗>(android.content.Context context) {
        super(context);
    }
	android.view.View v;
	@end
	
	方法 布局(容器 : 组件容器)
		code v = #容器.getLayout().getView();
	结束 方法	

   方法 显示()
	   @code
	   xp.isDestroyOnDismiss(false);
       bpv = new CustomFullScreenPopup(#取安卓环境());
	   bpv.popupInfo.isDestroyOnDismiss = true;
	   bpv.show();
	   @end
   结束 方法

   @code 
   public class CustomFullScreenPopup extends com.lxj.xpopup.impl.FullScreenPopupView {
      public CustomFullScreenPopup(android.content.Context context) {
         super(context);
		 this.popupInfo = new com.lxj.xpopup.core.PopupInfo();
      }
      protected void addInnerContent() {
		this.contentView = v;
        this.fullPopupContainer.addView(v);
      }
   }
   @end
	
结束 类

@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/interpolator-1.0.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/loader-1.0.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/collection-1.1.0.jar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/recyclerview-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/transition-1.2.0.aar")
@外部依赖库("../../../../依赖库/AllLib/XPopup")
@导入Java("com.lxj.xpopup.XPopup")
@导入Java("com.lxj.xpopup.XPopup.Builder")
@导入Java("com.lxj.xpopup.interfaces.OnSelectListener")
@导入Java("com.lxj.xpopup.enums.PopupAnimation")
@导入Java("com.lxj.xpopup.animator.PopupAnimator")
@导入Java("com.lxj.xpopup.enums.PopupPosition")
@导入Java("com.lxj.xpopup.core.BasePopupView")
类 XPopup基础 : 窗口组件
	
	@code
	Builder xp;
	BasePopupView bpv;
	
	public #<XPopup基础>(android.content.Context context) {
        super(context);
		xp = new Builder(context);
    }
	@end
	
	方法 关闭()
		code if(bpv != null) bpv.dismiss();
	结束 方法

	方法 延迟关闭(时长 为 整数)
		code if(bpv != null) bpv.delayDismiss(#时长);
	结束 方法

	方法 动画结束再关闭()
		code if(bpv != null) bpv.smartDismiss();
	结束 方法

	// 是否切换为View实现，默认是Dialog实现，具体区别看方法说明
	方法 View实现(是否 为 逻辑型)
		code xp.isViewMode(#是否);
	结束 方法

	// 是否有半透明的背景，默认为true
	方法 半透明(是否 为 逻辑型)
		code xp.hasShadowBg(#是否);
	结束 方法

	//单独给弹窗设置背景阴影色，默认用全局的值
	方法 背景阴影色(颜色 为 文本)
		code xp.shadowBgColor(android.graphics.Color.parseColor(#颜色));
	结束 方法

	//单独给弹窗设置动画时长，默认走全局的值
	方法 动画时长(值 为 整数)
		code xp.animationDuration(#值);
	结束 方法

	// 是否有高斯模糊的背景，默认为false
	方法 高斯模糊背景(是否 为 逻辑型)
		code xp.hasBlurBg(#是否);
	结束 方法

	//是否在消失的时候销毁资源，默认false。如果你的弹窗对象只使用一次，非常推荐设置这个，可以杜绝内存泄漏。如果会使用多次，千万不要设置
	方法 消失销毁(是否 为 逻辑型)
		code xp.isDestroyOnDismiss(#是否);
	结束 方法

	// 按返回键是否关闭弹窗，默认为true
	方法 返回键关闭(是否 为 逻辑型)
		code xp.dismissOnBackPressed(#是否);
	结束 方法

	// 点击外部是否关闭弹窗，默认为true
	方法 可取消(是否 为 逻辑型)
		code xp.dismissOnTouchOutside(#是否);
	结束 方法

	//点击弹窗外部时，是否允许点击到下方界面，默认false
	方法 外部点击(是否 为 逻辑型)
		code xp.isClickThrough(#是否);
	结束 方法

	//如果点击了传入的View则弹窗不消失，点击弹窗外部的其他地方再消失，
	方法 点击不关闭(组件 为 可视化组件)
		code xp.notDismissWhenTouchInView(#组件.getView());
	结束 方法

	//是否让输入框自动获取焦点，默认为true
	方法 输入自动获取焦点(是否 为 逻辑型)
		code xp.autoFocusEditText(#是否);
	结束 方法

	//是否弹窗显示的同时打开输入法，只在包含输入框的弹窗内才有效，默认为false
	方法 自动显示键盘(是否 为 逻辑型)
		code xp.autoOpenSoftInput(#是否);
	结束 方法

	// 设置内置的动画
	方法 动画(弹窗动画 为 XPopup动画)
		code xp.popupAnimation(#弹窗动画);
	结束 方法

	// 设置自定义的动画器
	//方法 置动画器(customAnimator 为 对象)
		//code xp.customAnimator(#customAnimator);
	//结束 方法

	// 软键盘弹出时，弹窗是否移动到软键盘上面，默认为true
	方法 键盘上方(是否 为 逻辑型)
		code xp.moveUpToKeyboard(#是否);
	结束 方法

	//手动指定弹窗出现在目标的什么位置，对Attach和Drawer类型弹窗生效
	方法 弹出位置(弹出位置 为 XPopup位置)
		code xp.popupPosition(#弹出位置);
	结束 方法

	//是否有状态栏阴影，目前对Drawer弹窗和FullScreen弹窗生效
	方法 状态栏阴影(是否 为 逻辑型)
		code xp.hasStatusBarShadow(#是否);
	结束 方法

	//默认是false，是否以屏幕中心进行定位，默认是false，为false时根据Material范式进行定位，主要影响Attach系列弹窗
	方法 中心定位(是否 为 逻辑型)
		code xp.positionByWindowCenter(#是否);
	结束 方法

	//是否是亮色状态栏，默认false;亮色模式下，状态栏图标和文字是黑色
	方法 亮色状态栏(是否 为 逻辑型)
		code xp.isLightStatusBar(#是否);
	结束 方法

	//是否显示状态栏，默认显示，一般不用设置设置, 当你App强制全屏时需要设置
	方法 显示状态栏(是否 为 逻辑型)
		code xp.hasStatusBar(#是否);
	结束 方法

	//是否显示导航栏，默认显示，一般不用设置，当你App修改了导航栏颜色的时候需要设置
	方法 显示导航栏(是否 为 逻辑型)
		code xp.hasNavigationBar(#是否);
	结束 方法

	//是否保持屏幕常亮，默认false
	方法 屏幕常亮(是否 为 逻辑型)
		code xp.keepScreenOn(#是否);
	结束 方法

	//弹窗在x方向的偏移量
	方法 X偏移(值 为 整数)
		code xp.offsetX(#值);
	结束 方法

	//弹窗在y方向的偏移量
	方法 Y偏移(值 为 整数)
		code xp.offsetY(#值);
	结束 方法

	//设置弹窗的最大宽度，如果重写弹窗的getMaxWidth()，以重写的为准
	方法 最大宽度(值 为 整数)
		code xp.maxWidth(#值);
	结束 方法

	//设置弹窗的最大高度，如果重写弹窗的getMaxHeight()，以重写的为准
	方法 最大高度(值 为 整数)
		code xp.maxHeight(#值);
	结束 方法

	//设置弹窗的宽度，受最大宽度限制，如果重写弹窗的getPopupHeight()，以重写的为准
	方法 宽度(值 为 整数)
		code xp.popupWidth(#值);
	结束 方法

	//设置弹窗的高度，受最大高度限制，如果重写弹窗的getPopupHeight()，以重写的为准
	方法 高度(值 为 整数)
		code xp.popupHeight(#值);
	结束 方法

	//是否和目标水平居中，比如：默认情况下Attach弹窗依靠着目标的左边或者右边，如果isCenterHorizontal为true，则与目标水平居中对齐
	方法 水平居中(是否 为 逻辑型)
		code xp.isCenterHorizontal(#是否);
	结束 方法

	//默认为true，默认情况下弹窗会抢占焦点，目的是为了响应返回按键按下事件；如果为false，则不抢焦点
	方法 弹窗焦点(是否 为 逻辑型)
		code xp.isRequestFocus(#是否);
	结束 方法

	//默认为false，是否允许弹窗在应用后台的时候也能显示。需要开启悬浮窗权限，一行代码即可实现
	方法 后台显示(是否 为 逻辑型)
		code xp.enableShowWhenAppBackground(#是否);
	结束 方法

	//是否启用拖拽，默认为true，目前对Bottom和Drawer弹窗有用
	方法 启用拖拽(是否 为 逻辑型)
		code xp.enableDrag(#是否);
	结束 方法

	//是否启用三阶拖拽（类似于BottomSheet），默认为false，目前对Bottom弹窗有用。如果enableDrag(false)则无效。
	方法 启用三阶拖拽(是否 为 逻辑型)
		code xp.isThreeDrag(#是否);
	结束 方法

	//是否启用暗色主题
	方法 暗色主题(是否 为 逻辑型)
		code xp.isDarkTheme(#是否);
	结束 方法

	//为弹窗设置圆角，默认是15，对内置弹窗生效
	方法 圆角(值 为 整数)
		code xp.borderRadius(#值);
	结束 方法

	// 操作完毕后是否自动关闭弹窗，默认为true；比如点击ConfirmPopup的确认按钮，默认自动关闭；如果为false，则不会关闭
	方法 自动关闭(是否 为 逻辑型)
		code xp.autoDismiss(#是否);
	结束 方法

	/*方法 置状态监听()
		setPopupCallback()
	结束 方法*/
	
	定义事件 动画结束执行()
	
结束 类

@导入Java("com.lxj.xpopup.enums.PopupAnimation")
@指代类("com.lxj.xpopup.enums.PopupAnimation")
类 XPopup动画
	
   // 缩放 + 透明渐变逻辑型
   // 从中心进行缩放+透明渐变
   @静态
   常量 缩放_中心 为 XPopup动画?
   //从左上角进行缩放+透明渐变
   @静态
   常量 缩放_左上 为 XPopup动画?
   //从右上角进行缩放+透明渐变
   @静态
   常量 缩放_右上 为 XPopup动画?
   //从左下角进行缩放+透明渐变
   @静态
   常量 缩放_左下 为 XPopup动画?
   //从右下角进行缩放+透明渐变
   @静态
   常量 缩放_右下 为 XPopup动画?

   // 平移 + 透明渐变
   // 从左平移进入
   @静态
   常量 平移透明_左进入 为 XPopup动画?
   // 从右平移进入
   @静态
   常量 平移透明_右进入 为 XPopup动画?
   // 从上方平移进入
   @静态
   常量 平移透明_上进入 为 XPopup动画?
   // 从下方平移进入
   @静态
   常量 平移透明_下进入 为 XPopup动画?

   // 平移，不带透明渐变
   // 从左平移进入
   @静态
   常量 平移_左进入 为 XPopup动画?
   // 从右平移进入
   @静态
   常量 平移_右进入 为 XPopup动画?
   // 从上方平移进入
   @静态
   常量 平移_上进入 为 XPopup动画?
   // 从下方平移进入
   @静态
   常量 平移_下进入 为 XPopup动画?

   // 滑动 + 透明渐变
   @静态
   常量 滑动_左 为 XPopup动画?
   @静态
   常量 滑动_左上 为 XPopup动画?
   @静态
   常量 滑动_上 为 XPopup动画?
   @静态
   常量 滑动_右上 为 XPopup动画?
   @静态
   常量 滑动_右 为 XPopup动画?
   @静态
   常量 滑动_右下 为 XPopup动画?
   @静态
   常量 滑动_下 为 XPopup动画?
   @静态
   常量 滑动_左下 为 XPopup动画?

   //禁用动画
   @静态
   常量 禁用动画 为 XPopup动画?
   
   @code
   static{
   	 #缩放_中心 = PopupAnimation.ScaleAlphaFromCenter;
        #缩放_左上 = PopupAnimation.ScaleAlphaFromLeftTop;
        #缩放_右上 = PopupAnimation.ScaleAlphaFromRightTop;
        #缩放_左下 = PopupAnimation.ScaleAlphaFromLeftBottom;
        #缩放_右下 = PopupAnimation.ScaleAlphaFromRightBottom;
        #平移透明_左进入 = PopupAnimation.TranslateAlphaFromLeft;
        #平移透明_右进入 = PopupAnimation.TranslateAlphaFromRight;
        #平移透明_上进入 = PopupAnimation.TranslateAlphaFromTop;
        #平移透明_下进入 = PopupAnimation.TranslateAlphaFromBottom;
        #平移_左进入 = PopupAnimation.TranslateFromLeft ;
        #平移_右进入 = PopupAnimation.TranslateFromRight;
        #平移_上进入 = PopupAnimation.TranslateFromTop;
        #平移_下进入 = PopupAnimation.TranslateFromBottom;
        #滑动_左 = PopupAnimation.ScrollAlphaFromLeft;
        #滑动_左上 = PopupAnimation.ScrollAlphaFromLeftTop;
        #滑动_上 = PopupAnimation.ScrollAlphaFromTop;
        #滑动_右上 = PopupAnimation.ScrollAlphaFromRightTop;
        #滑动_右 = PopupAnimation.ScrollAlphaFromRight;
        #滑动_右下 = PopupAnimation.ScrollAlphaFromRightBottom;
        #滑动_下 = PopupAnimation.ScrollAlphaFromBottom;
        #滑动_左下 = PopupAnimation.ScrollAlphaFromLeftBottom;
        #禁用动画 = PopupAnimation.NoAnimation;
   }
   @end
	
结束 类

@导入Java("com.lxj.xpopup.enums.PopupPosition")
@指代类("com.lxj.xpopup.enums.PopupPosition")
类 XPopup位置
	@静态
	常量 左 : XPopup位置?
	@静态
	常量 右: XPopup位置?
	@静态
	常量 上 : XPopup位置?
	@静态
	常量 下 : XPopup位置?
	
	@code
	static {
		#左 = PopupPosition.Left;
		#右 = PopupPosition.Left;
		#上 = PopupPosition.Left;
		#下 = PopupPosition.Left;
	}
	@end
结束 类