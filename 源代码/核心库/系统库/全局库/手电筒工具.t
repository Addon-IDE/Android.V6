@全局类
@导入Java("android.hardware.camera2.*")
@导入Java("android.content.Context")
类 手电筒工具
	
	@静态
	方法 打开手电筒()
		@code
		try {
            CameraManager cameraManager = (CameraManager) #<环境工具.取安卓环境>().getSystemService(#<环境工具.取安卓环境>().CAMERA_SERVICE);
            String cameraId = cameraManager.getCameraIdList()[0];
            cameraManager.setTorchMode(cameraId, true);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
		@end
	结束 方法
	
	@静态
	方法 关闭手电筒()
		@code
		try {
            CameraManager cameraManager = (CameraManager) #<环境工具.取安卓环境>().getSystemService(#<环境工具.取安卓环境>().CAMERA_SERVICE);
            String cameraId = cameraManager.getCameraIdList()[0];
            cameraManager.setTorchMode(cameraId, false);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
		@end
	结束 方法
	
结束 类