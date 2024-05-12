package com.mcyi.mcaddon.make;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Window;
import android.view.WindowManager;

public class AudioVisualizeActivity extends android.app.Activity implements android.widget.AdapterView.OnItemClickListener, ListContentAdapter.OnCheckedChangedListener, ListContentAdapter.OnSeekBarChangeListener, android.view.View.OnClickListener, android.widget.SeekBar.OnSeekBarChangeListener, android.widget.CompoundButton.OnCheckedChangeListener
{
	private android.widget.EditText Path;
	private android.widget.ListView ListView;
	private ListContentAdapter ListContentAdapter;
	private AudioVisualize AudioVisualize = AudioVisualizeUsers.AudioVisualize;
	//private int CreateScreen = -1;
	private boolean IsInit = false;

	@Override
	protected void onCreate(android.os.Bundle Bundle)
	{
		super.onCreate(Bundle);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

		ExceptionHandler.getExceptionHandler(AudioVisualizeActivity.this);
		//setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
		//requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
		getWindow().setFlags(android.view.WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED, android.view.WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED);
		getWindow().setBackgroundDrawable(null);
		setContentView(R.layout.AudioVisualize_main_activity);
		getWindow().setBackgroundDrawable(new ColorDrawable(Color.BLACK));
		try
		{
			/*android.content.pm.PackageManager PackageManager = getApplicationContext().getPackageManager();
			android.content.pm.PackageInfo PackageInfo = PackageManager.getPackageInfo(getApplicationContext().getPackageName(), 0);
			int Code = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "VersionCode");
			if(Code < 0 || Code != PackageInfo.versionCode)
			{
				LocalDataUtil.ClearData(getApplicationContext(), "AudioVisualizeSetting");
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "VersionCode", PackageInfo.versionCode);
			}*/
			//if(!FloatingWindowService.Active)
				/*if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O)
					startForegroundService(new android.content.Intent(getApplicationContext(), FloatingWindowService.class));
				else
					startService(new android.content.Intent(getApplicationContext(), FloatingWindowService.class));
			*/
			AudioVisualizeUsers.Context = getApplicationContext();
			AudioVisualizeUsers.CreateWaveLock();
			//AudioVisualizeUsers.ignoreBatteryOptimization(this);
			AudioVisualizeUsers.InitNewAudioVisualize(this);
			AudioVisualizeUsers.SetAudioVisualize();
			AudioVisualize = AudioVisualizeUsers.AudioVisualize;
			
			InitAudioVisualize();
			
			//======Start 申请权限======
			//======Min：Android 4.3+ ; Max：Android5.0 的权限判断======
			if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.KITKAT && android.os.Build.VERSION.SDK_INT <= 21)
			{
				android.app.AppOpsManager AppOpsManager = (android.app.AppOpsManager) getBaseContext().getSystemService(android.content.Context.APP_OPS_SERVICE);
				if(AppOpsManager != null)
				{
					java.lang.reflect.Method NoteOpNoThrow = android.app.AppOpsManager.class.getDeclaredMethod("noteOpNoThrow", Integer.TYPE, Integer.TYPE, String.class);
					NoteOpNoThrow.setAccessible(true);
					int noteOp = (int) NoteOpNoThrow.invoke(AppOpsManager, 24, android.os.Process.myUid(), getApplicationContext().getPackageName());
					if (noteOp == AppOpsManager.MODE_ALLOWED) {
                        ShowAlertMessage("已允许申请悬浮窗权限");
                    } else if (noteOp == AppOpsManager.MODE_IGNORED) {
                        ShowAlertMessage("申请悬浮窗权限被拒");
                    } else if (noteOp == AppOpsManager.MODE_ERRORED) {
                        ShowAlertMessage("申请悬浮窗权限出错");
                    } else if (noteOp == 4) {
                        ShowAlertMessage("请允许申请悬浮窗权限");
                    }
				}
			}
			
			if(android.os.Build.VERSION.SDK_INT < 23)
			{
				AudioVisualizeUsers.InitWindow();
				return;
			}
			
			if(android.os.Build.VERSION.SDK_INT >= 23)
				AskPermission();
			
			//====== Android 9+ 需要额外申请录音权限 （不清楚这是什么东西随便写的）======
			if (android.os.Build.VERSION.SDK_INT >= 29)
				startActivity(new android.content.Intent().setClassName("com.android.systemui", "com.android.systemui.media.MediaProjectionPermissionActivity"));
			//======End======
			
			//====== Android 6.0 在此判断悬浮窗权限后初始化 ======
			if(android.os.Build.VERSION.SDK_INT >= 23 && !android.provider.Settings.canDrawOverlays(getApplicationContext()))
			{
				android.app.AlertDialog.Builder AlertDialog = new android.app.AlertDialog.Builder(AudioVisualizeActivity.this);
				AlertDialog.setMessage("未授予悬浮窗权限，去授予权限？");
				AlertDialog.setPositiveButton("确定", new android.content.DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(android.content.DialogInterface DialogInterface, int Index)
					{
						startActivityForResult(new android.content.Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION, android.net.Uri.parse("package:" + getPackageName())), 0);
					}
				});
				AlertDialog.setNegativeButton("取消", null);
				AlertDialog.setCancelable(true);
				AlertDialog.create();
				AlertDialog.show();
			}
			else if(android.os.Build.VERSION.SDK_INT >= 23 && android.provider.Settings.canDrawOverlays(getApplicationContext()))
				AudioVisualizeUsers.InitWindow();
			
			ScreenBroadcastReceiver.registerReceiver(getApplicationContext());
		}
		catch(Exception E)
		{
			E.printStackTrace();
			ShowAlertMessage(E.getMessage());
		}
	}


	private void InitAudioVisualize()
	{
		if(IsInit)
			return;
		IsInit = true;
		//======Start 设置 AudioVisualize 属性======
		AudioVisualizeUsers.SetAudioVisualize();

		//======End======
		
		//======Start 获取控件以及设置事件======
		Path = findViewById(R.id.Path);
		((android.view.View) findViewById(R.id.Rest)).setOnClickListener(this);
		((android.view.View) findViewById(R.id.Pause)).setOnClickListener(this);
		((android.view.View) findViewById(R.id.Start)).setOnClickListener(this);
		((android.view.View) findViewById(R.id.Rest)).setOnClickListener(this);

		//======End======


		ListView = findViewById(R.id.ListView);
		ListView.setDividerHeight(0);
		ListView.setBackgroundColor(0);
		java.util.List<ListItemContent> List = new java.util.ArrayList<ListItemContent>();
		
		ListItemContent ItemContent;
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.TITLE;
		ItemContent.Title = "调试选项";
		List.add(ItemContent);*/
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "显示帧率";
		//ItemContent.Description = "显示当前的动画帧率";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ShowFPS");
		ItemContent.Id = Id.ShowFPS;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "显示调试信息";
		//ItemContent.Description = "显示各类调试信息";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ShowInformation");
		ItemContent.Id = Id.ShowInformation;
		List.add(ItemContent);
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "绘制拖影";
		//ItemContent.Description = "为动画增加拖影效果";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "IsDrawSmear");
		ItemContent.Id = Id.DrawSmear;
		List.add(ItemContent);*/
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.TITLE;
		ItemContent.Title = "绘制选项";
		List.add(ItemContent);*/
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "开启极致色彩";
		//ItemContent.Description = "为动画渲染色彩";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "CycleColor");
		ItemContent.Id = Id.CycleColor;
		List.add(ItemContent);*/
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "为波形开启极致色彩";
		//ItemContent.Description = "为波形动画渲染色彩";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "CycleColorForWave");
		ItemContent.Id = Id.OpenCycleColorForWave;
		List.add(ItemContent);*/
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION;
		ItemContent.Title = "绘制控件";
		int DrawView = LocalDataUtil.getIntegerData(AudioVisualizeActivity.this, "AudioVisualizeSetting", "DrawView");
		switch(DrawView)
		{
			case 1:
				ItemContent.Description = "View";
			break;
			case 2:
				ItemContent.Description = "SurfaceView";
			break;
			case 3:
				ItemContent.Description = "OpenGLView";
			break;
			case -1:
				ItemContent.Description = "View";
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DrawView", 1);
			break;
		}
		ItemContent.Id = Id.DrawView;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION;
		ItemContent.Title = "绘制动效";
		int DrawMode = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DrawMode");
		switch(DrawMode)
		{
			case 1:
				ItemContent.Description = "绘制一";
			break;
			case 2:
				ItemContent.Description = "绘制二";
			break;
			case 3:
				ItemContent.Description = "绘制三";
			break;
			case 4:
				ItemContent.Description = "绘制四";
			break;
			case 5:
				ItemContent.Description = "绘制五";
			break;
			case 6:
				ItemContent.Description = "绘制六";
			break;
			case 7:
				ItemContent.Description = "绘制七";
			break;
			case 8:
				ItemContent.Description = "绘制八";
			break;
			case -1:
				ItemContent.Description = "绘制一";
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DrawMode", 1);
			break;
		}
		ItemContent.Id = Id.DrawMode;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM;
		ItemContent.Title = "副绘制";
		ItemContent.Id = Id.SecondaryDrawMode;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "音量缩放";
		ItemContent.Description = "设置 Fft 数据增幅倍率";
		ItemContent.HasSeekBar = true;
		ItemContent.Progress = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DataVolumeAdjustmentScale");
		if(ItemContent.Progress < 0)
			ItemContent.Progress = 1;
		if(ItemContent.Progress > 2)
			ItemContent.Progress = 2;
		ItemContent.OffsetProgress = 1;
		ItemContent.MinProgress = 1;
		ItemContent.MaxProgress = 2;
		ItemContent.Id = Id.DataVolumeAdjustmentScale;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "帧率限制";
		ItemContent.Description = "设置动画的最大帧率";
		ItemContent.HasSeekBar = true;
		ItemContent.Progress = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "FrameRate");
		if(ItemContent.Progress < 0)
			ItemContent.Progress = 0;
		if(ItemContent.Progress > 60)
			ItemContent.Progress = 60;
		ItemContent.OffsetProgress = 60;
		ItemContent.MinProgress = 0;
		ItemContent.MaxProgress = 60;
		ItemContent.Id = Id.FrameRateControl;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "平滑率";
		ItemContent.Description = "设置动画的平滑率";
		ItemContent.HasSeekBar = true;
		ItemContent.Progress = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "AnimationSmoothRate");
		if(ItemContent.Progress < 0)
			ItemContent.Progress = 0;
		if(ItemContent.Progress > 10)
			ItemContent.Progress = 10;
		ItemContent.MinProgress = 0;
		ItemContent.MaxProgress = 10;
		ItemContent.Id = Id.AnimationSmoothRateControl;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "最小视图透明度";
		ItemContent.Description = "当没有音频数据可捕获时，就将视图的透明度减小到此值。（推荐值：0）";
		ItemContent.HasSeekBar = true;
		ItemContent.Progress = LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "MinViewAlpha");
		if(ItemContent.Progress < 0)
			ItemContent.Progress = 127;
		if(ItemContent.Progress > 255)
			ItemContent.Progress = 255;
		ItemContent.MinProgress = 0;
		ItemContent.MaxProgress = 255;
		ItemContent.Id = Id.MinViewAlphaControl;
		List.add(ItemContent);
		
		/*ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.TITLE;
		ItemContent.Title = "其他";
		List.add(ItemContent);*/
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "音频震动";
		ItemContent.Description = "根据频谱控制设备震动。";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "EnableVibrator");
		ItemContent.Id = Id.EnableVibrator;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM_WITH_DESCRIPTION_AND_FEATURES;
		ItemContent.Title = "应用保活";
		ItemContent.Description = "启动一个前台服务保持应用存活";
		ItemContent.HasSwitch = true;
		ItemContent.IsChecked = LocalDataUtil.getBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ForegroundActive");
		if(ItemContent.IsChecked)
			FloatingWindowService.Start(getApplicationContext());
		else
			FloatingWindowService.Stop(getApplicationContext());
		ItemContent.Id = Id.ForegroundActive;
		List.add(ItemContent);
		
		ItemContent = new ListItemContent();
		ItemContent.ItemContent = ListItemContent.Item.ITEM;
		ItemContent.Title = "关于";
		ItemContent.Id = Id.About;
		List.add(ItemContent);
		
		
		ListContentAdapter = new ListContentAdapter(AudioVisualizeActivity.this, List);
		ListContentAdapter.setOnCheckedChangedListener(this);
		ListContentAdapter.setOnSeekBarChangeListener(this);
		ListView.setOnItemClickListener(this);
		ListView.setAdapter(ListContentAdapter);
		
	}

	@Override
	public void onItemClick(android.widget.AdapterView<?> Parent, android.view.View View, int Position, long Id)
	{
		View.performHapticFeedback(android.view.HapticFeedbackConstants.KEYBOARD_PRESS, android.view.HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING);
		
		final ListItemContent ItemContent = ListContentAdapter.getListItemContent(Position);
		android.app.AlertDialog.Builder AlertDialog;
		switch(ItemContent.Id)
		{
			case com.mcyi.mcaddon.make.Id.About:
				try
				{
					android.os.Vibrator Vibrator = (android.os.Vibrator) getApplicationContext().getSystemService(android.app.Service.VIBRATOR_SERVICE);
					long StartTime = System.currentTimeMillis();
					android.os.VibrationEffect VibrationEffect = android.os.VibrationEffect.createOneShot(1, android.os.VibrationEffect.DEFAULT_AMPLITUDE);
					Vibrator.vibrate(VibrationEffect);
					long EndTime = System.currentTimeMillis() - StartTime;
					ShowAlertMessage("震动占用线程时间：" + EndTime);
				}
				catch(Exception E)
				{
					E.printStackTrace();
				}
				displayBriefMemory();
			break;
			
			
			case com.mcyi.mcaddon.make.Id.DrawMode:
				final String[] DrawModeList = {"关闭", "绘制一", "绘制二", "绘制三", "绘制四", "绘制五", "绘制六", "绘制七", "绘制八"};
				AlertDialog = new android.app.AlertDialog.Builder(AudioVisualizeActivity.this);
				AlertDialog.setTitle("绘制动效");
				AlertDialog.setSingleChoiceItems(DrawModeList, LocalDataUtil.getIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DrawMode"), new android.content.DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(android.content.DialogInterface DialogInterface, int Which)
					{
						if(AudioVisualize != null && AudioVisualize.IsInit())
						{
							AudioVisualize.SetDrawMode(Which);
							LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DrawMode", Which);
							if(ItemContent.Tag != null && ItemContent.Tag instanceof android.widget.TextView)
								((android.widget.TextView) ItemContent.Tag).setText(DrawModeList[Which]);
						}
						DialogInterface.dismiss();
					}
				});
				AlertDialog.create().show();
			break;
			
			
			case com.mcyi.mcaddon.make.Id.SecondaryDrawMode:
				final String [] SecondaryDrawModeList = {"绘制零（调试测试用）", "绘制一", "绘制二", "绘制三"};//, "绘制四", "绘制五", "绘制六"};
				final boolean[] SecondaryDrawModeCheckedItems = AudioVisualize.GetSecondaryDrawMode();//, true, false, true, false};
				AlertDialog = new android.app.AlertDialog.Builder(AudioVisualizeActivity.this);
				AlertDialog.setTitle("副绘制");
				AlertDialog.setMultiChoiceItems(SecondaryDrawModeList, SecondaryDrawModeCheckedItems, new android.content.DialogInterface.OnMultiChoiceClickListener()
				{
					@Override
					public void onClick(android.content.DialogInterface DialogInterface, int Which, boolean IsChecked)
					{
						SecondaryDrawModeCheckedItems[Which] = IsChecked;
					}
				});

				AlertDialog.setPositiveButton("确定", new android.content.DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(android.content.DialogInterface DialogInterface, int Which)
					{
						if(AudioVisualize != null && AudioVisualize.IsInit())
						{
							AudioVisualizeUsers.SetSecondaryDrawMode(SecondaryDrawModeCheckedItems);
							/*if(ItemContent.Tag != null && ItemContent.Tag instanceof android.widget.TextView)
								((android.widget.TextView) ItemContent.Tag).setText(SecondaryDrawModeList[Which]);
							*/
						}
						DialogInterface.dismiss();
					}
				});
				AlertDialog.create().show();
			break;
			
			
			case com.mcyi.mcaddon.make.Id.DrawView:
				final String [] DrawViewList = {"View", "SurfaceView"};
				AlertDialog = new android.app.AlertDialog.Builder(AudioVisualizeActivity.this);
				AlertDialog.setTitle("绘制控件");
				AlertDialog.setSingleChoiceItems(DrawViewList, LocalDataUtil.getIntegerData(AudioVisualizeActivity.this, "AudioVisualizeSetting", "DrawView") - 1, new android.content.DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(android.content.DialogInterface DialogInterface, int Which)
					{
						if(AudioVisualize != null && AudioVisualize.IsInit() && Which + 1 != LocalDataUtil.getIntegerData(AudioVisualizeActivity.this, "AudioVisualizeSetting", "DrawView"))
						{
							AudioVisualizeUsers.RemoveWindowView();
							AudioVisualizeUsers.CreateWindow(Which + 1);
							if(ItemContent.Tag != null && ItemContent.Tag instanceof android.widget.TextView)
								((android.widget.TextView) ItemContent.Tag).setText(DrawViewList[Which]);
						}
						DialogInterface.dismiss();
					}
				});
				AlertDialog.create().show();
			break;
			
			
		}
		if(ItemContent.HasSwitch)
		{
			android.widget.Switch Switch = ItemContent.Switch;
			if(Switch.isChecked())
				Switch.setChecked(false);
			else
				Switch.setChecked(true);
		}
	}

	@Override
	public void onConfigurationChanged(android.content.res.Configuration Config)
	{
		super.onConfigurationChanged(Config);
		//====== 已在 AndroidManifest 和 OnCreate 中固定为竖屏，此方法不会运行 ======
		/*
		if (Config.orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE)
		{
			ShowAlertMessage("横屏");
		}
		else if (Config.orientation == android.content.res.Configuration.ORIENTATION_PORTRAIT)
		{
			ShowAlertMessage("竖屏");
		}*/
	}
	

	@Override
	public void onCheckedChanged(android.widget.CompoundButton Button, boolean IsChecked)
	{
		if(AudioVisualize != null)
			switch(Button.getId())
			{
				case Id.ShowFPS:
					if(AudioVisualize.IsInit())
						AudioVisualize.ShowFPS(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ShowFPS", IsChecked);
				break;
				case Id.ShowInformation:
					AudioVisualize.ShowInformation(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ShowInformation", IsChecked);
				break;
				case Id.DrawSmear:
					AudioVisualize.setDrawSmear(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "IsDrawSmear", IsChecked);
				break;
				case Id.CycleColor:
					AudioVisualize.OpenCycleColor(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "CycleColor", IsChecked);
				break;
				/*case Id.OpenCycleColorForWave:
					AudioVisualize.OpenCycleColorForWave(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "CycleColorForWave", IsChecked);
				break;*/
				case Id.EnableVibrator:
					AudioVisualize.SetEnableVibrator(IsChecked);
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "EnableVibrator", IsChecked);
				break;
				case Id.ForegroundActive:
					if(IsChecked)
						FloatingWindowService.Start(getApplicationContext());
					else
						FloatingWindowService.Stop(getApplicationContext());
					LocalDataUtil.putBooleanData(getApplicationContext(), "AudioVisualizeSetting", "ForegroundActive", IsChecked);
				break;
			}
	}

	public void onClick(android.view.View View)
	{
		if(AudioVisualize == null)
			return;
		switch(View.getId())
		{
			case R.id.Pause:
				AudioVisualize.Pause();
			break;
			case R.id.Start:
				AudioVisualize.Start();
			break;
			case R.id.Rest:
				if(!Path.getText().toString().equals(""))
				{
					if(new java.io.File(Path.getText().toString()).isFile())
						//AudioVisualize.LoaderMusic("MediaPlayer", Path.getText().toString());
						AudioVisualize.PlayTask(Path.getText().toString());
				}
			break;
		}
	}

	// 当用户对拖动条的拖动的动作完成时触发
	@Override
	public void onStopTrackingTouch(android.widget.SeekBar SeekBar)
	{
		switch(SeekBar.getId())
		{
			case Id.DataVolumeAdjustmentScale:
				int DataVolumeAdjustmentScale = SeekBar.getProgress();
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "DataVolumeAdjustmentScale", DataVolumeAdjustmentScale);
			break;
			case Id.FrameRateControl:
				int FrameRate = SeekBar.getProgress();
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "FrameRate", FrameRate);
			break;
			case Id.AnimationSmoothRateControl:
				int AnimationSmoothRate = SeekBar.getProgress();
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "AnimationSmoothRate", AnimationSmoothRate);
			break;
			case Id.MinViewAlphaControl:
				int MinViewAlpha = SeekBar.getProgress();
				LocalDataUtil.putIntegerData(getApplicationContext(), "AudioVisualizeSetting", "MinViewAlpha", MinViewAlpha);
			break;
		}
	}
	// 当用户对拖动条进行拖动时触发
	@Override
	public void onStartTrackingTouch(android.widget.SeekBar SeekBar) {}
	// 当拖动条的值发生改变的时触发
	@Override
	public void onProgressChanged(android.widget.SeekBar SeekBar, int Progress, boolean FromUser)
	{
		if(AudioVisualize != null && AudioVisualize.IsInit())
		{
			switch(SeekBar.getId())
			{
				case Id.DataVolumeAdjustmentScale:
					AudioVisualize.SetDataVolumeAdjustmentScale(Progress);
				break;
				case Id.FrameRateControl:
					AudioVisualize.SetFPS(Progress);
				break;
				case Id.AnimationSmoothRateControl:
					AudioVisualize.SetAnimationSmoothRate(Progress);
				break;
				case Id.MinViewAlphaControl:
					AudioVisualize.SetMinViewAlpha(Progress);
				break;
			}
		}
	}

	String[][] AppRunPermission = new String[][]
	{
		{android.Manifest.permission.SYSTEM_ALERT_WINDOW, "悬浮窗"},
		{android.Manifest.permission.RECORD_AUDIO, "录音"},
		{android.Manifest.permission.MODIFY_AUDIO_SETTINGS, "修改音频设置"},
		{android.Manifest.permission.PERSISTENT_ACTIVITY, "持续运行"},
		{android.Manifest.permission.READ_EXTERNAL_STORAGE, "读取存储数据"},
		{android.Manifest.permission.WRITE_EXTERNAL_STORAGE, "写入存储数据"}
	};
	private void AskPermission()
	{
		if(android.os.Build.VERSION.SDK_INT < 23)
			return;
		try
		{
			if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M)
			{
				java.util.List<String> Permissions = new java.util.ArrayList<String>();
				for(int Index = 0;  Index < AppRunPermission.length; Index++)
				{
					int Granted = checkSelfPermission(AppRunPermission[Index][0]);
					if(Granted != android.content.pm.PackageManager.PERMISSION_GRANTED)
						Permissions.add(AppRunPermission[Index][0]);
				}
				if (!Permissions.isEmpty())
					requestPermissions(Permissions.toArray(new String[Permissions.size()]), 114514);
			}
		}
		catch(Exception E)
		{
			ShowAlertMessage(E.getMessage());
		}
	}

	@Override
	public void onRequestPermissionsResult(int RequestCode, String[] Permissions, int[] GrantResults)
	{
		if (RequestCode == 114514)
		{
			for (int Index = 0; Index < GrantResults.length; Index++)
			{
				if(GrantResults[Index] == android.content.pm.PackageManager.PERMISSION_GRANTED && Permissions[Index] != null)
				{
					if(Permissions[Index].equals(AppRunPermission[1][0]))
						AudioVisualize.InitVisualizer();
				}
				if(GrantResults[Index] == android.content.pm.PackageManager.PERMISSION_DENIED && Permissions[Index] != null)
				{
					if(Permissions[Index].equals(AppRunPermission[0][0]))
						continue;
					//====== Android 6.0 需要录音权限 ======
					if(Permissions[Index].equals(AppRunPermission[1][0]))
					{
						ShowAlertMessage("系统版本为 Android 6.0 以上的设备必需授予录音权限");
						/*android.content.Intent Intent = new android.content.Intent();
						Intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
						if (android.os.Build.VERSION.SDK_INT >= 9)
						{
							Intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
							Intent.setData(android.net.Uri.fromParts("package", getPackageName(), null));
							startActivityForResult(Intent, 0);
						}
						else if (android.os.Build.VERSION.SDK_INT <= 8)
						{
							Intent.setAction(Intent.ACTION_VIEW);
							Intent.setClassName("com.android.settings", "com.android.settings.InstalledAppDetails");
							Intent.putExtra("com.android.settings.ApplicationPkgName", getPackageName());
							startActivity(Intent);
						}*/
						//AskPermission();
						continue;
					}
					
					if(Permissions[Index].equals(AppRunPermission[Index][0]))
						ShowAlertMessage("程序还需获取：" +  AppRunPermission[Index][1] + "权限");
				}
			}
		}
		super.onRequestPermissionsResult(RequestCode, Permissions, GrantResults);
	}

	@Override
	protected void onActivityResult(int RequestCode, int ResultCode, android.content.Intent Data)
	{
		super.onActivityResult(RequestCode, ResultCode, Data);
		if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M)
		{
			if (!android.provider.Settings.canDrawOverlays(this))
				ShowAlertMessage("授予权限失败");
			else
				AudioVisualizeUsers.InitWindow();
		}
	}

	@Override
	public boolean onKeyDown(int KeyCode, android.view.KeyEvent KeyEvent)
	{
		if (KeyCode == android.view.KeyEvent.KEYCODE_BACK)
		{
			//====== 没有在快捷设置栏中添加快速设置，而是在桌面中启动音频可视化时，在主界面按下返回键就停止音频可视化运行 ======
			//====== 当然也要考虑 Android 7.0 以下没有这个 Api，调用 TileService 中的任何东西都会闪退 ======
			if(android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.N || !TileService.getEnable(getApplicationContext()))
			{
				AudioVisualizeUsers.RemoveWindowView();
				AudioVisualizeUsers.Stop();
				FloatingWindowService.StopFloatingWindowService(getApplicationContext());
				System.exit(0);
				android.os.Process.killProcess(android.os.Process.myPid());
			}
			android.content.Intent Intent = new android.content.Intent(android.content.Intent.ACTION_MAIN);
			Intent.setFlags(android.content.Intent.FLAG_ACTIVITY_CLEAR_TOP);
			Intent.addCategory(android.content.Intent.CATEGORY_HOME);
			startActivity(Intent);
			return true;
		}
		else
			if(AudioVisualize != null && AudioVisualize.IsInit())
				AudioVisualize.onKeyDown(KeyCode, KeyEvent);
		return true;
	}

	@Override
	protected void onDestroy()
	{
		ExceptionHandler.getExceptionHandler(null).Release();
		AudioVisualizeUsers.ReleaseWaveLock();
		ScreenBroadcastReceiver.unregisterListener(getApplicationContext());
		super.onDestroy();
		
		//====== 如果已将快速设置添加到快捷设置栏中，清除后台主界面不会停止音频可视化运行 ======
		
		//====== 没有在快捷设置栏中添加快速设置，而是在桌面中启动音频可视化时，清除后台主界面就停止音频可视化运行 ======
		//====== 当然也要考虑 Android 7.0 以下没有这个 Api，调用 TileService 中的任何东西都会闪退 ======
		if(android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.N || !FloatingWindowService.Active || !TileService.getEnable(getApplicationContext()))
		{
			AudioVisualizeUsers.RemoveWindowView();
			AudioVisualizeUsers.Stop();
			FloatingWindowService.StopFloatingWindowService(getApplicationContext());
			System.exit(0);
			android.os.Process.killProcess(android.os.Process.myPid());
		}
		/*else
			AudioVisualizeUsers.RemoveWindowView();*/
	}

	private void ShowAlertMessage(String Message)
	{
		android.widget.Toast.makeText(getApplicationContext(), Message, 0).show();
	}

	private void displayBriefMemory()
	{
		final android.app.ActivityManager ActivityManager = (android.app.ActivityManager) getSystemService(ACTIVITY_SERVICE);
		android.app.ActivityManager.MemoryInfo info = new android.app.ActivityManager.MemoryInfo();
		ActivityManager.getMemoryInfo(info);
		StringBuffer StringBuffer = new StringBuffer("");
		StringBuffer.append("系统剩余内存：" + ((info.availMem >> 10) / 1024) + " MB");
		StringBuffer.append("\n系统是否处于低内存运行：" + info.lowMemory);
		StringBuffer.append("\n当系统剩余内存低于：" + (info.threshold / 1024 / 1024) + " MB 时就将设备看成处于低内存运行状态");
		ShowAlertMessage(StringBuffer.toString());
		StringBuffer = null;
	}

	private void setNeedsMenu()
	{
		try
		{
			Class<?> Window = Class.forName("android.view.Window");
			java.lang.reflect.Method NeedsMenuKey = Window.getDeclaredMethod("setNeedsMenuKey", new java.lang.Class[]{Integer.TYPE});
			NeedsMenuKey.setAccessible(true);
			Class<?> WindowManager = Class.forName("android.view.WindowManager$LayoutParams");
			int value = WindowManager.getField("NEEDS_MENU_SET_TRUE").getInt(null);
			NeedsMenuKey.invoke(getWindow(), value);
		}
		catch(Exception E)
		{
			ShowAlertMessage(E.toString());
		}
	}

	public static boolean isServiceRunning(android.content.Context Context, Class<?> Class)
	{
		android.app.ActivityManager ActivityManager = (android.app.ActivityManager) Context.getSystemService(android.content.Context.ACTIVITY_SERVICE);
		
		for (android.app.ActivityManager.RunningServiceInfo RunningServiceInfo : ActivityManager.getRunningServices(Integer.MAX_VALUE))
		{
			if (Class.getName().equals(RunningServiceInfo.service.getClassName()))
			{
				return true;
			}
		}
		return false;
	}

	public void SaveBitmap()
	{
		try
		{
			android.graphics.Bitmap Bitmap = android.graphics.Bitmap.createBitmap(100, 100, android.graphics.Bitmap.Config.ARGB_8888);
			java.io.FileOutputStream FileOutputStream = new java.io.FileOutputStream(new java.io.File("/sdcard/NTX_100x100.png"));
			Bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, FileOutputStream);
			FileOutputStream.flush();
			FileOutputStream.close();
		}
		catch(Exception E)
		{
			ShowAlertMessage(E.getMessage());
		}
	}

	public static CharSequence getPackageVersionName(android.content.Context Context)
	{
		CharSequence VersionName = "114514";
		try
		{
			VersionName = Context.getPackageManager().getPackageInfo(Context.getPackageName(), 0).versionName;
		}
		catch(Exception E)
		{
			E.printStackTrace();
		}
		return VersionName;
	}
}
