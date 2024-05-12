@全局类
@导入Java("android.content.Context")
@导入Java("android.content.pm.ShortcutManager")
@导入Java("android.content.Intent")
@导入Java("android.content.pm.ShortcutInfo")
@导入Java("android.graphics.drawable.Icon")
@导入Java("android.app.PendingIntent")
类 桌面快捷方式工具
	
	@静态
	方法 添加桌面快捷方式(窗口:安卓窗口,图标:整数)
		@code
		Context context=#<环境工具.取安卓环境>();
		ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(Context.SHORTCUT_SERVICE);
        if (shortcutManager.isRequestPinShortcutSupported()) {
            Intent shortcutInfoIntent = new Intent(context, #窗口.getClass());
            shortcutInfoIntent.setAction(Intent.ACTION_VIEW); //action必须设置，不然报错
            ShortcutInfo info = new ShortcutInfo.Builder(context, "The only id")
                .setIcon(Icon.createWithResource(context, #图标))
                .setShortLabel(#窗口.getString(R.string.app_name))
                .setIntent(shortcutInfoIntent)
                .build();
            //当添加快捷方式的确认弹框弹出来时，将被回调
            PendingIntent shortcutCallbackIntent = PendingIntent.getBroadcast(context, 0, new Intent(context, #窗口.getClass()), PendingIntent.FLAG_UPDATE_CURRENT);
            shortcutManager.requestPinShortcut(info, shortcutCallbackIntent.getIntentSender());
        }
		@end
	结束 方法
	
	@静态
	方法 创建桌面快捷方式(窗口:Java类,图标:整数)
		@code
		Context context=#<环境工具.取安卓环境>();
		ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(Context.SHORTCUT_SERVICE);
        if (shortcutManager.isRequestPinShortcutSupported()) {
            Intent shortcutInfoIntent = new Intent(context, #窗口);
            shortcutInfoIntent.setAction(Intent.ACTION_VIEW); //action必须设置，不然报错
            ShortcutInfo info = new ShortcutInfo.Builder(context, "The only id")
                .setIcon(Icon.createWithResource(context, #图标))
                .setShortLabel("全局工具")
                .setIntent(shortcutInfoIntent)
                .build();
            //当添加快捷方式的确认弹框弹出来时，将被回调
            PendingIntent shortcutCallbackIntent = PendingIntent.getBroadcast(context, 0, new Intent(context, #窗口), PendingIntent.FLAG_UPDATE_CURRENT);
            shortcutManager.requestPinShortcut(info, shortcutCallbackIntent.getIntentSender());
        }
		@end
	结束 方法
	
	
结束 类