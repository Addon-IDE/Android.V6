@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("com.blankj.utilcode.util.PathUtils")
类 路径工具
	
	@静态
	方法 取根目录() : 文本
		code return PathUtils.getRootPath();
	结束 方法
	
	@静态
	方法 取数据目录() : 文本
		code return PathUtils.getDataPath();
	结束 方法
	
	@静态
	方法 取数据目录路径() : 文本
		code return PathUtils.getInternalAppDataPath();
	结束 方法
	
	@静态
	方法 取私有目录路径() : 文本
		code return PathUtils.getInternalAppFilesPath();
	结束 方法
	
	@静态
	方法 取数据库目录路径() : 文本
		code return PathUtils.getInternalAppDbsPath();
	结束 方法
	
	@静态
	方法 取数据库指定目录路径(路径:文本) : 文本
		code return PathUtils.getInternalAppDbPath(#路径);
	结束 方法
	
	@静态
	方法 取共享数据目录路径() : 文本
		code return PathUtils.getInternalAppSpPath();
	结束 方法
	
	@静态
	方法 取无备份文件路径() : 文本
		code return PathUtils.getInternalAppNoBackupFilesPath();
	结束 方法
	
	@静态
	方法 取通知路径() : 文本
		code return PathUtils.getExternalNotificationsPath();
	结束 方法
	
	@静态
	方法 取obb数据包目录路径() : 文本
		code return PathUtils.getExternalAppObbPath();
	结束 方法
	
结束 类