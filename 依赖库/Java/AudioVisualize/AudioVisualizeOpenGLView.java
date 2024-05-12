package com.mcyi.mcaddon.make;

public class AudioVisualizeOpenGLView extends android.opengl.GLSurfaceView
{
	private String AudioVisualizeOpenGLView;
	private boolean Flag;
	private android.content.Context Context;
	private int ScreenWidth;
	private int ScreenHeight;
	private int BufferWidth, BufferHeight;

	public AudioVisualize AudioVisualize;

	private float getScreenDensityForNewSize(float ParamSize)
	{
		return ((float) ScreenWidth) * (ParamSize / 1080);
	}

	public AudioVisualizeOpenGLView(android.content.Context $Context, AudioVisualize $AudioVisualize)
	{
		super($Context);
		Context = $Context;
		AudioVisualize = $AudioVisualize;
		Context = $Context;
		android.content.res.Resources Resources = $Context.getResources();
		android.util.DisplayMetrics DisplayMetrics = Resources.getDisplayMetrics();
		ScreenWidth = DisplayMetrics.widthPixels;
		ScreenHeight = DisplayMetrics.heightPixels;
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

	@Override
	protected void onDetachedFromWindow()
	{
		super.onDetachedFromWindow();
	}

	@Override
	public void surfaceChanged(android.view.SurfaceHolder SurfaceHolder, int Format, int Width, int Height)
	{
		super.surfaceChanged(SurfaceHolder, Format, Width, Height);
		ScreenWidth = Width;
		ScreenHeight = Height;
	}
}
