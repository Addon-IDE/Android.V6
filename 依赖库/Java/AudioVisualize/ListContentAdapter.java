package com.mcyi.mcaddon.make;

public class ListContentAdapter extends android.widget.BaseAdapter implements android.widget.SeekBar.OnSeekBarChangeListener, android.widget.CompoundButton.OnCheckedChangeListener, android.widget.RadioGroup.OnCheckedChangeListener
{
	private int BaseWidth = 1080;
	private float BaseWidthScale = 1.0f;

	public float getSizeFromScreenRatio(float Size)
	{
		return BaseWidth * BaseWidthScale * Size;
	}

	private android.content.Context Context;
	private java.util.List<ListItemContent> List;
	private java.util.List<android.view.View> ViewList;
	private int ScreenWidth, ScreenHeight;
	
	private OnCheckedChangedListener OnCheckedChangedListener;
	private OnRadioGroupCheckedChangedListener OnRadioGroupCheckedChangedListener;
	private OnSeekBarChangeListener OnSeekBarChangeListener;

	public void add(ListItemContent $ListItemContent)
	{
		List.add($ListItemContent);
	}

	public void remove(int Index)
	{
		List.remove(Index);
	}

	@Override
	public int getCount()
	{
		return List.size();
	}

	@Override
	public Object getItem(int Position)
	{
		return List.get(Position);
	}

	@Override
	public long getItemId(int Position)
	{
		return Position;
	}

	public ListItemContent getListItemContent(int Position)
	{
		return List.get(Position);
	}

	public ListContentAdapter(android.content.Context $Context, java.util.List<ListItemContent> $List)
	{
		Context = $Context;
		List = $List;
		if(Context != null)
		{
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
			
			BaseWidth = ScreenWidth;
		}
		if(List == null)
			List = new java.util.ArrayList<ListItemContent>();
		if(ViewList == null)
			ViewList = new java.util.ArrayList<android.view.View>();
	}

	@Override
	public boolean isEnabled(int Position)
	{
		if(List.get(Position).ItemContent == ListItemContent.Item.TITLE)
		{
			return false;
		}
		return super.isEnabled(Position);
	}

	@Override
	public android.view.View getView(int Position, android.view.View ConvertView, android.view.ViewGroup ParentView)
	{
		android.view.View View = null;

		if (Context != null)
		{
			if(ViewList.size() - 1 >= Position && ViewList.get(Position) != null)
				return ViewList.get(Position);
			ListItemContent ItemContent = List.get(Position);
			if(ItemContent == null)
				return ParentView;
			android.widget.LinearLayout RootLinearLayout = new android.widget.LinearLayout(Context);
			android.widget.LinearLayout LinearLayout = new android.widget.LinearLayout(Context);
			android.widget.LinearLayout LeftLinearLayout;
			android.widget.LinearLayout CenterLinearLayout;
			android.widget.LinearLayout RightLinearLayout;
			android.widget.LinearLayout.LayoutParams LinearLayoutLayoutParams;
			android.widget.TextView Title = new android.widget.TextView(Context);
			android.widget.TextView Description;
			//android.view.ViewGroup.LayoutParams TextViewLayoutParams;
			
			float TitleTextSize = getSizeFromScreenRatio(0.0342f);
			float DescriptionTextSize = getSizeFromScreenRatio(0.032f);
			
			LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
			RootLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
			RootLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
			RootLinearLayout.setGravity(android.view.Gravity.CENTER);
			RootLinearLayout.setClipChildren(false);
			RootLinearLayout.setClipToPadding(false);
			RootLinearLayout.addView(LinearLayout);
			LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(ScreenWidth, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
			LinearLayout.setLayoutParams(LinearLayoutLayoutParams);
			
			switch(ItemContent.ItemContent)
			{
				case TITLE:
					
					
					LinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					LinearLayout.setGravity(android.view.Gravity.BOTTOM | android.view.Gravity.CENTER);
					
					//设置宽高和外边距
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.191f), (int) getSizeFromScreenRatio(0.041f), (int) getSizeFromScreenRatio(0.191f), 0);
					Title.setLayoutParams(LinearLayoutLayoutParams);
					
					Title.setGravity(android.view.Gravity.CENTER_VERTICAL);
					Title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, TitleTextSize);
					Title.setTextColor(android.graphics.Color.parseColor("#ff212121"));
					
					Title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
					Title.setText(ItemContent.Title);
					LinearLayout.addView(Title);
					
					
				break;
				case DESCRIPTION:
					
					
					LinearLayout.setOrientation(android.widget.LinearLayout.HORIZONTAL);
					LinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);

					LeftLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeFromScreenRatio(0.150f), android.view.ViewGroup.LayoutParams.MATCH_PARENT);
					LeftLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					LeftLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					LeftLinearLayout.setGravity(android.view.Gravity.CENTER);
					LinearLayout.addView(LeftLinearLayout);

					CenterLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.041f));
					CenterLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					CenterLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					CenterLinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					LinearLayout.addView(CenterLinearLayout);

					Description = new android.widget.TextView(Context);
					//设置宽高和外边距
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
					Description.setLayoutParams(LinearLayoutLayoutParams);

					Description.setGravity(android.view.Gravity.CENTER_VERTICAL);
					Description.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, DescriptionTextSize);
					Description.setTextColor(android.graphics.Color.rgb(150, 150, 150));
					Description.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
					Description.setText(ItemContent.Description);
					CenterLinearLayout.addView(Description);
					
					
				break;
				case ITEM:
					
					
					LinearLayout.setOrientation(android.widget.LinearLayout.HORIZONTAL);
					LinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					
					LeftLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeFromScreenRatio(0.150f), android.view.ViewGroup.LayoutParams.MATCH_PARENT);
					LeftLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					LeftLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					LeftLinearLayout.setGravity(android.view.Gravity.CENTER);
					LinearLayout.addView(LeftLinearLayout);
					
					CenterLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.041f));
					else
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.07035f), 0, (int) getSizeFromScreenRatio(0.07035f));
					CenterLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					CenterLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					CenterLinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					LinearLayout.addView(CenterLinearLayout);

					//设置宽高和外边距
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), (int) getSizeFromScreenRatio(0.01097f));
					else
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
					Title.setLayoutParams(LinearLayoutLayoutParams);

					Title.setGravity(android.view.Gravity.CENTER_VERTICAL);
					Title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, TitleTextSize);
					Title.setTextColor(android.graphics.Color.WHITE);
					Title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
					Title.setText(ItemContent.Title);
					CenterLinearLayout.addView(Title);
					
					
				break;
				case ITEM_WITH_DESCRIPTION:
					
					
					LinearLayout.setOrientation(android.widget.LinearLayout.HORIZONTAL);
					LinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					
					LeftLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeFromScreenRatio(0.150f), android.view.ViewGroup.LayoutParams.MATCH_PARENT);
					LeftLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					LeftLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					LeftLinearLayout.setGravity(android.view.Gravity.CENTER);
					LinearLayout.addView(LeftLinearLayout);

					CenterLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.041f));
					else
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.07035f), 0, (int) getSizeFromScreenRatio(0.07035f));
					CenterLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					CenterLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					CenterLinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					LinearLayout.addView(CenterLinearLayout);

					//设置宽高和外边距
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), (int) getSizeFromScreenRatio(0.01097f));
					else
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
					Title.setLayoutParams(LinearLayoutLayoutParams);

					Title.setGravity(android.view.Gravity.CENTER_VERTICAL);
					Title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, TitleTextSize);
					Title.setTextColor(android.graphics.Color.WHITE);
					Title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
					Title.setText(ItemContent.Title);
					CenterLinearLayout.addView(Title);
					
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
					{
						Description = new android.widget.TextView(Context);
						//设置宽高和外边距
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
						Description.setLayoutParams(LinearLayoutLayoutParams);

						Description.setGravity(android.view.Gravity.CENTER_VERTICAL);
						Description.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, DescriptionTextSize);
						Description.setTextColor(android.graphics.Color.rgb(150, 150, 150));
						Description.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
						Description.setText(ItemContent.Description);
						CenterLinearLayout.addView(Description);
					
						ItemContent.Tag = Description;
					}
					
				break;
				case ITEM_WITH_DESCRIPTION_AND_FEATURES:
					
					
					LinearLayout.setOrientation(android.widget.LinearLayout.HORIZONTAL);
					LinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);

					LeftLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeFromScreenRatio(0.150f), android.view.ViewGroup.LayoutParams.MATCH_PARENT);
					LeftLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					LeftLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					LeftLinearLayout.setGravity(android.view.Gravity.CENTER);
					LinearLayout.addView(LeftLinearLayout);

					CenterLinearLayout = new android.widget.LinearLayout(Context);
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					LinearLayoutLayoutParams.weight = 1.0f;
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.041f));
					else
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.07035f), 0, (int) getSizeFromScreenRatio(0.07035f));
					CenterLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
					CenterLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
					CenterLinearLayout.setGravity(android.view.Gravity.CENTER_VERTICAL);
					LinearLayout.addView(CenterLinearLayout);

					//设置宽高和外边距
					LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), (int) getSizeFromScreenRatio(0.01097f));
					else
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
					Title.setLayoutParams(LinearLayoutLayoutParams);

					Title.setGravity(android.view.Gravity.CENTER_VERTICAL);
					Title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, TitleTextSize);
					Title.setTextColor(android.graphics.Color.WHITE);
					Title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
					Title.setText(ItemContent.Title);
					CenterLinearLayout.addView(Title);

					if(ItemContent.Description != null && !ItemContent.Description.equals(""))
					{
						Description = new android.widget.TextView(Context);
						//设置宽高和外边距
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
						Description.setLayoutParams(LinearLayoutLayoutParams);

						Description.setGravity(android.view.Gravity.CENTER_VERTICAL);
						Description.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, DescriptionTextSize);
						Description.setTextColor(android.graphics.Color.rgb(150, 150, 150));
						Description.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
						Description.setText(ItemContent.Description);
						CenterLinearLayout.addView(Description);
					}
					
					if(ItemContent.HasSwitch)
					{
						RightLinearLayout = new android.widget.LinearLayout(Context);
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeFromScreenRatio(0.219f), android.view.ViewGroup.LayoutParams.MATCH_PARENT);
						LinearLayoutLayoutParams.setMargins(0, (int) getSizeFromScreenRatio(0.022f), 0, (int) getSizeFromScreenRatio(0.022f));
						RightLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
						RightLinearLayout.setOrientation(android.widget.LinearLayout.VERTICAL);
						RightLinearLayout.setGravity(android.view.Gravity.CENTER);
						LinearLayout.addView(RightLinearLayout);
						
						android.widget.Switch Switch = new android.widget.Switch(Context);
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams((int) getSizeBasedOn1080p(138), (int) getSizeBasedOn1080p(56));
						Switch.setLayoutParams(LinearLayoutLayoutParams);
						Switch.setFocusableInTouchMode(false);
						Switch.setFocusable(false);
						Switch.setChecked(ItemContent.IsChecked);
						Switch.setOnCheckedChangeListener(this);
						Switch.setId(ItemContent.Id);
						ItemContent.Switch = Switch;
						RightLinearLayout.addView(Switch);
					}
					else if(ItemContent.HasSeekBar)
					{
						RightLinearLayout = new android.widget.LinearLayout(Context);
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), (int) getSizeFromScreenRatio(0.022f), (int) getSizeFromScreenRatio(0.054f), 0);
						RightLinearLayout.setLayoutParams(LinearLayoutLayoutParams);
						RightLinearLayout.setOrientation(android.widget.LinearLayout.HORIZONTAL);
						RightLinearLayout.setGravity(android.view.Gravity.CENTER);
						CenterLinearLayout.addView(RightLinearLayout);
						
						android.widget.SeekBar SeekBar = new android.widget.SeekBar(Context);
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
						LinearLayoutLayoutParams.weight = 1.0f;
						SeekBar.setLayoutParams(LinearLayoutLayoutParams);
						SeekBar.setFocusable(false);
						SeekBar.setOnSeekBarChangeListener(this);
						//====== Android 5.0 竟然没有这个方法！======
						//SeekBar.setMin(ItemContent.MinProgress);
						SeekBar.setMax(ItemContent.MaxProgress);
						SeekBar.setProgress(ItemContent.Progress);
						SeekBar.setId(ItemContent.Id);
						RightLinearLayout.addView(SeekBar);
						
						android.widget.TextView Process = new android.widget.TextView(Context);
						//设置宽高和外边距
						LinearLayoutLayoutParams = new android.widget.LinearLayout.LayoutParams(android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
						LinearLayoutLayoutParams.setMargins((int) getSizeFromScreenRatio(0.041f), 0, (int) getSizeFromScreenRatio(0.054f), 0);
						Process.setLayoutParams(LinearLayoutLayoutParams);

						Process.setGravity(android.view.Gravity.CENTER_VERTICAL);
						Process.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, DescriptionTextSize);
						Process.setTextColor(android.graphics.Color.rgb(150, 150, 150));
						Process.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
						Process.setText(String.valueOf(ItemContent.OffsetProgress + ItemContent.Progress));
						ItemContent.Tag = Process;
						SeekBar.setTag(ItemContent);
						RightLinearLayout.addView(Process);
					}
					
				break;
				case ITEM_WITH_FEATURES_ON_RADIOBUTTON:
				break;
			}
			View = RootLinearLayout;
			ViewList.add(View);
		}
		return View;
	}

	public static void setMargins(android.view.View View, int Left, int Top, int Right, int Bottom)
	{
		if (View.getLayoutParams() instanceof android.view.ViewGroup.MarginLayoutParams)
		{
			android.view.ViewGroup.MarginLayoutParams MarginLayoutParams = (android.view.ViewGroup.MarginLayoutParams) View.getLayoutParams();
			MarginLayoutParams.setMargins(Left, Top, Right, Bottom);
			View.requestLayout();
		}
	}

	interface OnCheckedChangedListener
	{
		void onCheckedChanged(android.widget.CompoundButton Button, boolean IsChecked);
	}
	public void setOnCheckedChangedListener(OnCheckedChangedListener $OnCheckedChangedListener)
	{
		OnCheckedChangedListener = $OnCheckedChangedListener;
	}
	@Override
	public void onCheckedChanged(android.widget.CompoundButton CompoundButton, boolean IsChecked)
	{
		if(OnCheckedChangedListener != null)
			OnCheckedChangedListener.onCheckedChanged(CompoundButton, IsChecked);
	}
	
	interface OnRadioGroupCheckedChangedListener
	{
		void onCheckedChanged(android.widget.RadioGroup RadioGroup, int CheckedId);
	}
	public void setOnRadioGroupCheckedChangedListener(OnRadioGroupCheckedChangedListener $OnRadioGroupCheckedChangedListener)
	{
		OnRadioGroupCheckedChangedListener = $OnRadioGroupCheckedChangedListener;
	}
	@Override
	public void onCheckedChanged(android.widget.RadioGroup RadioGroup, int CheckedId)
	{
		if(OnRadioGroupCheckedChangedListener != null)
			OnRadioGroupCheckedChangedListener.onCheckedChanged(RadioGroup, CheckedId);
	}

	interface OnSeekBarChangeListener
	{
		//当用户对拖动条的拖动的动作完成时触发
		void onStopTrackingTouch(android.widget.SeekBar SeekBar);
		//当用户对拖动条进行拖动时触发
		void onStartTrackingTouch(android.widget.SeekBar SeekBar);
		//当拖动条的值发生改变的时触发
		void onProgressChanged(android.widget.SeekBar SeekBar, int Progress, boolean FromUser);
	}
	public void setOnSeekBarChangeListener(OnSeekBarChangeListener $OnSeekBarChangeListener)
	{
		OnSeekBarChangeListener = $OnSeekBarChangeListener;
	}
	//当用户对拖动条的拖动的动作完成时触发
	@Override
	public void onStopTrackingTouch(android.widget.SeekBar SeekBar)
	{
		if(OnSeekBarChangeListener != null)
			OnSeekBarChangeListener.onStopTrackingTouch(SeekBar);
	}
	//当用户对拖动条进行拖动时触发
	@Override
	public void onStartTrackingTouch(android.widget.SeekBar SeekBar)
	{
		if(OnSeekBarChangeListener != null)
			OnSeekBarChangeListener.onStartTrackingTouch(SeekBar);
	}
	//当拖动条的值发生改变的时触发
	@Override
	public void onProgressChanged(android.widget.SeekBar SeekBar, int Progress, boolean FromUser)
	{
		ListItemContent ItemContent = (ListItemContent) SeekBar.getTag();
		//ItemContent.Progress = SeekBar.getProgress();
		if(ItemContent != null && ItemContent.Tag instanceof android.widget.TextView)
			((android.widget.TextView) ItemContent.Tag).setText(String.valueOf(ItemContent.OffsetProgress + Progress));
		if(OnSeekBarChangeListener != null)
			OnSeekBarChangeListener.onProgressChanged(SeekBar, Progress, FromUser);
	}

	private float getSizeBasedOn1080p(float ParamSize)
	{
		float ScaleRate = 1;
		return ((float) ScreenWidth) * (ParamSize / 1080) * ScaleRate;
	}
}
