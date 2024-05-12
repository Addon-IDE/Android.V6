@外部依赖库("../../../../依赖库/JarLib/exception_handling.jar")
@导入Java(" android.widget. *")
@导入Java(" android.os. *")
@导入Java(" android.view. *")
@导入Java(" android.view.View. *")
@导入Java(" android.webkit. *")
@导入Java(" android.graphics. *")
@导入Java(" android.graphics.drawable. *")
@导入Java(" android.app. *")
@导入Java(" android.content. *")
@导入Java(" android.content.res. *")
@导入Java(" java.util. *")
@导入Java(" java.io. *")
@导入Java("com.ExceptionCapture.activity.MyUncaughtExceptionHandler")
@导入Java("com.ExceptionCapture.activity.UncaughtExceptionActivity")
@全局类
@附加可变清单([[	<activity
		android:label="null"
		android:name="com.ExceptionCapture.activity.UncaughtExceptionActivity"/>]])
类 全局异常处理
	@静态 
	//初始化异常处理，设置 重启 功能所打开的窗口和日志保存路径，如果路径是文件夹路径，则使用崩溃时间来当做日志名称，在 全局应用 里调用
	@静态 
	方法 初始化(上下文环境 为 安卓环境,重启窗口 为 安卓窗口,异常保存路径 为 文本)
		@code
		MyUncaughtExceptionHandler.ExceptionFilepath = #异常保存路径;
		UncaughtExceptionActivity.启动Activity = #重启窗口;
		MyUncaughtExceptionHandler.getInstance(#上下文环境).init();
        @end
	结束 方法

	//初始化异常处理，并设置 重启 功能所打开的窗口，在 全局应用 里调用
	@静态
	方法 初始化(上下文环境 为 安卓环境,重启窗口 为 安卓窗口)
		@code
		UncaughtExceptionActivity.启动Activity = #重启窗口;
		MyUncaughtExceptionHandler.getInstance(#上下文环境).init();
		@end
	结束 方法

	//初始化异常处理，并设置日志保存路径，如果路径是文件夹路径，则使用崩溃时间来当做日志名称，在 全局应用 里调用
	@静态 
	方法 初始化(上下文环境 为 安卓环境,异常保存路径 为 文本)
		@code
		MyUncaughtExceptionHandler.ExceptionFilepath = #异常保存路径;
		MyUncaughtExceptionHandler.getInstance(#上下文环境).init();
		@end
	结束 方法

	//初始化异常处理，在 全局应用 里调用
	@静态
	方法 初始化(上下文环境 为 安卓环境)
	code	MyUncaughtExceptionHandler.getInstance(#上下文环境).init();
	结束 方法

结束 类