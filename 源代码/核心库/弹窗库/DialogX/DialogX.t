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
@附加清单([[<activity
            android:name="com.kongzue.dialogx.util.DialogXFloatingWindowActivity"
            android:configChanges="orientation|keyboardHidden|screenSize|mcc|mnc|locale|touchscreen|keyboard|navigation|fontScale"
            android:exported="false"
            android:theme="@style/DialogXFloatingWindow"
            android:windowSoftInputMode="adjustResize" />]])
@导入Java("com.kongzue.dialogx.DialogX")
类 DX全局设置

	@静态 
	方法 初始化(上下文 : 安卓环境)
		code DialogX.init(#上下文.getApplicationContext());
	结束 方法

	//开启调试模式，在部分情况下会使用 Log 输出日志信息
	@静态 
	方法 开启调试(是否 : 逻辑型)
		code DialogX.DEBUGMODE = #是否;
	结束 方法

	// 0 : VIEW , 1 : WINDOW , 2 : DIALOG_FRAGMENT
	@静态 
	方法 实现方式(方式 : DX实现方式)
		code DialogX.implIMPLMode = #方式;
	结束 方法

	//设置主题样式
	@静态 
	方法 全局样式(样式 为 DX样式)
		变量 y : 整数 = 0
		code #y = #样式;
		假如 y
			是 0 
				code DialogX.globalStyle = com.kongzue.dialogx.style.MaterialStyle.style();
			是 1 
				code DialogX.globalStyle = com.kongzue.dialogxmaterialyou.style.MaterialYouStyle.style();
			是 2 
				code DialogX.globalStyle = com.kongzue.dialogx.style.KongzueStyle.style();
			是 3 
				code DialogX.globalStyle = com.kongzue.dialogx.style.IOSStyle.style();
			是 4 
				code DialogX.globalStyle = com.kongzue.dialogx.style.MIUIStyle.style();
		结束 假如
	结束 方法

	/*设置亮色/暗色（在启动下一个对话框时生效  
   0-自动  1-亮  2-暗*/
	@静态 
	方法 主题(主题 : DX主题)
		code DialogX.globalTheme = #主题;
	结束 方法

	//设置对话框最大宽度（单位为像素）
	@静态 
	方法 最大宽度(最大宽 : 整数)
		code DialogX.dialogMaxWidth = #最大宽;
	结束 方法

	//设置 输入对话框 自动弹出键盘
	@静态 
	方法 自动弹出键盘(是否 : 逻辑型)
		code DialogX.autoShowInputKeyboard = #是否;
	结束 方法

	//限制 简单提示 一次只显示一个实例（开启后可以同时弹出多个 简单提示）
	@静态 
	方法 弹出多个(是否 : 逻辑型)
		code DialogX.onlyOnePopTip = !#是否;
	结束 方法

	//设置对话框默认按钮文本字体样式
	@静态 
	方法 默认按钮文字样式(样式 : DX文字样式)
		code DialogX.buttonTextInfo = #样式;
	结束 方法

	//设置对话框默认确定按钮文字样式
	@静态 
	方法 默认确定按钮文字样式(样式 : DX文字样式)
		code DialogX.okButtonTextInfo = #样式;
	结束 方法

	//设置对话框默认标题文字样式
	@静态 
	方法 默认标题文字样式(样式 : DX文字样式)
		code DialogX.titleTextInfo = #样式;
	结束 方法

	//设置对话框默认内容文字样式
	@静态 
	方法 默认内容文字样式(样式 : DX文字样式)
		code DialogX.messageTextInfo = #样式;
	结束 方法

	//设置默认 等待框 文字样式
	@静态 
	方法 默认等待框文字样式(样式 : DX文字样式)
		code DialogX.tipTextInfo = #样式;
	结束 方法

	//设置默认输入框文字样式
	@静态 
	方法 默认输入框文字样式(样式 : DX输入样式)
		code DialogX.inputInfo = #样式;
	结束 方法

	//设置默认底部菜单、对话框的标题文字样式
	@静态 
	方法 默认菜单标题文字样式(样式 : DX文字样式)
		code DialogX.menuTitleInfo = #样式;
	结束 方法

	//设置默认底部菜单文本样式
	@静态 
	方法 默认菜单内容文字样式(样式 : DX文字样式)
		code DialogX.menuTextInfo = #样式;
	结束 方法

	//设置默认对话框背景颜色
	@静态 
	方法 默认背景颜色(颜色 : 文本)
		code DialogX.backgroundColor = android.graphics.Color.parseColor(#颜色);
	结束 方法

	//设置默认对话框默认是否可以点击外围遮罩区域或返回键关闭，此开关不影响提示框（TipDialog）以及等待框（TipDialog）
	@静态 
	方法 默认可取消(是否 : 逻辑型)
		code DialogX.cancelable = #是否;
	结束 方法

	//设置默认提示框及等待框默认是否可以关闭
	@静态 
	方法 等待框默认可关闭(是否 : 逻辑型)
		code DialogX.cancelableTipDialog = #是否;
	结束 方法

	//设置默认取消按钮文本文字，影响 底部对话框
	@静态 
	方法 默认取消按钮文本(文本 : 文本)
		code DialogX.cancelButtonText = #文本;
	结束 方法

	//设置默认 简单提示 文本样式
	@静态 
	方法 默认提示文字样式(样式 : DX文字样式)
		code DialogX.popTextInfo = #样式;
	结束 方法

	//设置全局 Dialog 生命周期监听器
	//DialogX.dialogLifeCycleListener = (DialogLifecycleCallback);

	//设置 等待框 明暗风格，不设置则默认根据 globalTheme 定义
	@静态 
	方法 等待框亮暗显示模式(亮暗 : 整数)
		//DialogX.tipTheme = (THEME);
		假如 亮暗
			是 0 
				code DialogX.tipTheme = DialogX.THEME.AUTO;
			是 1 
				code DialogX.tipTheme = DialogX.THEME.LIGHT;
			是 2 
				code DialogX.tipTheme = DialogX.THEME.DARK;
		结束 假如
	结束 方法

	//默认 等待框 背景颜色（值: ColorInt，为-1不生效）
	@静态 
	方法 等待框默认背景色(颜色 : 文本)
		code DialogX.tipBackgroundColor = android.graphics.Color.parseColor(#颜色);
	结束 方法

	/**
 * 重写 等待框 进度动画颜色，
 * 注意此属性为覆盖性质，即设置此值将替换提示框原本的进度动画的颜色，包括亮暗色切换的颜色变化也将被替代
 */
	@静态 
	方法 等待框进度颜色(颜色 : 文本)
		code DialogX.tipProgressColor = android.graphics.Color.parseColor(#颜色);
	结束 方法

	/*设置 底部对话框 导航栏背景颜色*/
	@静态 
	方法 底部对话框导航栏背景色(颜色 : 文本)
		code DialogX.bottomDialogNavbarColor = android.graphics.Color.parseColor(#颜色);
	结束 方法
	
	@静态
	方法 支持显示多个提示(是否 为 逻辑型)
		code com.kongzue.dialogx.DialogX.onlyOnePopTip = !#是否;
	结束 方法

结束 类

@指代类("com.kongzue.dialogx.util.TextInfo")
类 DX文字样式 

	属性读 大小() : 整数
		code return #this.getFontSize();
	结束 属性

	属性读 对齐方式() : 整数
		code return #this.getGravity();
	结束 属性

	属性读 颜色() : 整数
		code return #this.getFontColor();
	结束 属性

	属性读 粗体() : 逻辑型
		code return #this.isBold();
	结束 属性

	属性读 最大行数() : 逻辑型
		code return #this.isBold();
	结束 属性

	属性读 显示省略号() : 逻辑型
		code return #this.isBold();
	结束 属性

	方法 大小(大小 : 整数) : DX文字样式
		code #this.setFontSize(#大小);
		code return #this;
	结束 方法
	
	方法 大小2(大小 : 整数) : DX文字样式
		code #this.setFontSize(#大小);
		code return #this;
	结束 方法

	方法 对齐方式(Gravity : 整数) : DX文字样式
		code #this.setGravity(#Gravity);
		code return #this;
	结束 方法

	方法 颜色(颜色 : 文本) : DX文字样式
		code #this.setFontColor(android.graphics.Color.parseColor(#颜色));
		code return #this;
	结束 方法
	
	方法 颜色2(颜色 : 文本) : DX文字样式
		code #this.setFontColor(android.graphics.Color.parseColor(#颜色));
		code return #this;
	结束 方法

	方法 粗体(是否 : 逻辑型) : DX文字样式
		code #this.setBold(#是否);
		code return #this;
	结束 方法

	方法 最大行数(行数 : 整数) : DX文字样式
		code #this.setMaxLines(#行数);
		code return #this;
	结束 方法

	方法 显示省略号(是否显示 : 逻辑型) : DX文字样式
		code #this.setShowEllipsis(#是否显示);
		code return #this;
	结束 方法

结束 类

@指代类("com.kongzue.dialogx.util.InputInfo")
类 DX输入样式

	属性读 最大长度() : 整数
		code return #this.getMAX_LENGTH();
	结束 属性

	属性读 输入类型() : 整数
		code return #this.getInputType();
	结束 属性

	属性读 文字样式() : DX文字样式
		code return #this.getTextInfo();
	结束 属性

	属性读 支持多行() : 逻辑型
		code return #this.isMultipleLines();
	结束 属性

	属性读 默认选中所有文字() : 逻辑型
		code return #this.isSelectAllText();
	结束 属性

	方法 最大长度(长度 : 整数) : DX输入样式
		code #this.setMAX_LENGTH(#长度);
		code return #this;
	结束 方法

	方法 输入类型(类型 : 整数) : DX输入样式
		code #this.setInputType(#类型);
		code return #this;
	结束 方法

	方法 文字样式(样式 : DX文字样式) : DX输入样式
		code #this.setTextInfo(#样式);
		code return #this;
	结束 方法

	方法 支持多行(是否 : 逻辑型) : DX输入样式
		code #this.setMultipleLines(#是否);
		code return #this;
	结束 方法

	方法 默认选中所有文字(是否 : 逻辑型) : DX输入样式
		code #this.setSelectAllText(#是否);
		code return #this;
	结束 方法

结束 类

@常量类型(整数)
@需求值类型(整数)
类 DX样式

	@静态
	常量 Material : DX样式 = 0
	@静态 
	常量 MaterialYou : DX样式 = 1
	@静态 
	常量 Kongzue : DX样式 = 2
	@静态 
	常量 IOS : DX样式 = 3
	@静态 
	常量 MIUI : DX样式 = 4

结束 类


@指代类("com.kongzue.dialogx.DialogX.THEME")
类 DX主题
	@静态
	常量 亮色 : DX主题?
	@静态
	常量 暗色 : DX主题?
	@静态
	常量 自动 : DX主题?

	@code
	static {
		#亮色 = #<@DX主题>.LIGHT;
		#暗色 = #<@DX主题>.DARK;
		#自动 = #<@DX主题>.AUTO;
	}
	@end

结束 类

@指代类("com.kongzue.dialogx.DialogX.IMPL_MODE")
类 DX实现方式

	@静态
	常量 VIEW : DX实现方式?
	@静态
	常量 WINDOW : DX实现方式?
	@静态
	常量 DIALOG_FRAGMENT : DX实现方式?
	@静态
	常量 FLOATING_ACTIVITY : DX实现方式?

	@code
	static {
		#VIEW = #<@DX实现方式>.VIEW;
		#WINDOW = #<@DX实现方式>.WINDOW;
		#DIALOG_FRAGMENT = #<@DX实现方式>.DIALOG_FRAGMENT;
		#FLOATING_ACTIVITY = #<@DX实现方式>.FLOATING_ACTIVITY;
	}
	@end

结束 类

@常量类型(整数)
@需求值类型(整数)
类 DX对齐方式
	
	@静态
	常量 上 : DX对齐方式 = 48
	
	@静态
	常量 上左 : DX对齐方式 = 51
	
	@静态
	常量 上右 : DX对齐方式 = 53
	
	@静态
	常量 下 : DX对齐方式 = 80
	
	@静态
	常量 下左 : DX对齐方式 = 83
	
	@静态
	常量 下右 : DX对齐方式 = 85
	
	@静态
	常量 左 : DX对齐方式 = 19
	
	@静态
	常量 右 : DX对齐方式 = 21
	
	@静态
	常量 居中 : DX对齐方式 = 17
	
结束 类

@禁止创建对象
@禁止继承
@指代类("com.kongzue.dialogx.dialogs.GuideDialog.STAGE_LIGHT_TYPE")
类 DX形状
	
	@静态
	常量 矩形 : DX形状?
	@静态
	常量 方形 : DX形状?
	@静态
	常量 方形_内 : DX形状?
	@静态
	常量 圆形 : DX形状?
	@静态
	常量 圆形_内 : DX形状?
	
	@code
	static {
        #矩形 = #<@DX形状>.RECTANGLE;      //矩形
        #方形 = #<@DX形状>.SQUARE_OUTSIDE; //方形（外围）
        #方形_内 = #<@DX形状>.SQUARE_INSIDE;  //方形（内围）
        #圆形 = #<@DX形状>.CIRCLE_OUTSIDE; //圆形（外围）
        #圆形_内 = #<@DX形状>.CIRCLE_INSIDE;  //圆形（内围）
	}
	@end
	
结束 类

@常量类型(整数)
@需求值类型(整数)
类 DX相对位置
	@静态
	常量 居中 : 整数 = 0
	@静态
	常量 上 : 整数 = 100
	@静态
	常量 上_中 : 整数 = 101
	@静态
	常量 上_左 : 整数 = 102
	@静态
	常量 上_右 : 整数 = 103
	@静态
	常量 下 : 整数 = 110
	@静态
	常量 下_中 : 整数 = 111
	@静态
	常量 下_左 : 整数 = 112
	@静态
	常量 下_右 : 整数 = 113
	@静态
	常量 左 : 整数 = 120
	@静态
	常量 左_中 : 整数 = 121
	@静态
	常量 左_上 : 整数 = 122
	@静态
	常量 左_下 : 整数 = 123
	@静态
	常量 右 : 整数 = 130
	@静态
	常量 右_中 : 整数 = 131
	@静态
	常量 右_上 : 整数 = 132
	@静态
	常量 右_下 : 整数 = 133
结束 类
	
	