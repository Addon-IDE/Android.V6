package com.mcyi.mcaddon.make;

public class AudioVisualizeView extends android.view.View implements java.lang.Runnable
{
	private String AudioVisualizeView;
	private android.content.Context Context;
	private java.lang.Thread MainDrawThread = null;
	private long UpDrawTime = System.currentTimeMillis();
	private long UpDrawFrameRate = 1000 / 60;
	private long ThreadSleepTime = 0;
	public boolean ThreadPowerSave = false;
	private int BufferWidth = 0;
	private int BufferHeight = 0;
	private boolean Flag = false;
	public AudioVisualize AudioVisualize;

	public AudioVisualizeView(android.content.Context $Context, AudioVisualize $AudioVisualize)
	{
		super($Context);
		Context = $Context;
		android.view.WindowManager WindowManager = (android.view.WindowManager) Context.getSystemService(Context.WINDOW_SERVICE);
		android.view.Display Display = WindowManager.getDefaultDisplay();
		android.graphics.Point Point = new android.graphics.Point();
		if (android.os.Build.VERSION.SDK_INT >= 19)
			Display.getRealSize(Point);
		else
			Display.getSize(Point);
		int ScreenWidth = Point.x;//DisplayMetrics.widthPixels;
		int ScreenHeight = Point.y;//DisplayMetrics.heightPixels;
		ScreenWidth = Math.min(Point.x, Point.y);
		ScreenHeight = Math.max(Point.x, Point.y);
		BufferWidth = ScreenWidth - (int) (ScreenWidth * 0.35f);
		BufferHeight = BufferWidth;
		AudioVisualize = $AudioVisualize;
		setLayerType(android.view.View.LAYER_TYPE_HARDWARE, null);
		if(AudioVisualizeView == null)
		{
			AudioVisualizeView = "View";
			MainDrawThread = new java.lang.Thread(this);
			MainDrawThread.setPriority(java.lang.Thread.MIN_PRIORITY); // 1
			Flag = true;
			MainDrawThread.start();
		}
		else
			Flag = true;
	}

	@Override
	protected void onDraw(android.graphics.Canvas Canvas)
	{
		/*if(Fft != null && !Fft.IsInformation())
			Canvas.clipRect(new android.graphics.Rect((getWidth() >> 1) - (BufferWidth >> 1), (getHeight() >> 1) - (BufferHeight >> 1), ((getWidth() >> 1) - (BufferWidth >> 1)) + BufferWidth, ((getHeight() >> 1) - (BufferHeight >> 1)) + BufferHeight));
		*/
		super.onDraw(Canvas);
		if(AudioVisualize != null)
			AudioVisualize.Draw(Canvas, getWidth(), getHeight());
	}

	public void UpDraw()
	{
		if(AudioVisualize != null)
		{
			if(AudioVisualize.IsInformation())
				postInvalidate();
			else
				postInvalidate((getWidth() >> 1) - (BufferWidth >> 1), (getHeight() >> 1) - (BufferHeight >> 1), ((getWidth() >> 1) - (BufferWidth >> 1)) + BufferWidth, ((getHeight() >> 1) - (BufferHeight >> 1)) + BufferHeight);
		}
	}

	public void SetFPS(AudioVisualize $Fft, long $FrameRate)
	{
		if(AudioVisualize == $Fft)
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
			{}
			finally
			{
				WorkIsNotFinish = false;
			}
		}
		MainDrawThread = null;
		AudioVisualize = null;
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
					postInvalidate();
					/*if(Fft != null && Fft.IsInformation())
						postInvalidate();
					else
						postInvalidate((getWidth() / 2) - (BufferWidth / 2), (getHeight() / 2) - (BufferHeight / 2), ((getWidth() / 2) - (BufferWidth / 2)) + BufferWidth, ((getHeight() / 2) - (BufferHeight / 2)) + BufferHeight);
					*/
				}
				Thread.sleep(1);
			}
		}catch(Exception E){}
		return;
	}

	@Override
	protected void onDetachedFromWindow()
	{
		Stop();
		super.onDetachedFromWindow();
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
}
