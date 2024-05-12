package com.mcyi.mcaddon.make;

public class FloatingWindowService extends android.app.Service
{
	public static int Code = 0;
	public static final int NotificationId = 114514;
	public static final String ChannelIdString = "114514";
	public static final String ChannelName = "音频可视化前台服务进程";
	public static boolean Active = false;

	private android.os.PowerManager.WakeLock WakeLock = null;
	
	public void CreateWaveLock()
	{
		
		if(WakeLock == null)
		{
			android.os.PowerManager PowerManager = (android.os.PowerManager) getApplicationContext().getSystemService(android.content.Context.POWER_SERVICE);
			WakeLock = PowerManager.newWakeLock(android.os.PowerManager.PARTIAL_WAKE_LOCK, AudioVisualizeActivity.class.getName());
			WakeLock.acquire();
		}
	}

	public void ReleaseWaveLock()
	{
		if (WakeLock != null)
		{
			WakeLock.release();
			WakeLock = null;
		}
	}
	
	@Override
	public android.os.IBinder onBind(android.content.Intent Intent)
	{
		return null;
	}

	@Override
	public void onCreate()
	{
		super.onCreate();
		// Android 8.0 系统的特殊处理
		if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O)
		{
			android.app.NotificationManager NotificationManager = (android.app.NotificationManager) getApplicationContext().getSystemService(android.content.Context.NOTIFICATION_SERVICE);
			android.app.NotificationChannel Channel = new android.app.NotificationChannel(ChannelIdString, ChannelName, android.app.NotificationManager.IMPORTANCE_HIGH);
			// 使通知静音
			Channel.setSound(null,null);
			NotificationManager.createNotificationChannel(Channel);
			android.app.Notification Notification = new android.app.Notification.Builder(getApplicationContext(), ChannelIdString)
			//====== 不添加类别可以使得通知被点击时可以直接点击进入应用详情页 ======
			/*.setContentTitle("音频可视化")
			.setContentText("正在运行")
			.setWhen(System.currentTimeMillis())
			.setSmallIcon(R.drawable.svg_ic_launcher)*/
			.build();
			startForeground(NotificationId, Notification);
		}
		else if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2)
		{
			android.app.Notification.Builder Builder = new android.app.Notification.Builder(getApplicationContext());
			Builder.setContentTitle(ChannelName);
			startForeground(NotificationId, Builder.build());
			/*android.content.Intent Intent = new android.content.Intent(this, CancelNoticeService.class);
			startService(Intent);*/
		}
		else
		{
			startForeground(NotificationId, new android.app.Notification());
		}
		
		AudioVisualizeUsers.InitNewAudioVisualize(getApplicationContext());
		AudioVisualizeUsers.SetAudioVisualize();
		AudioVisualizeUsers.InitWindow();
		android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_URGENT_AUDIO);
		//android.os.StrictMode.setThreadPolicy(new android.os.StrictMode.ThreadPolicy.Builder().detectCustomSlowCalls().detectAll().penaltyDialog().build());
		Active = true;
		
		AudioVisualizeUsers.CreateWaveLock();
	}

	@Override
	public int onStartCommand(android.content.Intent Intent, int Flags, int StartId)
	{
		super.onStartCommand(Intent, Flags, StartId);
		CreateWaveLock();
		Code++;
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N)
			TileService.SetTileState(getApplicationContext(), true);
		return START_STICKY;
	}

	public void Stop()
	{
		Active = false;
		//====== 设置快捷设置状态 ======
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N && TileService.getEnable(getApplicationContext()))
			TileService.SetTileState(getApplicationContext(), false);
		
		//====== 一般不需要 ======
		
		if (android.os.Build.VERSION.SDK_INT > android.os.Build.VERSION_CODES.JELLY_BEAN_MR2)
		{
			new Thread(new Runnable()
			{
				@Override
				public void run()
				{
					//android.os.SystemClock.sleep(1000);
					stopForeground(true);
					android.app.NotificationManager NotificationManager = (android.app.NotificationManager) getSystemService(NOTIFICATION_SERVICE);
					NotificationManager.cancel(NotificationId);
					stopSelf();
					/*System.exit(0);
					android.os.Process.killProcess(android.os.Process.myPid());*/
				}
			}).start();
		}
	}

	public static void Start(android.content.Context Context)
	{
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O)
			Context.startForegroundService(new android.content.Intent(Context, FloatingWindowService.class));
		else
			Context.startService(new android.content.Intent(Context, FloatingWindowService.class));
	}

	public static void Stop(android.content.Context Context)
	{
		Context.stopService(new android.content.Intent(Context, FloatingWindowService.class));
	}

	public static void StopFloatingWindowService(android.content.Context Context)
	{
		AudioVisualizeUsers.RemoveWindowView();
		AudioVisualizeUsers.Stop();
		Context.stopService(new android.content.Intent(Context, FloatingWindowService.class));
		System.exit(0);
		android.os.Process.killProcess(android.os.Process.myPid());
	}

	@Override
	public void onDestroy()
	{
		AudioVisualizeUsers.ReleaseWaveLock();
		super.onDestroy();
		Stop();
	}
}
