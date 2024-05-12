package com.mcyi.mcaddon.make;

public class TileService extends android.service.quicksettings.TileService
{
	public static boolean Enable = false;
	private TileStateReceiver TileStateReceiver;

	public static boolean getEnable(android.content.Context Context)
	{
		return LocalDataUtil.getBooleanData(Context, "AudioVisualizeSetting", "EnableTile");
	}

	private void SetEnable(boolean $Enable)
	{
		Enable = $Enable;
		LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "EnableTile", Enable);
	}

	public static void SetTileState(android.content.Context Context, boolean State)
	{
		android.content.Intent Intent = new android.content.Intent("com.mcyi.mcaddon.make.TileState");
		Intent.putExtra("TileState", State);
		Context.sendBroadcast(Intent);
	}

	// 当用户从快速设置编辑栏添加到快速设置中调用
	@Override
	public void onTileAdded()
	{
		super.onTileAdded();
	}
	
	// 当用户从快速设置编辑栏中移除的时候调用
	@Override
	public void onTileRemoved()
	{
		super.onTileRemoved();
		SetEnable(false);
		FloatingWindowService.StopFloatingWindowService(getApplicationContext());
		stopSelf();
	}

	@Override
	public void onCreate()
	{
		super.onCreate();
		CreateTileStateReceiver();
	}

	public static int Code = 0;
	@Override
	public int onStartCommand(android.content.Intent Intent, int Flags, int StartId)
	{
		Code++;
		return super.onStartCommand(Intent, Flags, StartId);
	}

	// 点击时
	@Override
	public void onClick()
	{
		super.onClick();
		
		if(!android.provider.Settings.canDrawOverlays(getApplicationContext()))
		{
			android.content.Intent Intent = new android.content.Intent(getApplicationContext(), SplashActivity.class);
			Intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
			startActivity(Intent);
			return;
		}
		
		int State = getQsTile().getState();
		if (State == android.service.quicksettings.Tile.STATE_INACTIVE)
		{
			SetEnable(true);
			// 更改成活跃状态
			getQsTile().setState(android.service.quicksettings.Tile.STATE_ACTIVE);
			FloatingWindowService.Start(getApplicationContext());
		}
		else
		{
			SetEnable(false);
			// 更改成非活跃状态
			getQsTile().setState(android.service.quicksettings.Tile.STATE_INACTIVE);
			FloatingWindowService.StopFloatingWindowService(getApplicationContext());
		}
		//getQsTile().setIcon(android.graphics.drawable.Icon.createWithResource(getApplicationContext(), R.drawable.svg_ic_launcher));
		getQsTile().updateTile();
	}

	// 打开下拉菜单的时候调用，当快速设置按钮并没有在编辑栏拖到设置栏中不会调用
	// 在 TleAdded 之后会调用一次
	@Override
	public void onStartListening()
	{
		super.onStartListening();
		SetTileState(getApplicationContext(), FloatingWindowService.Active);
	}
	// 关闭下拉菜单的时候调用，当快速设置按钮并没有在编辑栏拖到设置栏中不会调用
	// 在 onTileRemoved 移除之前也会调用移除
	@Override
	public void onStopListening()
	{
		super.onStopListening();
		SetTileState(getApplicationContext(), FloatingWindowService.Active);
	}

	private void CreateTileStateReceiver()
	{
		if(TileStateReceiver == null)
		{
			TileStateReceiver = new TileStateReceiver();
			android.content.IntentFilter IntentFilter = new android.content.IntentFilter();
			IntentFilter.addAction("com.mcyi.mcaddon.make.TileState");
			registerReceiver(TileStateReceiver, IntentFilter);
		}
	}

	public class TileStateReceiver extends android.content.BroadcastReceiver
	{
		@Override
		public void onReceive(android.content.Context Context, android.content.Intent Intent)
		{
			if (Intent == null)
				return;
			if(Intent.getAction() != null && Intent.getAction().equals("com.mcyi.mcaddon.make.TileState"))
			{
				if(Intent.getExtras().getBoolean("TileState"))
				{
					SetEnable(true);
					getQsTile().setState(android.service.quicksettings.Tile.STATE_ACTIVE);
				}
				else
				{
					SetEnable(false);
					getQsTile().setState(android.service.quicksettings.Tile.STATE_INACTIVE);
				}
				getQsTile().updateTile();
			}
		}
	}

	@Override
	public void onDestroy()
	{
		unregisterReceiver(TileStateReceiver);
		stopSelf();
		super.onDestroy();
	}
}

