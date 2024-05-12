包名 结绳.安卓.XX权限

@外部依赖库("../../../../依赖库/AarLib/permission_request_framework/XXPermissions-16.2.aar")
@外部依赖库("../../../../依赖库/AarLib/permission_request_framework/support-fragment-28.0.0.aar")
@指代类("com.hjq.permissions.XXPermissions")
@导入Java("com.hjq.permissions.XXPermissions")
类 XX权限
	@静态
	方法 设置请求对象(当前安卓环境 : 安卓环境) : XX权限
		code return XXPermissions.with(#当前安卓环境);
	结束 方法

	方法 添加权限(权限 : 文本) : XX权限
		code return #this.permission(#权限);
	结束 方法

	方法 添加权限组(权限组 : 文本[]) : XX权限
		code return #this.permission(#权限组);
	结束 方法

	方法 添加权限集合(权限集合 : 文本集合) : XX权限
		code return #this.permission(#权限集合);
	结束 方法

	方法 置不触发错误检测机制() : XX权限
		code return #this.unchecked();
	结束 方法

	方法 置权限请求拦截器(拦截器 : 权限请求拦截器) : XX权限
		code return #this.interceptor(#拦截器);
	结束 方法

	方法 请求权限(回调 : 权限申请回调)
		code #this.request(#回调);
	结束 方法	

	@静态
	方法 申请单个权限(所处安卓环境 : 安卓环境, 权限 : 文本, 回调 : 权限申请回调)
		XX权限.设置请求对象(所处安卓环境).添加权限(权限).请求权限(回调)
	结束 方法

	@静态
	方法 申请多个权限_权限组(所处安卓环境 : 安卓环境, 权限组 : 文本[], 回调 : 权限申请回调)
		XX权限.设置请求对象(所处安卓环境).添加权限组(权限组).请求权限(回调)
	结束 方法

	@静态
	方法 申请多个权限_权限集合(所处安卓环境 : 安卓环境, 权限集合 : 文本集合, 回调 : 权限申请回调)
		XX权限.设置请求对象(所处安卓环境).添加权限集合(权限集合).请求权限(回调)
	结束 方法

	@静态
	属性写 置全局权限请求拦截器(拦截器 : 权限请求拦截器)
		code XXPermissions.setInterceptor(#拦截器);
	结束 属性

	@静态
	属性读 取全局权限请求拦截器() : 权限请求拦截器
		code return (#<权限请求拦截器>) XXPermissions.getInterceptor();
	结束 属性

	@静态
	方法 是否授予权限(当前安卓环境 : 安卓环境, 权限 : 文本) : 逻辑型
		code return XXPermissions.isGranted(#当前安卓环境, #权限);
	结束 方法

	@静态
	方法 是否授予权限组(当前安卓环境 : 安卓环境, 权限组 : 文本[]) : 逻辑型
		code return XXPermissions.isGranted(#当前安卓环境, #权限组);
	结束 方法

	@静态
	方法 是否授予权限集合(当前安卓环境 : 安卓环境, 权限集合 : 文本集合) : 逻辑型
		code return XXPermissions.isGranted(#当前安卓环境, #权限集合);
	结束 方法

	@静态
	方法 取未授予权限(当前安卓环境 : 安卓环境, 权限 : 文本) : 文本集合
		code return (java.util.ArrayList<String>) XXPermissions.getDenied(#当前安卓环境, #权限);
	结束 方法

	@静态
	方法 取未授予权限从组(当前安卓环境 : 安卓环境, 权限组 : 文本[]) : 文本集合
		code return (java.util.ArrayList<String>) XXPermissions.getDenied(#当前安卓环境, #权限组);
	结束 方法

	@静态
	方法 取未授予权限从集合(当前安卓环境 : 安卓环境, 权限集合 : 文本集合) : 文本集合
		code return (java.util.ArrayList<String>) XXPermissions.getDenied(#当前安卓环境, #权限集合);
	结束 方法

	@静态
	方法 是否为特殊权限(权限 : 文本) : 逻辑型
		code return XXPermissions.isSpecial(#权限);
	结束 方法

	@静态
	方法 是否包含特殊权限(权限组 : 文本[]) : 逻辑型
		code return XXPermissions.containsSpecial(#权限组);
	结束 方法

	@静态
	方法 是否包含特殊权限从集合(权限集合 : 文本集合) : 逻辑型
		code return XXPermissions.containsSpecial(#权限集合);
	结束 方法

	@静态
	方法 权限是否永远拒绝(当前安卓窗口 : 安卓窗口, 权限 : 文本) : 逻辑型
		code return XXPermissions.isPermanentDenied(#当前安卓窗口, #权限);
	结束 方法

	@静态
	方法 权限组是否永远拒绝(当前安卓窗口 : 安卓窗口, 权限组 : 文本[]) : 逻辑型
		code return XXPermissions.isPermanentDenied(#当前安卓窗口, #权限组);
	结束 方法

	@静态
	方法 权限集合是否永远拒绝(当前安卓窗口 : 安卓窗口, 权限集合 : 文本集合) : 逻辑型
		code return XXPermissions.isPermanentDenied(#当前安卓窗口, #权限集合);
	结束 方法

	@静态
	方法 跳转到应用权限设置页(当前安卓环境 : 安卓环境)
		code XXPermissions.startPermissionActivity(#当前安卓环境);
	结束 方法

	/**
	 * 不是所有权限都能跳转
	 */
	@静态
	方法 跳转到应用权限设置页_权限(当前安卓环境 : 安卓环境, 权限 : 文本)
		code XXPermissions.startPermissionActivity(#当前安卓环境, #权限);
	结束 方法

	/**
	 * 不是所有权限都能跳转
	 */
	@静态
	方法 跳转到应用权限设置页_权限组(当前安卓环境 : 安卓环境, 权限组 : 文本[])
		code XXPermissions.startPermissionActivity(#当前安卓环境, #权限组);
	结束 方法

	/**
	 * 不是所有权限都能跳转
	 */
	@静态
	方法 跳转到应用权限设置页_权限集合(当前安卓环境 : 安卓环境, 权限集合 : 文本集合)
		code XXPermissions.startPermissionActivity(#当前安卓环境, #权限集合);
	结束 方法

	/**
	 * 如果项目已经适配了 Android 10 分区存储特性，请调用该方法
     * 如果当前项目没有适配这特性，那么这一步骤可以忽略
     * 需要注意的是：这个选项是框架用于判断当前项目是否适配了分区存储，
	 * 需要注意的是，如果你的项目已经适配了分区存储特性，可以使用 READ_EXTERNAL_STORAGE、WRITE_EXTERNAL_STORAGE 来申请权限，
	 * 如果你的项目还没有适配分区特性，就算申请了 READ_EXTERNAL_STORAGE、WRITE_EXTERNAL_STORAGE 权限也会导致无法正常读取外部存储上面的文件，
	 * 如果你的项目没有适配分区存储，请使用 MANAGE_EXTERNAL_STORAGE 来申请权限，这样才能正常读取外部存储上面的文件，
	 * 你如果想了解更多关于 Android 10 分区存储的特性，可以访问 https://github.com/getActivity/AndroidVersionAdapter#android-100。
	 */
	@附加清单([[
	<!-- 表示当前项目已经适配了分区存储特性 -->
        <meta-data
            android:name="ScopedStorage"
            android:value="true" />
	]])
	@静态
	方法 置分区存储特性()

	结束 方法

结束 类

@导入Java("android.app.Activity")
@导入Java("java.util.List")
@导入Java("java.util.ArrayList")
@导入Java("com.hjq.permissions.OnPermissionCallback")
@后缀代码("implements com.hjq.permissions.IPermissionInterceptor")
类 权限请求拦截器
	@code
	@Override
    public void requestPermissions(Activity activity, List<String> allPermissions, OnPermissionCallback callback) {
	    #权限申请拦截(activity, (ArrayList<String>) allPermissions, (#<权限申请回调>) callback);
	}
	
	@Override
    public void grantedPermissions(Activity activity, List<String> allPermissions, List<String> grantedPermissions,  boolean all, OnPermissionCallback callback) {
	    #权限授予回调拦截(activity, (ArrayList<String>) allPermissions, (ArrayList<String>) grantedPermissions, all, (#<权限申请回调>) callback);
	}
	
	@Override
    public void deniedPermissions(Activity activity, List<String> allPermissions, List<String> deniedPermissions,  boolean never, OnPermissionCallback callback) {
	    #权限拒绝回调拦截(activity, (ArrayList<String>) allPermissions, (ArrayList<String>) deniedPermissions, never, (#<权限申请回调>) callback);
	}
	@end

	定义事件 权限申请拦截(当前安卓窗口 : 安卓窗口, 申请权限集合 : 文本集合, 回调 : 权限申请回调)

	定义事件 权限授予回调拦截(当前安卓窗口 : 安卓窗口, 申请权限集合 : 文本集合, 授予权限集合 : 文本集合, 已全部获取 : 逻辑型, 回调 : 权限申请回调)

	定义事件 权限拒绝回调拦截(当前安卓窗口 : 安卓窗口, 申请权限集合 : 文本集合, 拒绝权限集合 : 文本集合, 已永远拒绝 : 逻辑型, 回调 : 权限申请回调)
结束 类

@导入Java("java.util.List")
@导入Java("java.util.ArrayList")
@后缀代码("implements com.hjq.permissions.OnPermissionCallback")
类 权限申请回调
	@code
	@Override
    public void onGranted(List<String> permissions, boolean all) {
	    #已授予权限((ArrayList<String>) permissions, all);
	}
	
	@Override
	public void onDenied(List<String> permissions, boolean never) {
	    #已拒绝权限((ArrayList<String>) permissions, never);
	}
	@end

	定义事件 已授予权限(授予权限集合 : 文本集合, 已全部获取 : 逻辑型)

	定义事件 已拒绝权限(拒绝权限集合 : 文本集合, 已永远拒绝 : 逻辑型)
结束 类

类 安卓权限定义 : 结绳.安卓.安卓权限
	/**
     * 闹钟权限（特殊权限，Android 12 新增的权限）
     *
     * 需要注意的是：这个权限和其他特殊权限不同的是，默认已经是授予状态，用户也可以手动撤销授权
     * 官方文档介绍：https://developer.android.google.cn/about/versions/12/behavior-changes-12?hl=zh_cn#exact-alarm-permission
     */
    @静态
	常量 闹钟权限 : 文本 = "android.permission.SCHEDULE_EXACT_ALARM"

    /**
     * 文件管理权限（特殊权限，Android 11 新增的权限）
     *
     * 为了兼容 Android 11 以下版本，需要在清单文件中注册
     * {@link Permission#READ_EXTERNAL_STORAGE} 和 {@link Permission#WRITE_EXTERNAL_STORAGE} 权限
     *
     * 如果你的应用需要上架 GooglePlay，那么需要详细查看：https://support.google.com/googleplay/android-developer/answer/9956427
     */
    @静态
	常量 文件管理权限 : 文本 = "android.permission.MANAGE_EXTERNAL_STORAGE"

    /**
     * 安装应用权限（特殊权限，Android 8.0 新增的权限）
     *
     * Android 11 特性调整，安装外部来源应用需要重启 App：https://cloud.tencent.com/developer/news/637591
     * 经过实践，Android 12 已经修复了此问题，授权或者取消授权后应用并不会重启
     */
    @静态
    常量 安装应用权限 : 文本 = "android.permission.REQUEST_INSTALL_PACKAGES"

    /**
     * 画中画权限（特殊权限，Android 8.0 新增的权限，注意此权限不需要在清单文件中注册也能申请）
     *
     * 需要注意的是：这个权限和其他特殊权限不同的是，默认已经是授予状态，用户也可以手动撤销授权
     */
    @静态
    常量 画中画权限 : 文本 = "android.permission.PICTURE_IN_PICTURE"

    /**
     * 悬浮窗权限（特殊权限，Android 6.0 新增的权限）
     *
     * 在 Android 10 及之前的版本能跳转到应用悬浮窗设置页面，而在 Android 11 及之后的版本只能跳转到系统设置悬浮窗管理列表了
     * 官方解释：https://developer.android.google.cn/reference/android/provider/Settings#ACTION_MANAGE_OVERLAY_PERMISSION
     */
    @静态
    常量 悬浮窗权限 : 文本 = "android.permission.SYSTEM_ALERT_WINDOW"

    /** 系统设置权限（特殊权限，Android 6.0 新增的权限） */
    @静态
    常量 系统设置权限 : 文本 = "android.permission.WRITE_SETTINGS"

    /** 请求忽略电池优化选项权限（特殊权限，Android 6.0 新增的权限）*/
    @静态
    常量 请求忽略电池优化选项权限 : 文本 = "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    /** 勿扰权限，可控制手机响铃模式【静音，震动】（特殊权限，Android 6.0 新增的权限）*/
    @静态
    常量 勿扰权限 : 文本 = "android.permission.ACCESS_NOTIFICATION_POLICY"

    /** 查看应用使用情况权限，简称使用统计权限（特殊权限，Android 5.0 新增的权限） */
    @静态
    常量 查看应用使用情况权限 : 文本 = "android.permission.PACKAGE_USAGE_STATS"

    /** 通知栏监听权限（特殊权限，Android 4.3 新增的权限，注意此权限不需要在清单文件中注册也能申请） */
    @静态
    常量 通知栏监听权限 : 文本 = "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE"

    /** VPN 权限（特殊权限，Android 4.0 新增的权限，注意此权限不需要在清单文件中注册也能申请） */
    @静态
    常量 VPN权限 : 文本 = "android.permission.BIND_VPN_SERVICE"

    /** 通知栏权限（特殊权限，注意此权限不需要在清单文件中注册也能申请） */
    @静态
    常量 通知栏权限 : 文本 = "android.permission.NOTIFICATION_SERVICE"

    /* ------------------------------------ 我是一条华丽的分割线 ------------------------------------ */

    /**
     * 发送通知权限（Android 13.0 新增的权限）
     *
     * 为了兼容 Android 13 以下版本，框架会自动申请 {@link #NOTIFICATION_SERVICE} 权限
     */
    @静态
    常量 发送通知权限 : 文本 = "android.permission.POST_NOTIFICATIONS"

    /**
     * WIFI 权限（Android 13.0 新增的权限）
     *
     * 需要在清单文件中加入 android:usesPermissionFlags="neverForLocation" 属性（表示不推导设备地理位置）
     * 否则就会导致在没有定位权限的情况下扫描不到附近的 WIFI 设备，这个是经过测试的，下面是清单权限注册案例，请参考以下进行注册
     * <uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES" android:usesPermissionFlags="neverForLocation" tools:targetApi="s" />
     *
     * 为了兼容 Android 13 以下版本，需要清单文件中注册 {@link #ACCESS_FINE_LOCATION} 权限
     * 还有 Android 13 以下设备，使用 WIFI 需要精确定位权限，框架会自动在旧的安卓设备上自动添加此权限进行动态申请
     */
    @静态
	常量 WIFI权限 : 文本 = "android.permission.NEARBY_WIFI_DEVICES"

    /**
     * 后台传感器权限（Android 13.0 新增的权限）
     *
     * 需要注意的是：
     * 1. 一旦你申请了该权限，在授权的时候，需要选择《始终允许》，而不能选择《仅在使用中允许》
     * 2. 如果你的 App 只在前台状态下使用传感器功能，请不要申请该权限（后台传感器权限）
     */
    @静态
    常量 后台传感器权限 : 文本 = "android.permission.BODY_SENSORS_BACKGROUND"

    /**
     * 读取图片权限（Android 13.0 新增的权限）
     *
     * 为了兼容 Android 13 以下版本，需要在清单文件中注册 {@link #READ_EXTERNAL_STORAGE} 权限
     */
    @静态
    常量 读取图片权限 : 文本 = "android.permission.READ_MEDIA_IMAGES"

    /**
     * 读取视频权限（Android 13.0 新增的权限）
     *
     * 为了兼容 Android 13 以下版本，需要在清单文件中注册 {@link #READ_EXTERNAL_STORAGE} 权限
     */
    @静态
    常量 读取视频权限 : 文本 = "android.permission.READ_MEDIA_VIDEO"

    /**
     * 读取音频权限（Android 13.0 新增的权限）
     *
     * 为了兼容 Android 13 以下版本，需要在清单文件中注册 {@link #READ_EXTERNAL_STORAGE} 权限
     */
    @静态
    常量 读取音频权限 : 文本 = "android.permission.READ_MEDIA_AUDIO"

    /**
     * 蓝牙扫描权限（Android 12.0 新增的权限）
     *
     * 需要在清单文件中加入 android:usesPermissionFlags="neverForLocation" 属性（表示不推导设备地理位置）
     * 否则就会导致在没有定位权限的情况下扫描不到附近的蓝牙设备，这个是经过测试的，下面是清单权限注册案例，请参考以下进行注册
     * <uses-permission android:name="android.permission.BLUETOOTH_SCAN" android:usesPermissionFlags="neverForLocation" tools:targetApi="s" />
     *
     * 为了兼容 Android 12 以下版本，需要清单文件中注册 {@link Manifest.permission#BLUETOOTH_ADMIN} 权限
     * 还有 Android 12 以下设备，获取蓝牙扫描结果需要精确定位权限，框架会自动在旧的安卓设备上自动添加此权限进行动态申请
     */
    @静态
    常量 蓝牙扫描权限 : 文本 = "android.permission.BLUETOOTH_SCAN"

    /**
     * 蓝牙连接权限（Android 12.0 新增的权限）
     *
     * 为了兼容 Android 12 以下版本，需要在清单文件中注册 {@link Manifest.permission#BLUETOOTH} 权限
     */
    @静态
    常量 蓝牙连接权限 : 文本 = "android.permission.BLUETOOTH_CONNECT"

    /**
     * 蓝牙广播权限（Android 12.0 新增的权限）
     *
     * 将当前设备的蓝牙进行广播，供其他设备扫描时需要用到该权限
     * 为了兼容 Android 12 以下版本，需要在清单文件中注册 {@link Manifest.permission#BLUETOOTH_ADMIN} 权限
     */
    @静态
    常量 蓝牙广播权限 : 文本 = "android.permission.BLUETOOTH_ADVERTISE"

    /**
     * 在后台获取位置（Android 10.0 新增的权限）
     *
     * 需要注意的是：
     * 1. 一旦你申请了该权限，在授权的时候，需要选择《始终允许》，而不能选择《仅在使用中允许》
     * 2. 如果你的 App 只在前台状态下使用定位功能，请不要申请该权限（后台定位权限）
     */
    @静态
    常量 在后台获取位置 : 文本 = "android.permission.ACCESS_BACKGROUND_LOCATION"

    /**
     * 获取活动步数（Android 10.0 新增的权限）
     *
     * 需要注意的是：Android 10 以下不需要传感器（BODY_SENSORS）权限也能获取到步数
     */
    @静态
    常量 获取活动步数 : 文本 = "android.permission.ACTIVITY_RECOGNITION"

    /**
     * 读取照片中的地理位置（Android 10.0 新增的权限）
     *
     * 需要注意的是：如果这个权限申请成功了但是不能正常读取照片的地理信息，那么需要先申请存储权限：
     *
     * 如果项目 targetSdkVersion <= 29 需要申请 {@link Permission.Group#STORAGE}
     * 如果项目 targetSdkVersion >= 30 需要申请 {@link Permission#MANAGE_EXTERNAL_STORAGE}
     */
    @静态
    常量 读取照片中的地理位置 : 文本 = "android.permission.ACCESS_MEDIA_LOCATION"

    /** 允许呼叫应用继续在另一个应用中启动的呼叫（Android 9.0 新增的权限） */
    @静态
    常量 允许呼叫应用继续在另一个应用中启动的呼叫 : 文本 = "android.permission.ACCEPT_HANDOVER"

    /**
     * 读取手机号码（Android 8.0 新增的权限）
     *
     * 为了兼容 Android 8.0 以下版本，需要在清单文件中注册 {@link #READ_PHONE_STATE} 权限
     */
    @静态
    常量 读取手机号码 : 文本 = "android.permission.READ_PHONE_NUMBERS"

    /**
     * 接听电话（Android 8.0 新增的权限，Android 8.0 以下可以采用模拟耳机按键事件来实现接听电话，这种方式不需要权限）
     */
    @静态
    常量 接听电话 : 文本 = "android.permission.ANSWER_PHONE_CALLS"

    /** 读取外部存储 */
    @静态
    常量 读取外部存储  : 文本 = "android.permission.READ_EXTERNAL_STORAGE"

    /** 写入外部存储 */
    @静态
    常量 写入外部存储 : 文本 = "android.permission.WRITE_EXTERNAL_STORAGE"

    /** 相机权限 */
    @静态
    常量 相机权限 : 文本 = "android.permission.CAMERA"

    /** 麦克风权限 */
    @静态
    常量 麦克风权限 : 文本 = "android.permission.RECORD_AUDIO"

    /** 获取精确位置 */
    @静态
    常量 获取精确位置 : 文本 = "android.permission.ACCESS_FINE_LOCATION"

    /** 获取粗略位置 */
    @静态
    常量 获取粗略位置 : 文本 = "android.permission.ACCESS_COARSE_LOCATION"

    /** 读取联系人 */
    @静态
    常量 读取联系人 : 文本 = "android.permission.READ_CONTACTS"

    /** 修改联系人 */
    @静态
    常量 修改联系人 : 文本 = "android.permission.WRITE_CONTACTS"

    /** 访问账户列表 */
    @静态
    常量 访问账户列表 : 文本 = "android.permission.GET_ACCOUNTS"

    /** 读取日历 */
    @静态
    常量 读取日历 : 文本 = "android.permission.READ_CALENDAR"

    /** 修改日历 */
    @静态
    常量 修改日历 : 文本 = "android.permission.WRITE_CALENDAR"

    /**
     * 读取电话状态
     *
     * 需要注意的是：这个权限在某些手机上面是没办法获取到的，因为某些系统禁止应用获得该权限
     *             所以你要是申请了这个权限之后没有弹授权框，而是直接回调授权失败方法
     *             请不要惊慌，这个不是 Bug、不是 Bug、不是 Bug，而是正常现象
     *
     * 后续情况汇报：有人反馈在 iQOO 手机上面获取不到该权限，在清单文件加入下面这个权限就可以了（这里只是做记录，并不代表这种方式就一定有效果）
     *             <uses-permission android:name="android.permission.READ_PRIVILEGED_PHONE_STATE" />
     */
    @静态
    常量 读取电话状态 : 文本 = "android.permission.READ_PHONE_STATE"

    /** 拨打电话 */
    @静态
    常量 拨打电话 : 文本 = "android.permission.CALL_PHONE"

    /** 读取通话记录 */
    @静态
    常量 读取通话记录 : 文本 = "android.permission.READ_CALL_LOG"

    /** 修改通话记录 */
    @静态
    常量 修改通话记录 : 文本 = "android.permission.WRITE_CALL_LOG"

    /** 添加语音邮件 */
    @静态
    常量 添加语音邮件 : 文本 = "com.android.voicemail.permission.ADD_VOICEMAIL"

    /** 使用SIP视频 */
    @静态
    常量 使用SIP视频 : 文本 = "android.permission.USE_SIP"

    /**
     * 处理拨出电话
     *
     * @deprecated         在 Android 10 已经过时，请见：https://developer.android.google.cn/reference/android/Manifest.permission?hl=zh_cn#PROCESS_OUTGOING_CALLS
     */
    @静态
    常量 处理拨出电话 : 文本 = "android.permission.PROCESS_OUTGOING_CALLS"

    /** 使用传感器 */
    @静态
    常量 使用传感器 : 文本 = "android.permission.BODY_SENSORS"

    /** 发送短信 */
    @静态
    常量 发送短信 : 文本 = "android.permission.SEND_SMS"

    /** 接收短信 */
    @静态
    常量 接收短信 : 文本 = "android.permission.RECEIVE_SMS"

    /** 读取短信 */
    @静态
    常量 读取短信 : 文本 = "android.permission.READ_SMS"

    /** 接收 WAP 推送消息 */
    @静态
    常量 接收WAP推送消息 : 文本 = "android.permission.RECEIVE_WAP_PUSH"

    /** 接收彩信 */
    @静态
    常量 接收彩信 : 文本 = "android.permission.RECEIVE_MMS"
结束 类

类 安卓权限组定义
	/** 存储权限 */
	@静态
	常量 存储权限 : 文本[] = {安卓权限定义.读取外部存储, 安卓权限定义.写入外部存储}
	
	/** 日历权限 */
	@静态
	常量 日历权限 : 文本[] = {安卓权限定义.读取日历, 安卓权限定义.修改日历}
	
	/** 联系人权限 */
	@静态
	常量 联系人权限 : 文本[] = {安卓权限定义.读取联系人, 安卓权限定义.修改联系人, 安卓权限定义.访问账户列表}
	
	/** 蓝牙权限 */
	@静态
	常量 蓝牙权限 : 文本[] = {安卓权限定义.蓝牙扫描权限, 安卓权限定义.蓝牙连接权限, 安卓权限定义.蓝牙广播权限}
结束 类

@指代类("com.hjq.permissions.PermissionFragment")
@导入Java("com.hjq.permissions.PermissionFragment")
类 权限申请页面
	@静态
	方法 启动权限申请(当前安卓窗口 : 安卓窗口, 申请权限集合 : 文本集合, 拦截器 : 权限请求拦截器, 回调 : 权限申请回调)
		code PermissionFragment.beginRequest(#当前安卓窗口, #申请权限集合, #拦截器, #回调);
	结束 方法
结束 类