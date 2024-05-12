package com.mcyi.mcaddon.make;


public class AudioVisualizeSurfaceView extends android.view.SurfaceView implements android.view.SurfaceHolder.Callback, java.lang.Runnable
{
	private String AudioVisualizeSurfaceView;
	private boolean Flag;
	private android.content.Context Context;
	private android.graphics.Canvas Canvas;
	private android.graphics.Paint Paint;
	private java.lang.Thread MainDrawThread = null;
	private long UpDrawTime = -1;
	private long UpDrawFrameRate = 1000 / 60;
	private long ThreadSleepTime = 0;
	public boolean ThreadPowerSave = false;
	private int ScreenWidth;
	private int ScreenHeight;
	private android.view.SurfaceHolder SurfaceHolder;
	private int BufferWidth, BufferHeight;
	private boolean IsHardWareCanvas = true;
	// SDK >= 29，反射系统类被严格限制不可用，因此弃用反射方法
	//private java.lang.reflect.Method LockHardwareCanvas = null;

	public AudioVisualize AudioVisualize;

	private float getScreenDensityForNewSize(float ParamSize)
	{
		return ((float) ScreenWidth) * (ParamSize / 1080);
	}

	public AudioVisualizeSurfaceView(android.content.Context $Context, AudioVisualize $AudioVisualize)
	{
		super($Context);
		Context = $Context;
		AudioVisualize = $AudioVisualize;
		setZOrderOnTop(true);
		if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.HONEYCOMB)
		{
			setLayerType(android.view.View.LAYER_TYPE_HARDWARE, null);
			getHolder().setType(android.view.SurfaceHolder.SURFACE_TYPE_HARDWARE | android.view.SurfaceHolder.SURFACE_TYPE_GPU | android.view.SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
		}
		getHolder().setFormat(android.graphics.PixelFormat.TRANSPARENT);
		SurfaceHolder = getHolder();
		SurfaceHolder.addCallback(this);
		setFocusable(true);
		setKeepScreenOn(true);
		
		// SDK >= 29，反射系统类被严格限制不可用，因此弃用反射方法
		/*if(android.os.Build.VERSION.SDK_INT >= 23 && LockHardwareCanvas == null)
		{
			try
			{
				LockHardwareCanvas = SurfaceHolder.getSurface().getClass().getDeclaredMethod("lockHardwareCanvas");
				LockHardwareCanvas.setAccessible(true);
			}
			catch(Exception E){}
			IsHardWareCanvas = true;
		}*/
		if(android.os.Build.VERSION.SDK_INT >= 23)
			IsHardWareCanvas = true;
	}

	private void ShowAlertMessage(String Message)
	{
		if(Context != null)
			android.widget.Toast.makeText(Context, Message, 0).show();
	}

	private void init()
	{
		/*if(getWidth() > getHeight())
		{
			ScreenWidth = getHeight();
			ScreenHeight = getWidth();
		}
		else
		{
			ScreenWidth = getWidth();
			ScreenHeight = getHeight();
		}*/
		BufferWidth = ScreenWidth - (int) (ScreenWidth * 0.35f);
		BufferHeight = BufferWidth;
		Paint = new android.graphics.Paint();
		Paint.setAntiAlias(true);
		Paint.setARGB(255, 250, 220, 190);
		Paint.setTextSize(getScreenDensityForNewSize(38f));
		AudioVisualizeSurfaceView = "AudioVisualizeSurfaceView";
	}

	
	private void Draw()
	{
		try
		{
			synchronized(SurfaceHolder.getSurface())
			{
				// SDK >= 29，反射系统类被严格限制不可用，因此弃用反射方法
				/*if(IsHardWareCanvas && LockHardwareCanvas != null)
				{
					try
					{
						Canvas = (android.graphics.Canvas) LockHardwareCanvas.invoke(SurfaceHolder.getSurface());
						if(Canvas == null)
							IsHardWareCanvas = false;
					}
					catch(Exception E){}
				}
				*/
				if(IsHardWareCanvas)
					Canvas = SurfaceHolder.getSurface().lockHardwareCanvas();
				else
				{
					//if(AudioVisualize != null && AudioVisualize.IsInformation())
						Canvas = SurfaceHolder.getSurface().lockCanvas(null);
					/*else
						Canvas = SurfaceHolder.getSurface().lockCanvas(new android.graphics.Rect((getWidth() >> 1) - (BufferWidth >> 1), (getHeight() >> 1) - (BufferHeight >> 1), ((getWidth() >> 1) - (BufferWidth >> 1)) + BufferWidth, ((getHeight() >> 1) - (BufferHeight >> 1)) + BufferHeight));
					*/
				}
				if(Canvas == null)
					return;
				//Canvas.setDrawFilter(PaintFlagsDrawFilter);
				Canvas.drawColor(android.graphics.Color.TRANSPARENT, android.graphics.PorterDuff.Mode.CLEAR);
				if(AudioVisualize != null)
					AudioVisualize.Draw(Canvas, getWidth(), getHeight());
			}
		}
		catch(Exception E)
		{
			//Toast(true, E);
		}
		finally
		{
			if(Canvas != null && SurfaceHolder != null)
				SurfaceHolder.getSurface().unlockCanvasAndPost(Canvas);
			Canvas = null;
		}
	}

	public void Stop()
	{
		Flag = false;
		boolean WorkIsNotFinish = true;
		while(WorkIsNotFinish)
		{
			try
			{
				MainDrawThread.join();
				MainDrawThread.currentThread().interrupt();
			}
			catch (Exception E)
			{
				ShowAlertMessage(E.toString());
			}
			finally
			{
				SurfaceHolder.getSurface().release();
				Context = null;
				Canvas = null;
				WorkIsNotFinish = false;
			}
		}
		MainDrawThread = null;
		AudioVisualize = null;
	}

	@Override
	public boolean onKeyDown(int KeyCode, android.view.KeyEvent KeyEvent)
	{
		AudioVisualize.onKeyDown(KeyCode, KeyEvent);
		return super.onKeyDown(KeyCode, KeyEvent);
	}

	@Override
	public boolean onTouchEvent(android.view.MotionEvent MotionEvent)
	{
		return AudioVisualize.onTouchEvent(MotionEvent);
	}

	public void SetFPS(AudioVisualize $AudioVisualize, long $FrameRate)
	{
		if(AudioVisualize == $AudioVisualize)
		{
			long FrameRate = $FrameRate;
			if(FrameRate > 120)
				FrameRate = 120;
			else if(FrameRate < 60)
				FrameRate = 60;
			UpDrawFrameRate = 1000 / FrameRate;
		}
	}

	public void PowerSave(boolean IsPowerSave)
	{
		//====== 修改线程休眠时长达到省电的目的 ======
		ThreadPowerSave = IsPowerSave;
		if(IsPowerSave)
			ThreadSleepTime = 41;
		else
			ThreadSleepTime = 0;
	}

	@Override
	public void run()
	{
		try
		{
			android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_URGENT_DISPLAY); // -19
			while (Flag)
			{
				if(System.currentTimeMillis() >= UpDrawTime)
				{
					UpDrawTime = System.currentTimeMillis() + UpDrawFrameRate + ThreadSleepTime;
					Draw();
				}
				Thread.sleep(1);
			}
		}
		catch(Exception E){}
		return;
	}

	@Override
	protected void onDetachedFromWindow()
	{
		Stop();
		super.onDetachedFromWindow();
	}

	@Override
	public void surfaceChanged(android.view.SurfaceHolder SurfaceHolder, int Format, int Width, int Height)
	{
	}

	@Override
	public void surfaceCreated(android.view.SurfaceHolder SurfaceHolder)
	{
		ScreenWidth = getWidth();
		ScreenHeight = getHeight();
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
		if(AudioVisualizeSurfaceView == null)
		{
			init();
			MainDrawThread = new java.lang.Thread(this);
			MainDrawThread.setPriority(java.lang.Thread.MIN_PRIORITY); // 1
			Flag = true;
			MainDrawThread.start();
		}
		else
			Flag = true;
	}

	public android.view.SurfaceHolder getSurfaceHolder()
	{
		return SurfaceHolder != null ? SurfaceHolder : null;
	}

	@Override
	public void surfaceDestroyed(android.view.SurfaceHolder SurfaceHolder)
	{
		if(MainDrawThread != null)
		{
			Stop();
			//AudioVisualize.Stop();
		}
		Flag = false;
	}
}
