@全局类
@外部依赖库("../../../../../依赖库/AarLib/utilcodex-1.26.0.aar")
@导入Java("android.app.Activity")
@导入Java("java.lang.reflect.Field")
@导入Java("java.util.Map")
@导入Java("java.lang.reflect.InvocationTargetException")
@导入Java("com.blankj.utilcode.util.Utils")
类 环境工具
	
	@静态
	方法 取全局上下文() : 应用
		code return Utils.getApp();
	结束 方法
	
	@静态
	方法 取安卓环境() : 安卓环境
		code return Utils.getApp().getApplicationContext();
	结束 方法
	
	@静态
	方法 取安卓窗口() : 安卓窗口
		@code
		try {
            Class activityThreadClass = Class.forName("android.app.ActivityThread");
            Object activityThread = activityThreadClass.getMethod("currentActivityThread").invoke(
                null);
            Field activitiesField = activityThreadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
            Map activities = (Map) activitiesField.get(activityThread);
            for (Object activityRecord : activities.values()) {
                Class activityRecordClass = activityRecord.getClass();
                Field pausedField = activityRecordClass.getDeclaredField("paused");
                pausedField.setAccessible(true);
                if (!pausedField.getBoolean(activityRecord)) {
                    Field activityField = activityRecordClass.getDeclaredField("activity");
                    activityField.setAccessible(true);
                    Activity activity = (Activity) activityField.get(activityRecord);
                    return activity;
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
		@end
	结束 方法
	
结束 类