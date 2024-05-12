包名 com.Meng

/*
*==========================
*   结绳封装 ：  @阿杰  Meng
*
*   Github @kongzue https://github.com/kongzue/DialogX
*==========================
*/

@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("android.view.View")
@导入Java("com.kongzue.dialogx.dialogs.*")
类 DX底部对话框

	@code
	BottomDialog dx = null;
	
	public #<DX底部对话框>() {
		this.dx = BottomDialog.build()
		.setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<BottomDialog>() {
         public void onShow(BottomDialog dialog) {#对话框启动();}
         public void onDismiss(BottomDialog dialog) {#对话框关闭();}
      }).setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<BottomDialog>(){
         public boolean onBackPressed(BottomDialog d){return #返回键被单击();}
      }).setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<BottomDialog>(){
	  	public boolean onClick(BottomDialog d, View v){return #外侧被单击();}
	  });
	}
	
	public BottomDialog getDX(){
		return (BottomDialog) dx;
	}
	@end

	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX底部对话框
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX底部对话框
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 标题(标题 为 文本) 为 DX底部对话框
		code getDX().setTitle(#标题);
		返回 本对象
	结束 方法

	方法 内容(内容 为 文本) 为 DX底部对话框
		code getDX().setMessage(#内容);
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮1(文本 为 文本) 为 DX底部对话框
		@code 
      getDX().setOkButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<BottomDialog>() {
         @Override
         public boolean onClick(BottomDialog baseDialog, View v) {
            Object r = #按钮1被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮2(文本 为 文本) 为 DX底部对话框
		@code
      getDX().setCancelButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<BottomDialog>() {
         @Override
         public boolean onClick(BottomDialog baseDialog, View v) {
            Object r = #按钮2被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮3(文本 为 文本) 为 DX底部对话框
		@code
      getDX().setOtherButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<BottomDialog>() {
         @Override
         public boolean onClick(BottomDialog baseDialog, View v) {
            Object r = #按钮3被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 最大高度(高度 为 整数) 为 DX底部对话框
		code getDX().setBottomDialogMaxHeight(#高度);
		返回 本对象
	结束 方法

	方法 最大宽度(宽 : 整数) : DX底部对话框
		code getDX().setMaxWidth(#宽);
		返回 本对象
	结束 方法

	方法 可取消(是否 为 逻辑型) 为 DX底部对话框
		code getDX().setCancelable(#是否);
		返回 本对象
	结束 方法

	方法 拦截触摸(是否 : 逻辑型) : DX底部对话框
		code getDX().setAllowInterceptTouch(#是否);
		返回 本对象
	结束 方法

	方法 开启动画时长(时长 为 长整数) 为 DX底部对话框
		code getDX().setEnterAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 关闭动画时长(时长 为 长整数) 为 DX底部对话框
		code getDX().setExitAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 标题图标(图片 : 可绘制对象) : DX底部对话框
		code getDX().setTitleIcon(#图片);
		返回 本对象
	结束 方法

	方法 标题文字样式(文字样式 为 DX文字样式) 为 DX底部对话框
		code getDX().setTitleTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 内容文字样式(文字样式 为 DX文字样式) 为 DX底部对话框
		code getDX().setMessageTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 按钮2文字样式(文字样式 为 DX文字样式) 为 DX底部对话框
		code getDX().setCancelTextInfo(#文字样式);
		返回 本对象
	结束 方法

	//设置背景颜色，强行对对话框背景进行染色
	方法 背景颜色(颜色 为 文本) 为 DX底部对话框
		code getDX().setBackgroundColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	//修改背景遮罩，这是为了丰富扩展性。
	方法 背景遮罩颜色(颜色 为 文本) 为 DX底部对话框
		code getDX().setMaskColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	方法 圆角(半径 : 整数)
		code getDX().setRadius(#半径);
	结束 方法

	方法 去除小横条()
		code if (getDX().getDialogImpl().imgTab != null) ((android.view.ViewGroup) getDX().getDialogImpl().imgTab.getParent()).removeView(getDX().getDialogImpl().imgTab);
	结束 方法

	方法 自定义布局(容器 为 组件容器) 为 DX底部对话框
		@code
       getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<BottomDialog>(#<容器.取根布局>().getView()){
         @Override
         public void onBind(BottomDialog dialog, View v) {
            //v.findViewById...
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 清除自定义布局()
		code getDX().removeCustomView();
	结束 方法

	方法 实现方式(方式 为 DX实现方式) 为 DX底部对话框
		code getDX().setDialogImplMode(#方式);
		返回 本对象
	结束 方法

	方法 显示() 为 DX底部对话框
		code getDX().show();
		返回 本对象
	结束 方法

	方法 隐藏()
		code getDX().hideWithExitAnim();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	方法 是否为亮主题() : 逻辑型
		code return getDX().isLightTheme();
	结束 方法

	//强制刷新界面
	方法 刷新界面()
		code getDX().refreshUI();
	结束 方法

	//获取对话框实例化对象，您可以通过此方法更深度的定制Dialog的功能
	方法 取实例化对象() 为 对象
		code return getDX().getDialogImpl();
	结束 方法

	//获取自定义布局实例
	方法 取自定义布局View() 为 对象
		code return getDX().getCustomView();
	结束 方法

	定义事件 按钮1被单击() 为 逻辑型

	定义事件 按钮2被单击() 为 逻辑型

	定义事件 按钮3被单击() 为 逻辑型

	定义事件 返回键被单击() 为 逻辑型

	定义事件 外侧被单击() : 逻辑型

	定义事件 对话框启动()

	定义事件 对话框关闭()

结束 类

@导入Java("com.kongzue.dialogx.dialogs.*")
@导入Java("com.kongzue.dialogx.util.TextInfo")
@导入Java("com.kongzue.dialogx.interfaces.MenuItemTextInfoInterceptor")
类 DX底部菜单 : DX底部对话框

	@code
	BottomMenu dx = null;
	
	public #<DX底部菜单>() {
		this.dx = BottomMenu.build()
		.setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<BottomDialog>() {
         public void onShow(BottomDialog dialog) {#对话框启动();}
         public void onDismiss(BottomDialog dialog) {#对话框关闭();}
      }).setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<BottomDialog>(){
         public boolean onBackPressed(BottomDialog d){return #返回键被单击();}
      }).setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<BottomDialog>(){
	  	public boolean onClick(BottomDialog d, android.view.View v){return #外侧被单击();}
	  }).setOnIconChangeCallBack(new com.kongzue.dialogx.interfaces.OnIconChangeCallBack<BottomMenu>(true) {
         @Override
         public int getIcon(BottomMenu bottomMenu, int index, String menuText) {
            Object r = #关联图标(index,menuText);
            return r != null?(int)r:0;
         }
      }).setOnMenuItemClickListener(new com.kongzue.dialogx.interfaces.OnMenuItemClickListener<BottomMenu>() {
         public boolean onClick(BottomMenu dialog, CharSequence text, int index) {return #列表被点击(index,(String)text);}
      }).setMenuItemTextInfoInterceptor(new MenuItemTextInfoInterceptor<BottomMenu>() {
         public TextInfo menuItemTextInfo(BottomMenu dialog, int index, String menuText) {return #菜单项文字样式(index,menuText);}
      }).setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<BottomDialog>(){
         public boolean onBackPressed(BottomDialog d){return  #返回键被单击();}
      }).setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<BottomDialog>(){
	  	public boolean onClick(BottomDialog d, android.view.View v){return #外侧被单击();}
	  });
	}
	
	public BottomMenu getDX(){
		return (BottomMenu) dx;
	}
	@end

	方法 列表(列表 : 文本[]) : DX底部菜单
		code getDX().setMenuList(#列表);
		返回 本对象
	结束 方法

	方法 列表集合(列表 : 文本集合) : DX底部菜单
		code getDX().setMenuStringList(#列表);
		返回 本对象
	结束 方法

	方法 菜单文字样式(样式 为 DX文字样式) 为 DX底部菜单
		code getDX().setMenuTextInfo(#样式);
		返回 本对象
	结束 方法

	方法 支持多选()
		code getDX().setMultiSelection();
	结束 方法

	方法 置多选选中(选中索引 : 整数[])
		code getDX().setSelection(#选中索引);
	结束 方法

	方法 置多选选中集合(选中索引 : 整数集合)
		code getDX().setSelection(#选中索引);
	结束 方法

	方法 支持单选()
		code getDX().setSingleSelection();
	结束 方法

	方法 置单选选中(选中索引 : 整数)
		code getDX().setSelection(#选中索引);
	结束 方法

	定义事件 菜单项文字样式(索引 : 整数, 名称 : 文本) : DX文字样式

	定义事件 关联图标(索引 为 整数, 内容 为 文本) : 整数

	定义事件 列表被点击(索引 为 整数, 内容 为 文本) : 逻辑型

结束 类

@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.MessageDialog")
类 DX基础对话框

	@code
	MessageDialog dx = null;
	
	public #<DX基础对话框>() {
		this.dx = MessageDialog.build();
		监听器();
	}
	
	public MessageDialog getDX(){
		return (MessageDialog) dx;
	}
	@end

	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX基础对话框
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX基础对话框
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 标题(标题 为 文本) 为 DX基础对话框
		code getDX().setTitle(#标题);
		返回 本对象
	结束 方法

	方法 内容(内容 为 文本) 为 DX基础对话框
		code getDX().setMessage(#内容);
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮1(文本 为 文本) 为 DX基础对话框
		@code 
      getDX().setOkButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<MessageDialog>() {
         @Override
         public boolean onClick(MessageDialog baseDialog, android.view.View v) {
            Object r = #按钮1被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮2(文本 为 文本) 为 DX基础对话框
		@code
      getDX().setCancelButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<MessageDialog>() {
         @Override
         public boolean onClick(MessageDialog baseDialog, android.view.View v) {
            Object r = #按钮2被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮3(文本 为 文本) 为 DX基础对话框
		@code
      getDX().setOtherButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<MessageDialog>() {
         @Override
         public boolean onClick(MessageDialog baseDialog, android.view.View v) {
            Object r = #按钮3被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 可取消(是否 为 逻辑型) 为 DX基础对话框
		code getDX().setCancelable(#是否);
		返回 本对象
	结束 方法

	方法 最大宽度(宽 : 整数) : DX基础对话框
		code getDX().setMaxWidth(#宽);
		返回 本对象
	结束 方法

	方法 圆角(半径 : 整数)
		code getDX().setRadius(#半径);
	结束 方法

	方法 标题图标(图片 : 可绘制对象) : DX基础对话框
		code getDX().setTitleIcon(#图片);
		返回 本对象
	结束 方法

	方法 拦截触摸(是否 : 逻辑型) : DX基础对话框
		code getDX().setBkgInterceptTouch(#是否);
		返回 本对象
	结束 方法

	方法 开启动画时长(时长 为 长整数) 为 DX基础对话框
		code getDX().setEnterAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 关闭动画时长(时长 为 长整数) 为 DX基础对话框
		code getDX().setExitAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 标题文字样式(文字样式 为 DX文字样式) 为 DX基础对话框
		code getDX().setTitleTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 内容文字样式(文字样式 为 DX文字样式) 为 DX基础对话框
		code getDX().setMessageTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 按钮1文字样式(文字样式 为 DX文字样式) 为 DX基础对话框
		code getDX().setOkTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 按钮2文字样式(文字样式 为 DX文字样式) 为 DX基础对话框
		code getDX().setCancelTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 按钮3文字样式(文字样式 为 DX文字样式) 为 DX基础对话框
		code getDX().setOtherTextInfo(#文字样式);
		返回 本对象
	结束 方法

	//按钮显示方向
	方法 按钮纵向显示(方向 为 逻辑型) 为 DX基础对话框
		code getDX().setButtonOrientation(#方向 ? 1 : 0);
		返回 本对象
	结束 方法

	//设置背景颜色，强行对对话框背景进行染色
	方法 背景颜色(颜色 为 文本) 为 DX基础对话框
		code getDX().setBackgroundColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	//修改背景遮罩，这是为了丰富扩展性。
	方法 背景遮罩颜色(颜色 为 文本) 为 DX基础对话框
		code getDX().setMaskColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	方法 自定义布局(容器 为 组件容器) 为 DX基础对话框
		@code 
      getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<MessageDialog>(#<容器.取根布局>().getView()) {
         @Override
         public void onBind(MessageDialog dialog, android.view.View v) {
            //挂接事件 自定义布局设置(容器);
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 清除自定义布局()
		code getDX().removeCustomView();
	结束 方法

	方法 实现方式(方式 为 DX实现方式) 为 DX基础对话框
		code getDX().setDialogImplMode(#方式);
		返回 本对象
	结束 方法

	方法 显示() 为 DX基础对话框
		code getDX().show();
		返回 本对象
	结束 方法

	方法 隐藏()
		code getDX().hideWithExitAnim();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	//将按钮文本设置为 空文本
	方法 隐藏全部按钮()
		code getDX().setOkButton("");
		code getDX().setCancelButton("");
		code getDX().setOtherButton("");
	结束 方法

	//强制刷新界面
	方法 刷新界面()
		code getDX().refreshUI();
	结束 方法

	//获取对话框实例化对象，您可以通过此方法更深度的定制Dialog的功能
	方法 取实例化对象() 为 对象
		code return getDX().getDialogImpl();
	结束 方法

	//获取自定义布局实例
	方法 取自定义布局View() 为 对象
		code return getDX().getCustomView();
	结束 方法

	定义事件 按钮1被单击() 为 逻辑型

	定义事件 按钮2被单击() 为 逻辑型

	定义事件 按钮3被单击() 为 逻辑型

	定义事件 返回键被单击() 为 逻辑型

	定义事件 外侧被单击() : 逻辑型

	定义事件 对话框启动()

	定义事件 对话框关闭()

	@code
   public void 监听器(){
      getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<MessageDialog>() {
         @Override
         public void onShow(MessageDialog dialog) {
            //对话框启动时回调
            #对话框启动();
         }
         @Override
         public void onDismiss(MessageDialog dialog) {
            //对话框关闭时回调
            #对话框关闭();
         }
      });
	 getDX().setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<MessageDialog>(){
         @Override
         public boolean onBackPressed(MessageDialog d){
            Object r = #返回键被单击();
            return r != null?(boolean)r:false;
         }
      });
	  getDX().setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<MessageDialog>(){
	  	public boolean onClick(MessageDialog d, android.view.View v){
		  	return #外侧被单击();
		  }
	  });
	}
    @end

结束 类

@导入Java("com.kongzue.dialogx.dialogs.MessageDialog")
@导入Java("com.kongzue.dialogx.dialogs.InputDialog")
类 DX输入对话框 : DX基础对话框

	@code
	InputDialog dx = null;
	
	public #<DX输入对话框>() {
		this.dx = InputDialog.build();
		监听器();
	}
	
	public InputDialog getDX(){
		return (InputDialog) dx;
	}
	@end

	属性读 取输入内容() 为 文本
		code return getDX().getInputText();
	结束 属性

	方法 输入内容(文本 为 文本) 为 DX输入对话框
		code getDX().setInputText(#文本);
		返回 本对象
	结束 方法

	方法 提示文本(文本 为 文本) 为 DX输入对话框
		code getDX().setInputHintText(#文本);
		返回 本对象
	结束 方法

	方法 输入文字样式(输入样式 为 DX输入样式) 为 DX输入对话框
		code getDX().setInputInfo(#输入样式);
		返回 本对象
	结束 方法

	//是否自动弹出键盘
	方法 自动弹出键盘(是否 为 逻辑型) 为 DX输入对话框
		code getDX().setAutoShowInputKeyboard(#是否);
		返回 本对象
	结束 方法
	
	//设置为空文本则不显示
	方法 按钮1(文本 为 文本) 为 DX基础对话框
		@code 
      getDX().setOkButton(#文本,new com.kongzue.dialogx.interfaces.OnInputDialogButtonClickListener<InputDialog>() {
         @Override
         public boolean onClick(InputDialog baseDialog, android.view.View v, String s) {
            Object r = #按钮1被单击(s);
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮2(文本 为 文本) 为 DX基础对话框
		@code
      getDX().setCancelButton(#文本,new com.kongzue.dialogx.interfaces.OnInputDialogButtonClickListener<InputDialog>() {
         @Override
         public boolean onClick(InputDialog baseDialog, android.view.View v, String s) {
            Object r = #按钮2被单击(s);
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	//设置为空文本则不显示
	方法 按钮3(文本 为 文本) 为 DX基础对话框
		@code
      getDX().setOtherButton(#文本,new com.kongzue.dialogx.interfaces.OnInputDialogButtonClickListener<InputDialog>() {
         @Override
         public boolean onClick(InputDialog baseDialog, android.view.View v, String s) {
            Object r = #按钮3被单击(s);
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法
	
	定义事件 按钮1被单击(文本 : 文本) 为 逻辑型

	定义事件 按钮2被单击(文本 : 文本) 为 逻辑型

	定义事件 按钮3被单击(文本 : 文本) 为 逻辑型
	
	@code
	public void 监听器(){
		//super.监听器();
		/*getDX().setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<MessageDialog>(){
	  	public boolean onClick(MessageDialog d, android.view.View v){
		  	return #外侧被单击();
		  }
	  });*/
	}
	@end

结束 类

@外部依赖库("../依赖库")
@外部依赖库("../../安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.CustomDialog")
类 DX自定义对话框
	
	@code
	
	CustomDialog dx = null;
	
	public #<DX自定义对话框>() {
		this.dx = CustomDialog.build();
	}
	
	public CustomDialog getDX(){
		return (CustomDialog) dx;
	}
	@end

	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX自定义对话框
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX自定义对话框
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 宽度(宽 : 整数)
		code getDX().setWidth(#宽);
	结束 方法

	方法 高度(高 : 整数)
		code getDX().setHeight(#高);
	结束 方法

	方法 相对位置(相对位置 为 整数) 为 DX自定义对话框
		@code
		CustomDialog.ALIGN an = CustomDialog.ALIGN.CENTER;
		switch(#相对位置){
		case 0: an = CustomDialog.ALIGN.CENTER; break;
		case 100: an = CustomDialog.ALIGN.TOP; break;
		case 101: an = CustomDialog.ALIGN.TOP_CENTER; break;
		case 102: an = CustomDialog.ALIGN.TOP_LEFT; break;
		case 103: an = CustomDialog.ALIGN.TOP_RIGHT; break;
		case 110: an = CustomDialog.ALIGN.BOTTOM; break;
		case 111: an = CustomDialog.ALIGN.BOTTOM_CENTER; break;
		case 112: an = CustomDialog.ALIGN.BOTTOM_LEFT; break;
		case 113: an = CustomDialog.ALIGN.BOTTOM_RIGHT; break;
		case 120: an = CustomDialog.ALIGN.LEFT; break;
		case 121: an = CustomDialog.ALIGN.LEFT_CENTER; break;
		case 122: an = CustomDialog.ALIGN.LEFT_TOP; break;
		case 123: an = CustomDialog.ALIGN.LEFT_BOTTOM; break;
		case 130: an = CustomDialog.ALIGN.RIGHT; break;
		case 131: an = CustomDialog.ALIGN.RIGHT_CENTER; break;
		case 132: an = CustomDialog.ALIGN.RIGHT_TOP; break;
		case 133: an = CustomDialog.ALIGN.RIGHT_BOTTOM; break;
		}
		@end
		code getDX().setAlign(an);
		返回 本对象
	结束 方法
	
	
	code android.view.View v;
	code int dq = 0;

	方法 附着组件(组件 : 可视化组件)
		code if(dq != 0) getDX().setAlignBaseViewGravity(v = #组件.getView(), dq);
		code else getDX().setAlignBaseView(v = #组件.getView());
	结束 方法
	
	方法 附着位置(对齐方式 : DX对齐方式)
		code if(v != null) getDX().setAlignBaseViewGravity(v, (int)#对齐方式);
	结束 方法

	方法 附着组件边距(左 : 整数, 上 : 整数, 右 : 整数, 下 : 整数)
		code getDX().setBaseViewMargin(#左, #上, #右, #下);
	结束 方法

	方法 全屏显示(是否 : 逻辑型)
		code getDX().setFullScreen(#是否);
	结束 方法

	方法 可取消(是否 为 逻辑型) 为 DX自定义对话框
		code getDX().setCancelable(#是否);
		返回 本对象
	结束 方法

	方法 拦截触摸(是否 : 逻辑型) : DX自定义对话框
		code getDX().setBkgInterceptTouch(#是否);
		返回 本对象
	结束 方法

	方法 开启动画时长(时长 为 长整数) 为 DX自定义对话框
		code getDX().setEnterAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 关闭动画时长(时长 为 长整数) 为 DX自定义对话框
		code getDX().setExitAnimDuration(#时长);
		返回 本对象
	结束 方法

	//修改背景遮罩，这是为了丰富扩展性。
	方法 背景遮罩颜色(颜色 为 文本) 为 DX自定义对话框
		code getDX().setMaskColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	方法 沉浸式(是否 为 逻辑型) 为 DX自定义对话框
		code getDX().setAutoUnsafePlacePadding(!#是否);
		返回 本对象
	结束 方法

	方法 自定义布局(容器 为 组件容器) 为 DX自定义对话框
		@code 
      getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<CustomDialog>(#<容器.取根布局>().getView()){
         @Override
         public void onBind(CustomDialog dialog, android.view.View v) {
            //v.findViewById...
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 清除自定义布局()
		code getDX().removeCustomView();
	结束 方法

	方法 实现方式(方式 为 DX实现方式) 为 DX自定义对话框
		code getDX().setDialogImplMode(#方式);
		返回 本对象
	结束 方法

	方法 显示() 为 DX自定义对话框
		code getDX().show();
		返回 本对象
	结束 方法

	方法 隐藏()
		code getDX().hideWithExitAnim();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	//强制刷新界面
	方法 刷新界面()
		code getDX().refreshUI();
	结束 方法

	//获取对话框实例化对象，您可以通过此方法更深度的定制Dialog的功能
	方法 取实例化对象() 为 对象
		code return getDX().getDialogImpl();
	结束 方法

	//获取自定义布局实例
	方法 取自定义布局View() 为 对象
		code return getDX().getCustomView();
	结束 方法

	定义事件 对话框启动()

	定义事件 对话框关闭()

	定义事件 返回键被单击() 为 逻辑型

	定义事件 外侧被单击() : 逻辑型

	@code
    public void 监听器(){
      getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<CustomDialog>() {
         @Override
         public void onShow(CustomDialog dialog) {
            //对话框启动时回调
            #对话框启动();
         }
         @Override
         public void onDismiss(CustomDialog dialog) {
            //对话框关闭时回调
            #对话框关闭();
         }
      }).setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<CustomDialog>(){
         @Override
         public boolean onBackPressed(CustomDialog d){
            Object r = #返回键被单击();
            return r != null?(boolean)r:false;
         }
      }).setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<CustomDialog>(){
	  	public boolean onClick(CustomDialog d, android.view.View v){
		  	return #外侧被单击();
		  }
	  });
	}
   @end

结束 类

@外部依赖库("../依赖库/")
@外部依赖库("../../安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.FullScreenDialog")
类 DX全屏对话框 

	@code
	FullScreenDialog dx = null;
	
	public #<DX全屏对话框>() {
		this.dx = FullScreenDialog.build();
	}
	
	public FullScreenDialog getDX(){
		return (FullScreenDialog) dx;
	}
	@end

	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX全屏对话框
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX全屏对话框
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 自定义布局(容器 为 组件容器) 为 DX全屏对话框
		@code 
      getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<FullScreenDialog>(#<容器.取根布局>().getView()) {
         @Override
         public void onBind(FullScreenDialog dialog, android.view.View v) {
            //挂接事件 自定义布局设置(容器);
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 实现方式(方式 为 DX实现方式) 为 DX全屏对话框
		code getDX().setDialogImplMode(#方式);
		返回 本对象
	结束 方法

	方法 可取消(是否 为 逻辑型) 为 DX全屏对话框
		code getDX().setCancelable(#是否);
		返回 本对象
	结束 方法

	方法 最大宽度(宽 : 整数)
		code getDX().setMaxWidth(#宽);
	结束 方法

	方法 圆角(半径 : 整数)
		code getDX().setRadius(#半径);
	结束 方法

	//设置背景颜色，强行对对话框背景进行染色
	方法 背景颜色(颜色 为 文本) 为 DX全屏对话框
		code getDX().setBackgroundColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	方法 拦截触摸(是否 : 逻辑型) : DX全屏对话框
		code getDX().setAllowInterceptTouch(#是否);
		返回 本对象
	结束 方法

	/*
   //修改背景遮罩，这是为了丰富扩展性。
   方法 背景遮罩颜色(颜色 为 文本) 为 DX全屏对话框
      DX对话框.setMaskColor(转换操作.转换颜色(颜色))
      返回 本对象
   结束 方法*/

	方法 隐藏背景缩放(是否 : 逻辑型)
		code getDX().setHideZoomBackground(#是否);
	结束 方法

	方法 显示() 为 DX全屏对话框
		code getDX().show();
		返回 本对象
	结束 方法

	@静态
	方法 显示2(容器 为 组件容器) 为 DX全屏对话框
		变量 对话框 为 DX全屏对话框
		返回 对话框.自定义布局(容器).显示()
	结束 方法

	方法 隐藏()
		code getDX().hideWithExitAnim();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	//强制刷新界面
	方法 刷新界面()
		code getDX().refreshUI();
	结束 方法

	//获取对话框实例化对象，您可以通过此方法更深度的定制Dialog的功能
	方法 取实例化对象() 为 对象
		code return getDX().getDialogImpl();
	结束 方法

	//获取自定义布局实例
	方法 取自定义布局View() 为 对象
		code return getDX().getCustomView();
	结束 方法

	@code
    public void 监听器(){
      getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<FullScreenDialog>() {
         @Override
         public void onShow(FullScreenDialog dialog) {
            //对话框启动时回调
            #对话框启动();
         }
         @Override
         public void onDismiss(FullScreenDialog dialog) {
            //对话框关闭时回调
            #对话框关闭();
         }
      }).setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<FullScreenDialog>(){
         @Override
         public boolean onBackPressed(FullScreenDialog d){
            Object r = #返回键被单击();
            return r != null?(boolean)r:false;
         }
      }).setOnBackgroundMaskClickListener(new com.kongzue.dialogx.interfaces.OnBackgroundMaskClickListener<FullScreenDialog>(){
	  	public boolean onClick(FullScreenDialog d, android.view.View v){
		  	return #外侧被单击();
		  }
	  });
	}
    @end

	定义事件 对话框启动()

	定义事件 对话框关闭()

	定义事件 返回键被单击() 为 逻辑型

	定义事件 外侧被单击() : 逻辑型

结束 类

@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.PopTip")
@全局类
类 DX提示 

	@code
	PopTip dx = null;
	
	public #<DX提示>() {
		this.dx = PopTip.build();
		getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<PopTip>() {
         @Override
         public void onShow(PopTip dialog) {
            //对话框启动时回调
            #对话框启动();
         }
         @Override
         public void onDismiss(PopTip dialog) {
            //对话框关闭时回调
            #对话框关闭();
         }
      });
	}
	
	public PopTip getDX(){
		return (PopTip) dx;
	}
	@end

	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX提示
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX提示
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 内容(内容 为 文本) 为 DX提示
		code getDX().setMessage(#内容);
		返回 本对象
	结束 方法

	方法 时长(时长 为 长整数) 为 DX提示
		code getDX().autoDismiss(#时长);
		返回 本对象
	结束 方法

	方法 始终显示() : DX提示
		code getDX().noAutoDismiss();
		返回 本对象
	结束 方法

	方法 成功() : DX提示
		code getDX().iconSuccess();
		返回 本对象
	结束 方法

	方法 警告() : DX提示
		code getDX().iconWarning();
		返回 本对象
	结束 方法

	方法 错误() : DX提示
		code getDX().iconError();
		返回 本对象
	结束 方法

	方法 淡色图标(是否 : 逻辑型 = 真) : DX提示
		code getDX().setTintIcon(#是否);
		返回 本对象
	结束 方法

	方法 按钮(文本 为 文本) 为 DX提示
		@code 
	  getDX().setButton(#文本,new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<PopTip>() {
         @Override
         public boolean onClick(PopTip popTip, android.view.View v) {
            Object r = #按钮被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 开启动画时长(时长 为 长整数) 为 DX提示
		code getDX().setEnterAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 关闭动画时长(时长 为 长整数) 为 DX提示
		code getDX().setExitAnimDuration(#时长);
		返回 本对象
	结束 方法

	方法 内容文字样式(文字样式 为 DX文字样式) 为 DX提示
		code getDX().setMessageTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 按钮文字样式(文字样式 为 DX文字样式) 为 DX提示
		code getDX().setButtonTextInfo(#文字样式);
		返回 本对象
	结束 方法

	方法 图标(图标 为 图片资源) 为 DX提示
		code getDX().setIconResId(#图标);
		返回 本对象
	结束 方法

	//设置背景颜色，强行对对话框背景进行染色
	方法 背景颜色(颜色 为 文本) 为 DX提示
		code getDX().setBackgroundColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法

	方法 边距(左 : 整数, 上 : 整数, 右 : 整数, 下 : 整数)
		code getDX().setMargin(#左,#上,#右,#下);
	结束 方法

	方法 自定义布局(容器 为 组件容器) 为 DX提示
		@code 
		getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<PopTip>(#<容器.取根布局>().getView()) {
			@Override
			public void onBind(PopTip dialog, android.view.View v) {
				//挂接事件 自定义布局设置(容器);
			}
		});
		@end
		返回 本对象
	结束 方法

	方法 支持单击() 为 DX提示
		@code 
      getDX().setOnPopTipClickListener(new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<PopTip>() {
         @Override
         public boolean onClick(PopTip baseDialog, android.view.View v) {
            //点击 PopTip
            Object r = #被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 显示() 为 DX提示
		code getDX().show();
		返回 本对象
	结束 方法

	方法 显示2(自动消失 为 逻辑型) 为 DX提示
		如果 自动消失 则
			显示()
		否则
			code getDX().show().noAutoDismiss();
		结束 如果
		返回 本对象
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	//强制刷新界面
	方法 刷新界面()
		code getDX().refreshUI();
	结束 方法

	//获取对话框实例化对象，您可以通过此方法更深度的定制Dialog的功能
	方法 取实例化对象() 为 对象
		code return getDX().getDialogImpl();
	结束 方法

	//获取自定义布局实例
	方法 取自定义布局View() 为 对象
		code return getDX().getCustomView();
	结束 方法

	@静态 
	方法 弹出提示2(内容 为 文本, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.内容(内容).时长(时长).显示();
	结束 方法

	@静态 
	方法 弹出成功提示(内容 为 文本, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.内容(内容).时长(时长).成功().显示();
	结束 方法
	
	@静态 
	方法 弹出警告提示(内容 为 文本, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.内容(内容).时长(时长).警告().显示();
	结束 方法
	
	@静态 
	方法 弹出错误提示(内容 为 文本, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.内容(内容).时长(时长).错误().显示();
	结束 方法

	@静态 
	方法 弹出容器(容器 为 组件容器, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.自定义布局(容器).时长(时长).显示()
	结束 方法

	@静态 
	方法 弹出提示3(内容 为 文本,容器 为 组件容器, 时长 为 整数 = 2000) 为 DX提示
		变量 对话框 : DX提示
		返回 对话框.内容(内容).自定义布局(容器).时长(时长).显示()
	结束 方法

	定义事件 被单击() 为 逻辑型

	定义事件 按钮被单击() 为 逻辑型

	定义事件 对话框启动()

	定义事件 对话框关闭()

结束 类

@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.WaitDialog")
@导入Java("com.kongzue.dialogx.dialogs.TipDialog")
@全局类
类 DX加载

	@code
	static WaitDialog dx2 = null;
	WaitDialog dx = null;
	static String wb = "";
	public #<DX加载>() {
		this(null);
	}
	public #<DX加载>(WaitDialog w) {
		if(w != null) dx = dx2 = w;
		else dx = WaitDialog.build();
		dx.setOnBackPressedListener(new com.kongzue.dialogx.interfaces.OnBackPressedListener<WaitDialog>(){
         @Override
         public boolean onBackPressed(WaitDialog d){
            Object r = #返回键被单击();
            return r != null?(boolean)r:false;
         }
        });
	}
	
	public static boolean isShow() {
		return dx2 != null ? dx2.isShow() : false;
	}
	
	public WaitDialog getDX(){
		return (WaitDialog) dx;
	}
	
	public #<DX加载> setDX(WaitDialog dx){
		this.dx = dx;
		return this;
	}
	@end
	
	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX加载
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX加载
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	属性读 当前进度() 为 小数
		code return (#<@小数>)getDX().getProgress();
	结束 属性

	方法 内容(内容 为 文本) 为 DX加载
		code getDX().setMessage(wb = #内容);
		返回 本对象
	结束 方法

	方法 进度(进度 为 小数) 为 DX加载
		code getDX().setProgress((float)#进度);
		返回 本对象
	结束 方法
	
	方法 圆角(半径 为 整数) 为 DX加载
		code getDX().setRadius(#半径);
		返回 本对象
	结束 方法
	
	方法 内容样式(样式 为 DX文字样式) 为 DX加载
		code getDX().setMessageTextInfo(#样式);
		返回 本对象
	结束 方法
	
	// 0无  1成功  2结果  3错误
	方法 类型(类型 : 整数) : DX加载
		code getDX().setTipType(getType(#类型));
		返回 本对象
	结束 方法
	
	方法 自定义布局(容器 为 组件容器) 为 DX加载
		@code 
		getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<WaitDialog>(#<容器.取根布局>().getView()) {
			public void onBind(WaitDialog dialog, android.view.View v) {}
		});
		@end
		返回 本对象
	结束 方法

	方法 显示() 为 DX加载
		code getDX().show();
		code getDX().setMessage(wb);
		返回 本对象
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	定义事件 返回键被单击() 为 逻辑型

	@静态 
	方法 显示加载(内容 为 文本) : DX加载
		code return new #<DX加载>(WaitDialog.show(wb = #内容));
	结束 方法
	
	@静态 
	方法 显示加载进度(内容 为 文本,进度 为 小数) 为 DX加载
		code return new #<DX加载>(isShow() ? dx2.setProgress((float)#进度) : WaitDialog.show(#内容,(float)#进度));
	结束 方法

	@静态 
	方法 更新加载进度(内容 为 文本,进度 为 小数) 为 DX加载
		code return new #<DX加载>(isShow() ? dx2.setProgress((float)#进度) : WaitDialog.show(#内容,(float)#进度));
	结束 方法
	
	@静态
	方法 显示加载成功(内容 : 文本) : DX加载
		code return new #<DX加载>(isShow() ? dx2.setMessageContent(#内容).setTipType(getType(#类型_成功)) : WaitDialog.show(#内容).setTipType(getType(#类型_成功)));
	结束 方法
	
	@静态
	方法 显示加载警告(内容 : 文本) : DX加载
		code return new #<DX加载>(isShow() ? dx2.setMessageContent(#内容).setTipType(getType(#类型_警告)) : WaitDialog.show(#内容).setTipType(getType(#类型_警告)));
	结束 方法
	
	@静态
	方法 显示加载错误(内容 : 文本) : DX加载
		code return new #<DX加载>(isShow() ? dx2.setMessageContent(#内容).setTipType(getType(#类型_错误)) : WaitDialog.show(#内容).setTipType(getType(#类型_错误)));
	结束 方法
	
	@静态 
	方法 显示加载容器(内容 : 文本, 容器 : 组件容器) 为 DX加载
		@code
		#<DX加载> w = new #<DX加载>(isShow() ? dx2 : WaitDialog.show(#内容));
		w.getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<WaitDialog>(#<容器.取根布局>().getView()){
			public void onBind(WaitDialog d, android.view.View v){}
		});
		return w;
		@end
	结束 方法

	@静态 
	方法 关闭加载()
		code WaitDialog.dismiss();
	结束 方法
	
	@静态 
	方法 关闭加载进度()
		code WaitDialog.dismiss();
	结束 方法

	@静态
	常量 类型_无 为 整数 = 0
	@静态
	常量 类型_成功 为 整数 = 1
	@静态
	常量 类型_警告 为 整数 = 2
	@静态
	常量 类型_错误 为 整数 = 3

	@code
   public static WaitDialog.TYPE getType(int i){
   	switch(i){
	   case 0:
   	return WaitDialog.TYPE.NONE;
	   case 1:
   	return WaitDialog.TYPE.SUCCESS;
	   case 2:
   	return WaitDialog.TYPE.WARNING;
	   case 3:
   	return WaitDialog.TYPE.ERROR;
	   }
	   return WaitDialog.TYPE.NONE;
   }
   @end

	@静态
	方法 显示加载提示(内容 为 文本,类型 为 整数, 时长 为 整数 = 3000) 为 DX加载
		变量 对话框 : DX加载
		code return #对话框.setDX(TipDialog.show(#内容, getType(#类型), #时长));
	结束 方法

	@静态 
	方法 关闭提示()
		code TipDialog.dismiss();
	结束 方法

结束 类

@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.PopMenu")
类 DX菜单

	@code
	PopMenu dx = null;
	
	public #<DX菜单>() {
		this.dx = PopMenu.build();
		监听器();
	}
	
	public #<DX菜单>(PopMenu dx){
		this.dx = dx;
		监听器();
	}
	
	public PopMenu getDX(){
		return (PopMenu) dx;
	}
	@end
	
	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX菜单
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX菜单
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法

	方法 显示()
		code getDX().show();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	方法 菜单列表(项目列表 为 文本[]) 为 DX菜单
		code getDX().setMenuList(#项目列表);
		返回 本对象
	结束 方法

	方法 菜单列表集合(项目列表 为 文本集合) 为 DX菜单
		code getDX().setMenuList((java.util.ArrayList)#项目列表);
		返回 本对象
	结束 方法

	方法 宽度(宽度 为 整数) 为 DX菜单
		code getDX().setWidth(#宽度);
		返回 本对象
	结束 方法

	方法 高度(高度 为 整数) 为 DX菜单
		code getDX().setHeight(#高度);
		返回 本对象
	结束 方法

	//毫秒
	方法 入场动画时长(时长 为 整数) 为 DX菜单
		code getDX().overrideEnterDuration = #时长;
		返回 本对象
	结束 方法

	//毫秒
	方法 出场动画时长(时长 为 整数) 为 DX菜单
		code getDX().overrideExitDuration = #时长;
		返回 本对象
	结束 方法
	
	方法 圆角(半径 为 整数) 为 DX菜单
		code getDX().setRadius(#半径);
		返回 本对象
	结束 方法
	
	方法 自定义布局(组件 为 组件容器) 为 DX菜单
		@code 
      getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView(#<组件.取根布局>().getView()){
         public void onBind(Object dialog, android.view.View v) {
         }
         public void OnBindView(Object dialog, android.view.View v) {
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 依附组件(组件 : 可视化组件) 为 DX菜单
		code getDX().setOverlayBaseView(true).setBaseView(#组件.getView());
		返回 本对象
	结束 方法

	方法 依附位置(对齐方式 为 DX对齐方式) 为 DX菜单
		code getDX().setOverlayBaseView(false).setAlignGravity((int)#对齐方式);
		返回 本对象
	结束 方法

	方法 允许超出屏幕显示(是否 为 逻辑型) 为 DX菜单
		code getDX().setOffScreen(#是否);
		返回 本对象
	结束 方法

	方法 菜单文字样式(文字样式 为 DX文字样式) 为 DX菜单
		code getDX().setMenuTextInfo(#文字样式);
		返回 本对象
	结束 方法

	定义事件 菜单启动()

	定义事件 菜单关闭()

	定义事件 列表被点击(索引 为 整数, 内容 为 文本) 为 逻辑型

	定义事件 关联图标(索引 为 整数, 内容 为 文本) 为 整数
	
	定义事件 菜单项文字样式(索引 : 文本, 内容 : 文本) : DX文字样式

	@code
   public void 监听器(){
      getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<PopMenu>() {
         @Override
         public void onShow(PopMenu dialog) {
            //对话框启动时回调
            #菜单启动();
            super.onShow(dialog);
         }
         @Override
         public void onDismiss(PopMenu dialog) {
            //对话框关闭时回调
            #菜单关闭();
            super.onDismiss(dialog);
         }
      });
      getDX().setOnIconChangeCallBack(new com.kongzue.dialogx.interfaces.OnIconChangeCallBack<PopMenu>(true) {
         @Override
         public int getIcon(PopMenu bottomMenu, int index, String menuText) {
            Object r = #关联图标(index,menuText);
            return r != null?(int)r:0;
         }
      });
      getDX().setOnMenuItemClickListener(new com.kongzue.dialogx.interfaces.OnMenuItemClickListener<PopMenu>() {
         @Override
         public boolean onClick(PopMenu dialog, CharSequence text, int index) {
            return #列表被点击(index,(String)text);
         }
      });/*.setMenuItemTextInfoInterceptor(new com.kongzue.dialogx.interfaces.MenuItemTextInfoInterceptor<PopMenu>() {
         @Override
         public #<@DX文字样式> menuItemTextInfo(PopMenu dialog, int index, String menuText) {
            Object r = #菜单项文字样式(index, menuText);
            return r != null? (#<@DX文字样式>)r : null;
         }
      });*/
	  }
      @end
结束 类

@全局类
@外部依赖库("../../../../../依赖库/AllLib/DialogX")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/activity-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-common-2.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-runtime-2.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/fragment-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-common-2.2.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-runtime-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/lifecycle-viewmodel-2.2.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/savedstate-1.0.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@导入Java("com.kongzue.dialogx.dialogs.PopNotification")
类 DX通知
	
	@code
	PopNotification dx = null;
	
	public #<DX通知>() {
		this.dx = PopNotification.build();
		监听器();
	}
	
	public #<DX通知>(PopNotification dx){
		this.dx = dx;
		监听器();
	}
	
	public PopNotification getDX(){
		return (PopNotification) dx;
	}
	@end
	
	//样式  默认0-Material  1-MaterialYou  2-空祖  3-IOS  4-MIUI
	方法 样式(样式 为 DX样式) 为 DX通知
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code getDX().setStyle(new com.kongzue.dialogx.style.MaterialStyle());
			是 1 
				code getDX().setStyle(new com.kongzue.dialogxmaterialyou.style.MaterialYouStyle());
			是 2 
				code getDX().setStyle(new com.kongzue.dialogx.style.KongzueStyle());
			是 3 
				code getDX().setStyle(new com.kongzue.dialogx.style.IOSStyle());
			是 4 
				code getDX().setStyle(new com.kongzue.dialogx.style.MIUIStyle());
		结束 假如
		返回 本对象
	结束 方法

	//亮/暗色/自动 主题
	方法 主题(主题 : DX主题) : DX通知
		code getDX().setTheme(#主题);
		返回 本对象
	结束 方法
	
	方法 图标(图标 为 可绘制对象) 为 DX通知
		code getDX().setIcon(#图标);
		返回 本对象
	结束 方法
	
	方法 图标2(图标 为 图片资源) 为 DX通知
		code getDX().setIconResId(#图标);
		返回 本对象
	结束 方法
	
	方法 成功图标() : DX通知
		code getDX().iconSuccess();
		返回 本对象
	结束 方法
	
	方法 警告图标() : DX通知
		code getDX().iconWarning();
		返回 本对象
	结束 方法
	
	方法 错误图标() : DX通知
		code getDX().iconError();
		返回 本对象
	结束 方法
	
	方法 图标大小(大小 为 整数) 为 DX通知
		code getDX().setIconSize(#大小);
		返回 本对象
	结束 方法
	
	方法 标题(标题 为 文本) 为 DX通知
		code getDX().setTitle(#标题);
		返回 本对象
	结束 方法
	
	方法 内容(内容 为 文本) 为 DX通知
		code getDX().setMessage(#内容);
		返回 本对象
	结束 方法
	
	方法 按钮(文本 为 文本) 为 DX通知
		@code 
	  getDX().setButton(#文本).setOnButtonClickListener(new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<PopNotification>() {
         @Override
         public boolean onClick(PopNotification popTip, android.view.View v) {
            Object r = #按钮被单击();
            return r != null?(boolean)r:false;
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 时长(时长 为 长整数) 为 DX通知
		code getDX().autoDismiss(#时长);
		返回 本对象
	结束 方法
	
	方法 标题文字样式(文字样式 为 DX文字样式) 为 DX通知
		code getDX().setTitleTextInfo(#文字样式);
		返回 本对象
	结束 方法
	
	方法 内容文字样式(文字样式 为 DX文字样式) 为 DX通知
		code getDX().setMessageTextInfo(#文字样式);
		返回 本对象
	结束 方法
	
	方法 按钮文字样式(文字样式 为 DX文字样式) 为 DX通知
		code getDX().setButtonTextInfo(#文字样式);
		返回 本对象
	结束 方法
	
	方法 背景颜色(颜色 为 文本) 为 DX通知
		code getDX().setBackgroundColor(android.graphics.Color.parseColor(#颜色));
		返回 本对象
	结束 方法
	
	方法 自定义布局(容器 为 组件容器) 为 DX通知
		@code 
      getDX().setCustomView(new com.kongzue.dialogx.interfaces.OnBindView<PopNotification>(#<容器.取根布局>().getView()){
         @Override
         public void onBind(PopNotification dialog, android.view.View v) {
            //v.findViewById...
         }
      });
      @end
		返回 本对象
	结束 方法

	方法 清除自定义布局()
		code getDX().removeCustomView();
	结束 方法
	
	方法 显示()
		code getDX().show();
	结束 方法

	方法 关闭()
		code getDX().dismiss();
	结束 方法

	方法 始终显示() : DX通知
		code getDX().noAutoDismiss();
		返回 本对象
	结束 方法
	
	@静态
	方法 弹出通知(标题 : 文本, 内容 : 文本 = 空, 图标 : 可绘制对象 = 空, 时长 : 整数 = 2000) : DX通知
		变量 通知 : DX通知
		通知.标题(标题)
		如果 图标 != 空
			通知.图标(图标)
		结束 如果
		如果 内容 != 空
			通知.内容(内容)
		结束 如果
		通知.时长(时长)
		通知.显示()
		返回 通知
	结束 方法
	
	@静态
	方法 弹出成功通知(标题 : 文本, 内容 : 文本 = 空, 时长 : 整数 = 2000) : DX通知
		变量 通知 : DX通知
		通知.标题(标题).成功图标()
		如果 内容 != 空
			通知.内容(内容)
		结束 如果
		通知.时长(时长)
		通知.显示()
		返回 通知
	结束 方法
	
	@静态
	方法 弹出警告通知(标题 : 文本, 内容 : 文本 = 空, 时长 : 整数 = 2000) : DX通知
		变量 通知 : DX通知
		通知.标题(标题).警告图标()
		如果 内容 != 空
			通知.内容(内容)
		结束 如果
		通知.时长(时长)
		通知.显示()
		返回 通知
	结束 方法
	
	@静态
	方法 弹出错误通知(标题 : 文本, 内容 : 文本 = 空, 时长 : 整数 = 2000) : DX通知
		变量 通知 : DX通知
		通知.标题(标题).错误图标()
		如果 内容 != 空
			通知.内容(内容)
		结束 如果
		通知.时长(时长)
		通知.显示()
		返回 通知
	结束 方法
	
	定义事件 被单击() 为 逻辑型

	定义事件 按钮被单击() 为 逻辑型
	
	定义事件 对话框启动()

	定义事件 对话框关闭()
	
	@code
	void 监听器(){
	getDX().setDialogLifecycleCallback(new com.kongzue.dialogx.interfaces.DialogLifecycleCallback<PopNotification>() {
         @Override
         public void onShow(PopNotification dialog) {
            //对话框启动时回调
            #对话框启动();
         }
         @Override
         public void onDismiss(PopNotification dialog) {
            //对话框关闭时回调
            #对话框关闭();
         }
      });
	  getDX().setOnPopNotificationClickListener(new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<PopNotification>() {
         @Override
         public boolean onClick(PopNotification baseDialog, android.view.View v) {
            //点击 PopTip
            return #被单击();
         }
      });
	
	}
	@end
	
结束 类

@导入Java("com.kongzue.dialogx.dialogs.GuideDialog")
类 DX引导 : DX自定义对话框
	
	@code
	GuideDialog dx = null;
	
	public #<DX引导>() {
		this.dx = GuideDialog.build();
		监听器();
	}
	
	public #<DX引导>(GuideDialog dx){
		this.dx = dx;
		监听器();
	}
	
	public GuideDialog getDX(){
		return (GuideDialog) dx;
	}
	@end
	
	方法 目标组件(组件 : 可视化组件) : DX引导
		code getDX().setAlignBaseViewGravity(#组件.getView());
		返回 本对象
	结束 方法
	
	方法 灯光形状(形状 : DX形状)
		code getDX().setStageLightType(#形状);
	结束 方法
	
	方法 灯光圆角(半径 : 整数)
		code getDX().setStageLightFilletRadius(#半径);
	结束 方法
	
	方法 目标组件灯光位置(对齐 : DX对齐方式)
		code getDX().setAlignBaseViewGravity(#对齐);
	结束 方法
	
	方法 提示图片(图片 : 可绘制对象)
		code getDX().setTipImage(#图片);
	结束 方法
	
	方法 提示图片2(图片 : 图片资源)
		code getDX().setTipImage(#图片);
	结束 方法
	
	方法 提示图片3(图片 : 位图对象)
		code getDX().setTipImage(#图片);
	结束 方法
	
	方法 边距(左 : 整数, 上 : 整数, 右 : 整数, 下 : 整数)
		code getDX().setBaseViewMargin(#左,#上,#右,#下);
	结束 方法
	
	定义事件 灯光被单击() : 逻辑型
	
	@code
	public void 监听器(){
		super.监听器();
		getDX().setOnStageLightPathClickListener(new com.kongzue.dialogx.interfaces.OnDialogButtonClickListener<GuideDialog>() {
         @Override
         public boolean onClick(GuideDialog baseDialog, android.view.View v) {
            Object r = #灯光被单击();
            return r != null?(boolean)r:false;
         }
        });
	 }
	@end
	
结束 类