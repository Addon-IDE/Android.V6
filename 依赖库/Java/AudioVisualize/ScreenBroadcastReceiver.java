package com.mcyi.mcaddon.make;

public class ScreenBroadcastReceiver extends android.content.BroadcastReceiver
{
	public static ScreenBroadcastReceiver ScreenBroadcastReceiver;
	
	public static void unregisterListener(android.content.Context Context)
	{
		Context.unregisterReceiver(ScreenBroadcastReceiver);
	}
	
	public static void registerReceiver(android.content.Context Context)
	{
		ScreenBroadcastReceiver = new ScreenBroadcastReceiver();
		android.content.IntentFilter IntentFilter = new android.content.IntentFilter();
		IntentFilter.addAction(android.content.Intent.ACTION_SCREEN_ON);
		IntentFilter.addAction(android.content.Intent.ACTION_SCREEN_OFF);
		IntentFilter.addAction(android.content.Intent.ACTION_USER_PRESENT);
		Context.registerReceiver(ScreenBroadcastReceiver, IntentFilter);
	}

	public boolean IsForegroundActive(android.content.Context Context)
	{
		return LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "ForegroundActive");
	}

	@Override
	public void onReceive(android.content.Context Context, android.content.Intent Intent)
	{
		/*if (!IsForegroundActive(Context))
			return;*/
		String Action = Intent.getAction();
		if (android.content.Intent.ACTION_SCREEN_ON.equalsIgnoreCase(Action))
		{
			FloatingWindowService.Stop(Context);
		}
		else if (android.content.Intent.ACTION_SCREEN_OFF.equalsIgnoreCase(Action))
		{
			FloatingWindowService.Start(Context);
		}
		else if (android.content.Intent.ACTION_USER_PRESENT.equalsIgnoreCase(Action))
		{
			//FloatingWindowService.Start(Context);
		}
	}
}

