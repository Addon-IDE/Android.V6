@导入Java("android.app.Activity")
@导入Java("android.content.ContentUris")
@导入Java("android.content.Context")
@导入Java("android.content.Intent")
@导入Java("android.database.Cursor")
@导入Java("android.net.Uri")
@导入Java("android.os.Build")
@导入Java("android.os.Environment")
@导入Java("android.provider.DocumentsContract")
@导入Java("android.provider.MediaStore")
@导入Java("android.widget.Toast")
@导入Java("java.io.*")
@导入Java("android.net.Uri")
@强制输出
类 文件选择器:启动信息
	@静态

	方法 打开Uri(窗口环境:安卓窗口，uri:文本)
		@code
     Uri uriS = Uri.parse(#uri);
     Intent intent = new Intent(Intent.ACTION_VIEW, uriS);
	 #窗口环境.startActivity(intent);
        @end
	结束 方法
	方法 选择图片(窗口1 为 窗口,请求码 为 整数)
		code #窗口1.startActivityForResult(new Intent(ACTION_PICK,MediaStore.Images.Media.EXTERNAL_CONTENT_URI), #请求码);
	结束 方法
	方法 解析图片地址(窗口1 为 窗口, 数据 为 启动信息) 为 文本
		@code
       if (null != #数据) {
            Uri selectedImage = #数据.getData();
            String[] filePathColumn = {MediaStore.Images.Media.DATA};
            Cursor cursor = #窗口1.getContentResolver().query(selectedImage,
																				filePathColumn, null, null, null);
            cursor.moveToFirst();
            int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
            String picturePath = cursor.getString(columnIndex);
            cursor.close();
			return picturePath;
        }
		return "";
   @end
	结束 方法

	方法 选择文件(窗口1 为 窗口,请求码 为 整数)
		@code
        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
		intent.setType("*/*");
		intent.addCategory(Intent.CATEGORY_OPENABLE);
		#窗口1.startActivityForResult(intent, #请求码);
   @end
	结束 方法

	方法 解析文件地址(窗口1 为 窗口, 数据 为 启动信息) 为 文本
		@code
        if (null != #数据) {
			return FileChooseUtil.getInstance(#窗口1).getChooseFileResultPath(#数据.getData());
		}
		return "";
   @end
	结束 方法

	@code
   static class FileChooseUtil {

		private Context context;
		private static FileChooseUtil util = null;

		private FileChooseUtil(Context context) {
			this.context = context;
		}

		public static FileChooseUtil getInstance(Context context) {
			if (util == null) {
				util = new FileChooseUtil(context);
			}
			return util;
		}

		/**
		 * 对外接口  获取uri对应的路径
		 *
		 * @param uri
		 * @return
		 */
		public String getChooseFileResultPath(Uri uri) {
			String chooseFilePath = null;
			if ("file".equalsIgnoreCase(uri.getScheme())) {//使用第三方应用打开
				chooseFilePath = uri.getPath();
				Toast.makeText(context, chooseFilePath, Toast.LENGTH_SHORT).show();
				return chooseFilePath;
			}
			if (Build.VERSION.SDK_INT > Build.VERSION_CODES.KITKAT) {//4.4以后
				chooseFilePath = getPath(context, uri);
			}
			else {//4.4以下下系统调用方法
				chooseFilePath = getRealPathFromURI(uri);
			}
			return chooseFilePath;
		}

		private String getRealPathFromURI(Uri contentUri) {
			String res = null;
			String[] proj = {MediaStore.Images.Media.DATA};
			Cursor cursor = context.getContentResolver().query(contentUri, proj, null, null, null);
			if (null != cursor && cursor.moveToFirst()) {
				int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
				res = cursor.getString(column_index);
				cursor.close();
			}
			return res;
		}

		/**
		 * 专为Android4.4设计的从Uri获取文件绝对路径，以前的方法已不好使
		 */
		private String getPath(final Context context, final Uri uri) {

			final boolean isKitKat = Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT;

			// DocumentProvider
			if (isKitKat && DocumentsContract.isDocumentUri(context, uri)) {
				// ExternalStorageProvider
				if (isExternalStorageDocument(uri)) {
					final String docId = DocumentsContract.getDocumentId(uri);
					final String[] split = docId.split(":");
					final String type = split[0];

					if ("primary".equalsIgnoreCase(type)) {
						return Environment.getExternalStorageDirectory() + "/" + split[1];

					}
				}
				else if (isDownloadsDocument(uri)) {
					final String id = DocumentsContract.getDocumentId(uri);
					final Uri contentUri = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.valueOf(id));
					return getDataColumn(context, contentUri, null, null);

				}
				else if (isMediaDocument(uri)) {
					final String docId = DocumentsContract.getDocumentId(uri);
					final String[] split = docId.split(":");
					final String type = split[0];

					Uri contentUri = null;
					if ("image".equals(type)) {
						contentUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

					}
					else if ("video".equals(type)) {
						contentUri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;

					}
					else if ("audio".equals(type)) {
						contentUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;

					}

					final String selection = "_id=?";
					final String[] selectionArgs = new String[]{split[1]};

					return getDataColumn(context, contentUri, selection, selectionArgs);

				}

			}
			else if ("content".equalsIgnoreCase(uri.getScheme())) {
				return getDataColumn(context, uri, null, null);

			}
			else if ("file".equalsIgnoreCase(uri.getScheme())) {
				uri.getPath();

			}
			return null;
		}

		private String getDataColumn(Context context, Uri uri, String selection, String[] selectionArgs) {
			Cursor cursor = null;
			final String column = "_data";
			final String[] projection = {column};
			try {
				cursor = context.getContentResolver().query(uri, projection, selection, selectionArgs,
															null);
				if (cursor != null && cursor.moveToFirst()) {
					final int column_index = cursor.getColumnIndexOrThrow(column);
					return cursor.getString(column_index);
				}
			}
			finally {
				if (cursor != null)
					cursor.close();
			}
			return null;
		}

		/**
		 * @param uri The Uri to check.
		 * @return Whether the Uri authority is ExternalStorageProvider.
		 */
		private boolean isExternalStorageDocument(Uri uri) {
			return "com.android.externalstorage.documents".equals(uri.getAuthority());
		}

		/**
		 * @param uri The Uri to check.
		 * @return Whether the Uri authority is DownloadsProvider.
		 */
		private boolean isDownloadsDocument(Uri uri) {
			return "com.android.providers.downloads.documents".equals(uri.getAuthority());
		}

		/**
		 * @param uri The Uri to check.
		 * @return Whether the Uri authority is MediaProvider.
		 */
		private boolean isMediaDocument(Uri uri) {
			return "com.android.providers.media.documents".equals(uri.getAuthority());
		}
	}
   @end
结束 类