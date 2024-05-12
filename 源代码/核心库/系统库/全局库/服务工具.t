@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@指代类("com.blankj.utilcode.util.ServiceUtils")
类 服务工具
	
	@静态
	常量 绑定自动创建 : 整数?
	
	@code
	static{
	   #绑定自动创建=android.content.Context.BIND_AUTO_CREATE;
	}
	@end
	
	@静态
	@嵌入式代码
	方法 启动服务(欲启动服务 : 安卓服务)
		code #<@服务工具>.startService(#欲启动服务.class)
	结束 方法
	
	@静态
	@嵌入式代码
	方法 关闭服务(欲关闭服务 : 安卓服务)
    	code #<@服务工具>.stopService(#欲关闭服务.class)
	结束 方法
	
	@静态
	@嵌入式代码
	方法 绑定服务(欲绑定服务 : 安卓服务,连接 : 服务连接,标志 : 整数=绑定自动创建)
		code #<@服务工具>.bindService(#欲绑定服务.class,#连接,#标志)
	结束 方法
	
	@静态
	方法 解除绑定服务(连接 : 服务连接)
		code #<@服务工具>.startService(#连接);
	结束 方法
	
	@静态
	@嵌入式代码
	方法 服务正在运行(服务 : 安卓服务) : 逻辑型
		code #<@服务工具>.isServiceRunning(#服务.class)
	结束 方法
	
结束 类

@导入Java("android.os.IBinder")
@导入Java("android.content.ComponentName")
@导入Java("android.content.ServiceConnection")
@后缀代码("implements ServiceConnection")
类 服务连接
	@code
	@Override
	public void onServiceConnected(ComponentName name, IBinder service) {
		#服务已连接(name,service);
	}

	@Override
	public void onServiceDisconnected(ComponentName name) {
	      #服务已断开连接(name);
	}
	@end
	
	定义事件 服务已连接(名称:组件名称,服务:粘合剂)
    定义事件 服务已断开连接(名称:组件名称)
结束 类

@指代类("android.content.ComponentName")
类 组件名称
结束 类

@指代类("android.os.IBinder")
类 粘合剂
结束 类