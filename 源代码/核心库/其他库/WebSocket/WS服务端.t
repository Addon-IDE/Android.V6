@外部依赖库("../../../../../依赖库/JarLib/WebSocket/Java-WebSocket-1.5.3.jar")
@外部依赖库("../../../../../依赖库/JarLib/WebSocket/slf4j-api-1.7.25.jar")
@导入Java("java.nio.ByteBuffer")
@导入Java("java.net.InetSocketAddress")
@导入Java("java.util.function.ToIntFunction")
@导入Java("java.util.concurrent.ConcurrentHashMap")
@导入Java("android.os.Looper")
@导入Java("android.os.Handler")
@导入Java("org.java_websocket.WebSocket")
@导入Java("org.java_websocket.server.WebSocketServer")
@导入Java("org.java_websocket.handshake.ClientHandshake")
@附加权限(安卓权限.网络权限)
类 WS服务端
	@code
	private WebSocketServer server;
	private ConcurrentHashMap<WebSocket, Integer> ids;
	private ConcurrentHashMap<Integer, WebSocket> clients;
	private int increment;
	@end

	属性读 监听端口() 为 整数
		@code
		if (server != null) {
			return server.getPort();
		}
		return -1;
		@end
	结束 属性

	属性读 当前总在线人数() 为 整数
		@code
		if (ids != null) {
			return ids.size();
		}
		return 0;
		@end
	结束 属性
	
	属性读 当前所有连接() 为 整数[]
		@code
		if (ids != null) {
			return ids.values().stream().mapToInt(new ToIntFunction<Integer>() {
				@Override
				public int applyAsInt(Integer value) {
					return value;
				}
			}).toArray();
		}
		return new int[0];
		@end
	结束 属性

	方法 开始监听(端口 为 整数 = 0)
		@code
		Handler handler = new Handler(Looper.getMainLooper());
		server = new WebSocketServer(new InetSocketAddress(#端口)) {
			@Override
			public void onStart() {
				increment = 0;
				ids = new ConcurrentHashMap();
				clients = new ConcurrentHashMap();
				handler.post(new Runnable() {
					@Override
					public void run() {
						#监听成功();
					}
				});
			}
			
			@Override
			public void onOpen(WebSocket client, ClientHandshake clientHandshake) {
				int id = increment;
				ids.put(client, id);
				clients.put(id, client);
				increment++;
				handler.post(new Runnable() {
					@Override
					public void run() {
						#有新连接(id);
					}
				});
			}
			
			@Override
			public void onMessage(WebSocket client, String text) {
				int id = ids.get(client);
				handler.post(new Runnable() {
					@Override
					public void run() {
						#收到文本(id, text);
					}
				});
			}
			
			@Override
			public void onMessage(WebSocket client, ByteBuffer byteBuffer) {
				int id = ids.get(client);
				byte[] bytes = byteBuffer.array();
				handler.post(new Runnable() {
					@Override
					public void run() {
						#收到字节集(id, bytes);
					}
				});
			}
			
			@Override
			public void onClose(WebSocket client, int code, String reason, boolean remote) {
				int id = ids.get(client);
				ids.remove(client);
				clients.remove(id);
				handler.post(new Runnable() {
					@Override
					public void run() {
						#有连接关闭(id);
					}
				});
			}
			
			@Override
			public void onError(WebSocket client, Exception e) {
				handler.post(new Runnable() {
					@Override
					public void run() {
						#发生异常(e);
					}
				});
			}
		};
		server.start();
		@end
	结束 方法

	方法 取客户端地址(连接标识 为 整数) 为 文本
		@code
		if (clients != null) {
			WebSocket client = clients.get(#连接标识);
			if (client != null) {
				return client.getRemoteSocketAddress().getHostString();
			}
		}
		return "";
		@end
	结束 方法

	方法 取客户端端口(连接标识 为 整数) 为 整数
		@code
		if (clients != null) {
			WebSocket client = clients.get(#连接标识);
			if (client != null) {
				return client.getRemoteSocketAddress().getPort();
			}
		}
		return -1;
		@end
	结束 方法

	方法 关闭客户端连接(连接标识 为 整数)
		@code
		if (clients != null) {
			WebSocket client = clients.get(#连接标识);
			if (client != null) {
				client.close();
			}
		}
		@end
	结束 方法

	@异步方法()
	方法 发送文本(连接标识 为 整数, 内容 为 文本)
		等待 发送文本_同步(连接标识, 内容)
	结束 方法

	@异步方法
	方法 发送字节集(连接标识 为 整数, 字节集 为 字节[])
		等待 发送字节集_同步(连接标识, 字节集)
	结束 方法

	方法 发送文本_同步(连接标识 为 整数, 内容 为 文本)
		@code
		if (clients == null) return;
		WebSocket client = clients.get(#连接标识);
		if (client != null) {
			client.send(#内容);
		}
		@end
	结束 方法

	方法 发送字节集_同步(连接标识 为 整数, 字节集 为 字节[])
		@code
		if (clients == null) return;
		WebSocket client = clients.get(#连接标识);
		if (client != null) {
			client.send(#字节集);
		}
		@end
	结束 方法

	@异步方法
	方法 广播文本(内容 为 文本)
		等待 广播文本_同步(内容)
	结束 方法

	@异步方法
	方法 广播字节集(字节集 为 字节[])
		等待 广播字节集_同步(字节集)
	结束 方法

	方法 广播文本_同步(内容 为 文本)
		@code
		if (server != null) {
			server.broadcast(#内容);
		}
		@end
	结束 方法

	方法 广播字节集_同步(字节集 为 字节[])
		@code
		if (server != null) {
			server.broadcast(#字节集);
		}
		@end
	结束 方法

	方法 关闭监听()
		@code
		increment = 0;
		ids = null;
		clients = null;
		if (server != null) {
			try {
				server.stop();
			} catch (Exception e) {
				#发生异常(e);
			}
		}
		@end
	结束 方法

	定义事件 监听成功()

	定义事件 发生异常(异常信息 为 异常)

	定义事件 有新连接(连接标识 为 整数)

	定义事件 收到文本(连接标识 为 整数, 内容 为 文本)

	定义事件 收到字节集(连接标识 为 整数, 字节集 为 字节[])

	定义事件 有连接关闭(连接标识 为 整数)
结束 类