
/*
*    @阿杰  Meng
*    
*/

@导入Java("android.net.Uri")
@导入Java("android.content.Intent")
@导入Java("android.content.pm.PackageManager")
@导入Java("java.io.File")
@导入Java("android.content.ComponentName")
@导入Java("android.content.pm.ResolveInfo")
@导入Java("java.util.List")
@附加权限(安卓权限.文件权限_读取)
类 分享操作

	//打开一段uri，比如打开QQ：应用操作.打开Uri("mqqwpa://im/chat?chat_type=wpa&uin=114514version=1");
	@静态 
	方法 打开Uri(窗口环境 为 安卓窗口, uri 为 文本)
		@code
		Uri uriS = Uri.parse(#uri);
		Intent intent = new Intent(Intent.ACTION_VIEW, uriS);
		#窗口环境.startActivity(intent);
		@end
	结束 方法

	//打开一个应用程序，参数是该应用程序的包名，如：应用操作.打开应用("com.tencent.mobileqq");
	@静态 
	方法 打开应用(窗口环境 为 安卓窗口, 应用包名 为 文本)
		@code 
		String mainAct = null;
		PackageManager pkgMag = #窗口环境.getPackageManager();
		Intent intent = new Intent(Intent.ACTION_MAIN);
		intent.addCategory(Intent.CATEGORY_LAUNCHER);
		intent.setFlags(Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED | Intent.FLAG_ACTIVITY_NEW_TASK);
		List < ResolveInfo > list = pkgMag.queryIntentActivities(intent, PackageManager.GET_ACTIVITIES);
		for (int i = 0; i < list.size(); i++) {
			ResolveInfo info = list.get(i);
			if (info.activityInfo.packageName.equals(#应用包名)) {
				mainAct = info.activityInfo.name;
				break;
			}
		}
		if (mainAct.isEmpty()) {
			return;
		}
		intent.setComponent(new ComponentName(#应用包名, mainAct));
		#窗口环境.startActivity(intent);
		@end
	结束 方法

	//打开系统分享，分享一段文本
	@静态
	方法 分享文本(窗口环境 为 安卓环境, 内容 为 文本 = "")
		分享文本_指定应用(窗口环境, 内容, 空)
	结束 方法
	
	@静态
	方法 分享文本_指定应用(窗口环境 为 安卓环境, 内容 为 文本 = "", 应用包名 : 文本 = 空)
		分享图文_指定应用(窗口环境, 内容, "", 应用包名)
	结束 方法

	//打开系统分享，分享图片与文本
	@静态
	方法 分享图片(窗口环境 为 安卓环境,图片路径 为 文本 = "")
		分享图片_指定应用(窗口环境, 图片路径, 空)
	结束 方法
	
	@静态
	方法 分享图片_指定应用(窗口环境 为 安卓环境,图片路径 为 文本 = "", 应用包名 为 文本)
		分享图文_指定应用(窗口环境, "", 图片路径, 应用包名)
	结束 方法
	
	@静态
	方法 分享图文(窗口环境 为 安卓环境,内容 为 文本 = "",图片路径 为 文本 = "")
		分享图文_指定应用(窗口环境, 内容, 图片路径, 空)
	结束 方法
	
	@静态
	方法 分享图文_指定应用(窗口环境 为 安卓环境,内容 为 文本 = "",图片路径 为 文本 = "",应用包名 为 文本 = 空)
		@code 
		Intent intent = new Intent("android.intent.action.SEND");
		if ("".equals(#图片路径)) {
			intent.setType("text/plain");
		} else {
			// 7.0+文件访问，可直接跳过权限
            // fileURI = androidx.core.content.FileProvider.getUriForFile(context,"{包名}.provider",out);
            // 直接跳过权限
			android.os.StrictMode.VmPolicy.Builder builder = new android.os.StrictMode.VmPolicy.Builder();
            android.os.StrictMode.setVmPolicy(builder.build());
			intent.setType("image/*");
			intent.putExtra("android.intent.extra.STREAM", Uri.fromFile(new File(#图片路径)));
		}
		intent.putExtra("android.intent.extra.SUBJECT", "分享到");
		intent.putExtra("android.intent.extra.TEXT", #内容);
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		if(#应用包名 != null && !(#应用包名.length()==0) && !#应用包名.isEmpty() && !"".equals(#应用包名)) intent.setPackage(#应用包名);
		#窗口环境.startActivity(Intent.createChooser(intent, "分享到"));
		@end
	结束 方法
	
	@静态
	方法 分享文件(窗口环境 : 安卓环境, 文件路径 : 文本)
		分享文件_指定应用(窗口环境,文件路径,空)
	结束 方法
	
	@静态
	方法 分享文件_指定应用(窗口环境 : 安卓环境, 文件路径 : 文本, 应用包名 : 文本 = 空)
		@code
		File file = new File(#文件路径);
		Intent intent = new Intent(Intent.ACTION_SEND);
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		android.os.StrictMode.VmPolicy.Builder builder = new android.os.StrictMode.VmPolicy.Builder();
        android.os.StrictMode.setVmPolicy(builder.build());
		intent.putExtra(Intent.EXTRA_STREAM, Uri.fromFile(file));
		intent.setType("*/*");
		if(#应用包名 != null && !(#应用包名.length()==0) && !#应用包名.isEmpty() && !"".equals(#应用包名)) intent.setPackage(#应用包名);
		#窗口环境.startActivity(Intent.createChooser(intent, "分享"));
		@end
	结束 方法	
	
	//打开QQ进行临时会话，第一个参数为当前窗口环境，第二个参数为要会话的QQ号，注意:这里的QQ号码不能为自己的QQ号码
	@静态
	方法 打开QQ聊天(窗口环境 为 安卓窗口,QQ号码 为 文本) 为 逻辑型
		@code 
		try {
			#窗口环境.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("mqqwpa://im/chat?chat_type=wpa&uin=" + #QQ号码 + "&version=1")));
			return true;
		} catch (Exception e) {
			return false;
		}
		@end
	结束 方法

	//打开QQ进行临时会话，第一个参数为当前窗口环境，第二个参数为QQ群号码
	@静态
	方法 打开QQ加群(窗口环境 为 安卓窗口,QQ群号 为 文本) 为 逻辑型
		@code 
		try {
			#窗口环境.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("mqqwpa://im/chat?chat_type=group&uin=" + #QQ群号 + "&version=1")));
			return true;
		} catch (Exception e) {
			return false;
		}
		@end
	结束 方法

	//打开QQ进行加群，第一个参数为当前窗口环境，第二个参数为QQ群key，需要去qun.qq.com获取
	@静态
	方法 打开QQ加群2(窗口环境 为 安卓窗口,QQ群key 为 文本) 为 逻辑型
		@code 
		Intent intent = new Intent();
		intent.setData(Uri.parse("mqqopensdkapi://bizAgent/qm/qr?url=http%3A%2F%2Fqm.qq.com%2Fcgi-bin%2Fqm%2Fqr%3Ffrom%3Dapp%26p%3Dandroid%26k%3D" + #QQ群key));
		try {
			#窗口环境.startActivity(intent);
			return true;
		} catch (Exception e) {
			return false;
		}
		@end
	结束 方法
	
结束 类