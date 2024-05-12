包名 xyz.wyst.tlb.installapk

/**
 * 安装应用绳包_1.0
 *
 * 用于安卓11以上调用系统安装器安装应用
 *
 * 本类库作者：WYstudio QQ：1519258319
 * 最后一次编辑日期：2023-5-20
 *
 * 警告⚠️ 本绳包仅供学习参考，禁止用于任何非法用途！！
 * 警告⚠️ 使用本绳包所造成的任何后果与本绳包无关！！
 */

@外部依赖库("../../../../依赖库/JarLib/Installapplication_v4-provider.jar")
@安卓资源("../../../../资源库/核心库资源/Tools/Installapplication")
@附加清单([[<provider
		android:authorities="xyz.wyst.tlb.installapk.fileprovider"
		android:name="android.support.v4.content.FileProvider"
		android:exported="false"
		android:grantUriPermissions="true">
		<meta-data
			android:name="android.support.FILE_PROVIDER_PATHS"
			android:resource="@xml/file_paths"/>
	</provider>]])
@附加权限("android.permission.REQUEST_INSTALL_PACKAGES")
@附加权限("android.permission.READ_EXTERNAL_STORAGE")
@附加权限("android.permission.WRITE_EXTERNAL_STORAGE")
@导入Java("android.net.Uri")
@导入Java("java.io.File")
@导入Java("android.os.Build")
@导入Java("android.content.Intent")
@导入Java("android.content.Context")
@导入Java("android.support.v4.content.*")
@导入Java("android.provider.*")
@强制输出
类 安装应用
	方法 安装应用(环境 : 安卓环境, 安装包路径 : 文本)
		@code
		File apkfile = new File(#安装包路径);
        if (!apkfile.exists()) {
            return;
        }
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.addCategory(Intent.CATEGORY_DEFAULT);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        //兼容android7.0以上版本
        Uri uri = Uri.fromFile(apkfile);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            //通过FileProvider创建一个content类型的Uri
            uri = FileProvider.getUriForFile(#环境, "xyz.wyst.tlb.installapk.fileprovider", apkfile);
            // 给目标应用一个临时授权
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
        }
        intent.setDataAndType(uri, "application/vnd.android.package-archive");
        #环境.startActivity(intent);
		@end
	结束 方法
结束 类