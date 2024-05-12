package com.mcyi.mcaddon.make;

public class ExceptionHandler implements Thread.UncaughtExceptionHandler
{
	public static ExceptionHandler ExceptionHandler;
	
	private android.content.Context Context;
	
	private Thread.UncaughtExceptionHandler UncaughtExceptionHandler;

	public ExceptionHandler(android.content.Context $Context)
	{
		this.Context = $Context;
		UncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
		Thread.setDefaultUncaughtExceptionHandler(this);
	}

	public static ExceptionHandler getExceptionHandler(android.content.Context Context)
	{
		if(ExceptionHandler == null && Context != null)
		{
			synchronized(ExceptionHandler.class)
			{
				ExceptionHandler = new ExceptionHandler(Context);
			}
		}
		return ExceptionHandler;
	}

	@Override
	public void uncaughtException(Thread Thread, Throwable Throwable)
	{
		if(!HandleException(Throwable) && UncaughtExceptionHandler != null)
		{
			UncaughtExceptionHandler.uncaughtException(Thread, Throwable);
		}
	}

	private boolean HandleException(final Throwable Throwable)
	{
		if(Throwable == null)
			return false;
		
		/*new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					ShowAlertMessage(getMessage, 1);
					android.app.AlertDialog.Builder AlertDialog;
					AlertDialog = new android.app.AlertDialog.Builder(Context, R.style.Dialog);
					AlertDialog.setTitle("运行崩溃");
					AlertDialog.setMessage(Information);
					AlertDialog.setPositiveButton("确定", null);
					AlertDialog.setCancelable(true);
					AlertDialog.create();
					AlertDialog.show();
				}
				catch(Throwable $Throwable)
				{
				}
			}
		});*/
		new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					final String getMessage = Throwable.getMessage();
					final String Information = getCrashInformation(Throwable);
					android.os.Looper.prepare();
					ShowAlertMessage(getMessage, 1);
					ShowAlertDialog(Information, Context);
					android.os.Looper.loop();
				}
				catch(Throwable $Throwable) {}
			}
		}).start();
		return true;
	}

	public void ShowAlertMessage(String Message, int Time)
	{
		if(Context != null && Message != null)
			android.widget.Toast.makeText(Context, Message, Time).show();
	}

	public void ShowAlertDialog(String Message, android.content.Context Context)
	{
		if(Context != null && Message != null)
		{
			android.app.AlertDialog.Builder AlertDialog;
			AlertDialog = new android.app.AlertDialog.Builder(Context);
			AlertDialog.setTitle("运行错误");
			AlertDialog.setMessage(Message);
			AlertDialog.setPositiveButton("确定", null);
			AlertDialog.setCancelable(true);
			AlertDialog.create();
			AlertDialog.show();
		}
	}

	private String getCrashInformation(Throwable Throwable)
	{
		String Information = "114514";
		if(Throwable == null)
			return Information;
		java.io.Writer Writer = new java.io.StringWriter();
		java.io.PrintWriter PrintWriter = new java.io.PrintWriter(Writer);
		PrintWriter.append("Android 版本：");
		PrintWriter.append(android.os.Build.VERSION.RELEASE);
		PrintWriter.append('\n');
		PrintWriter.append("Android SDK：");
		PrintWriter.append(android.os.Build.VERSION.SDK);
		PrintWriter.append('\n');
		PrintWriter.append("设备型号：");
		PrintWriter.append(android.os.Build.MODEL);
		PrintWriter.append('\n');
		PrintWriter.append("CPU ABI：");
		PrintWriter.append(android.os.Build.CPU_ABI);
		PrintWriter.append('\n');
		PrintWriter.append('\n');
		PrintWriter.append("错误信息：");
		Throwable.printStackTrace(PrintWriter);
		Throwable ThrowableCause = Throwable.getCause();
		while (ThrowableCause != null)
		{
			ThrowableCause.printStackTrace(PrintWriter);
			ThrowableCause = ThrowableCause.getCause();
		}
		PrintWriter.close();
		return Information = Writer.toString();
	}

	public void Release()
	{
		Context = null;
		ExceptionHandler = null;
		Thread.setDefaultUncaughtExceptionHandler(UncaughtExceptionHandler);
	}
}

