package com.mcyi.mcaddon.make;

public class AudioVisualize
{
	private android.content.Context Context;
	private String AudioVisualize = null;
	private boolean Flag;
	private int Dpi = 0;
	private android.graphics.Bitmap BackBuffer;
	private android.graphics.Bitmap BackBufferT;
	private android.graphics.Bitmap Buffer;
	private android.graphics.Bitmap Logo;
	private android.graphics.Paint Paint;
	private android.graphics.Paint ForePaint;
	private android.graphics.Paint cPan;
	private android.graphics.Paint pC;
	private android.graphics.Paint pan;
	private android.graphics.Paint panBg;
	private android.graphics.Paint PathPaint;
	private android.graphics.Paint DrawTextPaint;
	private android.graphics.Paint CirclePaint;
	private android.graphics.Path Path = null;
	private android.graphics.Paint PointPaint;
	private android.graphics.Paint ScreenOutPaint;
	private android.graphics.Canvas Canvas;
	private android.graphics.Canvas RaCanvas;
	private android.graphics.Canvas BackBufferCanvas;
	private android.graphics.Canvas DrawCanvas;
	//private android.graphics.PaintFlagsDrawFilter PaintFlagsDrawFilter = new android.graphics.PaintFlagsDrawFilter(0, android.graphics.Paint.ANTI_ALIAS_FLAG | android.graphics.Paint.FILTER_BITMAP_FLAG);
	private android.media.AudioManager AudioManager;
	private android.media.MediaPlayer MediaPlayer;
	private android.media.audiofx.Visualizer Visualizer;
	private android.media.AudioTrack AudioTrack;
	private AudioTrackPlayMusic AudioTrackPlayMusic;
	private boolean AudioFxPlaying;
	private boolean IsPlaying;
	//控制采样率
	private int Frequence = 41100;
	private int PlayChannelConfig = android.media.AudioFormat.CHANNEL_IN_STEREO;
	private int AudioEncoding = android.media.AudioFormat.ENCODING_PCM_16BIT;

	private int BackGroundColor;
	private String AudioName;
	private String MusicName;
	private int StreamMaxVolume;
	private int StreamVolume;

	private int ByteAllCount = 464;
	private int ByteAllCountFft = 464;
	private int ByteAllCountWave = 464;
	
	private long DeltaTime = -1;
	private long drawTime = -1;
	private float DataKey = 0;
	private float LastDataKey = 0;
	private float DataLastKey = 0;
	private float MainUseLength = 0;
	
	private float SlowlyDrawFftDataOne = 0, SlowlyDrawFftDataOneRatio = 0;
	private float DrawFftDataOneRatio = 0, LastDrawFftDataOneRatio = 0;
	private float DrawFftDataOne = 0, LastDrawFftDataOne = 0;
	private float MaxAudioData = 127;
	
	private float DataVolumeAdjustment = 0;
	private float DataVolumeAdjustmentBase = 0;
	private float DataMaxVolumeAdjustment = 4;
	
	private boolean NotAudioData = true;
	
	//====== 音频 Fft 原始数据 ======
	private float[] BaseFftData = null;
	
	//====== 音频 Wave + Fft 处理数据 ======
	private int[] WaveData = null;
	private int[] DrawWaveData = null;
	private float[] FftData = null;
	private float[] DrawFftData = null;
	
	//====== 处理简化后的 Fft 数据 ======
	private float[] DrawSimplifyFftData = null;
	private float[] DrawSimplifyCentralizedFftData = null;
	
	//====== 正弦波化 Fft 数据 ======
	private float[] WaveShapeFftData = null;
	private float[] DrawWaveShapeFftData = null;
	
	private float[] DrawSecondaryWaveShapeFftData = null;
	
	//============
	
	private float[] ReadByte;
	private float[] BufferSize;
	private float RateAdd;
	
	
	private final float DeltaAngle = (float) (6.283185307179586d / 464);
	
	//====== 更新绘制数据线程 ======
	private java.lang.Thread UpDrawDataThread = null;
	
	//====== 用于计算绘制用时 ======
	private long UpDrawDeltaTime = -1;
	//============
	
	//====== 用于计算更新绘制数据时长 ======
	private long UpDrawDataTime = -1;
	private long UpDrawDataFrameRate = 1000 / 120;
	private int UpDrawDataSmoothRate = 4;

	//====== 屏幕宽高，绘制宽高，绘制位置，屏幕方向 ======
	// 是否全屏
	private boolean FullScreen = true;
	private int ScreenWidth;
	private int ScreenHeight;
	private int CanvasWidth;
	private int CanvasHeight;
	private int BufferWidth, BufferHeight;
	private int CenterX;
	private int CenterY;
	private int StatusBarHeight;
	private int NavigationBarHeight;
	private int PositionOffset;
	private int Orientation;
	private final int Orientation_Vertical = -1;
	private final int Orientation_Vertical_Handstand = 1;
	private final int Orientation_Horizontal = 2;
	private final int Orientation_Left_Horizontal = 3;
	private final int Orientation_Right_Horizontal = 4;
	//============

	//====== 用于计算绘制的数据 ======
	
	private float LastDrawRng = 0;
	private float DrawRng = 0;
	private float DrawRngRate = 0;
	
	private float LastDrawR = 0;
	private float DrawR = 0;
	private float DrawRRate = 0;
	
	private float DrawRateAdd = 0;
	
	private float LastDrawFftOneR = 0;
	private float DrawFftOneR = 0;
	private float DrawFftOneRRate = 0;
	
	private float CircleR;
	
	//============

	//====== 避免内存抖动导致频繁 GC 而创建的用于渲染方法中的对象 ======
	
	private float DefaultStrokeWidth = 25;
	
	//====== 绘制六 ======
	private float ChangeCircleR = 0;
	private float LastCircleR = 0;
	private float[] DrawMaxData = null;
	private float[] Change = null;
	private float[] LastBytes = null;
	
	//============

	private AudioVisualizeView AudioVisualizeView;
	private AudioVisualizeSurfaceView AudioVisualizeSurfaceView;
	private AudioVisualizeOpenGLView AudioVisualizeOpenGLView;
	//private HardwareCanvas HardwareCanvas = null;
	
	
	private int FPS = 0;
	private int MaxFps = 60;
	
	/* * *
	 * * * 控制
	* * */
	private boolean IsFps = false;
	private boolean IsCycleColor = true;
	//private boolean IsCycleColorForWave = false;
	private boolean IsInformation = false;
	private boolean IsDrawSmear = false;
	//====== 绘制模式 ======
	private int DrawMode = 1;
	public final int MaxDrawMode = 8;
	//====== 副绘制模式 ======
	private boolean[] SecondaryDrawMode = new boolean[]
	{
		true,
		true,
		true,
		true
	};
	
	private int ViewAlpha = 255;
	private int MinViewAlpha = 127;
	
	private int DataVolumeAdjustmentScale = 1;
	
	private boolean EnableVibrator = false;
	
	/* * * 
	 * * *
	* * */
	
	//====== 临时数据 ======
	private float TestNumber = 0;
	private float[] TestDataO;
	private float[] TestDataT;
	
	private static class HighFrequency
	{
		public static boolean HighFrequencyAvailable;
		public static int Position = 16;
		private static long UpdateRate = 10;
		
		private static long UpdateTime = 0;
		public static void Update()
		{
			if(HighFrequencyAvailable && System.currentTimeMillis() > UpdateTime)
			{
				if(Position > 0)
					Position--;
				UpdateTime = System.currentTimeMillis() + UpdateRate;
			}
		}
	}
	
	

	private int BaseWidth = 1080;
	private float BaseWidthScale = 1.0f;

	public float getSizeFromScreenRatio(float Size)
	{
		return BaseWidth * BaseWidthScale * Size;
	}

	private float getSizeBasedOn1080p(float ParamSize)
	{
		float ScaleRate = 1;
		return ((float) ScreenWidth) * (ParamSize / 1080) * ScaleRate;
	}

	private float DpToPx(float DP)
	{
		return DP * (float) (Dpi) / 160;
	}

	public void RemoveAllView()
	{
		if(AudioVisualizeView != null)
		{
			AudioVisualizeView.AudioVisualize = null;
			//AudioVisualizeView.onDetachedFromWindow();
			AudioVisualizeView = null;
		}
		if(AudioVisualizeSurfaceView != null)
		{
			AudioVisualizeSurfaceView.AudioVisualize = null;
			//AudioVisualizeSurfaceView.onDetachedFromWindow();
			AudioVisualizeSurfaceView = null;
		}
		if(AudioVisualizeOpenGLView != null)
		{
			AudioVisualizeOpenGLView.AudioVisualize = null;
			//AudioVisualizeOpenGLView.onDetachedFromWindow();
			AudioVisualizeOpenGLView = null;
		}
		AudioVisualizeView = null;
		AudioVisualizeSurfaceView = null;
		AudioVisualizeOpenGLView = null;
	}

	public android.view.View getView()
	{
		if(AudioVisualizeView != null)
			return AudioVisualizeView;
		return null;
	}

	public android.view.SurfaceView getSurfaceView()
	{
		if(AudioVisualizeSurfaceView != null)
			return AudioVisualizeSurfaceView;
		return null;
	}

	public AudioVisualizeOpenGLView getOpenGLView()
	{
		if(AudioVisualizeOpenGLView != null)
			return AudioVisualizeOpenGLView;
		return null;
	}

	public android.view.View getView(android.content.Context $Context)
	{
		if(AudioVisualize == null)
			init($Context);
		return AudioVisualizeView = new AudioVisualizeView($Context, this);
	}

	public android.view.SurfaceView getSurfaceView(android.content.Context $Context)
	{
		if(AudioVisualize == null)
			init($Context);
		return AudioVisualizeSurfaceView = new AudioVisualizeSurfaceView($Context, this);
	}

	public AudioVisualizeOpenGLView getOpenGLView(android.content.Context $Context)
	{
		if(AudioVisualize == null)
			init($Context);
		return AudioVisualizeOpenGLView = new AudioVisualizeOpenGLView($Context, this);
	}

	public void ShowAlertMessage(String Message)
	{
		if(Context != null)
			android.widget.Toast.makeText(Context, Message, 1).show();
	}

	public void init(android.content.Context $Context)
	{
		Context = $Context.getApplicationContext();
		AudioManager = (android.media.AudioManager) Context.getSystemService(android.content.Context.AUDIO_SERVICE);
		StreamMaxVolume = AudioManager.getStreamMaxVolume(android.media.AudioManager.STREAM_MUSIC);
		StreamVolume = AudioManager.getStreamVolume(android.media.AudioManager.STREAM_MUSIC);
		//AudioManager.setStreamVolume(3, StreamMaxVolume / 2, android.media.AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
		/*AudioManager.adjustStreamVolume(3, 1, android.media.AudioManager.FLAG_REMOVE_SOUND_AND_VIBRATE);
		AudioManager.getStreamVolume(3);
		*/
		DataMaxVolumeAdjustment = StreamMaxVolume * (4f / 15f);
		
		DataVolumeAdjustmentBase = 1.0f / StreamMaxVolume;
		
		float DataVolumeAdjustmentRatio = ((DataMaxVolumeAdjustment - StreamVolume) * DataVolumeAdjustmentBase);
		if(DataVolumeAdjustmentRatio < 0)
			DataVolumeAdjustmentRatio *= 2;
		if(DataVolumeAdjustmentRatio < -0.5f)
			DataVolumeAdjustmentRatio = -0.5f;
		DataVolumeAdjustment = 1.0f + DataVolumeAdjustmentRatio;
		
		MaxAudioData = ((127) * (DataVolumeAdjustmentBase * StreamVolume) * DataVolumeAdjustmentScale);
		
		init();
	}

	private android.view.OrientationEventListener OrientationEventListener;
	private int OrientationRotation = 0;
	private void InitOrientationEventListener()
	{
		OrientationEventListener = new android.view.OrientationEventListener(Context)
		{
			@Override
			public void onOrientationChanged(int Rotation)
			{
				OrientationRotation = Rotation;
			}
		};
		OrientationEventListener.enable();
	}

	private void SetOrientation()
	{
		android.content.res.Configuration Configuration = Context.getResources().getConfiguration();
        int TempOrientation = Configuration.orientation;
        if (TempOrientation == Configuration.ORIENTATION_PORTRAIT)
		{
			Orientation = Orientation_Vertical;
			PositionOffset = Math.abs(ScreenHeight - CanvasHeight);
		}
		else if (TempOrientation == Configuration.ORIENTATION_LANDSCAPE)
		{
			Orientation = Orientation_Horizontal;
			PositionOffset = Math.abs(ScreenHeight - CanvasWidth);
		}
	}

	private void init()
	{
		CanvasWidth = 1080;
		CanvasHeight = 1920;
		
		android.content.res.Resources Resources = Context.getResources();
		android.util.DisplayMetrics DisplayMetrics = Resources.getDisplayMetrics();
		
		android.view.WindowManager WindowManager = (android.view.WindowManager) Context.getSystemService(Context.WINDOW_SERVICE);
		android.view.Display Display = WindowManager.getDefaultDisplay();
		android.graphics.Point Point = new android.graphics.Point();
		if (android.os.Build.VERSION.SDK_INT >= 19)
			Display.getRealSize(Point);
		else
			Display.getSize(Point);
		ScreenWidth = Point.x;//DisplayMetrics.widthPixels;
		ScreenHeight = Point.y;//DisplayMetrics.heightPixels;
		ScreenWidth = Math.min(Point.x, Point.y);
		ScreenHeight = Math.max(Point.x, Point.y);
		
		Dpi = DisplayMetrics.densityDpi;
		CanvasWidth = ScreenWidth;
		CanvasHeight = ScreenHeight;
		
		BaseWidth = ScreenWidth;
		
		// navigation_bar_height status_bar_height
		int ResourceId = Resources.getIdentifier("status_bar_height", "dimen", "android");
		if (ResourceId > 0)
			StatusBarHeight = Resources.getDimensionPixelSize(ResourceId);
		else
			StatusBarHeight = -1;

		if(StatusBarHeight == -1)
			StatusBarHeight = ScreenHeight - Math.max(DisplayMetrics.widthPixels, DisplayMetrics.heightPixels);
		
		ResourceId = Resources.getIdentifier("navigation_bar_height", "dimen", "android");
		if (ResourceId > 0)
			NavigationBarHeight = Resources.getDimensionPixelSize(ResourceId);
		else
			NavigationBarHeight = -1;

		if(NavigationBarHeight == -1)
			NavigationBarHeight = ScreenHeight - Math.max(DisplayMetrics.widthPixels, DisplayMetrics.heightPixels);
		
		InitOrientationEventListener();
		
		UpDrawDataThread = new java.lang.Thread(new UpDrawDataThreadRunnable());
        UpDrawDataThread.setPriority(java.lang.Thread.NORM_PRIORITY);
		Flag = true;
		AudioFxPlaying = true;
		AudioName = "Null";
		MusicName = "Null";
		
		/*InitVisualizer();
		UpDrawDataThread.start();*/
		
		Vibrator.InitVibrator(Context);
		
		
		BufferWidth = ScreenWidth - (int) (ScreenWidth * 0.35f);
		//BufferHeight = (ScreenHeight / 2) - (int) (ScreenHeight * 0.1f);
		BufferHeight = BufferWidth;
		BackBuffer = android.graphics.Bitmap.createBitmap(BufferWidth, BufferHeight, android.graphics.Bitmap.Config.ARGB_4444);
		BackBufferT = android.graphics.Bitmap.createBitmap(BufferWidth, BufferHeight, android.graphics.Bitmap.Config.ARGB_4444);
		Buffer = android.graphics.Bitmap.createBitmap(BufferWidth, BufferHeight, android.graphics.Bitmap.Config.ARGB_4444);
		//Logo = SuperTools.LocalBitmap(Context, "Logo.png");
		BackGroundColor = android.graphics.Color.parseColor("#2E2E2E");
		
		Path = new android.graphics.Path();
		ScreenOutPaint = new android.graphics.Paint();
		ScreenOutPaint.setAntiAlias(true);
		ScreenOutPaint.setAlpha(0);
		ScreenOutPaint.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.CLEAR));
		
		DefaultStrokeWidth = getSizeFromScreenRatio(0.0029f);
		
		Paint = new android.graphics.Paint();
		/*Paint.setStrokeWidth(1);
		Paint.setStyle(android.graphics.Paint.Style.STROKE);*/
		Paint.setAntiAlias(true);
		Paint.setARGB(255, 255, 220, 175);
		Paint.setTextSize(getSizeFromScreenRatio(0.0347f));
		Paint.setAlpha(255);
		Paint.setFakeBoldText(true);
		
		PathPaint = new android.graphics.Paint();
		PathPaint.setAntiAlias(true);
		PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
		PathPaint.setStrokeWidth(DefaultStrokeWidth);
		PathPaint.setARGB(255, 255, 220, 175);
		
		PointPaint = new android.graphics.Paint();
		PointPaint.setAntiAlias(true);
		PointPaint.setStyle(android.graphics.Paint.Style.STROKE);
		PointPaint.setStrokeWidth(DefaultStrokeWidth);
		PointPaint.setARGB(255, 255, 220, 175);
		
		ForePaint = new android.graphics.Paint();
		ForePaint.setStrokeWidth(getSizeFromScreenRatio(0.001f));
		ForePaint.setAntiAlias(true);
		ForePaint.setARGB(255, 255, 220, 175);
		ForePaint.setAlpha(255);
		ForePaint.setTextSize(getSizeFromScreenRatio(0.0347f));
		
		cPan = new android.graphics.Paint();
		cPan.setAntiAlias(true);
		cPan.setAlpha(210);
		cPan.setARGB(230, 255, 255, 255);
		cPan.setStyle(android.graphics.Paint.Style.STROKE);
		
		pC = new android.graphics.Paint();
		pC.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.CLEAR));
		
		panBg = new android.graphics.Paint();
		panBg.setStyle(android.graphics.Paint.Style.FILL);
		
		pan = new android.graphics.Paint();
		pan.setAntiAlias(true);
		
		DrawTextPaint = new android.graphics.Paint();
		DrawTextPaint.setAlpha(255);
		DrawTextPaint.setARGB(192,255,255,255);
		DrawTextPaint.setStrokeWidth(getSizeFromScreenRatio(0.0164f));
		DrawTextPaint.setTextSize(getSizeFromScreenRatio(0.0228f));
		DrawTextPaint.setAntiAlias(true);
		
		CirclePaint = new android.graphics.Paint();
		CirclePaint.setAlpha(255);
		CirclePaint.setARGB(255,255,255,255);
		CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0191f));
		CirclePaint.setAntiAlias(true);
		CirclePaint.setStyle(android.graphics.Paint.Style.STROKE);
		
		//HardwareCanvas = new HardwareCanvas(Context, BufferWidth, BufferHeight);
		RaCanvas = new android.graphics.Canvas();
		//RaCanvas.setDrawFilter(PaintFlagsDrawFilter);
		RaCanvas.setBitmap(android.graphics.Bitmap.createBitmap(BufferWidth, BufferHeight, android.graphics.Bitmap.Config.ARGB_4444));
		BackBufferCanvas = new android.graphics.Canvas();
		//BackBufferCanvas.setDrawFilter(PaintFlagsDrawFilter);
		BackBufferCanvas.setBitmap(android.graphics.Bitmap.createBitmap(BufferWidth, BufferHeight, android.graphics.Bitmap.Config.ARGB_4444));
		
		BufferSize = new float[4];
		BufferSize[0] = getSizeFromScreenRatio(0.0091f);//ScreenWidth * 0.009259259f;
		BufferSize[1] = getSizeFromScreenRatio(0.0365f);//ScreenWidth * 0.041666667f;
		BufferSize[2] = getSizeFromScreenRatio(0.1114f);//ScreenWidth * 0.117592593f;
		BufferSize[3] = getSizeFromScreenRatio(0.1461f);//ScreenWidth * 0.152777778f;
		
		MaxAudioData = ((float) ScreenWidth) * (MaxAudioData / 1080);
		
		MainUseLength = 0.0f;
		DataKey = 0.0f;
		AudioVisualize = "AudioVisualize";
		
		InitVisualizer();
		UpDrawDataThread.start();
	}

	public boolean IsInit()
	{
		if(AudioVisualize != null)
			return true;
		return false;
	}
	
	private void SetThemeColor(android.graphics.Paint Paint)
	{
		Paint.setARGB(ViewAlpha, 255, 220, 175);
	}

	public static class Vibrator
	{
		public static android.os.Vibrator Vibrator;
		public static int Mode = 0;
		
		private static android.os.VibrationEffect VibrationEffect = android.os.VibrationEffect.createOneShot(100, android.os.VibrationEffect.DEFAULT_AMPLITUDE);
		
		private static java.lang.Thread VibratorThread;
		private static boolean VibratorThreadFlag;
		
		private static long StartTime = 0, EndTime = 0;
		
		public static volatile long[] Timings = new long[2];
		
		public static void InitVibrator(android.content.Context Context)
		{
			Vibrator = (android.os.Vibrator) Context.getSystemService(android.app.Service.VIBRATOR_SERVICE);
			VibratorThread = new java.lang.Thread(new Vibrator.VibratorRunnable());
			VibratorThread.setPriority(java.lang.Thread.NORM_PRIORITY);
			VibratorThreadFlag = true;
			VibratorThread.start();
			
			if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O)
			{
				Mode = 1;
			}
			else
			{
				Mode = 0;
			}
		}

		public static void Start()
		{
			/*if(VibratorThreadFlag)
				return;
			VibratorThreadFlag = true;
			if(VibratorThread != null)
			{
				VibratorThread = new java.lang.Thread(new VibratorRunnable());
				VibratorThread.setPriority(java.lang.Thread.NORM_PRIORITY);
				VibratorThreadFlag = true;
				VibratorThread.start();
			}*/
		}
		public static void Stop()
		{
			/*VibratorThreadFlag = false;
			try
			{
				if(VibratorThread != null)
				{
					VibratorThread.join();
					VibratorThread.interrupt();
				}
			}
			catch(Exception E) {}*/
		}
	
		public static class VibratorRunnable implements java.lang.Runnable
		{
			@Override
			public void run()
			{
				try
				{
					long DrawDataFrameRate = 1000 / 60;
					long DrawDataTime = System.currentTimeMillis();
					android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_FOREGROUND);
					while (VibratorThreadFlag)
					{
						if(System.currentTimeMillis() >= DrawDataTime)
						{
							DrawDataTime = System.currentTimeMillis() + DrawDataFrameRate;
							if(Vibrator != null && Timings != null && Timings[1] > 0)
							{
								StartTime = System.currentTimeMillis();
								if(Mode == 1)
								{
									try
									{
										VibrationEffect = android.os.VibrationEffect.createWaveform(Timings, android.os.VibrationEffect.DEFAULT_AMPLITUDE);
										if(VibrationEffect != null)
											Vibrator.vibrate(VibrationEffect);
									} catch(Exception E) {}
								}
								else
								{
									Vibrator.vibrate(Timings, -1);
								}
								EndTime = System.currentTimeMillis() - StartTime;
							}
						}
						Thread.sleep(1);
					}
				}
				catch(Exception E){}
			}
		}

		public static void Cancel()
		{
			if(Vibrator != null)
				Vibrator.cancel();
		}
	
		public static void Release()
		{
			Cancel();
			Vibrator = null;
			VibratorThreadFlag = false;
			boolean WorkIsNotFinish = true;
			while(WorkIsNotFinish)
			{
				try
				{
					
					VibratorThread.join();
					VibratorThread.interrupt();
				}
				catch (Exception E)
				{
					E.printStackTrace();
				}
				WorkIsNotFinish = false;
			}
			VibratorThread = null;
		}
	}

	private void LocalMusiciIni()
	{
		try
		{
			java.io.InputStream InputStream = Context.getAssets().open("init.ini");
			java.io.File File = new java.io.File("/mnt/sdcard/init.ini");
			java.io.FileOutputStream FileOutputStream = new java.io.FileOutputStream(File);
			int Length = -1 ;
			byte[] Bytes = new byte[1024];
			while( (Length = InputStream.read(Bytes)) != -1)
			{
				FileOutputStream.write(Bytes, 0, Length);
			}
			FileOutputStream.close();
			InputStream.close();
		}
		catch (Exception E)
		{
			ShowAlertMessage(E.toString());
		}
	}

	private android.media.MediaPlayer LocalAssetsAudio(String Path)
	{
		android.media.MediaPlayer MediaPlayer = null;
		try
		{
			AudioName = Path.substring(0,Path.lastIndexOf("."));
			MusicName = AudioName.substring(AudioName.indexOf("-") + 1 ,AudioName.length()).trim();
			MediaPlayer = new android.media.MediaPlayer();
			android.content.res.AssetManager AssetsManager = Context.getAssets();
			android.content.res.AssetFileDescriptor AssetsFileDescriptor = AssetsManager.openFd(Path);
			MediaPlayer.setDataSource(AssetsFileDescriptor.getFileDescriptor(),AssetsFileDescriptor.getStartOffset(),AssetsFileDescriptor.getLength());
		}
		catch (Exception E)
		{
			ShowAlertMessage(E.toString());
		}
		return MediaPlayer;
	}

	private void LocalAssetsAudio(String Path,android.media.MediaPlayer $MediaPlayer)
	{
		try
		{
			AudioName = Path.substring(0,Path.lastIndexOf("."));
			MusicName = AudioName.substring(AudioName.indexOf("-") + 1 ,AudioName.length()).trim();
			android.content.res.AssetManager AssetsManager = Context.getAssets();
			android.content.res.AssetFileDescriptor AssetsFileDescriptor = AssetsManager.openFd(Path);
			$MediaPlayer.setDataSource(AssetsFileDescriptor.getFileDescriptor(),AssetsFileDescriptor.getStartOffset(),AssetsFileDescriptor.getLength());
		}
		catch (Exception E)
		{
			ShowAlertMessage(E.toString());
		}
		return;
	}

	private java.io.FileInputStream LocalAssetsAudioFileInput(String Path)
	{
		java.io.FileInputStream FileInputStream = null;
		try
		{
			android.content.res.AssetManager AssetsManager = Context.getAssets();
			android.content.res.AssetFileDescriptor AssetsFileDescriptor = AssetsManager.openFd(Path);
			FileInputStream = AssetsFileDescriptor.createInputStream();
		}
		catch (Exception E)
		{
			ShowAlertMessage(E.toString());
		}
		return FileInputStream;
	}

	private void LocalAudio(String Path)
	{
		if(MediaPlayer != null && Path.substring(Path.lastIndexOf("/") + 1, Path.lastIndexOf(".")).equals(AudioName))
		{
			MediaPlayer.start();
			return;
		}
		try
		{
			if(MediaPlayer == null)
			{
				MediaPlayer = new android.media.MediaPlayer();
			}
			MediaPlayer.setAudioStreamType(android.media.AudioManager.STREAM_MUSIC);
			MediaPlayer.reset();
			if(new java.io.File(Path).isFile())
			{
				AudioName = Path.substring(Path.lastIndexOf("/") + 1,Path.lastIndexOf("."));
				MusicName = AudioName.substring(AudioName.indexOf("-") + 1 ,AudioName.length()).trim();
				MediaPlayer.setDataSource(Path);
			}
			else
			{
				LocalAssetsAudio(Path, MediaPlayer);
			}
			MediaPlayer.prepare();
			//MediaPlayer.setVolume(1.0f,1.0f);
			//缓冲完成的监听
			if(MediaPlayer != null)
				MediaPlayer.start();
			else
			MediaPlayer.setOnPreparedListener(new android.media.MediaPlayer.OnPreparedListener()
			{
				@Override
				public void onPrepared(android.media.MediaPlayer MediaPlayer)
				{
					//播放音乐
					MediaPlayer.start();
				}
			});
		}
		catch(Exception E)
		{
			ShowAlertMessage(E.toString());
		}
	}

	public void InitVisualizer()
	{
		InitVisualizer(-1);
	}

	public void InitVisualizer(int $AudioSessionId)
	{
		if(Context == null)
			return;
		if(android.os.Build.VERSION.SDK_INT >= 23 && Context.checkSelfPermission(android.Manifest.permission.RECORD_AUDIO) != android.content.pm.PackageManager.PERMISSION_GRANTED)
			return;
		if(Visualizer != null)
		{
			if(!Visualizer.getEnabled())
				Visualizer.setEnabled(true);
			return;
		}
		int AudioSessionId = $AudioSessionId;
		if(AudioTrack != null)
			AudioSessionId = AudioTrack.getAudioSessionId();
		else if(MediaPlayer != null)
			AudioSessionId = MediaPlayer.getAudioSessionId();
		if(AudioSessionId != -1)
			Visualizer = new android.media.audiofx.Visualizer(AudioSessionId);
		else
			Visualizer = new android.media.audiofx.Visualizer(0);
		if(Visualizer != null)
			try
			{
				InitVisualizer(Visualizer.getCaptureSize(), Visualizer.getMaxCaptureRate(), /* 不用 Wave 数据了，所以 false*/false, true);
			}
			catch(Exception E)
			{
				ShowAlertMessage(E.toString());
			}
	}

	private void InitVisualizer(int CaptureSize, int MaxCaptureRate, boolean UserWave, boolean UserFft)
	{
		Visualizer.setEnabled(false);
		// 设置采样大小
		Visualizer.setCaptureSize(CaptureSize);
		if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT)
		{
			Visualizer.setScalingMode(Visualizer.SCALING_MODE_NORMALIZED);
			Visualizer.setMeasurementMode(Visualizer.MEASUREMENT_MODE_PEAK_RMS);
		}
		if(true)
		{
			Visualizer.setEnabled(true);

			new Thread(new Runnable()
			{
				@Override
				public void run()
				{
					try
					{
						while(Visualizer.getEnabled())
						{
							if(Visualizer != null && Visualizer.getEnabled())
							{
								byte[] Bytes = new byte[1024];
								
								/*Visualizer.getWaveForm(Bytes);
								
								getWaveFrom(Bytes);*/
								
								/* Visualizer.getFft ()：
								{
								Visualizer.getWaveForm
								doFft
								}*/
								Visualizer.getFft(Bytes);
								
								getFft(Bytes);
							}
							Thread.sleep(16);
						}
					} catch(Exception E) {}
				}
			}).start();
		}
		else
		{
			Visualizer.setDataCaptureListener(new android.media.audiofx.Visualizer.OnDataCaptureListener()
			{
				// 更新时域波形数据
				public void onWaveFormDataCapture(android.media.audiofx.Visualizer Visualizer, byte[] Bytes, int SamplingRate)
				{
					getWaveFrom(Bytes);
				}
				// 更新频域波形数据
				public void onFftDataCapture(android.media.audiofx.Visualizer Visualizer, byte[] Bytes, int SamplingRate)
				{
					getFft(Bytes);
				}
			}, MaxCaptureRate, UserWave, UserFft);
			Visualizer.setEnabled(true);
		}
	}

	private void getWaveFrom(byte[] Bytes)
	{
		StreamVolume = AudioManager.getStreamVolume(android.media.AudioManager.STREAM_MUSIC);
		float DataVolumeAdjustmentRatio = ((DataMaxVolumeAdjustment - StreamVolume) * DataVolumeAdjustmentBase);
		if(DataVolumeAdjustmentRatio < 0)
			DataVolumeAdjustmentRatio *= 2;
		if(DataVolumeAdjustmentRatio < -0.5f)
			DataVolumeAdjustmentRatio = -0.5f;
		DataVolumeAdjustment = 1.0f + DataVolumeAdjustmentRatio;
		float FinallyDataVolumeAdjustment = DataVolumeAdjustment * DataVolumeAdjustmentScale;
		MaxAudioData = ((127) * (DataVolumeAdjustmentBase * StreamVolume) * DataVolumeAdjustmentScale);
		MaxAudioData = ((float) ScreenWidth) * (MaxAudioData / 1080);
		byte[] Model = new byte[Bytes.length];
		for (int Index = 0; Index < Bytes.length; Index++)
		{
			Bytes[Index] = (byte) (((int) Bytes[Index] & 0xFF) - 128);
			Model[Index] = (byte) (Math.hypot(Bytes[Index] << 1, Bytes[(Index + 1) % Bytes.length] << 1));
			//Model[Index] = Bytes[Index];
			
			Model[Index] *= FinallyDataVolumeAdjustment;
		}
		WaveData = UpdateVisualizerWave(Model, ByteAllCount);
		
	}
	
	private void getFft(byte[] Bytes)
	{
		StreamVolume = AudioManager.getStreamVolume(android.media.AudioManager.STREAM_MUSIC);
		float DataVolumeAdjustmentRatio = ((DataMaxVolumeAdjustment - StreamVolume) * DataVolumeAdjustmentBase);
		if(DataVolumeAdjustmentRatio < 0)
			DataVolumeAdjustmentRatio *= 2;
		if(DataVolumeAdjustmentRatio < -0.5f)
			DataVolumeAdjustmentRatio = -0.5f;
		DataVolumeAdjustment = 1.0f + DataVolumeAdjustmentRatio;
		float FinallyDataVolumeAdjustment = DataVolumeAdjustment * DataVolumeAdjustmentScale;
		MaxAudioData = ((127) * (DataVolumeAdjustmentBase * StreamVolume) * DataVolumeAdjustmentScale);
		MaxAudioData = ((float) ScreenWidth) * (MaxAudioData / 1080);
		byte[] Model = new byte[Bytes.length];
		for (int Index = 0; Index < Bytes.length; Index++)
		{
			Model[Index] = (byte) (Math.hypot(Bytes[Index], Bytes[(Index + 1) % Bytes.length]));
			if(Model[Index] < 2)
				Model[Index] = 0;
			else
				Model[Index] *= FinallyDataVolumeAdjustment;
		}
		Model[0] = (byte) Math.abs(Bytes[0]);
		/*
		
		Model = new byte[Bytes.length / 2 + 1];
		Model[0] = (byte) Math.abs(Bytes[0]);
		for (int Index = 1; Index < Model.length - 1; Index++)
		{
			Model[Index] = (byte) Math.hypot(Bytes[2 * Index], Bytes[2 * Index + 1]);
			if(Model[Index] < 2)
				Model[Index] = 0;
			else
				Model[Index] *= FinallyDataVolumeAdjustment;
		}//*/
		
		
		float[] BaseData = new float[Model.length];
		for (int Index = 0; Index < Model.length; Index++)
		{
			BaseData[Index] = Model[Index];
		}
		
		
		/*TestDataO = new float[Bytes.length];
		//TestDataT = new float[Bytes.length];
		for (int Index = 0; Index < Bytes.length; Index += 2)
		{
			float magnitude = (float)Math.hypot(Bytes[Index], Bytes[Index + 1]);
			float phase = (float)Math.atan2(Bytes[Index + 1], Bytes[Index]);
			TestDataO[Index] = magnitude;
			//TestDataT[Index] = phase;
		}*/
		/*byte[] ByteWave = new byte[1024];
		int[] IntWave = new int[1024];
		byte[] Test2 = new byte[1024];
		Visualizer.getWaveForm(ByteWave);
		for(int Index = 0; Index < ByteWave.length; Index++)
		{
			//IntWave[Index] = (((int) ByteWave[Index]) & 0xFF);
			
			IntWave[Index] = ByteWave[Index];
		}
		doFft(Test2, IntWave);
		if(TestDataO == null)
			TestDataO = new float[Test2.length];
		//Visualizer.getFft(Test2);
		for (int Index = 0; Index < Test2.length; Index++)
		{
			float magnitude = (float)Math.hypot(Test2[Index], Test2[(Index + 1) % Test2.length]);
			TestDataO[Index] = magnitude;
		}*/
		//TestDataO = getFftMagnitudes(Bytes);
		
		BaseFftData = BaseData;
		FftData = UpdateVisualizerFft(Model, ByteAllCount);
		
		
		//====== 降低透明度，绘制线程休眠处理 ======
		int Length = 0;
		for(float Index : FftData)
		{
			Length += Index;
		}
		if(Length < 1)
		{
			NotAudioData = true;
			RateAdd = 0f;
			if(ViewAlpha > MinViewAlpha)
				ViewAlpha--;
			else if(ViewAlpha < MinViewAlpha)
				ViewAlpha++;
			if(ViewAlpha == 0)
			{
				if(AudioVisualizeView != null && !AudioVisualizeView.ThreadPowerSave)
					AudioVisualizeView.PowerSave(true);
				if(AudioVisualizeSurfaceView != null && !AudioVisualizeSurfaceView.ThreadPowerSave)
					AudioVisualizeSurfaceView.PowerSave(true);
			}
			else
			{
				if(AudioVisualizeView != null && AudioVisualizeView.ThreadPowerSave)
					AudioVisualizeView.PowerSave(false);
				if(AudioVisualizeSurfaceView != null && AudioVisualizeSurfaceView.ThreadPowerSave)
					AudioVisualizeSurfaceView.PowerSave(false);
			}
		}
		else if(Length > 1)
		{
			NotAudioData = false;
			if(ViewAlpha < 255)
			{
				if(AudioVisualizeView != null && AudioVisualizeView.ThreadPowerSave)
					AudioVisualizeView.PowerSave(false);
				if(AudioVisualizeSurfaceView != null && AudioVisualizeSurfaceView.ThreadPowerSave)
					AudioVisualizeSurfaceView.PowerSave(false);
				ViewAlpha++;
			}
		}
		//============
		
		
		UpVisualizerFftData();
		UpVisualizerEndTime = System.currentTimeMillis() - UpVisualizerStartTime;
		UpVisualizerStartTime = System.currentTimeMillis();
	}

	/*public float[] getFftMagnitudes(byte[] Data)
	{
		int n = Data.length;
		float[] magnitudes = new float[n / 2 + 1];
		magnitudes[0] = (float) Math.abs(Data[0]);      // DC
		magnitudes[n / 2] = (float) Math.abs(Data[1]);  // Nyquist
		for (int k = 1; k < n / 2; k++)
		{
			int i = k * 2;
			magnitudes[k] = (float) Math.hypot(Data[i], Data[i + 1]);
		}
		return magnitudes;
	}
	

	private int doFft(byte[] fft, int[] waveform)
	{
		int CaptureSize = Visualizer.getCaptureSize();
		int[] workspace = new int[CaptureSize >> 1];
		int nonzero = 0;

		for (int i = 0; i < CaptureSize; i += 2)
		{
			workspace[i >> 1] =
				((waveform[i] ^ 0x80) << 24) | ((waveform[i + 1] ^ 0x80) << 8);
			nonzero |= workspace[i >> 1];
		}TestNumber = nonzero;

		if (nonzero != 0)
		{
			fixedfft.fixed_fft_real(CaptureSize >> 1, workspace);
		}

		for (int i = 0; i < CaptureSize; i += 2)
		{
			short tmp = (short) (workspace[i >> 1] >> 21);
			while (tmp > 127 || tmp < -128) tmp >>= 1;
			
			
			
			fft[i] = (byte) tmp;
			
			tmp = (short) workspace[i >> 1];
			tmp >>= 5;
			while (tmp > 127 || tmp < -128) tmp >>= 1;
			
			
			
			fft[i + 1] = (byte) tmp;
		}

		return 1;
	}

	public static class fixedfft
	{
		static int LOG_FFT_SIZE = 10;
		static int MAX_FFT_SIZE = (1 << LOG_FFT_SIZE);
		// MAX_FFT_SIZE / 4
		static int[] twiddle = new int[]
		{
			0x00008000, 0xff378001, 0xfe6e8002, 0xfda58006, 0xfcdc800a, 0xfc13800f,
			0xfb4a8016, 0xfa81801e, 0xf9b88027, 0xf8ef8032, 0xf827803e, 0xf75e804b,
			0xf6958059, 0xf5cd8068, 0xf5058079, 0xf43c808b, 0xf374809e, 0xf2ac80b2,
			0xf1e480c8, 0xf11c80de, 0xf05580f6, 0xef8d8110, 0xeec6812a, 0xedff8146,
			0xed388163, 0xec718181, 0xebab81a0, 0xeae481c1, 0xea1e81e2, 0xe9588205,
			0xe892822a, 0xe7cd824f, 0xe7078276, 0xe642829d, 0xe57d82c6, 0xe4b982f1,
			0xe3f4831c, 0xe3308349, 0xe26d8377, 0xe1a983a6, 0xe0e683d6, 0xe0238407,
			0xdf61843a, 0xde9e846e, 0xdddc84a3, 0xdd1b84d9, 0xdc598511, 0xdb998549,
			0xdad88583, 0xda1885be, 0xd95885fa, 0xd8988637, 0xd7d98676, 0xd71b86b6,
			0xd65c86f6, 0xd59e8738, 0xd4e1877b, 0xd42487c0, 0xd3678805, 0xd2ab884c,
			0xd1ef8894, 0xd13488dd, 0xd0798927, 0xcfbe8972, 0xcf0489be, 0xce4b8a0c,
			0xcd928a5a, 0xccd98aaa, 0xcc218afb, 0xcb698b4d, 0xcab28ba0, 0xc9fc8bf5,
			0xc9468c4a, 0xc8908ca1, 0xc7db8cf8, 0xc7278d51, 0xc6738dab, 0xc5c08e06,
			0xc50d8e62, 0xc45b8ebf, 0xc3a98f1d, 0xc2f88f7d, 0xc2488fdd, 0xc198903e,
			0xc0e990a1, 0xc03a9105, 0xbf8c9169, 0xbedf91cf, 0xbe329236, 0xbd86929e,
			0xbcda9307, 0xbc2f9371, 0xbb8593dc, 0xbadc9448, 0xba3394b5, 0xb98b9523,
			0xb8e39592, 0xb83c9603, 0xb7969674, 0xb6f196e6, 0xb64c9759, 0xb5a897ce,
			0xb5059843, 0xb46298b9, 0xb3c09930, 0xb31f99a9, 0xb27f9a22, 0xb1df9a9c,
			0xb1409b17, 0xb0a29b94, 0xb0059c11, 0xaf689c8f, 0xaecc9d0e, 0xae319d8e,
			0xad979e0f, 0xacfd9e91, 0xac659f14, 0xabcd9f98, 0xab36a01c, 0xaaa0a0a2,
			0xaa0aa129, 0xa976a1b0, 0xa8e2a238, 0xa84fa2c2, 0xa7bda34c, 0xa72ca3d7,
			0xa69ca463, 0xa60ca4f0, 0xa57ea57e, 0xa4f0a60c, 0xa463a69c, 0xa3d7a72c,
			0xa34ca7bd, 0xa2c2a84f, 0xa238a8e2, 0xa1b0a976, 0xa129aa0a, 0xa0a2aaa0,
			0xa01cab36, 0x9f98abcd, 0x9f14ac65, 0x9e91acfd, 0x9e0fad97, 0x9d8eae31,
			0x9d0eaecc, 0x9c8faf68, 0x9c11b005, 0x9b94b0a2, 0x9b17b140, 0x9a9cb1df,
			0x9a22b27f, 0x99a9b31f, 0x9930b3c0, 0x98b9b462, 0x9843b505, 0x97ceb5a8,
			0x9759b64c, 0x96e6b6f1, 0x9674b796, 0x9603b83c, 0x9592b8e3, 0x9523b98b,
			0x94b5ba33, 0x9448badc, 0x93dcbb85, 0x9371bc2f, 0x9307bcda, 0x929ebd86,
			0x9236be32, 0x91cfbedf, 0x9169bf8c, 0x9105c03a, 0x90a1c0e9, 0x903ec198,
			0x8fddc248, 0x8f7dc2f8, 0x8f1dc3a9, 0x8ebfc45b, 0x8e62c50d, 0x8e06c5c0,
			0x8dabc673, 0x8d51c727, 0x8cf8c7db, 0x8ca1c890, 0x8c4ac946, 0x8bf5c9fc,
			0x8ba0cab2, 0x8b4dcb69, 0x8afbcc21, 0x8aaaccd9, 0x8a5acd92, 0x8a0cce4b,
			0x89becf04, 0x8972cfbe, 0x8927d079, 0x88ddd134, 0x8894d1ef, 0x884cd2ab,
			0x8805d367, 0x87c0d424, 0x877bd4e1, 0x8738d59e, 0x86f6d65c, 0x86b6d71b,
			0x8676d7d9, 0x8637d898, 0x85fad958, 0x85beda18, 0x8583dad8, 0x8549db99,
			0x8511dc59, 0x84d9dd1b, 0x84a3dddc, 0x846ede9e, 0x843adf61, 0x8407e023,
			0x83d6e0e6, 0x83a6e1a9, 0x8377e26d, 0x8349e330, 0x831ce3f4, 0x82f1e4b9,
			0x82c6e57d, 0x829de642, 0x8276e707, 0x824fe7cd, 0x822ae892, 0x8205e958,
			0x81e2ea1e, 0x81c1eae4, 0x81a0ebab, 0x8181ec71, 0x8163ed38, 0x8146edff,
			0x812aeec6, 0x8110ef8d, 0x80f6f055, 0x80def11c, 0x80c8f1e4, 0x80b2f2ac,
			0x809ef374, 0x808bf43c, 0x8079f505, 0x8068f5cd, 0x8059f695, 0x804bf75e,
			0x803ef827, 0x8032f8ef, 0x8027f9b8, 0x801efa81, 0x8016fb4a, 0x800ffc13,
			0x800afcdc, 0x8006fda5, 0x8002fe6e, 0x8001ff37,

		};
		// Returns the multiplication of \conj{a} and {b}. 
		static int mult(int a, int b)
		{
			return (((a >> 16) * (b >> 16) + (short)a * (short)b) & ~0xFFFF) |
				((((a >> 16) * (short)b - (short)a * (b >> 16)) >> 16) & 0xFFFF);
		}

		static int half(int a)
		{
			return ((a >> 1) & ~0x8000) | (a & 0x8000);
		}
		
		static boolean iffalse(int v)
		{
			if(v == 0)
				return false;
			return true;
		}

		static void fixed_fft(int n, int[] v)
		{
			
			int scale = LOG_FFT_SIZE, i, p, r;

			for (r = 0, i = 1; i < n; ++i)
			{
				for (p = n; iffalse(p & r); p >>= 1, r ^= p);
				if (i < r)
				{
					int t = v[i];
					v[i] = v[r];
					v[r] = t;
				}
			}

			for (p = 1; p < n; p <<= 1)
			{
				scale--;
				
				for (i = 0; i < n; i += p << 1)
				{
					int x = half(v[i]);
					int y = half(v[i + p]);
					v[i] = x + y;
					v[i + p] = x - y;
				}

				for (r = 1; r < p; ++r)
				{
					int w = MAX_FFT_SIZE / 4 - (r << scale);
					i = w >> 31;
					w = twiddle[(w ^ i) - i] ^ (i << 16);
					for (i = r; i < n; i += p << 1)
					{
						int x = half(v[i]);
						int y = mult(w, v[i + p]);
						v[i] = x - y;
						v[i + p] = x + y;
					}
				}
			}
		}

		static void fixed_fft_real(int n, int[] v)
		{
			int scale = LOG_FFT_SIZE, m = n >> 1, i;

			fixed_fft(n, v);
			for (i = 1; i <= n; i <<= 1, --scale);
			v[0] = mult(~v[0], 0x80008000);
			v[m] = half(v[m]);

			for (i = 1; i < n >> 1; ++i)
			{
				int x = half(v[i]);
				int z = half(v[n - i]);
				int y = z - (x ^ 0xFFFF);
				x = half(x + (z ^ 0xFFFF));
				y = mult(y, (twiddle[i << scale]));
				v[i] = x - y;
				v[n - i] = (x + y) ^ 0xFFFF;
			}
		}
	}*/
	

	private float[] UpdateVisualizerFft(byte[] Datas, int Length)
	{
		float[] HandleDatas = new float[1 + Length];
		for(int Index = 0; Index < HandleDatas.length; Index++)
		{
			Datas[Index] = (byte) (Datas[Index] & 0xFF);
			HandleDatas[Index] = (float) (Math.sqrt(Datas[Index] * Datas[Index] + Datas[Index + 1] * Datas[Index + 1]) / 2);
		}
		return HandleDatas;
	}

	private int[] UpdateVisualizerWave(byte[] Datas, int Length)
	{
		int[] HandleDatas = new int[1 + Length];
		for(int Index = 0; Index < HandleDatas.length; Index++)
		{
			HandleDatas[Index] = (int)(Math.sqrt(((Datas[Index] * Datas[Index])) >> 1));
		}
		//return HandleDatas;
		return calculateVolume(HandleDatas);
	}

	private long UpVisualizerStartTime = 0;
	private long UpVisualizerEndTime = 0;

	private void UpVisualizerFftData()
	{
		if(FftData == null)
			return;
		DataKey = 0.0f;
		//FftData = calculateVolume(FftData);
		for(int Index = 0; Index < FftData.length; Index++)
		{
			if(FftData[Index] > MainUseLength)
				MainUseLength = FftData[Index];
			if(FftData[Index] > 1)
				DataKey += ((float) (Index * 2.5d) * FftData[Index]);
		}
		/*int Length = 0;
		for(int Index = 1; Index < FftData.length; Index++)
		{
			if(FftData[Index] > MainUseLength)
				MainUseLength = FftData[Index];
			if(FftData[Index] > FftData[Index - 1] && FftData[Index] > FftData[(Index + 1) % FftData.length])
			{
				DataKey += FftData[Index] * (Index * 2.5d);
				Length++;
			}
		}*/
		DataKey /= (float) FftData.length;
		DataKey = (float) Math.sqrt(DataKey) / 7f;
		DataKey = (float) Math.sqrt(DataKey);
		LastDataKey = DataKey;
		MainUseLength /= (float) 128;
		
		
		if(DataKey > 1)
		{
			if(HighFrequency.Position > 0)
				HighFrequency.Position --;
			if(!HighFrequency.HighFrequencyAvailable)
			{
				HighFrequency.Position = 16;
				HighFrequency.HighFrequencyAvailable = true;
			}
		}
		else if(DataKey < 1)
		{
			if(HighFrequency.Position == 0)
			{
				HighFrequency.HighFrequencyAvailable = false;
			}
		}
		
		if(HighFrequency.HighFrequencyAvailable)
		for(int Index = 0; Index < 6; Index ++)
		{
			FftData[HighFrequency.Position + Index] = FftData[Index];
		}
		
		
		if (ReadByte == null || ReadByte.length != ByteAllCount)
			ReadByte = new float[ByteAllCount];
		//
		//
		if(NotAudioData)
		{
			for (int Index = 0; Index < ReadByte.length; Index++)
			{
				if(ReadByte[Index] > 1.11f)
					ReadByte[Index] = FftData[Index] * (2 + 0.11f * (Index * 0.7f)) / 2;
				else if(ReadByte[Index] != 0)
					ReadByte[Index] = FftData[Index] * 1.51f;
				else
					ReadByte[Index] = FftData[Index];
				ReadByte[Index] = ((float) ScreenWidth) * (ReadByte[Index] / 1080);
			}
		}
		else
		{
			for (int Index = 0; Index < ReadByte.length; Index++)
			{
				if(ReadByte[Index] > 1.11f)
					ReadByte[Index] = FftData[Index] * (2 + 0.11f * (Index * 0.7f)) / 2;
				else if(ReadByte[Index] != 0)
					ReadByte[Index] = FftData[Index] * 1.51f;
				else
					ReadByte[Index] = 1;//FftData[Index];
				ReadByte[Index] = ((float) ScreenWidth) * (ReadByte[Index] / 1080);
			}//*/ReadByte = FftData;
		}

		//RateAdd = 0;
		float Pan = 210f / 255;
		if (DataKey > (DataLastKey))
			RateAdd = Math.min((float) Math.pow(DataKey * 2.564d - DataLastKey * 2.564d, 0.3) * 10, 25) * 1.2f;
		if (DataKey > (DataLastKey * 1.14d + 0.04d))
		{
			RateAdd = Math.min((float) Math.pow(DataKey - DataLastKey, 0.3) * 10, 35) * 3.2f;
			Pan = 150f / 255;
			cPan.setAlpha((int) Pan);
		}
		DataLastKey = DataKey;
	}

	private float[] calculateVolume(float[] f)
	{
		float[] r = new float[f.length];
		int range = 2;
		int start = 0;
		int end = 0;
		int count = 0;
		float rv;
		for (int i = 0; i < r.length; i++)
		{
			rv = 0;
			start = (i - range < 0) ? 0 : (i - range);
			end = (i + range >= r.length) ? (r.length - 1) : (i + range);
			count = end - start + 1;
			for (int j = start; j <= end; j++)
			{
				rv += f[j];
			}
			rv = rv / (count * 255);
			rv = (float) Math.pow(rv, 0.15);
			r[i] = rv * f[i] * 2;
		}
		return r;
	}

	private int[] calculateVolume(int[] f)
	{
		int[] r = new int[f.length];
		int range = 2;
		int start = 0;
		int end = 0;
		int count = 0;
		float rv;
		for (int i = 0; i < r.length; i++)
		{
			rv = 0;
			start = (i - range < 0) ? 0 : (i - range);
			end = (i + range >= r.length) ? (r.length - 1) : (i + range);
			count = end - start + 1;
			for (int j = start; j <= end; j++)
			{
				rv += f[j];
			}
			rv = rv / (count * 255);
			rv = (float) Math.pow(rv, 0.15);
			r[i] = (int) (rv * f[i]) << 1;
		}
		return r;
	}

	private DrawTextUtils PrintInfo = new DrawTextUtils();
	
	public class DrawTextUtils
	{
		StringBuffer StringBuffer = new StringBuffer();
		float X = 0, Y = 0;
		
		public void Println(String Text)
		{
			StringBuffer.append(Text).append("\n");
		}
	
		public void Println(String Name, Object Value)
		{
			StringBuffer.append(Name + "：" + Value).append("\n");
		}
	
		public void SetPosition(float $X, float $Y)
		{
			X = $X;
			Y = $Y;
		}
	
		public void Draw(android.graphics.Canvas Canvas, android.graphics.Paint Paint)
		{
			String[] TextLines = StringBuffer.toString().split("\n");
			android.graphics.Paint.Style Style = Paint.getStyle();
			int Color = Paint.getColor();
			float StrokeWidth = Paint.getStrokeWidth();
			float DrawStrokeWidth = Paint.getTextSize() * 0.1f;
			float TextX = X;
			float TextY = Y;
			float TextHeight = Paint.descent() - Paint.ascent();
			for(String Text : TextLines)
			{
				//====== 偏移修正 ======
				TextY += TextHeight;
				Paint.setStyle(android.graphics.Paint.Style.STROKE);
				Paint.setColor(android.graphics.Color.BLACK);
				Paint.setAlpha(ViewAlpha);
				Paint.setStrokeWidth(DrawStrokeWidth);
				Canvas.drawText(Text, TextX, TextY, Paint);
				
				Paint.setStyle(android.graphics.Paint.Style.FILL);
				Paint.setColor(android.graphics.Color.WHITE);
				Paint.setAlpha(ViewAlpha);
				Paint.setStrokeWidth(0);
				Canvas.drawText(Text, TextX, TextY, Paint);
			}
			
			Paint.setStyle(Style);
			Paint.setColor(Color);
			Paint.setStrokeWidth(StrokeWidth);
		}
	
		public void Rest()
		{
			X = 0;
			Y = 0;
			StringBuffer.setLength(0);
		}
	}

	private int Frames = 114514;
	private long StartTime = 114514;

	public void Draw(android.graphics.Canvas Canvas, int Width, int Height)
	{
		/*if(1==1)
			return;*/
		try
		{
			synchronized(Canvas)
			{
				if(Canvas == null)
					return;
				Canvas.drawColor(android.graphics.Color.TRANSPARENT, android.graphics.PorterDuff.Mode.CLEAR);
				
				long UpdateDrawTime = System.currentTimeMillis();
				UpDraw(Canvas);
				UpdateDrawTime = System.currentTimeMillis() - UpdateDrawTime;
				
				long DrawBitmapTime = System.currentTimeMillis();
				if(IsDrawSmear)
					Canvas.drawBitmap(Buffer, (CanvasWidth >> 1) - (Buffer.getWidth() >> 1), (CanvasHeight >> 1) - (Buffer.getHeight() >> 1), pan);
				DrawBitmapTime = System.currentTimeMillis() - DrawBitmapTime;
				
				int Y = (int) getSizeFromScreenRatio(0.10964f);
				Paint.setAlpha(ViewAlpha);
				
				/*PrintInfo.SetPosition(20, Y * 2);
				PrintInfo.Println("Position：" + (HighFrequency.Position));
				PrintInfo.Draw(Canvas, Paint);
				PrintInfo.Rest();*/
				if(IsInformation)
				{
					//Canvas.drawRect(0, Y, CanvasWidth, Y + 1, Paint);
					PrintInfo.SetPosition(20, Y);
					
					/*PrintInfo.Println("TestNumber：" + (Orientation));
					PrintInfo.Println("TestNumber：" + (OrientationRotation));
					*/
					/*PrintInfo.Println("StatusBarHeight", StatusBarHeight);
					PrintInfo.Println("NavigationBarHeight", NavigationBarHeight);*/
					//PrintInfo.Println("PositionOffset", PositionOffset);
					PrintInfo.Println("UpVisualizerEndTime：" + UpVisualizerEndTime);
					PrintInfo.Println("UpdateDrawTime", UpdateDrawTime);
					PrintInfo.Println("DrawBitmapTime：" + DrawBitmapTime);
					PrintInfo.Println("DrawDeltaTime：" + (System.currentTimeMillis() - UpDrawDeltaTime));
					
					PrintInfo.Println("NotAudioData", NotAudioData);
					PrintInfo.Println("DrawFftData[0]", DrawFftData[0]);
					//PrintInfo.Println("Vibrator.Timings[0]", Vibrator.Timings[0]);
					PrintInfo.Println("Vibrator.Timings[1]", Vibrator.Timings[1]);
					PrintInfo.Println("Vibrator.EndTime", Vibrator.EndTime);
					PrintInfo.Println("DataKey：" + DataKey);
					PrintInfo.Println("DrawRng：" + DrawRng);
					PrintInfo.Println("DrawR：" + DrawR);
					PrintInfo.Println("RateAdd：" + RateAdd);
					PrintInfo.Println("DrawRateAdd：" + DrawRateAdd);
					
					PrintInfo.Println("ByteAllCountFft：" + ByteAllCountFft);
					PrintInfo.Println("ByteAllCountWave：" + ByteAllCountWave);
					
					PrintInfo.Println("StreamMaxVolume：" + StreamMaxVolume);
					PrintInfo.Println("StreamVolume：" + StreamVolume);
					
					PrintInfo.Println("ScreenWidth：" + ScreenWidth);
					PrintInfo.Println("ScreenHeight：" + ScreenHeight);
					
					PrintInfo.Println("CanvasWidth：" + CanvasWidth);
					PrintInfo.Println("CanvasHeight：" + CanvasHeight);
					
					PrintInfo.Println("BufferWidth：" + BufferWidth);
					PrintInfo.Println("BufferHeight：" + BufferHeight);
					
					PrintInfo.Println("MusicName：" + MusicName);
					
					PrintInfo.Println("Canvas：" + (Canvas.getClass().toString()));
					PrintInfo.Println("DrawCanvas：" + (RaCanvas.getClass().toString()));
					
					PrintInfo.Println("ThreadPriority：" + UpDrawDataThread.getPriority());
					PrintInfo.Println("Android SDK_Int：" + android.os.Build.VERSION.SDK_INT);
					PrintInfo.Println("Info：" + getClass());
					
					if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.HONEYCOMB)
						PrintInfo.Println("IsHardwareAccelerated：" + Canvas.isHardwareAccelerated());
					
					PrintInfo.Println("ViewAlpha：" + (ViewAlpha));
					PrintInfo.Println("MinViewAlpha：" + (MinViewAlpha));
					
					PrintInfo.Println("DataVolumeAdjustment：" + DataVolumeAdjustment);
					PrintInfo.Println("DataVolumeAdjustmentBase：" + DataVolumeAdjustmentBase);
					PrintInfo.Println("DataMaxVolumeAdjustment：" + DataMaxVolumeAdjustment);
					PrintInfo.Println("DataVolumeAdjustmentScale：" + DataVolumeAdjustmentScale);
					
					//PrintInfo.Println("Size：" + (getSizeFromScreenRatio(0.1f) + " == " + getScreenDensityForNewSize(38) + " Dpi：" + Dpi));
					
					PrintInfo.Println("TestNumber：" + (TestNumber));
					
					PrintInfo.Draw(Canvas, Paint);
					PrintInfo.Rest();
				}
				if(IsFps)
				{
					/*FPS = 1000 / (System.currentTimeMillis() - UpDrawDeltaTime);
					if(FPS > MaxFps)
						FPS = MaxFps;*/
					Frames++;
					long EndTime = System.currentTimeMillis() - StartTime;
					
					if(EndTime > 1000)
					{
						FPS = (int) (Frames / (EndTime / 1000.0f));
						Frames = 0;
						StartTime = System.currentTimeMillis();
					}
					
					//Canvas.drawText(String.valueOf(FPS), Width - BufferWidth - (ForePaint.getTextSize() / 2), BufferHeight + Y, Paint);
					Paint.setTextAlign(android.graphics.Paint.Align.CENTER);
					PrintInfo.SetPosition((CanvasWidth >> 1) /*- Paint.measureText(String.valueOf(FPS)) / 2*/, (CanvasHeight >> 1) - ((Paint.descent() - Paint.ascent()) / 2 + Paint.descent()));
					PrintInfo.Println(String.valueOf(FPS));
					PrintInfo.Draw(Canvas, Paint);
					PrintInfo.Rest();
					Paint.setTextAlign(android.graphics.Paint.Align.LEFT);
				}
				UpDrawDeltaTime = System.currentTimeMillis();
			}
		}
		catch(Exception E)
		{
			//ShowAlertMessage(E.toString());
		}
	}

	private void UpDraw(android.graphics.Canvas Canvas)
	{
		if(ViewAlpha <= 0 || DrawFftData == null || DrawWaveData == null)
			return;
		
		if(!NotAudioData && EnableVibrator)
		{
			//long[] Timings = new long[2];
			if(Vibrator.Timings == null)
				Vibrator.Timings = new long[2];
			
			//DrawFftDataOne = DrawFftData[0];
			DrawFftDataOne = ((float) 1440) * (ReadByte[0] / 1080);
			DrawFftDataOne = SmoothDataHandle(DrawFftDataOne, DrawFftDataOne, 4);
			
			Vibrator.Timings[0] = 0;
			Vibrator.Timings[1] = 0;
			if(DrawFftDataOne > LastDrawFftDataOne)
				Vibrator.Timings[1] = (long) (DrawFftDataOne * 0.73f);
			if(DrawFftDataOne > (LastDrawFftDataOne * 1.27f))
			{
				long Time = (long) Math.min(LastDrawFftDataOne / 2, 27);
				Vibrator.Timings[1] += Time;// + (long) (Math.abs(DrawFftDataOne - LastDrawFftDataOne));
			}
			
			LastDrawFftDataOne = DrawFftDataOne;
			
			/*boolean IsEven = false;
			for(int Index = 0; Index < Timings.length; Index++)
			{
				Timings[Index] = (long) (DrawFftData[Index] / 2 + DrawFftData[0]);
				//if(DataKey > 1)
				if(!IsEven)
				{
					Timings[Index] -= DrawFftData[0] / 2;
					Timings[Index] += DrawFftData[0] / 4;
					if(Timings[Index] < 0)
						Timings[Index] = 1;
					IsEven = !IsEven;
				}
				else
				{
					if(DataKey > 1)
						Timings[Index] += DrawFftData[0] / 2;
					IsEven = !IsEven;
				}
			}//*/
		}
		else if(NotAudioData || !EnableVibrator)
		{
			if(Vibrator.Timings == null)
				Vibrator.Timings = new long[2];
			Vibrator.Timings[0] = 0;
			Vibrator.Timings[1] = 0;
		}
		
		CanvasWidth = Canvas.getWidth();
		CanvasHeight = Canvas.getHeight();
		
		int OriginCanvasWidth = CanvasWidth;
		int OriginCanvasHeight = CanvasHeight;
		
		UpdataCycleColor();
		
		//====== 解决因为导航栏的问题导致悬浮窗宽度或高度增加问题 ======
		//SetOrientation();
		if(ScreenWidth == CanvasWidth)
		{
			PositionOffset = ScreenHeight - CanvasHeight;
			Orientation = Orientation_Vertical;
		}
		else if(ScreenWidth == CanvasHeight)
		{
			PositionOffset = ScreenHeight - CanvasWidth;
			if(Orientation == -1)
				Orientation = Orientation_Horizontal;
			if(OrientationRotation >= 90 -20 && OrientationRotation <= 90 + 20)
				Orientation = Orientation_Right_Horizontal;
			else if(OrientationRotation >= 270 - 20 && OrientationRotation <= 270 + 20)
				Orientation = Orientation_Left_Horizontal;
		}
		
		if(Orientation == Orientation_Vertical)
		{
			if(OrientationRotation >= 180 - 20 && OrientationRotation <= 180 + 20)
				Orientation = Orientation_Vertical_Handstand;
		}
		/*else if(Orientation == Orientation_Horizontal)
		{
			if(OrientationRotation >= 90 -20 && OrientationRotation <= 90 + 20)
				Orientation = Orientation_Right_Horizontal;
			else if(OrientationRotation >= 270 - 20 && OrientationRotation <= 270 + 20)
				Orientation = Orientation_Left_Horizontal;
		}*/
		if(FullScreen)
		switch(Orientation)
		{
			case Orientation_Vertical:
				CanvasHeight += PositionOffset;
			break;
			case Orientation_Vertical_Handstand:
				CanvasHeight += PositionOffset;
			break;
			case Orientation_Horizontal:
				CanvasWidth += PositionOffset;
			break;
			case Orientation_Left_Horizontal:
				CanvasWidth += PositionOffset;
			break;
			case Orientation_Right_Horizontal:
				CanvasWidth += PositionOffset;
			break;
		}
		
		
		if(IsDrawSmear)
		{
			RaCanvas.setBitmap(Buffer);
			RaCanvas.drawRect(0, 0, BufferWidth, BufferHeight, pC);
			//RaCanvas.drawARGB(255, 0, 0, 0);
			panBg.setAlpha((int) (140 * Math.cos(DataKey)));
			pan.setAlpha(180);
			RaCanvas.drawBitmap(BackBufferT, 0, 0, pan);
			BackBufferCanvas.setBitmap(BackBufferT);
			BackBufferCanvas.drawRect(0, 0, BufferWidth, BufferHeight, pC);
			ForePaint.setAlpha(255);
			
			CenterX = BufferWidth >> 1;
			CenterY = BufferHeight >> 1;
			DrawCanvas = RaCanvas;
		}
		else
		{
			CenterX = CanvasWidth >> 1;
			CenterY = CanvasHeight >> 1;
			DrawCanvas = Canvas;
		}
		
		CanvasWidth = OriginCanvasWidth;
		CanvasHeight = OriginCanvasHeight;

		int BufferCenterX = CenterX;
		int BufferCenterY = CenterY;
		
		if(FullScreen)
			switch(Orientation)
			{
				case Orientation_Vertical:
					if(OriginCanvasHeight > ScreenHeight)
						CanvasHeight -= Math.abs(PositionOffset);
				break;
				case Orientation_Vertical_Handstand:
					if(OriginCanvasHeight > ScreenHeight)
						CanvasHeight += Math.abs(PositionOffset);
				break;
				case Orientation_Horizontal:
					if(OriginCanvasWidth > ScreenWidth)
						CanvasWidth -= Math.abs(PositionOffset);
				break;
				case Orientation_Left_Horizontal:
					if(OriginCanvasWidth > ScreenWidth)
						CanvasWidth -= Math.abs(PositionOffset);
				break;
				case Orientation_Right_Horizontal:
					if(OriginCanvasWidth > ScreenWidth)
					{
						CanvasWidth += Math.abs(PositionOffset);
						CenterX = CanvasWidth >> 1;
						CenterY = CanvasHeight >> 1;
					}
				break;
			}
		
		//======================
		
		//====== 防止数值被修改造成绘制错误 ======
		int TempByteAllCountFft = ByteAllCountFft;
		int TempByteAllCountWave = ByteAllCountWave;
		//======================
		
		//====== 绘制条形 Fft ======
		//====== 绘制一 ======
		//绘制三外不绘制条形
		if(DrawMode < 4 && DrawMode != 2)
		{
			float[] Lines = new float[TempByteAllCountFft << 2];
			float BarAngle = 0;
			int Position = 0;
			for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
			{
				float BarLine = DrawFftData[Bar];
				
				BarLine *= 2;
				Lines[Position] = (float)(CenterX + Math.cos(BarAngle) * DrawR);
				Lines[1 + Position] = (float)(CenterY - Math.sin(BarAngle) * DrawR);
				Lines[2 + Position] = (float)(CenterX + Math.cos(BarAngle) * (BarLine + DrawR));
				Lines[3 + Position] = (float)(CenterY - Math.sin(BarAngle) * (BarLine + DrawR));
				
				Position += 4;
				BarAngle += DeltaAngle;
			}
			if(IsCycleColor)
			{
				CycleColor(DrawCanvas, ForePaint);
				DrawCanvas.drawLines(Lines, ForePaint);
				ForePaint.setShader(null);
			}
			else
			{
				ForePaint.setShader(null);
				//ForePaint.setARGB(ViewAlpha, 255, 220, 175);
				SetThemeColor(ForePaint);
				DrawCanvas.drawLines(Lines, ForePaint);
			}
		}

		//====== 绘制动效 ======
		if(DrawMode != 0 && DrawR > 0)
		{
			Path.reset();
			float LastX = CenterX;
			float LastY = CenterY;
			float FirstX = 0;
			float FirstY = 0;
			
			int Position = 0;
			
			//======绘制二======
			if(DrawMode == 2)
			{
				
				/*float DeltaAngleWave = (float) (6.283185307179586d / TempByteAllCountWave);
				float BarWidth = (float) (6.283185307179586d / TempByteAllCountWave / 2);
				//float Offset = CirclePaint.getStrokeWidth() / 2 - 0.5f;
				float BarLine;
				float BarAngle;
				float R;
				float SLineX, SLineY;
				float[] UpLines = new float[TempByteAllCountWave << 2];
				for (int Bar = 0; Bar < TempByteAllCountWave; Bar ++)
				{
					BarLine = DrawWaveData[Bar];
					BarLine = ScreenWidth * (BarLine / 1080);
					BarAngle = (DeltaAngleWave * Bar) + BarWidth;
					R = CircleR + BarLine;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[Position] = SLineX;
					UpLines[1 + Position] = SLineY;

					BarLine = DrawWaveData[Bar + 1];
					BarLine = ScreenWidth * (BarLine / 1080);
					BarAngle = (DeltaAngleWave * (Bar + 1)) + BarWidth;
					R = CircleR + BarLine;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[2 + Position] = SLineX;
					UpLines[3 + Position] = SLineY;
					
					Position += 4;
				}
				int LastBar = TempByteAllCountWave - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				if(IsCycleColor)
					CycleColor(DrawCanvas, PathPaint);
				else
					PathPaint.setARGB(ViewAlpha, 255, 220, 175);
				DrawCanvas.drawLines(UpLines, PathPaint);
				PathPaint.setShader(null);//*/
				
				//====== 线 ======
				
				TempByteAllCountFft = 180;
				
				float[] DrawData = DrawFftData;
				
				PathPaint.setARGB(255, 255, 220, 175);
				int MaxHeight = (int) DrawR >> 1;
				float Time = 2f;
				float DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float BarWidth = DeltaAngleFft / 2;

				float BarLine;
				float BarAngle;
				float R;
				float PointX, PointY;
				
				float SLineX, SLineY;
				float ELineX, ELineY;

				Position = 0;
				float Angle = 0;

				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.004f));
				PathPaint.setStrokeCap(android.graphics.Paint.Cap.ROUND);
				
				Position = 0;
				float DrawRPoints = CircleR * 0.7f;
				float[] Points = new float[TempByteAllCountFft << 1];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					R = DrawRPoints - BarLine * Time;
					PointX = (float)(CenterX - Math.sin(BarAngle) * R);
					PointY = (float)(CenterY - Math.cos(BarAngle) * R);
					Points[Position] = PointX;
					Points[1 + Position] = PointY;

					Position += 2;
					Angle += DeltaAngleFft;
				}
				//极致色彩
				if(IsCycleColor)
				{
					CycleColor(DrawCanvas, PathPaint, ColorListFO, PositionList);
					DrawCanvas.drawPoints(Points, PathPaint);
					PathPaint.setShader(null);
				}
				else
				{
					PathPaint.setARGB(ViewAlpha, 255, 255, 220);
					DrawCanvas.drawPoints(Points, PathPaint);
				}
				
				//======上行======
				Position = 0;
				float[] UpLines = new float[TempByteAllCountFft << 2];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar ++)
				{
					BarLine = DrawData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * Bar) + BarWidth;
					R = CircleR + BarLine * Time;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					UpLines[Position] = SLineX;
					UpLines[1 + Position] = SLineY;

					BarLine = DrawData[Bar + 1];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * (Bar + 1)) + BarWidth;
					R = CircleR + BarLine * Time;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					UpLines[2 + Position] = SLineX;
					UpLines[3 + Position] = SLineY;

					Position += 4;
				}
				int LastBar = TempByteAllCountFft - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				
				CycleColor(DrawCanvas, PathPaint, ColorListFO, PositionList);
				DrawCanvas.drawLines(UpLines, PathPaint);
				PathPaint.setShader(null);
				
				//======下行======
				Position = 0;
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * Bar) + BarWidth;
					R = CircleR - BarLine * Time;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					UpLines[Position] = SLineX;
					UpLines[1 + Position] = SLineY;

					BarLine = DrawData[Bar + 1];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * (Bar + 1)) + BarWidth;
					R = CircleR - BarLine * Time;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					UpLines[2 + Position] = SLineX;
					UpLines[3 + Position] = SLineY;

					Position += 4;
				}
				LastBar = TempByteAllCountFft - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				
				CycleColor(DrawCanvas, PathPaint, ColorListFI, PositionList);
				DrawCanvas.drawLines(UpLines, PathPaint);
				PathPaint.setShader(null);
				
				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				
				
				Position = 0;
				BarAngle = 0;
				Angle = 0;
				float[] Lines = new float[TempByteAllCountFft << 2];

				BarLine = DrawData[0];
				
				if(BarLine > MaxHeight)
					BarLine /= 2;
				BarAngle = 0;
				R = CircleR - BarLine * Time;
				SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
				SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar ++)
				{
					BarLine = DrawData[Bar];
					/*if(BarLine >= DrawSimplifyFftData[Bar])
						BarLine = DrawSimplifyFftData[Bar];*/
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					if(Bar % 2 == 0)
					{
						R = CircleR + BarLine * Time;
						/*SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
						SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
						Lines[Position] = SLineX;
						Lines[1 + Position] = SLineY;*/
					}
					else
					{
						R = CircleR - BarLine * Time;
						/*SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
						SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
						Lines[Position] = SLineX;
						Lines[1 + Position] = SLineY;
						Position += 4;*/
					}
					ELineX = (float)(CenterX - Math.sin(BarAngle) * R);
					ELineY = (float)(CenterY - Math.cos(BarAngle) * R);
					Lines[Position] = SLineX;
					Lines[1 + Position] = SLineY;
					Lines[2 + Position] = ELineX;
					Lines[3 + Position] = ELineY;

					SLineX = ELineX;
					SLineY = ELineY;

					Position += 4;
					Angle += DeltaAngleFft;
				}
				LastBar = TempByteAllCountFft - 1;
				Lines[0] = Lines[2 + (LastBar << 2)];
				Lines[1] = Lines[3 + (LastBar << 2)];
				
				CycleColor(DrawCanvas, PathPaint, ColorListFO, PositionList);
				DrawCanvas.drawLines(Lines, PathPaint);
				PathPaint.setShader(null);
				
				PathPaint.setStrokeCap(android.graphics.Paint.Cap.BUTT);
				
				
				TempByteAllCountFft = ByteAllCountFft;
				
				boolean IsMax = false;
				
				UpLines = new float[TempByteAllCountFft << 2];
				Lines = new float[TempByteAllCountFft << 2];
				
				float DownBarLine = 0;
				
				DeltaAngleFft = (float) (6.283185307179586d / (TempByteAllCountFft / 3));
				BarWidth = DeltaAngleFft / 2;
				
				BarAngle = 0;
				Position = 0;
				float Rate = DrawRateAdd * 2;
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					if(!IsMax && Bar > TempByteAllCountFft / 3)
					{
						BarAngle += BarWidth;
						IsMax = true;
					}
					BarLine = DrawFftData[Bar];
					
					BarLine *= 1.5f;
					
					DownBarLine = BarLine * Rate;
					
					Lines[Position] = (float)(CenterX + Math.cos(BarAngle) * DrawR);
					Lines[1 + Position] = (float)(CenterY - Math.sin(BarAngle) * DrawR);
					Lines[2 + Position] = (float)(CenterX + Math.cos(BarAngle) * (DownBarLine + DrawR));
					Lines[3 + Position] = (float)(CenterY - Math.sin(BarAngle) * (DownBarLine + DrawR));
					
					UpLines[Position] = (float)(CenterX + Math.cos(BarAngle) * (DownBarLine + DrawR));
					UpLines[1 + Position] = (float)(CenterY - Math.sin(BarAngle) * (DownBarLine + DrawR));
					UpLines[2 + Position] = (float)(CenterX + Math.cos(BarAngle) * (BarLine + DrawR));
					UpLines[3 + Position] = (float)(CenterY - Math.sin(BarAngle) * (BarLine + DrawR));
					

					Position += 4;
					BarAngle += DeltaAngleFft;
				}
				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.007f));
				if(IsCycleColor)
				{
					CycleColor(DrawCanvas, PathPaint, ColorListT);
					PathPaint.setAlpha(200);
					DrawCanvas.drawLines(UpLines, PathPaint);
					
					CycleColor(DrawCanvas, PathPaint, ColorListTH);
					PathPaint.setAlpha(200);
					DrawCanvas.drawLines(Lines, PathPaint);
					PathPaint.setAlpha(ViewAlpha);
					PathPaint.setShader(null);
				}
				else
				{
					PathPaint.setShader(null);
					//PathPaint.setARGB(ViewAlpha, 255, 220, 175);
					SetThemeColor(PathPaint);
					DrawCanvas.drawLines(UpLines, PathPaint);
					DrawCanvas.drawLines(Lines, PathPaint);
				}
				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				
				
			}

			//======绘制三======
			if(DrawMode == 3)
			{
				Position = 0;
				float Time = 1.2f;
				TempByteAllCountFft = 86;
				float DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float BarWidth = DeltaAngleFft / 2;
				float BarLine;
				float BarAngle;
				float R;
				float SmoothLineR;
				float Rate;
				float SLineX, SLineY;
				float BarLineX, BarLineY;
				float ELineX, ELineY;
				float PointX, PointY;
				float[] UpLines = new float[TempByteAllCountFft << 3];
				float[] DownLines = new float[TempByteAllCountFft << 3];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					BarAngle = DeltaAngleFft * Bar;
					R = CircleR;
					SmoothLineR = CircleR;
					Rate = (BarLine - DrawFftData[Bar + 1]) * 3;
					SmoothLineR += Rate;
					R += BarLine * Time - Rate;
					
					BarLineX = (float)(CenterX + Math.cos(BarAngle + BarWidth) * R);
					BarLineY = (float)(CenterY - Math.sin(BarAngle + BarWidth) * R);
					ELineX = (float)(CenterX + Math.cos(BarWidth * 2 + BarAngle) * SmoothLineR);
					ELineY = (float)(CenterY - Math.sin(BarWidth * 2 + BarAngle) * SmoothLineR);
					if(Bar == 0)
					{
						SLineX = (float)(CenterX + Math.cos(BarAngle) * CircleR);
						SLineY = (float)(CenterY - Math.sin(BarAngle) * CircleR);
						FirstX = SLineX;
						FirstY = SLineY;
						//上行
						UpLines[Position] = SLineX;
						UpLines[1 + Position] = SLineY;
						UpLines[2 + Position] = BarLineX;
						UpLines[3 + Position] = BarLineY;
						UpLines[4 + Position] = BarLineX;
						UpLines[5 + Position] = BarLineY;
						UpLines[6 + Position] = ELineX;
						UpLines[7 + Position] = ELineY;
						R = CircleR + BarLine * Time - Rate;
						BarLineX = (float)(CenterX + Math.cos(BarAngle + BarWidth) * R);
						BarLineY = (float)(CenterY - Math.sin(BarAngle + BarWidth) * R);
						DownLines[Position] = SLineX;
						DownLines[1 + Position] = SLineY;
						DownLines[2 + Position] = BarLineX;
						DownLines[3 + Position] = BarLineY;
						DownLines[4 + Position] = BarLineX;
						DownLines[5 + Position] = BarLineY;
						DownLines[6 + Position] = ELineX;
						DownLines[7 + Position] = ELineY;
					}
					else if(Bar != TempByteAllCountFft - 1)
					{
						//上行
						UpLines[Position] = LastX;
						UpLines[1 + Position] = LastY;
						UpLines[2 + Position] = BarLineX;
						UpLines[3 + Position] = BarLineY;
						UpLines[4 + Position] = BarLineX;
						UpLines[5 + Position] = BarLineY;
						UpLines[6 + Position] = ELineX;
						UpLines[7 + Position] = ELineY;
						//下行
						R = CircleR - BarLine * Time - Rate;
						BarLineX = (float)(CenterX + Math.cos(BarAngle + BarWidth) * R);
						BarLineY = (float)(CenterY - Math.sin(BarAngle + BarWidth) * R);
						DownLines[Position] = LastX;
						DownLines[1 + Position] = LastY;
						DownLines[2 + Position] = BarLineX;
						DownLines[3 + Position] = BarLineY;
						DownLines[4 + Position] = BarLineX;
						DownLines[5 + Position] = BarLineY;
						DownLines[6 + Position] = ELineX;
						DownLines[7 + Position] = ELineY;
					}
					if(Bar == TempByteAllCountFft - 1)
					{
						//上行
						UpLines[Position] = LastX;
						UpLines[1 + Position] = LastY;
						UpLines[2 + Position] = BarLineX;
						UpLines[3 + Position] = BarLineY;
						UpLines[4 + Position] = BarLineX;
						UpLines[5 + Position] = BarLineY;
						UpLines[6 + Position] = FirstX;
						UpLines[7 + Position] = FirstY;
						//下行
						R = CircleR - BarLine * Time - Rate;
						BarLineX = (float)(CenterX + Math.cos(BarAngle + BarWidth) * R);
						BarLineY = (float)(CenterY - Math.sin(BarAngle + BarWidth) * R);
						DownLines[Position] = LastX;
						DownLines[1 + Position] = LastY;
						DownLines[2 + Position] = BarLineX;
						DownLines[3 + Position] = BarLineY;
						DownLines[4 + Position] = BarLineX;
						DownLines[5 + Position] = BarLineY;
						DownLines[6 + Position] = FirstX;
						DownLines[7 + Position] = FirstY;
					}
					//点
					/*R = Math.abs(BarLine * Time - (CircleR * 0.7f) - Rate);
					PointX = (float)(CenterX + Math.cos(BarAngle + BarWidth) * R);
					PointY = (float)(CenterY - Math.sin(BarAngle + BarWidth) * R);
					Points[Bar << 1] = PointX;
					Points[1 + (Bar << 1)] = PointY;*/
					LastX = ELineX;
					LastY = ELineY;
					
					Position += 8;
				}
				
				
				Position = 0;
				TempByteAllCountFft = 260;
				float[] Points = new float[TempByteAllCountFft << 1];
				DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float TempR = CircleR * 0.7f;
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					BarAngle = DeltaAngleFft * Bar;
					//点
					R = TempR - BarLine * Time;
					PointX = (float)(CenterX + Math.cos(BarAngle) * R);
					PointY = (float)(CenterY - Math.sin(BarAngle) * R);
					Points[Position] = PointX;
					Points[1 + Position] = PointY;
					
					Position += 2;
				}
				
				//极致色彩
				if(IsCycleColor)
					CycleColor(DrawCanvas, PathPaint);
				else
					PathPaint.setARGB(ViewAlpha, 255, 220, 175);
				DrawCanvas.drawLines(UpLines, PathPaint);
				DrawCanvas.drawLines(DownLines, PathPaint);
				DrawCanvas.drawPoints(Points, PathPaint);
				PathPaint.setShader(null);
				
				/*for (int Bar = 0; Bar < TempByteAllCountFft; Bar ++)
				{
					BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					BarAngle = (DeltaAngleFft * Bar) + BarWidth;
					R = Math.abs(BarLine + CircleR);
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[Bar << 2] = SLineX;
					UpLines[1 + (Bar << 2)] = SLineY;

					BarLine = DrawFftData[Bar + 1];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawWaveData[0];
					
					BarAngle = (DeltaAngleFft * (Bar + 1)) + BarWidth;
					R = Math.abs(BarLine + CircleR);
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[2 + (Bar << 2)] = SLineX;
					UpLines[3 + (Bar << 2)] = SLineY;
				}
				int LastBar = TempByteAllCountFft - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				if(IsCycleColorForWave)
					CycleColor(DrawCanvas, PathPaint);
				else
					PathPaint.setARGB(ViewAlpha, 255, 220, 175);
				DrawCanvas.drawLines(UpLines, PathPaint);
				PathPaint.setShader(null);*/
			}

			//======绘制四======
			if(DrawMode == 4)
			{
				
				PathPaint.setARGB(255, 255, 220, 175);
				int MaxHeight = (int) DrawR >> 1;
				float Time = 1.2f;
				float DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float BarWidth = DeltaAngleFft / 2;
				float DrawRPoints = DrawR * 0.7f;
				
				float BarLine;
				float BarAngle = 0;
				float Angle = 0;
				float R;
				float PointX, PointY;
				
				//======点======
				Position = 0;
				float[] Points = new float[TempByteAllCountFft << 1];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawFftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					R = DrawRPoints - BarLine * Time;
					PointX = (float)(CenterX + Math.cos(BarAngle) * R);
					PointY = (float)(CenterY - Math.sin(BarAngle) * R);
					Points[Position] = PointX;
					Points[1 + Position] = PointY;
					
					Position += 2;
					Angle += DeltaAngleFft;
				}
				//极致色彩
				if(IsCycleColor)
				{
					CycleColor(DrawCanvas, PathPaint);
					DrawCanvas.drawPoints(Points, PathPaint);
					PathPaint.setShader(null);
				}
				else
				{
					PathPaint.setARGB(ViewAlpha, 255, 255, 220);
					DrawCanvas.drawPoints(Points, PathPaint);
				}

				PathPaint.setARGB(ViewAlpha, 255, 255, 255);
				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.001f));
				
				float SLineX, SLineY;
				float ELineX, ELineY;
				
				//======线条======
				Position = 0;
				BarAngle = 0;
				Angle = 0;
				float[] Lines = new float[TempByteAllCountFft << 2];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawFftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					R = DrawR + BarLine * Time;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					R = DrawR - BarLine * Time;
					ELineX = (float)(CenterX + Math.cos(BarAngle) * R);
					ELineY = (float)(CenterY - Math.sin(BarAngle) * R);
					Lines[Position] = SLineX;
					Lines[1 + Position] = SLineY;
					Lines[2 + Position] = ELineX;
					Lines[3 + Position] = ELineY;
					
					Position += 4;
					Angle += DeltaAngleFft;
				}
				DrawCanvas.drawLines(Lines, PathPaint);

				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				
				//PathPaint.setStrokeCap(android.graphics.Paint.Cap.SQUARE);
				//======上行======
				Position = 0;
				float[] UpLines = new float[TempByteAllCountFft << 2];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar ++)
				{
					BarLine = DrawFftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * Bar) + BarWidth;
					R = DrawR + BarLine * Time;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[Position] = SLineX;
					UpLines[1 + Position] = SLineY;
					
					BarLine = DrawFftData[Bar + 1];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * (Bar + 1)) + BarWidth;
					R = DrawR + BarLine * Time;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[2 + Position] = SLineX;
					UpLines[3 + Position] = SLineY;
					
					Position += 4;
				}
				int LastBar = TempByteAllCountFft - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				DrawCanvas.drawLines(UpLines, PathPaint);
				
				//======下行======
				Position = 0;
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					BarLine = DrawFftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * Bar) + BarWidth;
					R = DrawR - BarLine * Time;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[Position] = SLineX;
					UpLines[1 + Position] = SLineY;
					
					BarLine = DrawFftData[Bar + 1];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = (DeltaAngleFft * (Bar + 1)) + BarWidth;
					R = DrawR - BarLine * Time;
					SLineX = (float)(CenterX + Math.cos(BarAngle) * R);
					SLineY = (float)(CenterY - Math.sin(BarAngle) * R);
					UpLines[2 + Position] = SLineX;
					UpLines[3 + Position] = SLineY;
					
					Position += 4;
				}
				LastBar = TempByteAllCountFft - 1;
				UpLines[LastBar << 2] = UpLines[LastBar << 2];
				UpLines[1 + (LastBar << 2)] = UpLines[1 + (LastBar << 2)];
				UpLines[2 + (LastBar << 2)] = UpLines[0];
				UpLines[3 + (LastBar << 2)] = UpLines[1];
				DrawCanvas.drawLines(UpLines, PathPaint);
				
				//PathPaint.setStrokeCap(android.graphics.Paint.Cap.BUTT);
			}

			//======绘制五======
			if(DrawMode == 5)
			{
				
				float MaxHeight = (int) DrawR >> 1;
				float Time = 1.2f;
				float BarWidth = (float) (6.283185307179586d / TempByteAllCountFft / 2);
				float DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float DrawRFft = DrawR * 0.7f;
				//======点======
				Position = 0;
				float BarAngle = 0;
				float Angle = 0;
				if(!IsCycleColor)
					PointPaint.setShader(null);
				if(IsCycleColor && PointPaint.getShader() == null)
						CycleColor(DrawCanvas, PointPaint);
				float[] Points = new float[ByteAllCountFft << 2];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					float BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountWave)
						BarLine = DrawFftData[0];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					float R = DrawRFft - BarLine * Time;
					float PointX = (float)(CenterX - Math.sin(BarAngle) * R);
					float PointY = (float)(CenterY - Math.cos(BarAngle) * R);
					Points[Position] = PointX;
					Points[1 + Position] = PointY;
					
					Position += 2;
					Angle += DeltaAngleFft;
				}
				//极致色彩
				if(IsCycleColor)
				{
					CycleColor(DrawCanvas, PathPaint);
					DrawCanvas.drawPoints(Points, PathPaint);
					PathPaint.setShader(null);
				}
				else
				{
					PathPaint.setARGB(ViewAlpha, 255, 255, 220);
					DrawCanvas.drawPoints(Points, PathPaint);
				}
				

				PathPaint.setARGB(ViewAlpha, 255, 255, 255);
				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.001f));
				//======线条======
				Position = 0;
				BarAngle = 0;
				Angle = 0;
				float[] Lines = new float[TempByteAllCountFft << 2];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					float BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					float R = DrawR + BarLine * Time;
					float SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					float SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					R = DrawR - BarLine * Time;
					float ELineX = (float)(CenterX - Math.sin(BarAngle) * R);
					float ELineY = (float)(CenterY - Math.cos(BarAngle) * R);
					Lines[Bar << 2] = SLineX;
					Lines[1 + (Bar << 2)] = SLineY;
					Lines[2 + (Bar << 2)] = ELineX;
					Lines[3 + (Bar << 2)] = ELineY;
					
					Position += 4;
					Angle += DeltaAngleFft;
				}
				DrawCanvas.drawLines(Lines, PathPaint);

				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				//======上行======
				BarAngle = 0;
				Angle = 0;
				for (int Bar = 0; Bar <= TempByteAllCountFft; Bar++)
				{
					float BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					float R = DrawR + BarLine * Time;
					float SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					float SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 0)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					if(Bar == TempByteAllCountFft)
					{
						Path.lineTo(FirstX, FirstY);
						/*DrawCanvas.drawPath(Path, PathPaint);
						Path.reset();*/
					}
					
					Angle += DeltaAngleFft;
				}
				//======下行======
				BarAngle = 0;
				Angle = 0;
				for (int Bar = 0; Bar <= TempByteAllCountFft; Bar++)
				{
					float BarLine = DrawFftData[Bar];
					if(Bar == TempByteAllCountFft)
						BarLine = DrawFftData[0];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					float R = DrawR - BarLine * Time;
					float SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					float SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 0)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					if(Bar == TempByteAllCountFft)
					{
						Path.lineTo(FirstX, FirstY);
						DrawCanvas.drawPath(Path, PathPaint);
						Path.reset();
					}
					
					Angle += DeltaAngleFft;
				}
			}
			
			//====== 绘制六 ======
			if(DrawMode == 6)
			{
				PathPaint.setARGB(255, 255, 220, 175);
				int MaxHeight = (int) DrawR >> 1;
				float Time = 1.2f;
				float DeltaAngleFft = (float) (6.283185307179586d / TempByteAllCountFft);
				float BarWidth = DeltaAngleFft / 2;
				
				float BarLine;
				float BarAngle;
				float R;
				float PointX, PointY;
				
				Position = 0;
				float Angle = 0;
				
				float DefaultStrokeWidth = PathPaint.getStrokeWidth();
				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.004f));
				PathPaint.setStrokeCap(android.graphics.Paint.Cap.ROUND);

				//======点======
				float[] Points = new float[TempByteAllCountFft << 1];
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar++)
				{
					if(Bar % 2 != 0)
						continue;
					BarLine = DrawFftData[Bar];
					if(BarLine > FftData[Bar])
						BarLine = FftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					R = DrawR + BarLine * Time;
					PointX = (float)(CenterX - Math.sin(BarAngle) * R);
					PointY = (float)(CenterY - Math.cos(BarAngle) * R);
					Points[Position] = PointX;
					Points[1 + Position] = PointY;
					
					Position += 2;
					Angle += DeltaAngleFft;
				}
				//极致色彩
				/*if(IsCycleColor)
				{
					CycleColor(DrawCanvas, PathPaint);
					DrawCanvas.drawPoints(Points, PathPaint);
					PathPaint.setShader(null);
				}
				else
				{*/
					PathPaint.setARGB(ViewAlpha, 255, 255, 255);
					DrawCanvas.drawPoints(Points, PathPaint);
				//}

				PathPaint.setARGB(ViewAlpha, 255, 255, 255);
				
				float SLineX, SLineY;
				float ELineX, ELineY;

				
				//====== 线 ======
				Position = 0;
				BarAngle = 0;
				Angle = 0;
				float[] Lines = new float[TempByteAllCountFft << 2];
				
				R = Math.abs(DrawR);
				SLineX = (float)(CenterX - Math.sin(0) * R);
				SLineY = (float)(CenterY - Math.cos(0) * R);
				for (int Bar = 0; Bar < TempByteAllCountFft; Bar ++)
				{
					BarLine = DrawFftData[Bar];
					if(BarLine > FftData[Bar])
						BarLine = FftData[Bar];
					
					if(BarLine > MaxHeight)
						BarLine /= 2;
					BarAngle = Angle + BarWidth;
					if(Bar % 2 == 0)
						R = DrawR - BarLine * Time;
					else
						R = DrawR + BarLine * Time;
					ELineX = (float)(CenterX - Math.sin(BarAngle) * R);
					ELineY = (float)(CenterY - Math.cos(BarAngle) * R);
					Lines[Position] = SLineX;
					Lines[1 + Position] = SLineY;
					Lines[2 + Position] = ELineX;
					Lines[3 + Position] = ELineY;
					
					SLineX = ELineX;
					SLineY = ELineY;
					
					Position += 4;
					Angle += DeltaAngleFft;
				}
				int LastBar = TempByteAllCountFft - 1;
				Lines[LastBar << 2] = Lines[LastBar << 2];
				Lines[1 + (LastBar << 2)] = Lines[1 + (LastBar << 2)];
				Lines[2 + (LastBar << 2)] = Lines[0];
				Lines[3 + (LastBar << 2)] = Lines[1];
				DrawCanvas.drawLines(Lines, PathPaint);
				
				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				PathPaint.setStrokeCap(android.graphics.Paint.Cap.BUTT);
			}
			
			
			//====== 绘制七 ======
			if(DrawMode == 7)
			{
				if(DrawWaveData == null || DrawSecondaryWaveShapeFftData == null)
					return;
				SetThemeColor(PathPaint);
				//int MaxHeight = (int) DrawR >> 1;
				//float Time = 2; // 优化，减少计算

				float BarLine;
				float BarAngle = 0;
				float R;
				float BaseR = DrawFftOneR;
				float SLineX, SLineY;
				//float ELineX = 0, ELineY = 0;
				
				//float[] Lines = new float[360 << 2];
				float Angle = (float) (Math.PI * 2) / 360;
				/*float OffsetY = CenterY / 2;
				for(int Index = 0; Index < 360; Index++)
				{
					Lines[Index << 2] = 0;
					Lines[1 + (Index << 2)] = OffsetY + Index * 5;
					Lines[2 + (Index << 2)] = DrawWaveShapeFftData[Index] * 1;
					Lines[3 + (Index << 2)] = OffsetY + Index * 5;
				}
				Canvas.drawLines(Lines, PathPaint);*/
				
				BaseR = BaseR * 1.1f;
				//for (int Bar = 720; Bar < DrawSecondaryWaveShapeFftData.length; Bar++)
				for (int Bar = 720; Bar < DrawSecondaryWaveShapeFftData.length; Bar++)
				{
					BarLine = DrawSecondaryWaveShapeFftData[Bar];
					if(Bar == DrawSecondaryWaveShapeFftData.length)
						BarLine = DrawSecondaryWaveShapeFftData[0];
					
					
					R = BarLine + BaseR;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 720)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					
					BarAngle += Angle;
				}
				Path.lineTo(FirstX, FirstY);
				//PathPaint.setStyle(android.graphics.Paint.Style.FILL);
				PathPaint.setARGB(ViewAlpha, 255, 255, 230);
				PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.004f));
				Canvas.drawPath(Path, PathPaint);
				Path.reset();
				PathPaint.setStrokeWidth(DefaultStrokeWidth);
				//PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
				
				BaseR = BaseR * 0.9f;
				//======  ======
				BarAngle = 0;
				for (int Bar = 0; Bar < 360; Bar++)
				{
					BarLine = DrawSecondaryWaveShapeFftData[Bar];
					if(Bar == 360)
						BarLine = DrawWaveShapeFftData[0];
					
					
					R = BarLine + BaseR;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 0)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					
					BarAngle += Angle;
				}
				Path.lineTo(FirstX, FirstY);
				PathPaint.setStyle(android.graphics.Paint.Style.FILL);
				PathPaint.setARGB(ViewAlpha, 255, 255, 230);
				Canvas.drawPath(Path, PathPaint);
				Path.reset();
				
				BarAngle = 0;
				for (int Bar = 360; Bar < 720; Bar++)
				{
					BarLine = DrawSecondaryWaveShapeFftData[Bar];
					if(Bar == 720)
						BarLine = DrawWaveShapeFftData[360];
					
					
					R = BarLine + BaseR;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 360)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					
					BarAngle += Angle;
				}
				Path.lineTo(FirstX, FirstY);
				PathPaint.setStyle(android.graphics.Paint.Style.FILL);
				PathPaint.setARGB(ViewAlpha, 10, 255, 220);
				Canvas.drawPath(Path, PathPaint);
				Path.reset();
				
				BarAngle = 0;
				for (int Bar = 720; Bar < DrawSecondaryWaveShapeFftData.length; Bar++)
				{
					BarLine = DrawSecondaryWaveShapeFftData[Bar];
					if(Bar == DrawSecondaryWaveShapeFftData.length)
						BarLine = DrawWaveShapeFftData[720];
					
					
					R = BarLine + BaseR;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 720)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					
					BarAngle += Angle;
				}
				Path.lineTo(FirstX, FirstY);
				PathPaint.setStyle(android.graphics.Paint.Style.FILL);
				PathPaint.setARGB(ViewAlpha, 255, 40, 40);
				Canvas.drawPath(Path, PathPaint);
				Path.reset();
				
				//======  ======
				
				
				SetThemeColor(PathPaint);
				BarAngle = 0;
				for (int Bar = 0; Bar < DrawWaveShapeFftData.length; Bar++)
				{
					BarLine = DrawWaveShapeFftData[Bar];
					if(Bar == DrawWaveShapeFftData.length)
						BarLine = DrawWaveShapeFftData[0];
					
					
					R = BarLine + BaseR;
					SLineX = (float)(CenterX - Math.sin(BarAngle) * R);
					SLineY = (float)(CenterY - Math.cos(BarAngle) * R);
					if(Bar == 0)
					{
						FirstX = SLineX;
						FirstY = SLineY;
						Path.moveTo(SLineX, SLineY);
					}
					else
						Path.lineTo(SLineX, SLineY);
					
					BarAngle += Angle;
				}
				Path.lineTo(FirstX, FirstY);
				PathPaint.setStyle(android.graphics.Paint.Style.FILL);
				Canvas.drawPath(Path, PathPaint);
				Path.reset();
				PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
				Canvas.drawCircle(CenterX, CenterY, BaseR * 0.97f, ScreenOutPaint);
				
				
				
				
			}
		}
		/*DrawCanvas.drawLine(CenterX - 2, CenterY - DrawFftData[0], CenterX - 2, CenterY + DrawFftData[0], PathPaint);
		DrawCanvas.drawLine(CenterX + 2, CenterY - MaxAudioData, CenterX + 2, CenterY + MaxAudioData, PathPaint);
		*/
		if(DrawMode == 8)
		{
			float[] DrawData = DrawFftData;
			int DrawDataLength = DrawData.length;// / 2;

			/*float[] BarsHeightRatio = new float[]{0.5f, 1f, 1.5f};
			
			int BarsHeightRatioIndex = 0;
			int BarIndexOffset = 0;*/
			
			float MaxBarsHeight = 1.0f;
			float BaseBarHeight = DrawData[0] / 2;

			float BarWidth = getSizeFromScreenRatio(0.005f);
			// 隐藏线条间隔
			float PaintStrokeWidth = BarWidth + BarWidth * 0.08f;
			float BarHeight = 0;
			float BarSpace = getSizeFromScreenRatio(0.002f);
			float BarBackgroundSpace = BarSpace * 1.5f;
			if(NotAudioData)
			{
				BarSpace = DrawData[0];
				BarBackgroundSpace = DrawData[0];
			}
			float MaxAngle = (float) (6.283185307179586d / 4);
			float AddAngle = MaxAngle / (DrawR / BarWidth);
			float Angle = 0;

			float PositionOffset = BarWidth;

			float StartX = 0, StartY = 0, EndX = 0, EndY = 0;

			float Time = 5;
			float BarPoaitionOffsetX = CenterX;
			final int IndexSpace = 3;

			float[] Lines = new float[(int) (CanvasWidth / BarWidth) << 2];

			PathPaint.setStrokeWidth(PaintStrokeWidth + BarSpace);
			ColorLinearLevel(DrawCanvas, PathPaint);
			PathPaint.setAlpha(ViewAlpha);

			boolean IsEven = false;
			/* * *
			 * * * 背景层
			 * * */
			//====== 左半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX < 0)
					break;
				BarHeight = (BaseBarHeight * (float) Math.cos(Angle) + DrawData[Index]) * Time;
				if(MaxAngle > Angle + AddAngle)
					Angle += AddAngle;
				StartX = BarPoaitionOffsetX;
				StartY = CenterY - (BarHeight + BarBackgroundSpace);
				EndX = BarPoaitionOffsetX;
				EndY = CenterY + (BarHeight + BarBackgroundSpace);
				Lines[LinesIndex] = StartX;
				Lines[LinesIndex + 1] = StartY;
				Lines[LinesIndex + 2] = EndX;
				Lines[LinesIndex + 3] = EndY;
				//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
				BarPoaitionOffsetX -= PositionOffset;
				LinesIndex += 4;
				Index++;
				/*if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < 3; BarsHeightRatioIndex ++)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarsHeightRatioIndex]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight + BarBackgroundSpace);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarIndexOffset]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight + BarBackgroundSpace);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}*/
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			Angle = 0;
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			//====== 右半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX > CanvasWidth)
					break;
				BarHeight = (BaseBarHeight * (float) Math.cos(Angle) + DrawData[Index]) * Time;
				if(MaxAngle > Angle + AddAngle)
					Angle += AddAngle;
				StartX = BarPoaitionOffsetX;
				StartY = CenterY - (BarHeight + BarBackgroundSpace);
				EndX = BarPoaitionOffsetX;
				EndY = CenterY + (BarHeight + BarBackgroundSpace);
				Lines[LinesIndex] = StartX;
				Lines[LinesIndex + 1] = StartY;
				Lines[LinesIndex + 2] = EndX;
				Lines[LinesIndex + 3] = EndY;
				//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
				BarPoaitionOffsetX += PositionOffset;
				LinesIndex += 4;
				Index++;
				/*if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < 3; BarsHeightRatioIndex ++)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarsHeightRatioIndex]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight + BarBackgroundSpace);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarIndexOffset]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight + BarBackgroundSpace);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}*/
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			Angle = 0;
			PathPaint.setStrokeWidth(PaintStrokeWidth);
			PathPaint.setShader(null);
			PathPaint.setARGB(ViewAlpha, 0, 0, 0);
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			/* * *
			 * * * 
			 * * */
			//====== 左半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX < 0)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				BarHeight = (BaseBarHeight * (float) Math.cos(Angle) + DrawData[Index]) * Time;
				if(MaxAngle > Angle + AddAngle)
					Angle += AddAngle;
				StartX = BarPoaitionOffsetX;
				StartY = CenterY - (BarHeight);
				EndX = BarPoaitionOffsetX;
				EndY = CenterY + (BarHeight);
				Lines[LinesIndex] = StartX;
				Lines[LinesIndex + 1] = StartY;
				Lines[LinesIndex + 2] = EndX;
				Lines[LinesIndex + 3] = EndY;
				//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
				BarPoaitionOffsetX -= PositionOffset;
				LinesIndex += 4;
				Index++;
				/*if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < 3; BarsHeightRatioIndex ++)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarsHeightRatioIndex]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarIndexOffset]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}*/
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			Angle = 0;
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			//====== 右半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX > CanvasWidth)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				BarHeight = (BaseBarHeight * (float) Math.cos(Angle) + DrawData[Index]) * Time;
				if(MaxAngle > Angle + AddAngle)
					Angle += AddAngle;
				StartX = BarPoaitionOffsetX;
				StartY = CenterY - (BarHeight);
				EndX = BarPoaitionOffsetX;
				EndY = CenterY + (BarHeight);
				Lines[LinesIndex] = StartX;
				Lines[LinesIndex + 1] = StartY;
				Lines[LinesIndex + 2] = EndX;
				Lines[LinesIndex + 3] = EndY;
				//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
				BarPoaitionOffsetX += PositionOffset;
				LinesIndex += 4;
				Index++;
				/*if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < 3; BarsHeightRatioIndex ++)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarsHeightRatioIndex]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = (BaseBarHeight + DrawData[Index + BarIndexOffset]) * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CenterY - (BarHeight);
						EndX = BarPoaitionOffsetX;
						EndY = CenterY + (BarHeight);
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}*/
			}
			DrawCanvas.drawLines(Lines, PathPaint);

			Time = 1.5f;
			float DeltaAngle = (float) (6.283185307179586d / 60);
			BarWidth = DeltaAngle / 2;

			float BarLine;
			float BarAngle = 0;
			Angle = 0;
			float R;
			float BaseR = BaseBarHeight * 5;
			float SLineX, SLineY;
			float ELineX, ELineY;
			int Position = 0;
			BarAngle = 0;
			Angle = 0;
			PathPaint.setStrokeWidth(getSizeFromScreenRatio(0.006f));
			Lines = new float[60 << 2];
			
			Position = 0;
			Angle = 0;
			Lines = new float[60 << 2];
			for (int Bar = 0, Index = 0; Index < 60; Index++, Bar++)
			{
				if(Bar >= 10)
					Bar = 0;
				BarLine = DrawFftData[Bar] * Time;

				if(BarLine > BaseR)
					BarLine = BaseR;
				BarAngle = Angle + BarWidth;
				R = 0 + BarLine;
				SLineX = (float)(CenterX + Math.sin(BarAngle) * R);
				SLineY = (float)(CenterY + Math.cos(BarAngle) * R);
				R = 0 - BarLine;
				ELineX = (float)(CenterX + Math.sin(BarAngle) * R);
				ELineY = (float)(CenterY + Math.cos(BarAngle) * R);
				Lines[Position] = SLineX;
				Lines[1 + Position] = SLineY;
				Lines[2 + Position] = ELineX;
				Lines[3 + Position] = ELineY;

				Position += 4;
				Angle += DeltaAngle;
			}
			ColorLinearLevel(DrawCanvas, PathPaint);
			PathPaint.setAlpha(ViewAlpha);
			DrawCanvas.drawLines(Lines, PathPaint);

			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);
			PathPaint.setShader(null);
			PathPaint.setStrokeWidth(DefaultStrokeWidth);
		}
		
		
		//====== 副绘制 ======
		
		
		
		if(SecondaryDrawMode[1])
		{
			PathPaint.setAlpha(ViewAlpha);
			float[] TempDrawSimplifyCentralizedFftData = new float[DrawSimplifyCentralizedFftData.length];
			boolean Orientation = true;
			int PositionL = TempDrawSimplifyCentralizedFftData.length >> 1;
			int PositionR = TempDrawSimplifyCentralizedFftData.length >> 1;
			TempDrawSimplifyCentralizedFftData[TempDrawSimplifyCentralizedFftData.length >> 1] = DrawSimplifyCentralizedFftData[0];

			for(int Index = 1; Index < TempDrawSimplifyCentralizedFftData.length; Index++)
			{
				if(Orientation)
				{
					PositionL--;
					if(PositionL < 0)
						PositionL = 0;
					TempDrawSimplifyCentralizedFftData[PositionL] = DrawSimplifyCentralizedFftData[Index];
					Orientation = false;
				}
				else
				{
					PositionR++;
					if(PositionR > TempDrawSimplifyCentralizedFftData.length - 1)
						PositionR = TempDrawSimplifyCentralizedFftData.length - 1;
					TempDrawSimplifyCentralizedFftData[PositionR] = DrawSimplifyCentralizedFftData[Index];
					Orientation = true;
				}
			}

			
			int BottomY = CanvasHeight;
			float BarWidth = getSizeFromScreenRatio(0.1005f);
			float BarHeight = getSizeFromScreenRatio(0.009f);
			float BarSpace = getSizeFromScreenRatio(0.009f);
			//float BarR = getSizeFromScreenRatio(0.009f);
			float BarOffsetY;
			int BarLineCount = 0;
			float BarLine;
			float BarLineWidthSpace;
			//float BarLineHeight;
			float OffsetX = -((TempDrawSimplifyCentralizedFftData.length >> 1) * (BarWidth + BarSpace) + (BarWidth / 2)) + CenterX;
			android.graphics.RectF BarRect = new android.graphics.RectF();
			CycleColorLinearLevel(Canvas, PathPaint);
			//Canvas.drawRect(0, CanvasHeight - 100, CanvasWidth, CanvasHeight - 90, PathPaint);

			PathPaint.setStyle(android.graphics.Paint.Style.FILL);
			for(int Bar = 0; Bar < 260; Bar++)
			{
				PathPaint.setAlpha(160);
				BarLine = TempDrawSimplifyCentralizedFftData[Bar];
				BarLine *= 8;
				BarLineCount = (int) (BarLine / (BarHeight + BarSpace));
				//BarLineHeight = 0;
				BarLineWidthSpace = OffsetX + (BarWidth + BarSpace) * Bar;
				for(int Index = 0; Index <= BarLineCount; Index++)
				{
					BarOffsetY = Index * (BarHeight + BarSpace);
					/*if(Index == BarLineCount - 1)
					 BarLineHeight = (BarOffsetY / (BarLine + (BarSpace * Index)) * BarHeight) - BarHeight;*/
					BarRect.left = BarLineWidthSpace;
					BarRect.top = BottomY - (BarOffsetY + BarSpace);// - BarLineHeight;
					BarRect.right = BarLineWidthSpace + BarWidth;
					BarRect.bottom = BottomY - BarOffsetY;
					
					//if(BarLineCount != 2)
					if(Index == BarLineCount - 5)
						PathPaint.setAlpha(156);
					else if(Index == BarLineCount - 4)
						PathPaint.setAlpha(130);
					else if(Index == BarLineCount - 3)
						PathPaint.setAlpha(104);
					else if(Index == BarLineCount - 2)
						PathPaint.setAlpha(78);
					else if(Index == BarLineCount - 1)
					{
						BarRect.top = BottomY - (BarOffsetY - BarSpace) - Math.abs(BarLine - BarOffsetY);
						BarRect.bottom = BottomY - (BarOffsetY - BarSpace);
						PathPaint.setAlpha(52);
					}
					else if(Index == BarLineCount)
					{
						BarRect.top = BottomY - (BarOffsetY) - Math.abs(BarLine - BarOffsetY);
						PathPaint.setAlpha(26);//(int) (255 * ( 1f - (BarOffsetY / (BarLine + (BarSpace * Index))))));
					}
					
					Canvas.drawRect(BarRect, PathPaint);
					//Canvas.drawRoundRect(BarRect, BarR, BarR, PathPaint);

				}

				/*android.graphics.RectF Rect = 
				 new android.graphics.RectF(
				 BarWidth * Bar, BottomY - (BarLine * 2f), BarWidth * Bar + BarWidth, BottomY
				 );
				 Canvas.drawRoundRect(Rect, 10, 10, PathPaint);*/
			}
			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);
			PathPaint.setShader(null);
		}


		if(SecondaryDrawMode[2])
		{
			float[] DrawData = DrawFftData;
			int DrawDataLength = DrawData.length;// / 2;
			
			float[] BarsHeightRatio = new float[]{0.5f, 1, 1.5f};
			int BarsHeightRatioIndex = 0;
			int BarIndexOffset = 0;
			
			float BarWidth = getSizeFromScreenRatio(0.015f);
			// 隐藏线条间隔
			float PaintStrokeWidth = BarWidth + BarWidth * 0.04f;
			float BarHeight = 0;
			float BarSpace = getSizeFromScreenRatio(0.002f);
			float BarBackgroundSpace = BarSpace * 1.5f;
			if(NotAudioData)
			{
				BarSpace = DrawData[0];
				BarBackgroundSpace = DrawData[0];
			}
			
			float PositionOffset = BarWidth;
			
			/*DrawDataLength = (int) (CanvasHeight / (BarWidth * 3)) / 2 + 1;
			if(DrawDataLength > DrawData.length)
				DrawDataLength = DrawData.length / 2;*/
			
			float StartX = 0, StartY = 0, EndX = 0, EndY = 0;

			float Time = 5;
			float BarPoaitionOffsetY = 0;
			final int IndexSpace = 3;
			
			PathPaint.setStrokeWidth(PaintStrokeWidth + BarSpace);
			PathPaint.setColor(android.graphics.Color.RED);
			PathPaint.setAlpha(ViewAlpha);
			boolean IsEven = false;
			
			/* * *
			 * * * 背景层
			* * */
			//====== 左上半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY > CenterY)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace;
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace;
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			BarPoaitionOffsetY = CanvasHeight;
			IsEven = false;
			//====== 左下半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY < CenterY)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace;
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace;
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			
			PathPaint.setColor(android.graphics.Color.CYAN);
			PathPaint.setAlpha(ViewAlpha);
			BarPoaitionOffsetY = 0;
			IsEven = false;
			/* * *
			 * * * 背景层
			 * * */
			//====== 右上半 ======/
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY > CenterY)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = CanvasWidth - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = CanvasWidth - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			BarPoaitionOffsetY = CanvasHeight;
			IsEven = false;
			//====== 右下半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY < CenterY)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = CanvasWidth - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = CanvasWidth - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			
			
			PathPaint.setStrokeWidth(PaintStrokeWidth);
			PathPaint.setARGB(ViewAlpha, 0, 0, 0);
			BarPoaitionOffsetY = 0;
			IsEven = false;
			/* * *
			 * * * 
			* * */
			//====== 左上半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY > CenterY)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			BarPoaitionOffsetY = CanvasHeight;
			IsEven = false;
			//====== 左下半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY < CenterY)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = 0;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			

			BarPoaitionOffsetY = 0;
			IsEven = false;
			/* * *
			 * * * 
			 * * */
			//====== 右上半 ======/
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY > CenterY)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = CanvasWidth - BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = CanvasWidth - BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY += PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			BarPoaitionOffsetY = CanvasHeight;
			IsEven = false;
			//====== 右下半 ======
			for(int Index = 0; Index < DrawDataLength;)
			{
				if(BarPoaitionOffsetY < CenterY)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = CanvasWidth - BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = CanvasWidth - BarHeight * BarsHeightRatio[BarsHeightRatioIndex];
						StartY = BarPoaitionOffsetY;
						EndX = CanvasWidth;
						EndY = BarPoaitionOffsetY;
						DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetY -= PositionOffset;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}

			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);
			PathPaint.setShader(null);
			PathPaint.setStrokeWidth(DefaultStrokeWidth);
		}
		
		if(SecondaryDrawMode[3])
		{
			float[] DrawData = DrawFftData;
			int DrawDataLength = DrawData.length;// / 2;

			float[] BarsHeightRatio = new float[]{0.5f, 1, 1.5f};
			int BarsHeightRatioIndex = 0;
			int BarIndexOffset = 0;

			float BarWidth = getSizeFromScreenRatio(0.015f);
			// 隐藏线条间隔
			float PaintStrokeWidth = BarWidth + BarWidth * 0.04f;
			float BarHeight = 0;
			float BarSpace = getSizeFromScreenRatio(0.002f);
			float BarBackgroundSpace = BarSpace * 1.5f;
			if(NotAudioData)
			{
				BarSpace = DrawData[0];
				BarBackgroundSpace = DrawData[0];
			}

			float PositionOffset = BarWidth;

			float StartX = 0, StartY = 0, EndX = 0, EndY = 0;

			float Time = 5;
			float BarPoaitionOffsetX = CenterX;
			final int IndexSpace = 3;
			
			float[] Lines = new float[(int) (CanvasWidth / BarWidth) << 2];

			PathPaint.setStrokeWidth(PaintStrokeWidth + BarSpace);
			ColorLinearLevel(DrawCanvas, PathPaint);
			PathPaint.setAlpha(ViewAlpha);
			
			boolean IsEven = false;
			/* * *
			 * * * 背景层
			* * */
			//====== 左半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX < 0)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			//====== 右半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX > CanvasWidth)
					break;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex] + BarBackgroundSpace);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			
			PathPaint.setStrokeWidth(PaintStrokeWidth);
			PathPaint.setShader(null);
			PathPaint.setARGB(ViewAlpha, 0, 0, 0);
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			/* * *
			 * * * 
			 * * */
			//====== 左半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX < 0)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex]);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex]);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX -= PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			Lines = new float[(int) (CanvasWidth / BarWidth) << 2];
			
			BarPoaitionOffsetX = CenterX;
			IsEven = false;
			//====== 右半 ======
			for(int Index = 0, LinesIndex = 0; Index < DrawDataLength && LinesIndex < Lines.length;)
			{
				if(BarPoaitionOffsetX > CanvasWidth)
					break;
				//BarHeight = /*DrawData[0] + */DrawData[Index] * Time;
				if(!IsEven)
				{
					for(BarsHeightRatioIndex = 0; BarsHeightRatioIndex < BarsHeightRatio.length; BarsHeightRatioIndex ++)
					{
						BarHeight = DrawData[Index + BarsHeightRatioIndex] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex]);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
					}
					IsEven = !IsEven;
					Index++;
				}
				else
				{
					BarIndexOffset = 0;
					for(BarsHeightRatioIndex = 2; BarsHeightRatioIndex > 0; BarsHeightRatioIndex --)
					{
						BarHeight = DrawData[Index + BarIndexOffset] * Time;
						StartX = BarPoaitionOffsetX;
						StartY = CanvasHeight - (BarHeight * BarsHeightRatio[BarsHeightRatioIndex]);
						EndX = BarPoaitionOffsetX;
						EndY = CanvasHeight;
						Lines[LinesIndex] = StartX;
						Lines[LinesIndex + 1] = StartY;
						Lines[LinesIndex + 2] = EndX;
						Lines[LinesIndex + 3] = EndY;
						//DrawCanvas.drawLine(StartX, StartY, EndX, EndY, PathPaint);
						BarPoaitionOffsetX += PositionOffset;
						LinesIndex += 4;
						BarIndexOffset++;
					}
					IsEven = !IsEven;
					Index += IndexSpace;
				}
			}
			DrawCanvas.drawLines(Lines, PathPaint);
			
			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);
			PathPaint.setShader(null);
			PathPaint.setStrokeWidth(DefaultStrokeWidth);
		}
		
		
		if(1==0)//if(SecondaryDrawMode[2])
		{
			float[] Source = DrawSimplifyCentralizedFftData;
			float[] TempDrawSimplifyCentralizedFftData = new float[Source.length];
			boolean Orientation = true;
			int PositionL = TempDrawSimplifyCentralizedFftData.length >> 1;
			int PositionR = TempDrawSimplifyCentralizedFftData.length >> 1;
			TempDrawSimplifyCentralizedFftData[TempDrawSimplifyCentralizedFftData.length >> 1] = Source[0];

			for(int Index = 1; Index < TempDrawSimplifyCentralizedFftData.length; Index++)
			{
				if(Orientation)
				{
					PositionL--;
					if(PositionL < 0)
						PositionL = 0;
					TempDrawSimplifyCentralizedFftData[PositionL] = Source[Index];
					Orientation = false;
				}
				else
				{
					PositionR++;
					if(PositionR > TempDrawSimplifyCentralizedFftData.length - 1)
						PositionR = TempDrawSimplifyCentralizedFftData.length - 1;
					TempDrawSimplifyCentralizedFftData[PositionR] = Source[Index];
					Orientation = true;
				}
			}

			float[] DrawData = TempDrawSimplifyCentralizedFftData;

			android.graphics.RectF BarRect = new android.graphics.RectF();

			float Left, Top, Right, Bottom;
			
			float BarWidth = getSizeFromScreenRatio(0.009f);
			float BarHeight = getSizeFromScreenRatio(0.009f);
			float BarSpace = getSizeFromScreenRatio(0.02f);
			
			float OffsetX = -((DrawData.length >> 1) * (BarSpace) + (BarSpace / 2)) + CenterY;
			
			float BarScaleSize = BarWidth;
			
			float Bar;
			float BarOffsetX = 0;

			float Time = 3;

			PathPaint.setStyle(android.graphics.Paint.Style.FILL);
			PathPaint.setAlpha(Math.min(150, (int) (150 * DrawRateAdd)));
			for(int Index = 0; Index < DrawData.length; Index++)
			{
				Bar = DrawData[Index];
				Bar *= Time;
				BarScaleSize = (Bar * DrawRateAdd);
				
				Left = OffsetX + BarOffsetX - BarScaleSize;
				Top = Bar;
				Right = OffsetX + BarOffsetX + BarScaleSize;
				Bottom = 0;

				BarRect.left = Bottom;
				BarRect.top = Left;
				BarRect.right = Top;
				BarRect.bottom = Right;

				DrawCanvas.drawRect(BarRect, PathPaint);
				
				BarRect.left = CanvasWidth - Top;
				BarRect.top = Left;
				BarRect.right = CanvasWidth;
				BarRect.bottom = Right;

				DrawCanvas.drawRect(BarRect, PathPaint);
				
				BarOffsetX += BarSpace;
			}
			
			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);

		}
		
		
		if(1==0)//if(SecondaryDrawMode[2])
		{
			float[] DrawData = DrawFftData;
			int DrawDataLength = DrawData.length / 2;

			float BarWidth = getSizeFromScreenRatio(0.0305f);
			float BarHeight = 0;
			float BarSpace = getSizeFromScreenRatio(0.003f);

			DrawDataLength = (int) (CanvasHeight / (BarWidth + BarSpace)) / 2 + 1;
			if(DrawDataLength > DrawFftData.length)
				DrawDataLength = DrawFftData.length / 2;

			float StartX = 0, StartY = 0, EndX = 0, EndY = 0;

			float Time = 3f;
			float BarPoaitionOffsetY = CenterY;
			Path.reset();
			for(int Index = 0; Index < DrawDataLength; Index++)
			{
				if(BarPoaitionOffsetY < 0)
					break;

				Path.moveTo(0, BarPoaitionOffsetY);

				BarHeight = DrawData[Index] * Time;
				
				StartX = BarHeight;
				StartY = BarPoaitionOffsetY;

				BarPoaitionOffsetY -= BarWidth;

				BarHeight = DrawData[(Index + 1) % DrawDataLength] * Time;
				
				EndX = BarHeight;
				EndY = BarPoaitionOffsetY;

				Path.lineTo(StartX, StartY);
				Path.lineTo(EndX, EndY);
				Path.lineTo(0, EndY);

				BarPoaitionOffsetY -= BarSpace;
			}
			BarPoaitionOffsetY = CenterY + BarSpace;
			for(int Index = 0; Index < DrawDataLength; Index++)
			{
				if(BarPoaitionOffsetY > CanvasHeight)
					break;

				Path.moveTo(0, BarPoaitionOffsetY);

				BarHeight = DrawData[Index] * Time;
				
				StartX = BarHeight;
				StartY = BarPoaitionOffsetY;

				BarPoaitionOffsetY += BarWidth;

				BarHeight = DrawData[(Index + 1) % DrawDataLength] * Time;
				
				EndX = BarHeight;
				EndY = BarPoaitionOffsetY;

				Path.lineTo(StartX, StartY);
				Path.lineTo(EndX, EndY);
				Path.lineTo(0, EndY);

				BarPoaitionOffsetY += BarSpace;
			}
			Path.close();
			PathPaint.setStyle(android.graphics.Paint.Style.FILL);
			CycleColorLinearVertical(Canvas, PathPaint);
			PathPaint.setAlpha(100);
			Canvas.drawPath(Path, PathPaint);

			BarPoaitionOffsetY = CenterY;
			Path.reset();
			for(int Index = 0; Index < DrawDataLength; Index++)
			{
				if(BarPoaitionOffsetY < 0)
					break;

				Path.moveTo(CanvasWidth, BarPoaitionOffsetY);

				BarHeight = DrawData[Index] * Time;
				
				StartX = CanvasWidth - BarHeight;
				StartY = BarPoaitionOffsetY;

				BarPoaitionOffsetY -= BarWidth;

				BarHeight = DrawData[(Index + 1) % DrawDataLength] * Time;
				
				EndX = CanvasWidth - BarHeight;
				EndY = BarPoaitionOffsetY;

				Path.lineTo(StartX, StartY);
				Path.lineTo(EndX, EndY);
				Path.lineTo(CanvasWidth, EndY);

				BarPoaitionOffsetY -= BarSpace;
			}
			BarPoaitionOffsetY = CenterY + BarSpace;
			for(int Index = 0; Index < DrawDataLength; Index++)
			{
				if(BarPoaitionOffsetY > CanvasHeight)
					break;

				Path.moveTo(CanvasWidth, BarPoaitionOffsetY);

				BarHeight = DrawData[Index] * Time;
				
				StartX = CanvasWidth - BarHeight;
				StartY = BarPoaitionOffsetY;

				BarPoaitionOffsetY += BarWidth;

				BarHeight = DrawData[(Index + 1) % DrawDataLength] * Time;
				
				EndX = CanvasWidth - BarHeight;
				EndY = BarPoaitionOffsetY;

				Path.lineTo(StartX, StartY);
				Path.lineTo(EndX, EndY);
				Path.lineTo(CanvasWidth, EndY);

				BarPoaitionOffsetY += BarSpace;
			}
			Path.close();
			Canvas.drawPath(Path, PathPaint);

			PathPaint.setStyle(android.graphics.Paint.Style.STROKE);
			PathPaint.setAlpha(ViewAlpha);
			PathPaint.setShader(null);
		}
		
		if(SecondaryDrawMode[0])
		{
			SetThemeColor(PathPaint);
			float[] Lines = new float[BaseFftData.length << 2];
			float LineOffsetX = 0;
			float OffsetY = 0;
			float Time = 1f;
			int BarOffsetX = 0;
			int Position = 0;
			for(int Index = 0; Index < BaseFftData.length; Index++)
			{
				BarOffsetX += 5;
				Lines[Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[1 + Position] = BaseFftData[Index] * Time;
				Lines[2 + Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[3 + Position] = 0;
				Position += 4;
			}
			Canvas.drawLines(Lines, PathPaint);

			Lines = new float[DrawFftData.length << 2];
			Position = 0;
			BarOffsetX = 0;
			OffsetY += 200;
			for(int Index = 0; Index < DrawFftData.length; Index++)
			{
				BarOffsetX += 5;
				Lines[Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[1 + Position] = DrawFftData[Index] * Time + OffsetY;
				Lines[2 + Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[3 + Position] = OffsetY;
				Position += 4;
			}
			Canvas.drawLines(Lines, PathPaint);

			Lines = new float[FftData.length << 2];
			Position = 0;
			BarOffsetX = 0;
			OffsetY += 200;
			for(int Index = 0; Index < FftData.length; Index++)
			{
				BarOffsetX += 5;
				Lines[Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[1 + Position] = FftData[Index] * Time + OffsetY;
				Lines[2 + Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[3 + Position] = OffsetY;
				Position += 4;
			}
			Canvas.drawLines(Lines, PathPaint);

			Lines = new float[60 << 2];
			Position = 0;
			BarOffsetX = 0;
			OffsetY += 200;
			for(int Index = 0; Index < 60; Index++)
			{
				BarOffsetX += 5;
				Lines[Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[1 + Position] = DrawSimplifyFftData[Index] * Time + OffsetY;
				Lines[2 + Position] = LineOffsetX + BarOffsetX;//Index * 5;
				Lines[3 + Position] = OffsetY;
				Position += 4;
			}
			Canvas.drawLines(Lines, PathPaint);

			if(TestDataO != null)
			{
				Lines = new float[TestDataO.length << 2];
				Position = 0;
				BarOffsetX = 0;
				OffsetY += 200;
				for(int Index = 0; Index < TestDataO.length; Index++)
				{
					BarOffsetX += 5;
					Lines[Index << 2] = LineOffsetX + BarOffsetX;//Index * 5;
					Lines[1 + (Index << 2)] = TestDataO[Index] * Time + OffsetY;
					Lines[2 + (Index << 2)] = LineOffsetX + BarOffsetX;//Index * 5;
					Lines[3 + (Index << 2)] = OffsetY;
					Position += 4;
				}
				Canvas.drawLines(Lines, PathPaint);
			}
			
			if(TestDataT != null)
			{
				Lines = new float[TestDataT.length << 2];
				Position = 0;
				BarOffsetX = 0;
				OffsetY += 200;
				for(int Index = 0; Index < TestDataT.length; Index++)
				{
					BarOffsetX += 5;
					Lines[Index << 2] = LineOffsetX + BarOffsetX;//Index * 5;
					Lines[1 + (Index << 2)] = TestDataT[Index] * Time + OffsetY;
					Lines[2 + (Index << 2)] = LineOffsetX + BarOffsetX;//Index * 5;
					Lines[3 + (Index << 2)] = OffsetY;
					Position += 4;
				}
				Canvas.drawLines(Lines, PathPaint);
			}
		}
		
		
		//============
		
		CirclePaint.setAlpha(ViewAlpha);
		if(DrawMode < 5 && DrawMode > 0 && DrawMode != 2)
		{
			if(DrawMode != 4)
				DrawCanvas.drawCircle(CenterX, CenterY, CircleR, CirclePaint); // _47
			else
				DrawCanvas.drawCircle(CenterX, CenterY, DrawR, CirclePaint);
		}
		if(IsDrawSmear)
		{
			pan.setAlpha(255);
			BackBufferCanvas.drawBitmap(Buffer, 0, 0, Paint);
		}
	}

	private void UpDrawData()
	{
		if(FftData == null)
			return;
		
		HighFrequency.Update();
		
		int MaxR = (int) ScreenWidth >> 1;//getSizeFromScreenRatio(0.292f);
		int MaxBaseR = (int) ((ScreenWidth >> 1) / 1.31578947368421f);
		float[] RFBytes = ReadByte;
		// 60 * 137
		// 10 45 127 165
		float Rng = 0;
		float R = 0;
		if(DataKey == 0 || DataKey < 0)
		{
			Rng = BufferSize[1] * 0.7f + BufferSize[2];
			R = (int) (BufferSize[3] * 0.9f + BufferSize[0] * 0.6f);
		}
		else
		{
			Rng = (DataKey * 1.7f + MainUseLength) * (BufferSize[1] * 0.7f) + BufferSize[2];
			Rng += RateAdd;
			//======================
			R = (BufferSize[3] * 0.9f + ((DataKey * 4.7f + MainUseLength) * (BufferSize[0] * 0.6f))); // * 25
			R += RateAdd;
		}
		//Rng = getScreenDensityForNewSize(Rng);
		//R = getScreenDensityForNewSize(R);
		
		/*BaseDrawR = R;
		if(BaseDrawR > MaxR)
			BaseDrawR = LastDrawR;
		if(BaseDrawR > MaxR)
			BaseDrawR = MaxR + (int) (DataKey) << 3;*/
		
		
		
		/*Rng *= 1.31578947368421f;
		R *= 1.31578947368421f;*/
		
		//=====================
		if(DrawRng == 0)
		{
			DrawRng = Rng / 2;
			LastDrawRng = DrawRng;
		}
		else if(Rng > DrawRng)
		{
			DrawRngRate = (Rng - DrawRng) / 4;
			DrawRng += DrawRngRate;
		}
		else if(Rng < DrawRng)
		{
			DrawRngRate = (DrawRng - Rng) / 4;
			if(DrawRngRate < 0)
				DrawRngRate = UpDrawDataSmoothRate;
			DrawRng -= DrawRngRate;
		}
		if(DrawRng > MaxR)
			DrawRng = LastDrawRng;
		if(DrawRng > MaxR)
			DrawRng = MaxR + (int) (DataKey) << 3;
		LastDrawRng = DrawRng;
		
		//=====================
		if(DrawR == 0)
		{
			DrawR = R / 2;
			LastDrawR = DrawR;
		}
		else if(R > DrawR)
		{
			DrawRRate = (R - DrawR) / 4;
			DrawR += DrawRRate;
		}
		else if(R < DrawR)
		{
			DrawRRate = (DrawR - R) / 4;
			if(DrawRRate < 0)
				DrawRRate = UpDrawDataSmoothRate;
			DrawR -= DrawRRate;
		}
		if(DrawR > MaxR)
			DrawR = LastDrawR;
		if(DrawR > MaxR)
			DrawR = MaxR + (int) (DataKey) << 3;
		LastDrawR = DrawR;
		//=====================
		
		
		//====== 平滑标准 Fft Wave 数据 ======
		DrawFftData = SmoothDataHandle(RFBytes, DrawFftData);
		DrawWaveData = SmoothDataHandle(WaveData, DrawWaveData);
		//============
		
		float TempDrawFftDataOne = DrawFftData[0];
		if(TempDrawFftDataOne > MaxAudioData)
			TempDrawFftDataOne = MaxAudioData;
		DrawFftDataOneRatio = TempDrawFftDataOne / MaxAudioData;
		
		float FftOneR = getSizeBasedOn1080p(110);
		
		float Added = 0.1f;
		if(DrawFftDataOneRatio > LastDrawFftDataOneRatio)
		{
			Added = (DrawFftDataOneRatio - LastDrawFftDataOneRatio);
		}
		LastDrawFftDataOneRatio = DrawFftDataOneRatio;
		if(DrawFftDataOneRatio > DataKey * 0.01f)
		{
			float Add = (Added) + DrawFftDataOneRatio * DataKey;
			if(Add > 1.0f)
				Add = 1.0f;
			FftOneR += getSizeBasedOn1080p(30) * (Add);
			
			if(DrawFftDataOneRatio > 0.2f)
			{
				Add = (DrawFftDataOneRatio * 0.7f) * (DataKey * 0.5f);
				if(Add > 1.0f)
					Add *= 0.9f;
				if(Add > 1.0f)
					Add = 1.0f;
				FftOneR += getSizeBasedOn1080p(15) * (Add);
				Add = (DrawFftDataOneRatio * 0.5f) * DataKey;
				if(Add > 1.0f)
					Add *= 0.9f;
				if(Add > 1.0f)
					Add = 1.0f;
				FftOneR += getSizeBasedOn1080p(15) * Add;
			}
		}
		TestNumber = FftOneR;
		//TestNumber = DataKey * 0.01f;
		
		
		if(DrawFftOneR == 0)
		{
			DrawFftOneR = FftOneR / 2;
			LastDrawFftOneR = DrawFftOneR;
		}
		else if(FftOneR > DrawFftOneR)
		{
			DrawFftOneRRate = (FftOneR - DrawFftOneR) / 3;
			DrawFftOneR += DrawFftOneRRate;
		}
		else if(FftOneR < DrawFftOneR)
		{
			DrawFftOneRRate = (DrawFftOneR - FftOneR) / 3;
			if(DrawFftOneRRate < 0)
				DrawFftOneRRate = UpDrawDataSmoothRate;
			DrawFftOneR -= DrawFftOneRRate;
		}
		if(DrawFftOneR > MaxBaseR)
			DrawFftOneR = LastDrawFftOneR;
		if(DrawFftOneR > MaxBaseR)
			DrawFftOneR = MaxBaseR + (int) (DataKey) << 3;
		LastDrawFftOneR = DrawFftOneR;
		
		//====== 平滑集中简化的 Fft 数据 ======
		float[] Source = RFBytes;
		float[] MaxFftData = new float[Source.length];
		float[] SimplifyCentralizedFftData = new float[Source.length];
		for(int Index = 1, IndexT = 0; Index < MaxFftData.length; Index++)
		{
			if(Source[Index] > Source[Index - 1] && Source[Index] > Source[(Index + 1) % Source.length])
				MaxFftData[Index] = Source[Index];
			if(MaxFftData[Index] < 0)
				MaxFftData[Index] = 0;
			if(MaxFftData[Index] > 2)
			{
				SimplifyCentralizedFftData[IndexT] = MaxFftData[Index];
				IndexT++;
			}
		}
		
		DrawSimplifyCentralizedFftData = SmoothDataHandle(SimplifyCentralizedFftData, DrawSimplifyCentralizedFftData);
		//============
		
		
		//====== 平滑简化 Fft 数据 ======
		Source = RFBytes;
		float[] SimplifyFftData = new float[Source.length];
		
		if(DrawMode == 7 || SecondaryDrawMode[1] || SecondaryDrawMode[0])
		for(int Index = 1; Index < SimplifyFftData.length; Index++)
		{
			SimplifyFftData[Index] = Source[Index];
			/*if(Source[Index] > Source[Index - 1] && Source[Index] > Source[(Index + 1) % Source.length])
			{
				SimplifyFftData[Index - 1] = Source[Index - 1] * 0.5f;
				SimplifyFftData[Index] = Source[Index];
				SimplifyFftData[(Index + 1) % SimplifyFftData.length] = Source[(Index + 1) % Source.length] * 0.5f;
			}*/
		}
		SimplifyFftData[0] = Source[0];
		if(DrawMode == 7 || SecondaryDrawMode[1] || SecondaryDrawMode[0])
			DrawSimplifyFftData = SimplifyFftData;
			//SmoothDataHandle(SimplifyFftData, DrawSimplifyFftData);
		//============
		
		
		//====== 取第一个高能量 Fft 数据的位置 ======
		int FirstMaxLengthPosition = 0;
		float HighOne = 0;
		if(DrawMode == 7)
		for(int Index = 0; Index < 10; Index++)
		{
			if(Index < 5)
				HighOne += SimplifyFftData[Index];
			if(SimplifyFftData[Index] > SimplifyFftData[FirstMaxLengthPosition])
				FirstMaxLengthPosition = Index;
		}
		HighOne /= 3;
		//============
		

		//====== 扩大并增大 Fft 数据 ======
		float[] OSimplifyFftData = new float[200];
		float MaxSize = DrawFftOneR * 0.7f;
		int IndexOffset = 30;
		if(DrawMode == 7)
		for(int Index = 0, IndexT = 0; Index < SimplifyFftData.length && IndexT < OSimplifyFftData.length; Index++, IndexT += 1)
		{
			OSimplifyFftData[IndexT] = SimplifyFftData[Index] / 3;// + DrawFftData[DrawFftData.length - 1 - Index];
		}
		
		//TestDataO = OSimplifyFftData;
		
		float SubFft = 0;
		if(DrawFftData[0] > SlowlyDrawFftDataOne)
		{
			SlowlyDrawFftDataOne = SmoothDataHandle(DrawFftData[0], SlowlyDrawFftDataOne, 3);
		}
		else if(DrawFftData[0] < SlowlyDrawFftDataOne)
		{
			/*if(SlowlyDrawFftDataOne - DrawFftData[0] > 5)
				SlowlyDrawFftDataOne = SmoothDataHandle(0, SlowlyDrawFftDataOne, 3);
			else
				SlowlyDrawFftDataOne = SmoothDataHandle(DrawFftData[0], SlowlyDrawFftDataOne, 6);
			*/
			SubFft = (SlowlyDrawFftDataOne - DrawFftData[0]) * 2;
			SlowlyDrawFftDataOne = SmoothDataHandle(DrawFftData[0] - SubFft, SlowlyDrawFftDataOne, 6);
		}
		
		if(SlowlyDrawFftDataOne > MaxAudioData)
			SlowlyDrawFftDataOne = MaxAudioData;
		SlowlyDrawFftDataOneRatio = SlowlyDrawFftDataOne / MaxAudioData;
		
		//TestNumber = SlowlyDrawFftDataOne;
		
		float[] TSimplifyFftData = new float[200];
		if(DrawMode == 7)
		{
			for(int Index = 0, IndexT = IndexOffset; Index < SimplifyFftData.length && IndexT < TSimplifyFftData.length; Index++, IndexT += 1)
			{
				if(Index > FirstMaxLengthPosition)
				if(SimplifyFftData[Index] >= SimplifyFftData[FirstMaxLengthPosition])
						SimplifyFftData[Index] += SimplifyFftData[0] / 2 + SubFft;
				else
					SimplifyFftData[Index] /= 2;
				if(SimplifyFftData[Index] > MaxSize)
					SimplifyFftData[Index] = MaxSize;

				if(Index < 6)
				{
					if(Index != 2)
						TSimplifyFftData[IndexT] = SimplifyFftData[Index];
					else
						TSimplifyFftData[IndexT] = DrawFftData[Index] * 2 - SubFft;
				}
				else
					TSimplifyFftData[IndexT] = SimplifyFftData[Index];
			}
		}TestDataO = TSimplifyFftData;
		//============
		
		
		//====== 将 Fft 数据波形化 ======
		
		
		MaxSize = DrawFftOneR / 2;
		WaveShapeFftData = new float[360];
		float CirclePI = (float) Math.PI * 2;
		int StartPositionOffset = (int) Math.max(0, SlowlyDrawFftDataOneRatio * 12);
		StartPositionOffset = Math.min(12, StartPositionOffset);
		if(DrawMode == 7)
		for(int Index = 0, IndexT = 180; Index < WaveShapeFftData.length; Index++)
		{
			if(Index < 180)
			{
				if(OSimplifyFftData[Index] < 1)
					continue;
				float Data = OSimplifyFftData[Index];
				Data = Math.min(MaxSize, Data);
				int WaveShaperWidth = (int) (Data * 0.5f);
				WaveShaperWidth = Math.max(30, WaveShaperWidth);
				WaveShaperWidth = Math.min(72, WaveShaperWidth);

				float WaveShaperAngle = CirclePI / WaveShaperWidth;

				int StartPosition = Index - (WaveShaperWidth >> 1);
				
				if(StartPosition < 0)
				{
					StartPosition = Math.abs(StartPosition);
				}
				StartPosition += StartPositionOffset;
				//StartPositionOffset = 0;

				float Angle = 0;
				for(int I = 0; I < WaveShaperWidth; I++, StartPosition++)
				{
					float FinallyData = (float) (Math.sin(Angle) * Data);
					if(FinallyData > WaveShapeFftData[StartPosition])
					{
						WaveShapeFftData[StartPosition] = FinallyData;
					}
					Angle += WaveShaperAngle;
				}
			}
			else if(Index >= 180)
			{
				WaveShapeFftData[Index] = WaveShapeFftData[IndexT];
				if(IndexT > 0)
					IndexT--;
			}
		}

		MaxSize = DrawFftOneR * 0.9f;
		StartPositionOffset = (int) Math.min(60, SlowlyDrawFftDataOneRatio * 60);
		StartPositionOffset = Math.max(0, StartPositionOffset);
		for(int Index = IndexOffset, IndexT = 180; Index < WaveShapeFftData.length; Index++)
		{
			if(Index < 180)
			{
				if(TSimplifyFftData[Index] < 1)
					continue;
				float Data = TSimplifyFftData[Index];
				Data = Math.min(MaxSize, Data);
				int WaveShaperWidth = (int) (Data * 0.5f);
				WaveShaperWidth = Math.max(30, WaveShaperWidth);
				WaveShaperWidth = Math.min(74, WaveShaperWidth);

				float WaveShaperAngle = CirclePI / WaveShaperWidth;

				int StartPosition = 80 + Index - (WaveShaperWidth >> 1);

				if(StartPosition < 0)
				{
					StartPosition = Math.abs(StartPosition);
				}
				StartPosition -= StartPositionOffset;
				//StartPositionOffset = 0;

				float Angle = 0;
				for(int I = 0; I < WaveShaperWidth; I++, StartPosition++)
				{
					float FinallyData = (float) (Math.sin(Angle) * Data);
					if(FinallyData > WaveShapeFftData[StartPosition])
					{
						WaveShapeFftData[StartPosition] = FinallyData;
					}
					Angle += WaveShaperAngle;
				}
			}
			else if(Index >= 180)
			{
				WaveShapeFftData[Index] = WaveShapeFftData[IndexT];
				if(IndexT > 0)
					IndexT--;
			}
		}
		
		//====== 平滑波形化 Fft 数据 ======
		if(DrawMode == 7)
			//DrawWaveShapeFftData = WaveShapeFftData;
			DrawWaveShapeFftData = SmoothDataHandle(WaveShapeFftData, DrawWaveShapeFftData, 3);
		//============
		TestDataT = DrawWaveShapeFftData;
		
		//====== 延迟平滑波形 Fft 数据 ======
		if(WaveShapeFftData != null && DrawMode == 7)
			if(DrawSecondaryWaveShapeFftData == null || DrawSecondaryWaveShapeFftData.length != WaveShapeFftData.length * 3)
				DrawSecondaryWaveShapeFftData = new float[WaveShapeFftData.length * 3];
			else
			{
				float TempUpDrawDataSmoothRate = 4 + (2 * 3);
				for(int Index = 0, IndexT = 0, DataLength = 1; DataLength <= 3; Index++, IndexT++)
				{
					if(IndexT == WaveShapeFftData.length)
					{
						IndexT = 0;
						DataLength++;
						TempUpDrawDataSmoothRate -= 2;
					}
					if(DataLength > 3)
						break;
					if(WaveShapeFftData[IndexT] > DrawSecondaryWaveShapeFftData[Index])
						DrawSecondaryWaveShapeFftData[Index] += (WaveShapeFftData[IndexT] - DrawSecondaryWaveShapeFftData[Index]) / TempUpDrawDataSmoothRate;
					else if(WaveShapeFftData[IndexT] < DrawSecondaryWaveShapeFftData[Index])
						DrawSecondaryWaveShapeFftData[Index] -= (DrawSecondaryWaveShapeFftData[Index] - WaveShapeFftData[IndexT]) / TempUpDrawDataSmoothRate;
				}
			}
		//============
		
		float TempUpDrawDataSmoothRate = UpDrawDataSmoothRate + 6;
		
		float Rate = RateAdd / 25;
		if(Rate > DrawRateAdd)
			DrawRateAdd += (Rate - DrawRateAdd) / TempUpDrawDataSmoothRate;
		else if(Rate < DrawRateAdd)
			DrawRateAdd -= (DrawRateAdd - Rate) / TempUpDrawDataSmoothRate;
		
		
		CircleR = DrawRng - getSizeFromScreenRatio(0.052f);
		MainUseLength = 0;
	}

	private float[] SmoothDataHandle(float[] SourceData, float[] HandleData)
	{
		if(SourceData != null)
		{
			if(HandleData == null || HandleData.length != SourceData.length)
				HandleData = new float[SourceData.length];
			for(int Index = 0; Index < SourceData.length; Index++)
			{
				if(SourceData[Index] > HandleData[Index])
					HandleData[Index] += (SourceData[Index] - HandleData[Index]) / UpDrawDataSmoothRate;
				else if(SourceData[Index] < HandleData[Index])
					HandleData[Index] -= (HandleData[Index] - SourceData[Index]) / UpDrawDataSmoothRate;
			}
		}
		else
		{
			return HandleData = new float[1];
		}
		return HandleData;
	}

	private int[] SmoothDataHandle(int[] SourceData, int[] HandleData)
	{
		if(SourceData != null)
		{
			if(HandleData == null || HandleData.length != SourceData.length)
				HandleData = new int[SourceData.length];
			for(int Index = 0; Index < SourceData.length; Index++)
			{
				if(SourceData[Index] > HandleData[Index])
					HandleData[Index] += (SourceData[Index] - HandleData[Index]) / UpDrawDataSmoothRate;
				else if(SourceData[Index] < HandleData[Index])
					HandleData[Index] -= (HandleData[Index] - SourceData[Index]) / UpDrawDataSmoothRate;
			}
		}
		else
		{
			return HandleData = new int[1];
		}
		return HandleData;
	}

	private float SmoothDataHandle(float SourceData, float HandleData)
	{
		if(SourceData> HandleData)
			HandleData += (SourceData - HandleData) / UpDrawDataSmoothRate;
		else if(SourceData < HandleData)
			HandleData -= (HandleData - SourceData) / UpDrawDataSmoothRate;
		return HandleData;
	}

	private int SmoothDataHandle(int SourceData, int HandleData)
	{
		if(SourceData> HandleData)
			HandleData += (SourceData - HandleData) / UpDrawDataSmoothRate;
		else if(SourceData < HandleData)
			HandleData -= (HandleData - SourceData) / UpDrawDataSmoothRate;
		return HandleData;
	}

	private float SmoothDataHandle(float SourceData, float HandleData, float SmoothRate)
	{
		if(SourceData> HandleData)
			HandleData += (SourceData - HandleData) / SmoothRate;
		else if(SourceData < HandleData)
			HandleData -= (HandleData - SourceData) / SmoothRate;
		return HandleData;
	}

	private int SmoothDataHandle(int SourceData, int HandleData, float SmoothRate)
	{
		if(SourceData> HandleData)
			HandleData += (SourceData - HandleData) / SmoothRate;
		else if(SourceData < HandleData)
			HandleData -= (HandleData - SourceData) / SmoothRate;
		return HandleData;
	}

	private float[] SmoothDataHandle(float[] SourceData, float[] HandleData, float SmoothRate)
	{
		if(SourceData != null)
		{
			if(HandleData == null || HandleData.length != SourceData.length)
				HandleData = new float[SourceData.length];
			for(int Index = 0; Index < SourceData.length; Index++)
			{
				if(SourceData[Index] > HandleData[Index])
					HandleData[Index] += (SourceData[Index] - HandleData[Index]) / SmoothRate;
				else if(SourceData[Index] < HandleData[Index])
					HandleData[Index] -= (HandleData[Index] - SourceData[Index]) / SmoothRate;
			}
		}
		else
		{
			return HandleData = new float[1];
		}
		return HandleData;
	}

	private int[] SmoothDataHandle(int[] SourceData, int[] HandleData, float SmoothRate)
	{
		if(SourceData != null)
		{
			if(HandleData == null || HandleData.length != SourceData.length)
				HandleData = new int[SourceData.length];
			for(int Index = 0; Index < SourceData.length; Index++)
			{
				if(SourceData[Index] > HandleData[Index])
					HandleData[Index] += (SourceData[Index] - HandleData[Index]) / SmoothRate;
				else if(SourceData[Index] < HandleData[Index])
					HandleData[Index] -= (HandleData[Index] - SourceData[Index]) / SmoothRate;
			}
		}
		else
		{
			return HandleData = new int[1];
		}
		return HandleData;
	}

	private class UpDrawDataThreadRunnable implements java.lang.Runnable
	{
		@Override
		public void run()
		{
			try
			{
				android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_FOREGROUND);
				while (Flag)
				{
					if(System.currentTimeMillis() >= UpDrawDataTime)
					{
						UpDrawDataTime = System.currentTimeMillis() + UpDrawDataFrameRate;
						UpDrawData();
					}
					Thread.sleep(1);
				}
			}
			catch(Exception E){}
			return;
		}
	}

	//====== 由于需要频繁调用所以创建此对象 ======
	private int[] ColorList = new int[]{android.graphics.Color.RED, android.graphics.Color.MAGENTA, android.graphics.Color.BLUE, android.graphics.Color.CYAN, android.graphics.Color.GREEN, android.graphics.Color.YELLOW, android.graphics.Color.RED};
	
	private float L = 0, R = 0;
	private void UpdataCycleColor()
	{
		L = 0; R = 0;
		for(int Index = 0; Index < ByteAllCountFft / 2; Index++)
		{
			L += DrawFftData[Index];
		}
		for(int Index = ByteAllCountFft / 2; Index < ByteAllCountFft; Index++)
		{
			R += DrawFftData[Index];
		}
	}
	private android.graphics.SweepGradient SweepGradient;
	private int CycleColorCenterX, CycleColorCenterY;
	private void CycleColor(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint)
	{
		//ColorList = new int[]{android.graphics.Color.RED, android.graphics.Color.YELLOW, android.graphics.Color.GREEN, android.graphics.Color.CYAN, android.graphics.Color.BLUE, android.graphics.Color.MAGENTA, android.graphics.Color.RED};
		//$Paint.setShader(new android.graphics.LinearGradient(BufferWidth, 0, 0, 0, ColorList, null, android.graphics.Shader.TileMode.MIRROR));
		/*int X, Y;
		if(IsDrawSmear)
		{
			X = BufferWidth >> 1;
			Y = BufferHeight >> 1;
		}
		else
		{
			X = CanvasWidth >> 1;
			Y = CanvasHeight >> 1;
		}*/
		/*if(SweepGradient == null)
			SweepGradient = new android.graphics.SweepGradient(CenterX, CenterY, ColorList, null);
		*/
		/*if(CycleColorCenterX != CenterX && CycleColorCenterY != CenterY)
		{*/
			CycleColorCenterX = CenterX;
			CycleColorCenterY = CenterY;
			SweepGradient = new android.graphics.SweepGradient(CenterX, CenterY, ColorList, null);
		//}
		$Paint.setShader(SweepGradient);
		$Paint.setAlpha(ViewAlpha);
	}
	
	private int[] ColorListT = new int[]{android.graphics.Color.RED, android.graphics.Color.MAGENTA, android.graphics.Color.BLUE, android.graphics.Color.CYAN, android.graphics.Color.GREEN, android.graphics.Color.YELLOW, android.graphics.Color.RED};
	private int[] ColorListTH = new int[]{android.graphics.Color.RED, android.graphics.Color.CYAN, android.graphics.Color.RED, android.graphics.Color.CYAN, android.graphics.Color.RED};//android.graphics.Color.RED, android.graphics.Color.YELLOW, android.graphics.Color.CYAN, android.graphics.Color.CYAN, android.graphics.Color.BLUE, android.graphics.Color.MAGENTA, android.graphics.Color.RED};

	private int[] ColorListFO = new int[]{android.graphics.Color.CYAN, android.graphics.Color.RED, android.graphics.Color.RED, android.graphics.Color.CYAN};//android.graphics.Color.MAGENTA, android.graphics.Color.YELLOW, android.graphics.Color.RED, android.graphics.Color.CYAN, android.graphics.Color.RED, android.graphics.Color.GREEN, android.graphics.Color.MAGENTA};
	private int[] ColorListFI = new int[]{android.graphics.Color.CYAN, android.graphics.Color.RED, android.graphics.Color.RED, android.graphics.Color.CYAN};//android.graphics.Color.MAGENTA, android.graphics.Color.YELLOW, android.graphics.Color.RED, android.graphics.Color.CYAN, android.graphics.Color.RED, android.graphics.Color.GREEN, android.graphics.Color.MAGENTA};
	
	private void CycleColor(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint, int[] $ColorList)
	{
		CycleColorCenterX = CenterX;
		CycleColorCenterY = CenterY;
		SweepGradient = new android.graphics.SweepGradient(CenterX, CenterY, $ColorList, null);
		$Paint.setShader(SweepGradient);
		$Paint.setAlpha(ViewAlpha);
	}

	private float[] PositionList = new float[]{0f, 0.5f, 0.5f, 1.0f};
	private float OffsetAngleL = 0, OffsetAngleR;
	private void CycleColor(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint, int[] $ColorList, float[] $PositionList)
	{
		CycleColorCenterX = CenterX;
		CycleColorCenterY = CenterY;
		
		float OffsetX = DrawRateAdd;
		
		OffsetX = ((360f * OffsetX) / 360f);
		
		OffsetX = 0.50f * OffsetX;
		
		if(OffsetX > 0.45f)
			OffsetX = 0.45f;
		
		if(L > R)
		{
			OffsetAngleL = SmoothDataHandle(OffsetX, OffsetAngleL);
			OffsetAngleR = SmoothDataHandle(0.003f, OffsetAngleR);
		}
		else if(L < R)
		{
			OffsetAngleL = SmoothDataHandle(0.003f, OffsetAngleL);
			OffsetAngleR = SmoothDataHandle(OffsetX, OffsetAngleR);
		}
		
		
		/*if(OffsetAngle > 0)
		{
			PositionList[0] = 0f;
			PositionList[1] = 0.5f - OffsetAngle;
			PositionList[2] = 0.5f + OffsetAngle;
			PositionList[3] = 1f;
		}
		else if(OffsetAngle < 0)
		{
			PositionList[0] = 0f + OffsetAngle;
			PositionList[1] = 0.5F;
			PositionList[2] = 0.5f;
			PositionList[3] = 1f - OffsetAngle;
		}*/
		if(OffsetX > 0)
		{
			PositionList[0] = 0f + OffsetAngleR;
			PositionList[1] = 0.5f - OffsetAngleL;
			PositionList[2] = 0.5f + OffsetAngleL;
			PositionList[3] = 1f - OffsetAngleR;
		}
		else
		{
			PositionList[0] = 0f;
			PositionList[1] = 0.5f;
			PositionList[2] = 0.5f;
			PositionList[3] = 1f;
		}
		
		SweepGradient = new android.graphics.SweepGradient(CenterX, CenterY, $ColorList, $PositionList);
		$Paint.setShader(SweepGradient);
		$Paint.setAlpha(ViewAlpha);
	}


	private int[] LColorList = new int[]{android.graphics.Color.RED, android.graphics.Color.YELLOW, android.graphics.Color.GREEN, android.graphics.Color.CYAN, android.graphics.Color.BLUE, android.graphics.Color.MAGENTA, android.graphics.Color.RED};
	private android.graphics.LinearGradient LinearGradient;
	private void CycleColorLinearLevel(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint)
	{
		float OffsetX = CanvasWidth * 2 * DrawRateAdd;
		if(L > R)
			OffsetX = +OffsetX;
		else if(L < R)
			OffsetX = -OffsetX;
		LinearGradient = new android.graphics.LinearGradient(-CanvasWidth * 2 * DrawRateAdd + OffsetX, 0, CanvasWidth + CanvasWidth * 2 * DrawRateAdd + OffsetX, 0, LColorList, null, android.graphics.Shader.TileMode.MIRROR);
		$Paint.setShader(LinearGradient);
	}

	private void CycleColorLinearVertical(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint)
	{
		float OffsetX = CanvasHeight * 2 * DrawRateAdd;
		if(L > R)
			OffsetX = -OffsetX;
		else if(L < R)
			OffsetX = +OffsetX;
		LinearGradient = new android.graphics.LinearGradient(0, -CanvasHeight * 2 * DrawRateAdd + OffsetX, 0, CanvasHeight + CanvasHeight * 2 * DrawRateAdd + OffsetX, LColorList, null, android.graphics.Shader.TileMode.MIRROR);
		$Paint.setShader(LinearGradient);
	}

	private int[] LColorListT = new int[]{android.graphics.Color.RED, android.graphics.Color.CYAN};
	private android.graphics.LinearGradient LinearGradientT;
	private void ColorLinearLevel(android.graphics.Canvas $Canvas, android.graphics.Paint $Paint)
	{
		/*float OffsetX = CanvasWidth * 2 * DrawRateAdd;
		if(L > R)
			OffsetX = +OffsetX;
		else if(L < R)
			OffsetX = -OffsetX;*/
		LinearGradientT = new android.graphics.LinearGradient(0, 0, $Canvas.getWidth(), 0, LColorListT, new float[]{0.4f, 0.6f}, android.graphics.Shader.TileMode.MIRROR);
		$Paint.setShader(LinearGradientT);
	}

	/* * *
	
	
	
	
	
	
	* * */
	
	public void SetFullScreen(boolean Is)
	{
		FullScreen = Is;
	}

	public void SetEnableVibrator(boolean Is)
	{
		EnableVibrator = Is;
		if(EnableVibrator)
			Vibrator.Start();
		else
			Vibrator.Stop();
	}
	
	public void SetDataVolumeAdjustmentScale(int Scale)
	{
		if(Scale < 0 || Scale == 0)
			DataVolumeAdjustmentScale = 1;
		else if(Scale > 3)
			DataVolumeAdjustmentScale = 3;
		else
			DataVolumeAdjustmentScale = 1 + Scale;
	}
	
	public void OpenCycleColor(boolean Check)
	{
		IsCycleColor = Check;
	}

	/*public void OpenCycleColorForWave(boolean Check)
	{
		IsCycleColorForWave = Check;
	}*/

	public long getFPS()
	{
		return FPS;
	}

	public boolean IsInformation()
	{
		return IsInformation;
	}

	public void setDrawSmear(boolean Check)
	{
		IsDrawSmear = Check;
	}

	public void ShowFPS(boolean Check)
	{
		IsFps = Check;
	}

	public void ShowInformation(boolean Check)
	{
		IsInformation = Check;
	}

	public void SetFPS(int $FrameRate)
	{
		MaxFps = 60 + $FrameRate;
		if(MaxFps > 120)
			MaxFps = 120;
		else if(MaxFps < 60)
			MaxFps = 60;
		if(AudioVisualizeView != null)
			AudioVisualizeView.SetFPS(this, MaxFps);
		else if(AudioVisualizeSurfaceView != null)
			AudioVisualizeSurfaceView.SetFPS(this, MaxFps);
	}

	public void SetAnimationSmoothRate(int SmoothRate)
	{
		UpDrawDataSmoothRate = 4 + SmoothRate;
		if(UpDrawDataSmoothRate > 10)
			UpDrawDataSmoothRate = 10;
		else if(UpDrawDataSmoothRate < 4)
			UpDrawDataSmoothRate = 4;
	}

	public void SetMinViewAlpha(int Alpha)
	{
		MinViewAlpha = Alpha;
		if(MinViewAlpha > 255)
			MinViewAlpha = 255;
		else if(MinViewAlpha < 0)
			MinViewAlpha = 0;
	}

	public void SetDrawMode(int Mode)
	{
		DrawMode = Mode;
		if(DrawMode < 0)
			DrawMode = 1;
		else if(Mode > MaxDrawMode)
			DrawMode = MaxDrawMode;
		if(!IsInit())
			return;
		switch(DrawMode)
		{
			case 0:
				ByteAllCountFft = 0;
				ByteAllCountWave = 0;
			break;
			case 1:
				ByteAllCountFft = 464;
				ByteAllCountWave = 0;
			break;
			case 2:
				ByteAllCountFft = 464;
				ByteAllCountWave = 86 << 1;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0191f));
			break;
			case 3:
				ByteAllCountFft = 464;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0191f));
			break;
			case 4:
				ByteAllCountFft = 260;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0155f));
			break;
			case 5:
				ByteAllCountFft = 260;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0155f));
			break;
			case 6:
				ByteAllCountFft = 200;
				ByteAllCountWave = 200;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0155f));
			break;
			case 7:
				ByteAllCountFft = 260;
				ByteAllCountWave = 260;
				CirclePaint.setStrokeWidth(getSizeFromScreenRatio(0.0155f));
			break;
			case 8:
				ByteAllCountFft = 464;
				ByteAllCountWave = 0;
			break;
		}
	}

	public void SetSecondaryDrawMode(boolean[] List)
	{
		int Length = SecondaryDrawMode.length;
		if(List.length > SecondaryDrawMode.length)
			return;
		else if(List.length < SecondaryDrawMode.length)
			Length = List.length;
		for(int Index = 0; Index < Length; Index++)
		{
			SecondaryDrawMode[Index] = List[Index];
		}
	}

	public boolean[] GetSecondaryDrawMode()
	{
		return SecondaryDrawMode;
	}
	
	/* * * 
	
	
	
	
	
	
	* * */

	public void StopAudioVisualize()
	{
		if(AudioVisualize != null)
		{
			Flag = false;
			boolean WorkIsNotFinish = true;
			Vibrator.Release();
			while(WorkIsNotFinish)
			{
				try
				{
					if(Visualizer != null && Visualizer.getEnabled())
					{
						Visualizer.setEnabled(false);
						Visualizer.release();
					}
					UpDrawDataThread.join();
					UpDrawDataThread.interrupt();
				}
				catch (Exception E)
				{
					ShowAlertMessage(E.toString());
				}
				Context = null;
				Canvas = null;
				WorkIsNotFinish = false;
			}
			UpDrawDataThread = null;
		}
	}

	public boolean onKeyDown(int KeyCode, android.view.KeyEvent KeyEvent)
	{
		if(KeyEvent.getAction() == android.view.KeyEvent.ACTION_DOWN)
			switch(KeyCode)
			{
				case 4:
					StopAudioVisualize();
					System.exit(0);
					android.os.Process.killProcess(android.os.Process.myPid());
					break;
				case 24:
					if(AudioManager != null)
					{
						AudioManager.adjustStreamVolume(android.media.AudioManager.STREAM_MUSIC, android.media.AudioManager.ADJUST_RAISE, android.media.AudioManager.FX_FOCUS_NAVIGATION_UP);
						StreamVolume = AudioManager.getStreamVolume(android.media.AudioManager.STREAM_MUSIC);
					}
					break;
				case 25:
					if(AudioManager != null)
					{
						AudioManager.adjustStreamVolume(android.media.AudioManager.STREAM_MUSIC, android.media.AudioManager.ADJUST_LOWER, android.media.AudioManager.FX_FOCUS_NAVIGATION_UP);
						StreamVolume = AudioManager.getStreamVolume(android.media.AudioManager.STREAM_MUSIC);
					}
					break;
			}
		return true;
	}

	public boolean onTouchEvent(android.view.MotionEvent MotionEvent) {
    float X = MotionEvent.getX();
    float Y = MotionEvent.getY();
    int action = MotionEvent.getAction();
    
    if (action == MotionEvent.ACTION_DOWN) {
        if (Math.sqrt(Math.pow((((ScreenWidth / 2) - (0)) - (int) X), 2) + Math.pow((((ScreenHeight / 2) - (0)) - (int) Y), 2)) <= 137) {
            if (MediaPlayer != null) {
                if (MediaPlayer.isPlaying())
                    MediaPlayer.pause();
                else
                    MediaPlayer.start();
            }
        } else if (Math.sqrt(Math.pow(((0) - (int) X), 2) + Math.pow(((0) - (int) Y), 2)) <= 137) {
            StopAudioVisualize();
            System.exit(0);
        }
    }
    
    return false;
}

	public void PlayTask(String Path)
	{
		if(!new java.io.File(Path).isFile())
			return;
		IsPlaying = true;
		try
		{
			if(AudioTrackPlayMusic != null && AudioTrackPlayMusic.HasMusic && (Path.substring(Path.lastIndexOf("/") + 1, Path.lastIndexOf("."))).equals(AudioName))
			{
				AudioTrackPlayMusic.Playing = true;
				return;
			}
			else
			{
				if(AudioTrackPlayMusic != null)
				{
					AudioTrackPlayMusic.Release();
					AudioTrackPlayMusic = null;
				}
				if (AudioTrack != null)
				{
					if (AudioTrack.getState() == android.media.AudioRecord.STATE_INITIALIZED)
					{
						AudioTrack.stop();
					}
					AudioTrack.release();
					AudioTrack = null;
				}
				System.gc();
				AudioName = Path.substring(Path.lastIndexOf("/") + 1, Path.lastIndexOf("."));
				MusicName = AudioName.substring(AudioName.indexOf("-") + 1, AudioName.length()).trim();
				// 开始播放
				if(AudioTrackPlayMusic == null)
					AudioTrackPlayMusic = new AudioTrackPlayMusic();
				AudioTrackPlayMusic.decodeMusicFile(Path, Path, Context);
			}
		}
		catch (Exception E)
		{
			ShowAlertMessage(E.toString());
		}
		return;
	}

	public void Pause(String Play)
	{
		switch(Play)
		{
			case "MediaPlayer":
				if(MediaPlayer != null)
					MediaPlayer.pause();
			break;
			case "AudioTrack":
				if(AudioTrackPlayMusic != null)
					if(AudioTrackPlayMusic.HasMusic == true)
						AudioTrackPlayMusic.Playing = false;
			break;
		}
		AudioFxPlaying = false;
	}

	public void Pause()
	{
		if(MediaPlayer != null)
			MediaPlayer.pause();
		if(AudioTrackPlayMusic != null)
			if(AudioTrackPlayMusic.HasMusic == true)
				AudioTrackPlayMusic.Playing = false;
		AudioFxPlaying = false;
	}

	public void Start(String Play)
	{
		switch(Play)
		{
			case "MediaPlayer":
				if(MediaPlayer != null)
					MediaPlayer.start();
				if(Visualizer != null && !Visualizer.getEnabled())
					Visualizer.setEnabled(true);
			break;
			case "AudioTrack":
				if(AudioTrackPlayMusic != null)
					if(AudioTrackPlayMusic.HasMusic == true)
						AudioTrackPlayMusic.Playing = true;
			break;
		}
		AudioFxPlaying = true;
	}

	public void Start()
	{
		if(MediaPlayer != null)
			MediaPlayer.start();
		if(Visualizer != null && !Visualizer.getEnabled())
			Visualizer.setEnabled(true);
		if(AudioTrackPlayMusic != null)
			if(AudioTrackPlayMusic.HasMusic == true)
				AudioTrackPlayMusic.Playing = true;
		AudioFxPlaying = true;
	}

	public void LoaderMusic(String Play, String Path)
	{
		switch(Play)
		{
			case "MediaPlayer":
				if(MediaPlayer != null && MediaPlayer.isPlaying() != false && AudioName.equals(Path.substring(Path.lastIndexOf("/") + 1, Path.lastIndexOf("."))))
				{
					MediaPlayer.start();
					if(Visualizer != null && !Visualizer.getEnabled())
						Visualizer.setEnabled(true);
					else
						InitVisualizer();
					AudioFxPlaying = true;
				}
				if(!Path.substring(Path.lastIndexOf("/") + 1, Path.lastIndexOf(".")).equals(AudioName))
				{
					if(MediaPlayer != null)
						MediaPlayer.stop();
					LocalAudio(Path);
					InitVisualizer();
					AudioFxPlaying = true;
				}
			break;
			case "AudioTrack":
				if(AudioTrackPlayMusic != null && AudioTrackPlayMusic.HasMusic)
				{
					AudioTrackPlayMusic.Playing = true;
					AudioFxPlaying = true;
				}
				else
				{
					PlayTask(Path);
					AudioFxPlaying = true;
				}
			break;
		}
	}

	class AudioTrackPlayMusic
	{
		boolean Playing = false;
		boolean HasMusic = false;
		long StartMicroseconds;
		long EndMicroseconds;
		//采样率，声道数，时长，音频文件类型
		int SampleRate;
		int ChannelCount;
		long Duration;
		String Mime = null;
		//MediaExtractor, MediaFormat, MediaCodec
		android.media.MediaExtractor MediaExtractor;
		android.media.MediaFormat MediaFormat;
		android.media.MediaCodec MediaCodec;

		boolean DecodeInputEnd = false;
		boolean DecodeOutputEnd = false;
		//当前读取采样数据的大小
		int SampleDataSize;
		//当前输入数据的ByteBuffer序号，当前输出数据的ByteBuffer序号
		int InputBufferIndex;
		int OutputBufferIndex;
		//音频文件的采样位数字节数，= 采样位数/8
		int ByteNumber;
		//当前采样的音频时间，比如在当前音频的第40秒的时候
		long PresentationTimeUs;
		//定义编解码的超时时间
		long TimeOutUs;
		//存储输入数据的ByteBuffer数组，输出数据的ByteBuffer数组
		java.nio.ByteBuffer[] InputBuffers;
		java.nio.ByteBuffer[] OutputBuffers;
		//当前编解码器操作的 输入数据ByteBuffer 和 输出数据ByteBuffer，可以从targetBuffer中获取解码后的PCM数据
		java.nio.ByteBuffer SourceBuffer;
		java.nio.ByteBuffer TargetBuffer;
		//获取输出音频的媒体格式信息
		android.media.MediaFormat OutputFormat;
		android.media.MediaCodec.BufferInfo BufferInfo;

		public void Release()
		{
			DecodeOutputEnd = true;
			Playing = false;
			HasMusic = false;
		}

		public boolean decodeMusicFile(String MusicFileUrl, String DecodeFileUrl, android.content.Context Context)
		{
			DecodeInputEnd = false;
			DecodeOutputEnd = false;
			return decodeMusicFile(MusicFileUrl, DecodeFileUrl, 0, -1, Context);
		}
		/**
		 * 将音乐文件解码
		 * * @param musicFileUrl 源文件路径
		 * @param decodeFileUrl 解码文件路径
		 * @param startMicroseconds 开始时间 微秒
		 * @param endMicroseconds 结束时间 微秒
		 * @param decodeOperateInterface 解码过程回调 */
		private boolean decodeMusicFile(String MusicFileUrl, String DecodeFileUrl, long $StartMicroseconds, long $EndMicroseconds,android.content.Context Context)//, DecodeOperateInterface decodeOperateInterface)
		{
			StartMicroseconds = 0;
			EndMicroseconds = 0;
			//采样率，声道数，时长，音频文件类型
			SampleRate = 0;
			ChannelCount = 0;
			Duration = 0;
			Mime = null;
			//MediaExtractor, MediaFormat, MediaCodec
			MediaExtractor = new android.media.MediaExtractor();
			MediaFormat = null;
			MediaCodec = null;
			//给媒体信息提取器设置源音频文件路径
			try
			{
				if(new java.io.File(MusicFileUrl).isFile())
					MediaExtractor.setDataSource(MusicFileUrl);
				else
				{
					android.content.res.AssetManager AssetsManager = Context.getAssets();
					android.content.res.AssetFileDescriptor AssetsFileDescriptor;
					try
					{
						AssetsFileDescriptor = AssetsManager.openFd(MusicFileUrl);
						MediaExtractor.setDataSource(AssetsFileDescriptor.getFileDescriptor(), AssetsFileDescriptor.getStartOffset(), AssetsFileDescriptor.getLength());
					}
					catch (Exception E)
					{
						ShowAlertMessage(E.toString());
						return false;
					}
				}
			}
			catch (Exception E)
			{
				ShowAlertMessage(E.toString());
			}
			//获取音频格式轨信息
			MediaFormat = MediaExtractor.getTrackFormat(0);
			//从音频格式轨信息中读取 采样率，声道数，时长，音频文件类型
			SampleRate = MediaFormat.containsKey(android.media.MediaFormat.KEY_SAMPLE_RATE) ? MediaFormat.getInteger(android.media.MediaFormat.KEY_SAMPLE_RATE) : 44100;
			ChannelCount = MediaFormat.containsKey(android.media.MediaFormat.KEY_CHANNEL_COUNT) ? MediaFormat.getInteger(android.media.MediaFormat.KEY_CHANNEL_COUNT) : 1;
			Duration = MediaFormat.containsKey(android.media.MediaFormat.KEY_DURATION) ? MediaFormat.getLong(android.media.MediaFormat.KEY_DURATION) : 0;
			Mime = MediaFormat.containsKey(android.media.MediaFormat.KEY_MIME) ? MediaFormat.getString(android.media.MediaFormat.KEY_MIME) : "";
			android.widget.Toast.makeText(Context, "歌曲信息: \n音频类型：" + Mime + "\n采样率：" + SampleRate + "\n声道数：" + ChannelCount + "\n时长：" + Duration, 1).show();
			if (android.text.TextUtils.isEmpty(Mime) || !Mime.startsWith("audio/"))
			{
				ShowAlertMessage("解码文件不是音频文件：" + Mime);
				return false;
			}
			ShowAlertMessage("类型：" + Mime);
			MediaFormat.setString(android.media.MediaFormat.KEY_MIME, Mime);
			if (Duration <= 0)
			{
				ShowAlertMessage("音频文件时长为：" + Duration);
				return false;
			}
			//解码的开始时间和结束时间
			EndMicroseconds = Duration;
			if (StartMicroseconds >= EndMicroseconds)
			{
				ShowAlertMessage("Error Microseconds");
				return false;
			}
			//======创建 ======
			int Frequences = 0;
			if(Frequence <= 0)
				Frequences = SampleRate;
			else
				Frequences = Frequence;
			int BufferSize = android.media.AudioTrack.getMinBufferSize(Frequences, PlayChannelConfig, AudioEncoding);
			if(AudioTrack == null)
				AudioTrack = 
				//new android.media.AudioTrack(AudioManager.STREAM_MUSIC, Frequence, PlayChannelConfig, AudioEncoding, BufferSize, android.media.AudioTrack.MODE_STREAM);
				new android.media.AudioTrack(android.media.AudioManager.STREAM_MUSIC, Frequences, android.media.AudioFormat.CHANNEL_IN_STEREO, android.media.AudioFormat.ENCODING_PCM_16BIT, BufferSize, android.media.AudioTrack.MODE_STREAM);
			//======End======
			//创建一个解码器
			try
			{
				MediaCodec = android.media.MediaCodec.createDecoderByType(Mime);
				MediaCodec.configure(MediaFormat, null, null, 0);
			}
			catch (Exception E)
			{
				ShowAlertMessage("解码器 Configure 出错");
				return false;
			}
			//得到输出PCM文件的路径
			//decodeFileUrl = decodeFileUrl.substring(0, decodeFileUrl.lastIndexOf("."));
			String PcmFilePath = DecodeFileUrl.substring(0, DecodeFileUrl.lastIndexOf(".")) + ".pcm";
			//android.widget.Toast.makeText(Context,pcmFilePath,0).show();

			//后续解码操作
			ShowAlertMessage("以 " + Frequences + " 采样率开始调试解码");
			//初始化解码状态，未解析完成
			DecodeInputEnd = false;
			DecodeOutputEnd = false;
			//当前采样的音频时间，比如在当前音频的第40秒的时候
			PresentationTimeUs = 0;
			//定义编解码的超时时间
			TimeOutUs = 100;
			OutputFormat = MediaCodec.getOutputFormat();
			ByteNumber = (OutputFormat.containsKey("bit-width") ? OutputFormat.getInteger("bit-width") : 0) / 8;
			//开始解码操作
			MediaCodec.start();
			if(AudioTrack != null)
				AudioTrack.play();
			//获取存储输入数据的ByteBuffer数组，输出数据的ByteBuffer数组
			//android.widget.Toast.makeText(Context,":::",0).show();
			InputBuffers = MediaCodec.getInputBuffers();
			OutputBuffers = MediaCodec.getOutputBuffers();
			MediaExtractor.selectTrack(0);
			//当前解码的缓存信息，里面的有效数据在offset和offset+size之间
			BufferInfo = new android.media.MediaCodec.BufferInfo();
			//获取解码后文件的输出流
			//java.io.BufferedOutputStream BufferedOutputStream = null;
			try
			{
				//BufferedOutputStream = new java.io.BufferedOutputStream(new java.io.FileOutputStream(new java.io.File(PcmFilePath/*DecodeFileUrl*/)));
			}
			catch (Exception E)
			{
				ShowAlertMessage(E.toString());
				return false;
			}
			//FileFunction.getBufferedOutputStreamFromFile(decodeFileUrl);

			Playing = true;
			HasMusic = true;
			new java.lang.Thread(new java.lang.Runnable()
			{
				@Override
				public void run()
				{
					Thread.currentThread().setPriority(java.lang.Thread.MIN_PRIORITY);
					android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_URGENT_AUDIO);
					//开始进入循环解码操作，判断读入源音频数据是否完成，输出解码音频数据是否完成
					while (!DecodeOutputEnd)
					{
						if (!Playing)
							while(Playing == false)
								if(!HasMusic || DecodeOutputEnd)
									break;
						if (DecodeInputEnd)
							break;
						try
						{
							//操作解码输入数据
							//从队列中获取当前解码器处理输入数据的ByteBuffer序号
							InputBufferIndex = MediaCodec.dequeueInputBuffer(TimeOutUs);
							if (InputBufferIndex >= 0)
							{
								//取得当前解码器处理输入数据的ByteBuffer
								SourceBuffer = InputBuffers[InputBufferIndex];
								//获取当前ByteBuffer，编解码器读取了多少采样数据
								SampleDataSize = MediaExtractor.readSampleData(SourceBuffer, 0);
								//如果当前读取的采样数据<0，说明已经完成了读取操作
								if (SampleDataSize < 0)
								{
									DecodeInputEnd = true;
									SampleDataSize = 0;
								}
								else
								{
									PresentationTimeUs = MediaExtractor.getSampleTime();
								}
								//然后将当前ByteBuffer重新加入到队列中交给编解码器做下一步读取操作
								MediaCodec.queueInputBuffer(InputBufferIndex, 0, SampleDataSize, PresentationTimeUs, DecodeInputEnd ? android.media.MediaCodec.BUFFER_FLAG_END_OF_STREAM : 0);
								//前进到下一段采样数据
								if (!DecodeInputEnd)
								{
									MediaExtractor.advance();
								}
							}
							else
							{
								//Toast(false, "inputBufferIndex" + inputBufferIndex);
							}
							//操作解码输出数据
							//从队列中获取当前解码器处理输出数据的ByteBuffer序号
							OutputBufferIndex = MediaCodec.dequeueOutputBuffer(BufferInfo, TimeOutUs);
							if (OutputBufferIndex < 0)
							{
								//输出ByteBuffer序号<0，可能是输出缓存变化了，输出格式信息变化了
								switch (OutputBufferIndex)
								{
									case android.media.MediaCodec.INFO_OUTPUT_BUFFERS_CHANGED: OutputBuffers = MediaCodec.getOutputBuffers();
										//android.util.Log.e("", "MediaCodec.INFO_OUTPUT_BUFFERS_CHANGED [AudioDecoder]output buffers have changed.");
									break;
									case android.media.MediaCodec.INFO_OUTPUT_FORMAT_CHANGED: OutputFormat = MediaCodec.getOutputFormat();
										SampleRate = OutputFormat.containsKey(android.media.MediaFormat.KEY_SAMPLE_RATE) ? OutputFormat.getInteger(android.media.MediaFormat.KEY_SAMPLE_RATE) : SampleRate;
										ChannelCount = OutputFormat.containsKey(android.media.MediaFormat.KEY_CHANNEL_COUNT) ? OutputFormat.getInteger(android.media.MediaFormat.KEY_CHANNEL_COUNT) : ChannelCount;
										ByteNumber = (OutputFormat.containsKey("bit-width") ? OutputFormat.getInteger("bit-width") : 0) / 8;
										//Toast(false, "MediaCodec.INFO_OUTPUT_FORMAT_CHANGED [AudioDecoder]output format has changed to " + mediaCodec.getOutputFormat());
									break;
									default:
										//Toast(false, "error [AudioDecoder] dequeueOutputBuffer returned " + outputBufferIndex);
									break;
								}
								continue;
							}
							//取得当前解码器处理输出数据的ByteBuffer
							TargetBuffer = OutputBuffers[OutputBufferIndex];
							byte[] SourceByteArray = new byte[BufferInfo.size];
							//将解码后的TargetBuffer中的数据复制到SourceByteArray中
							TargetBuffer.get(SourceByteArray);
							TargetBuffer.clear();
							//释放当前的输出缓存
							MediaCodec.releaseOutputBuffer(OutputBufferIndex, false);
							//判断当前是否解码数据全部结束了
							if ((BufferInfo.flags & android.media.MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0)
								DecodeOutputEnd = true;
							//sourceByteArray就是最终解码后的采样数据
							//接下来可以对这些数据进行采样位数，声道的转换，但这是可选的，默认是和源音频一样的声道和采样位数
							if (SourceByteArray.length > 0 && /*BufferedOutputStream*/AudioTrack != null)
							{
								if (PresentationTimeUs < StartMicroseconds)
									continue;
								//采样位数转换，按自己需要是否实现
								//byte[] convertByteNumberByteArray = convertByteNumber(byteNumber, Constant.ExportByteNumber, sourceByteArray);
								//声道转换，按自己需要是否实现
								//byte[] resultByteArray = convertChannelNumber(channelCount, Constant.ExportChannelNumber, Constant.ExportByteNumber, convertByteNumberByteArray);
								//将解码后的PCM数据写入到PCM文件
								try
								{
									TestNumber = SourceByteArray.length;
									AudioTrack.write(SourceByteArray, 0, SourceByteArray.length);
									if(Visualizer == null)
										InitVisualizer();
									else if(!Visualizer.getEnabled())
										Visualizer.setEnabled(true);
									//BufferedOutputStream.write(SourceByteArray);
									//bufferedOutputStream.write(resultByteArray);
								}
								catch (Exception E)
								{
									ShowAlertMessage("输出解压音频数据异常：" + E.toString());
									return ;
								}
							}
							if (PresentationTimeUs > EndMicroseconds)
							{
								break;
							}
						}
						catch (Exception E)
						{
							ShowAlertMessage("getDecodeData 异常：" + E);
							return ;
						}
					}

					if (/*BufferedOutputStream*/AudioTrack != null && Playing)
					{
						try
						{
							AudioTrack.stop();
							AudioTrack.release();
							HasMusic = false;
							Playing = false;
							//BufferedOutputStream.close();
						}
						catch (Exception E)
						{
							ShowAlertMessage("释放内存异常：" + E.toString());
							return;
						}
					}
					//重置采样率，按自己需要是否实现
					/*if (sampleRate != Constant.ExportSampleRate)
					{
						Resample(sampleRate, decodeFileUrl);
					}
					notifyProgress(decodeOperateInterface, 100);*/
					//释放mediaCodec 和 mediaExtractor
					if (MediaCodec != null)
					{
						MediaCodec.stop();
						MediaCodec.release();
					}
					if (MediaExtractor != null)
					{
						MediaExtractor.release();
					}
				}
			}).start();
			return true;
		}
	}
}
