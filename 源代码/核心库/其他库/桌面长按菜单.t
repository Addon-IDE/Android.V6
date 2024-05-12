包名 我的.类库.桌面长按菜单

/**
 * 桌面长按菜单类库_1.0
 * 
 * 本类库作者：WYstudio QQ：1519258319
 * 最后一次编辑日期：2022-10-03 21:32
 */

@导入Java("android.os. *")
@导入Java("android.app. *")
@导入Java("android.content. *")
@导入Java("android.content.pm.ShortcutManager")
@导入Java("android.content.pm.ShortcutInfo")
@导入Java("android.graphics.drawable.Icon")
@导入Java("java.io. *")
@导入Java("java.util. *")
@导入Java("android.net.Uri")
@导入Java("java.net. *")
类 桌面长按菜单
	@code
	private static ShortcutManager shortcutManager;
	@end
	
	/*
	该方法仅限于安卓7以上使用！
	
	在桌面上长按应用图标即可弹出菜单
	参数一：安卓环境，一般填 "本对象"
	参数二：为菜单的图标
	参数三：唯一标识，在删除菜单时需要
	参数四：为菜单显示的信息
	参数五：为点击该菜单后需要跳转的类(窗口)
	*/
	@静态
	方法 添加菜单(环境 : 安卓环境, 图标 : 图片资源, 唯一标识 : 文本, 信息 : 文本, 跳转类 : Java类)
		@code
		 if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1){
		 	//获取ShortcutManager对象
			 shortcutManager = #环境.getSystemService(ShortcutManager.class);
             //ShortcutInfo.Builder构建快捷方式
             ShortcutInfo shortcut = new ShortcutInfo.Builder(#环境, #唯一标识)
                         .setShortLabel(#信息)
                         .setIcon(Icon.createWithResource(#环境, #图标))//设置快捷图标
                         //跳转的目标，定义Activity
                         .setIntent(new Intent(#环境, #跳转类).setAction(Intent.ACTION_MAIN))
                         .build();
              //setDynamicShortcuts()方法来设置快捷方式
              shortcutManager.addDynamicShortcuts(Arrays.asList(shortcut));
  	  }
		@end
	结束 方法
	
	/*
	该方法用于删除已添加的菜单
	参数一：安卓环境，一般填"本对象"
	参数二：添加菜单时填的唯一标识
	*/
	@静态
	方法 删除菜单(环境 : 安卓环境, 唯一标识 : 文本)
		@code
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
			shortcutManager = #环境.getSystemService(ShortcutManager.class);
     	   shortcutManager.removeDynamicShortcuts(Arrays.asList(#唯一标识));//唯一的id标识
		   }
		@end
	结束 方法
	
	/*
	该方法用于更新已添加的菜单信息
	参数一：安卓环境。一般填"本对象"
	参数二：添加菜单时填的唯一标识
	参数三：为要更新的菜单信息
	*/
	@静态
	方法 更新菜单_更新信息(环境 : 安卓环境, 唯一标识 : 文本, 更新信息 : 文本)
		@code
		 if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
		 	if (#更新信息 != null) {
				 shortcutManager = #环境.getSystemService(ShortcutManager.class);
        	 	ShortcutInfo info = new ShortcutInfo.Builder(#环境,#唯一标识)
           	    	   .setShortLabel(#更新信息)
           	  	     .build();
        		 List<ShortcutInfo> dynamicShortcuts = shortcutManager.getDynamicShortcuts();
         		shortcutManager.updateShortcuts(Arrays.asList(info));
			 }
 		}
		@end
	结束 方法
	
	/*
	该方法用于更新已添加的菜单的跳转类
	参数一：安卓环境。一般填"本对象"
	参数二：添加菜单时填的唯一标识
	参数三：为要更新的菜单跳转窗口
	*/
	@静态
	方法 更新菜单_更新跳转类(环境 : 安卓环境, 唯一标识 : 文本, 更新跳转类 : Java类)
		@code
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
			 if (#更新跳转类 != null) {
				 shortcutManager = #环境.getSystemService(ShortcutManager.class);
        	 	ShortcutInfo info = new ShortcutInfo.Builder(#环境,#唯一标识)
             	  	   .setIntent(new Intent(#环境, #更新跳转类).setAction(Intent.ACTION_MAIN))
           	  	     .build();
        		 List<ShortcutInfo> dynamicShortcuts = shortcutManager.getDynamicShortcuts();
         		shortcutManager.updateShortcuts(Arrays.asList(info));
			 }
 		}
		@end
	结束 方法
结束 类