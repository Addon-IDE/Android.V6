@外部依赖库("../../../../../依赖库/JarLib/WebSocket/Java-WebSocket-1.5.3.jar")
@外部依赖库("../../../../../依赖库/JarLib/WebSocket/slf4j-api-1.7.25.jar")
@导入Java("java.net.URI")
@导入Java("java.nio.ByteBuffer")
@导入Java("java.util.concurrent.ConcurrentHashMap")
@导入Java("android.os.Looper")
@导入Java("android.os.Handler")
@导入Java("org.java_websocket.client.WebSocketClient")
@导入Java("org.java_websocket.handshake.ServerHandshake")
@附加权限(安卓权限.网络权限)
类 WS客户端
	@code
	private WebSocketClient client;
	private ConcurrentHashMap<String, String> headers;
	@end

	属性读 监听端口() 为 整数
		@code
		if (client != null) {
			return client.getLocalSocketAddress().getPort();
		}
		return -1;
		@end
	结束 属性

	属性读 是否连接() 为 逻辑型
		@code
		if (client != null) {
			return client.isOpen();
		}
		return false;
		@end
	结束 属性

	属性读 是否关闭() 为 逻辑型
		@code
		if (client != null) {
			return client.isClosed();
		}
		return true;
		@end
	结束 属性

	方法 添加请求头(键名 为 文本, 值 为 文本)
		@code
		if (headers == null) {
			headers = new ConcurrentHashMap<>();
		}
		headers.put(#键名, #值);
		if (client != null) {
			client.addHeader(#键名, #值);
		}
		@end
	结束 方法

	方法 删除请求头(键名 为 文本)
		@code
		if (headers != null) {
			headers.remove(#键名);
		}
		if (client != null) {
			client.removeHeader(#键名);
		}
		@end
	结束 方法

	方法 清空所有请求头()
		@code
		if (headers != null) {
			headers.clear();
		}
		if (client != null) {
			client.clearHeaders();
		}
		@end
	结束 方法

	方法 开始连接(地址 为 文本)
		@code
		Handler handler = new Handler(Looper.getMainLooper());
		try {
			client = new WebSocketClient(new URI(#地址)) {
				@Override
				public void onOpen(ServerHandshake serverHandshake) {
					handler.post(new Runnable() {
						@Override
						public void run() {
							#连接成功();
						}
					});
				}
				
				@Override
				public void onMessage(String text) {
					handler.post(new Runnable() {
						@Override
						public void run() {
							#收到文本(text);
						}
					});
				}
				
				@Override
				public void onMessage(ByteBuffer byteBuffer) {
					byte[] bytes = byteBuffer.array();
					handler.post(new Runnable() {
						@Override
						public void run() {
							#收到字节集(bytes);
						}
					});
				}
				
				@Override
				public void onClose(int code, String reason, boolean remote) {
					handler.post(new Runnable() {
						@Override
						public void run() {
							#连接关闭();
						}
					});
				}
				
				@Override
				public void onError(Exception e) {
					handler.post(new Runnable() {
						@Override
						public void run() {
							#发生异常(e);
						}
					});
				}
			};
			if (headers != null &&  !headers.isEmpty()) {
				for (String key : headers.keySet()) {
					client.addHeader(key, headers.get(key));
				}
			}
			client.connect();
		} catch (Exception e) {
			#发生异常(e);
		}
		@end
	结束 方法

	@异步方法
	方法 重新连接()
		等待 重新连接_同步()
	结束 方法

	方法 重新连接_同步()
		@code
		if (client != null) {
			client.reconnect();
		}
		@end
	结束 方法

	@异步方法()
	方法 发送文本(内容 为 文本)
		等待 发送文本_同步(内容)
	结束 方法

	@异步方法
	方法 发送字节集(字节集 为 字节[])
		等待 发送字节集_同步(字节集)
	结束 方法

	方法 发送文本_同步(内容 为 文本)
		@code
		if (client != null && client.isOpen()) {
			client.send(#内容);
		}
		@end
	结束 方法

	方法 发送字节集_同步(字节集 为 字节[])
		@code
		if (client != null && client.isOpen()) {
			client.send(#字节集);
		}
		@end
	结束 方法

	方法 关闭连接()
		@code
		if (client != null) {
			client.close();
		}
		@end
	结束 方法

	定义事件 连接成功()

	定义事件 收到文本(内容 为 文本)

	定义事件 收到字节集(字节集 为 字节[])

	定义事件 连接关闭()

	定义事件 发生异常(异常信息 为 异常)
结束 类