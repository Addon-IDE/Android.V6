@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/documentfile-1.0.0.aar")
@导入Java("android.os.Build")
@导入Java("android.content.Context")
@导入Java("android.content.UriPermission")
@导入Java("android.net.Uri")
@导入Java("android.provider.DocumentsContract")
@导入Java("android.content.Intent")
@导入Java("androidx.documentfile.provider.DocumentFile")
@导入Java("android.os.Environment")
@导入Java("android.app.Activity")
@附加权限("android.permission.WRITE_EXTERNAL_STORAGE")
@附加权限("android.permission.READ_EXTERNAL_STORAGE")
@附加权限("android.permission.MANAGE_EXTERNAL_STORAGE")
类 安卓11文件权限
	方法 是否为安卓11():逻辑型
		@code
		if((Build.VERSION.SDK_INT)>=30){
			return true;
		}else{
			return false;
		}
		@end
	结束 方法
	
	方法 是否已经授权(上下文:安卓窗口):逻辑型
		@code
		for (UriPermission persistedUriPermission : #上下文.getContentResolver().getPersistedUriPermissions()) {
            if (persistedUriPermission.isReadPermission() && persistedUriPermission.getUri().toString().equals("content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata")) {
                return true;
            }
        }
        return false;
		@end
	结束 方法
	
	
	
	//返回请求代码，供请求返回事件使用
	方法 拉起授权(上下文:安卓窗口,请求代码:整数)
		@code
		Uri uri1 = Uri.parse("content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata");
        String uri = #转换TREE路径(Environment.getExternalStorageDirectory().getPath());
        uri = uri + "/document/primary%3A" + Environment.getExternalStorageDirectory().getPath().replace("/storage/emulated/0/", "").replace("/", "%2F");
        Uri parse = Uri.parse(uri);
        DocumentFile documentFile = DocumentFile.fromTreeUri(#上下文, uri1);
        Intent intent1 = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent1.setFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
						 | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
						 | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
						 | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        intent1.putExtra(DocumentsContract.EXTRA_INITIAL_URI, documentFile.getUri());
        #上下文.startActivityForResult(intent1, #请求代码);
		@end
	结束 方法
	
	方法 转换TREE路径(路径:文本):文本
		@code
		if (#路径.endsWith("/")) {
            #路径 = #路径.substring(0, #路径.length() - 1);
        }
        String path2 = #路径.replace("/storage/emulated/0/", "").replace("/", "%2F");
        return "content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata/document/primary%3A" + path2;
		@end
		
	结束 方法
	
	
结束 类