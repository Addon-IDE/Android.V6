@强制输出
@导入Java("android.view.View")
类 编辑器_代码编辑器_快捷栏 : 可视化组件

	//布局
	@隐藏
	@输出名("LayoutList")
	变量 LayoutList : 编辑器_代码编辑器_快捷栏布局?

	@code
    public #<编辑器_代码编辑器_快捷栏>(android.content.Context context) {
        super(context);
		#初始化();
    }

    @Override
    public View onCreateView(android.content.Context context) {
	    LayoutList = new #<编辑器_代码编辑器_快捷栏布局>(context);
		view = LayoutList.getLayout().getView();
        return view;
    }
	
    @Override
    public View getView() {
        return (View) view;
    }
    @end

	变量 设置_设定 : 设置_设定

	//初始化
	方法 初始化()
		//列表被点击
		事件 LayoutList.线性布局4:被单击()
			列表被点击()
		结束 事件
		//关闭被点击
		事件 LayoutList.线性布局5:被单击()
			关闭被点击()
		结束 事件
		如果 设置_设定.获取开关("NightMode") 则
			LayoutList.线性布局2.背景颜色 = 0XFF333333
			LayoutList.线性布局3.背景颜色 = 0XFF333333
			LayoutList.文本框1.字体颜色 = 0XFFFFFFFF
		结束 如果
	结束 方法

	属性读 标题() : 文本
		返回 LayoutList.文本框1.内容
	结束 属性

	属性写 标题(内容 : 文本)
		LayoutList.文本框1.内容 = 内容
	结束 属性

	属性读 标记2() : 文本
		返回 LayoutList.文本框2.内容
	结束 属性

	属性写 标记2(内容 : 文本)
		LayoutList.文本框2.内容 = 内容
	结束 属性

	属性写 下线颜色(类型 : 整数)
		如果 类型 == 1 则
			LayoutList.线性布局3.背景颜色 = 0XFFDD3A3A
		否则
			如果 设置_设定.获取开关("NightMode") 则
				LayoutList.线性布局3.背景颜色 = 0XFF333333
			否则
				LayoutList.线性布局3.背景颜色 = 0XFFFFFFFF
			结束 如果
		结束 如果
	结束 属性

	方法 隐藏()
		LayoutList.线性布局1.可视 = 假
	结束 方法


	定义事件 列表被点击()
	定义事件 关闭被点击()

结束 类

类 编辑器_代码编辑器_快捷栏布局 : 组件容器

	@布局配置([[根布局=真,宽度=-2,高度=-2,纵向布局=真]])
	变量 线性布局1 : 线性布局
	@布局配置([[父布局=线性布局1,宽度DP=120,高度DP=43,背景颜色=-1,对齐方式=17]])
	变量 线性布局2 : 线性布局
	@布局配置([[父布局=线性布局2,宽度DP=90,高度DP=43,对齐方式=8388627,水波纹效果=真]])
	变量 线性布局4 : 线性布局
	@布局配置([[父布局=线性布局4,@左外边距DP=10,字体大小=15,单行显示=真,省略显示=0]])
	变量 文本框1 : 文本框
	@布局配置([[父布局=线性布局4,可视=假]])
	变量 文本框2 : 文本框
	@布局配置([[父布局=线性布局2,高度DP=43,宽度DP=30,对齐方式=17,水波纹效果=真]])
	变量 线性布局5 : 线性布局
	@布局配置([[父布局=线性布局5,宽度DP=20,高度DP=20,图片资源="../../../../资源库/图标/editor/code_editor/x.png"]])
	变量 图片框1 : 图片框
	@布局配置([[父布局=线性布局1,宽度DP=120,高度DP=2,背景颜色=-1]])
	变量 线性布局3 : 线性布局

结束 类