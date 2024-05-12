package com.mcyi.mcaddon.make;

public class AudioVisualizeUsers
{
	public static AudioVisualize AudioVisualize;
	public static android.content.Context Context;
	private static android.view.WindowManager WindowManager = null;
	private static int CreateScreen = -1;
	private static boolean IsInit = false;

	private static android.os.PowerManager.WakeLock WakeLock = null;

	public static void CreateWaveLock()
	{
		if(Context == null) return;
		if(WakeLock == null)
		{
			android.os.PowerManager PowerManager = (android.os.PowerManager) Context.getApplicationContext().getSystemService(android.content.Context.POWER_SERVICE);
			WakeLock = PowerManager.newWakeLock(android.os.PowerManager.PARTIAL_WAKE_LOCK, AudioVisualizeActivity.class.getName());
			WakeLock.acquire();
		}
	}

	public static void ReleaseWaveLock()
	{
		if (WakeLock != null)
		{
			WakeLock.release();
			WakeLock = null;
		}
	}

	//忽略电池优化
	public static void ignoreBatteryOptimization(android.content.Context Context)
	{
		if(android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.M)
			return;
		android.os.PowerManager PowerManager = (android.os.PowerManager) Context.getSystemService(android.content.Context.POWER_SERVICE);
		boolean HasIgnoredBattery = PowerManager.isIgnoringBatteryOptimizations(Context.getPackageName());
		if(!HasIgnoredBattery)
		{
			android.content.Intent Intent = new android.content.Intent(android.provider.Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
			Intent.setData(android.net.Uri.parse("package:" + Context.getPackageName()));
			Context.startActivity(Intent);
		}
	}

	public static void InitNewAudioVisualize(android.content.Context $Context)
	{
		if(AudioVisualize != null && $Context != null)
			return;
		AudioVisualize = new AudioVisualize();
		AudioVisualize.init($Context);
		if(!LocalDataUtil.getBooleanData($Context, "AudioVisualizeSetting", "AudioVisualize"))
		{
			LocalDataUtil.ClearData($Context, "AudioVisualizeSetting");
			LocalDataUtil.putBooleanData($Context, "AudioVisualizeSetting", "AudioVisualize", true);
		}
		if(Context == null)
			Context = $Context.getApplicationContext();
	}

	public static void SetAudioVisualize()
	{
		if(AudioVisualize == null || !AudioVisualize.IsInit() || Context == null)
			return;
		// 使用全屏
		AudioVisualize.SetFullScreen(true);
		
		AudioVisualize.ShowFPS(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "ShowFPS"));
		AudioVisualize.ShowInformation(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "ShowInformation"));
		//AudioVisualize.setDrawSmear(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "IsDrawSmear"));
		//AudioVisualize.OpenCycleColor(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "CycleColor"));
		//AudioVisualize.OpenCycleColorForWave(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "CycleColorForWave"));
		AudioVisualize.SetEnableVibrator(LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "EnableVibrator"));

		int DataVolumeAdjustmentScale = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "DataVolumeAdjustmentScale");
		if(DataVolumeAdjustmentScale < 0)
			DataVolumeAdjustmentScale = 1;
		AudioVisualize.SetDataVolumeAdjustmentScale(DataVolumeAdjustmentScale);
		
		int DrawMode = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "DrawMode");
		if(DrawMode < 0)
			DrawMode = 1;
		AudioVisualize.SetDrawMode(DrawMode);
		AudioVisualize.SetSecondaryDrawMode(GetSecondaryDrawMode());

		int FrameRate = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "FrameRate");
		if(FrameRate < 0)
			FrameRate = 0;
		if(FrameRate > 60)
			FrameRate = 60;
		AudioVisualize.SetFPS(FrameRate);

		int AnimationSmoothRate = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "AnimationSmoothRate");
		if(AnimationSmoothRate < 0)
			AnimationSmoothRate = 0;
		if(AnimationSmoothRate > 10)
			AnimationSmoothRate = 10;
		AudioVisualize.SetAnimationSmoothRate(AnimationSmoothRate);

		int MinViewAlpha = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "MinViewAlpha");
		if(MinViewAlpha < 0)
			MinViewAlpha = 127;
		if(MinViewAlpha > 255)
			MinViewAlpha = 255;
		AudioVisualize.SetMinViewAlpha(MinViewAlpha);
	}

	public static void SetSecondaryDrawMode(boolean[] List)
	{
		if(AudioVisualize == null || !AudioVisualize.IsInit() || Context == null)
			return;
		AudioVisualize.SetSecondaryDrawMode(List);
		StringBuilder StringBuilder = new StringBuilder();
		for(int Index = 0; Index < List.length; Index++)
		{
			boolean Mode = List[Index];
			StringBuilder.append(String.valueOf(Index)).append(":")
			.append(String.valueOf(Mode)).append(";");
		}
		if(List.length > 1)
			StringBuilder.deleteCharAt(StringBuilder.length() - 1);
		LocalDataUtil.putStringData(Context, "AudioVisualizeSetting", "SecondaryDrawMode", StringBuilder.toString());
	}

	public static boolean[] GetSecondaryDrawMode()
	{
		String[] StringList = null;
		String Data = LocalDataUtil.getStringData(Context, "AudioVisualizeSetting", "SecondaryDrawMode");
		if(Data == null || Data.equals("") || Data.equals("-1"))
			StringList = new String[]{"0:true;1:true;2:true"};
		else
			StringList = Data.split(";");
		LocalDataUtil.getStringData(Context, "AudioVisualizeSetting", "SecondaryDrawMode").split(";");
		boolean[] List = new boolean[StringList.length];
		for(int Index = 0; Index < StringList.length; Index++)
		{
			boolean Mode = Boolean.parseBoolean(StringList[Index].split(":")[1]);
			List[Index] = Mode;
		}
		return List;
	}

	
	public static void InitWindow()
	{
		if(AudioVisualize == null || !AudioVisualize.IsInit() || Context == null)
			return;
		//======Start 创建 AudioVisualize 视图======
		if(CreateScreen == -1)
		{
			int DrawView = LocalDataUtil.getIntegerData(Context, "AudioVisualizeSetting", "DrawView");
			if(DrawView < 0 && android.os.Build.VERSION.SDK_INT >= 23)
				DrawView = 2;
			if(WindowManager == null)
				CreateWindow(DrawView);
			if(WindowManager != null)
				CreateScreen = 1;
		}
		//======End======
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N)
			TileService.SetTileState(Context, true);
	}

	public static void Stop()
	{
		if(AudioVisualize == null)
			return;
		AudioVisualize.StopAudioVisualize();
		AudioVisualize = null;
		System.gc();
	}

	public static void CreateWindow(int EView)
	{
		if(AudioVisualize != null)
			switch(EView)
			{
				case -1:
					CreateWindow(1);
				break;
				case 1:
					LocalDataUtil.putIntegerData(Context, "AudioVisualizeSetting", "DrawView", 1);
					WindowManager = CreateWindow(WindowManager, Context, AudioVisualize.getView(Context), -1, -1, 0, 0);
				break;
				case 2:
					LocalDataUtil.putIntegerData(Context, "AudioVisualizeSetting", "DrawView", 2);
					WindowManager = CreateWindow(WindowManager, Context, AudioVisualize.getSurfaceView(Context), -1, -1, 0, 0);
				break;
				case 3:
					LocalDataUtil.putIntegerData(Context, "AudioVisualizeSetting", "DrawView", 3);
					WindowManager = CreateWindow(WindowManager, Context, AudioVisualize.getOpenGLView(Context), -1, -1, 0, 0);
				break;
			}
	}

	public static android.view.WindowManager CreateWindow(android.view.WindowManager $WindowManager, android.content.Context Context, android.view.View View, int Width, int Height, int X, int Y)
	{
		if($WindowManager != null)
			return WindowManager;
		WindowManager = (android.view.WindowManager) Context.getSystemService(Context.WINDOW_SERVICE);
		android.view.WindowManager.LayoutParams WindowManagerParams = new android.view.WindowManager.LayoutParams();
		if(android.os.Build.VERSION.SDK_INT == android.os.Build.VERSION_CODES.N)
			WindowManagerParams.type = android.view.WindowManager.LayoutParams.TYPE_PHONE;
		else
		{
			if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O)
				WindowManagerParams.type = android.view.WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY;
			else
				WindowManagerParams.type = 2006;
		}
		WindowManagerParams.flags = android.view.WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED | 824;
		//WindowManagerParams.flags = android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN | android.view.WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN | 824;
		WindowManagerParams.format = android.graphics.PixelFormat.RGBA_8888;
		WindowManagerParams.width = Width;
		WindowManagerParams.height = Height;
		WindowManagerParams.x = X;
		WindowManagerParams.y = Y;
		//WindowManagerParams.systemUiVisibility = android.view.View.STATUS_BAR_HIDDEN;
		//WindowManagerParams.systemUiVisibility = android.view.View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | android.view.View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | android.view.View.SYSTEM_UI_FLAG_FULLSCREEN;
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.HONEYCOMB)
		{
			WindowManagerParams.memoryType = android.view.WindowManager.LayoutParams.MEMORY_TYPE_HARDWARE;
			View.setLayerType(android.view.View.LAYER_TYPE_HARDWARE, null);
		}
		WindowManager.addView(View, WindowManagerParams);
		return WindowManager;
	}

	public static void RemoveWindowView()
	{
		if(AudioVisualize != null && WindowManager != null)
		{
			android.view.View View = AudioVisualize.getView();
			android.view.SurfaceView SurfaceView = AudioVisualize.getSurfaceView();
			AudioVisualizeOpenGLView AudioVisualizeOpenGLView = AudioVisualize.getOpenGLView();
			if(View != null)
			{
				((AudioVisualizeView) View).AudioVisualize = null;
				WindowManager.removeViewImmediate(View);
			}
			if(SurfaceView != null)
			{
				((AudioVisualizeSurfaceView) SurfaceView).AudioVisualize = null;
				WindowManager.removeViewImmediate(SurfaceView);
			}
			if(AudioVisualizeOpenGLView != null)
			{
				((AudioVisualizeOpenGLView) AudioVisualizeOpenGLView).AudioVisualize = null;
				WindowManager.removeViewImmediate(AudioVisualizeOpenGLView);
			}
			AudioVisualize.RemoveAllView();
			WindowManager = null;
		}
	}
}
