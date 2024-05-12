包名 com.Meng

/*
* ==============================
*   结绳封装：@阿杰  Meng
*   
*   Github： @hackware1993  https://github.com/hackware1993/MagicIndicator
* ==============================
*/

@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../依赖库/AarLib/MagicIndicator_navigation_bar.aar")
@导入Java("android.content.Context")
@导入Java("android.view.View")
@导入Java("android.graphics.Color")
@导入Java("java.util.*")
@导入Java("net.lucode.hackware.magicindicator.MagicIndicator")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.CommonNavigator")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.*")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.indicators.*")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
@导入Java("net.lucode.hackware.magicindicator.FragmentContainerHelper")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgePagerTitleView")
类 导航栏 : 可视化组件
	
	@隐藏
	变量 分页布局 : 分页布局?
	
	@code
	ArrayList<String> mDataList;
	
	CommonNavigator commonNavigator;
	CommonNavigatorAdapter NAdapter;
	IPagerIndicator Indicator;
	FragmentContainerHelper mContainerHelper;
	
	public #<导航栏>(Context context) {
        super(context);
		mDataList = new #<@文本集合>();
		mContainerHelper = new FragmentContainerHelper();
        commonNavigator = new CommonNavigator(#取安卓环境());
        commonNavigator.setAdapter(NAdapter = new CommonNavigatorAdapter() {
            public int getCount() {return mDataList.size();}
            public IPagerTitleView getTitleView(Context context, final int index) {
				Object pt1 = #导航文本样式(index, mDataList.get(index)).getView();
				Object pt = (pt1 instanceof BadgePagerTitleView) ? ((BadgePagerTitleView)pt1).getInnerPagerTitleView() : pt1;
				if(pt == null) return null;
				if(!(pt instanceof CommonPagerTitleView)) {
					if(pt instanceof ClipPagerTitleView) {
						if(((ClipPagerTitleView)pt).getText() == null || (((ClipPagerTitleView)pt).getText().equals(""))) 
							((ClipPagerTitleView)pt).setText(mDataList.get(index));
					} else if (pt instanceof SimplePagerTitleView)
						if((((SimplePagerTitleView)pt).getText() == null) || (((SimplePagerTitleView)pt).getText().equals(""))) 
							((SimplePagerTitleView)pt).setText(mDataList.get(index));
				}
				((View)pt).setOnClickListener(new View.OnClickListener() {
                	public void onClick(View view) {
                    	if(!#导航被单击(index)){
							#选中项目(index, true);
							if(#分页布局 != null)
								if(index <= #<分页布局.页面总数>())
									#<分页布局.显示页面>(index, true);
						}
                	}
            	});
                return (IPagerTitleView)pt1;
            }
            public IPagerIndicator getIndicator(Context context) {
				#<导航条样式> Idr = #导航条样式();
				return Idr != null ? Idr.getIdr() : null;
            }
        });
        getView().setNavigator(commonNavigator);
		mContainerHelper.attachMagicIndicator(getView());
    }

    public MagicIndicator onCreateView(Context context) {
		MagicIndicator magicIndicator = new MagicIndicator(context);
		return magicIndicator;
	}

    public MagicIndicator getView() {return (MagicIndicator)view;}
	@end
	
	方法 选中项目(索引 : 整数, 动画 : 逻辑型 = 真)
		code mContainerHelper.handlePageSelected(#索引, #动画);
	结束 方法
	
	方法 添加项目(文本 : 文本)
		@code
		mDataList.add(#文本);
		NAdapter.notifyDataSetChanged();
		@end
	结束 方法
	
	方法 移除项目(文本 : 文本)
		@code
		if(mDataList.contains(#文本))
		mDataList.remove(#文本);
		NAdapter.notifyDataSetChanged();
		@end
	结束 方法
	
	方法 置文本集(文本集 : 文本集合)
		code mDataList = #文本集;
		code NAdapter.notifyDataSetChanged();
	结束 方法
	
	方法 置文本组(文本组 : 文本[])
		code mDataList = new ArrayList<>(java.util.Arrays.asList(#文本组));
		code NAdapter.notifyDataSetChanged();
	结束 方法
	
	方法 取项目集() : 文本集合
		code return mDataList;
	结束 方法
	
	方法 刷新导航项目()
		code NAdapter.notifyDataSetChanged();
	结束 方法
	
	方法 绑定分页布局(分页 : 分页布局)
		分页布局 = 分页
		@code
		#分页.addOnPageChangeListener(new #<分页布局>.OnPageChangeListener() {
			public void onPageChange(View view, int position){};
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                getView().onPageScrolled(position, positionOffset, positionOffsetPixels);
            }

            @Override
            public void onPageSelected(int position) {
                getView().onPageSelected(position);
            }
            @Override
            public void onPageScrollStateChanged(int state) {
                getView().onPageScrollStateChanged(state);
            }
        });
		@end
	结束 方法
	
	属性写 导航背景颜色(颜色 : 整数)
		code getView().setBackgroundColor(#颜色);
	结束 属性
	
	属性写 固定宽(是否 : 逻辑型)
		code commonNavigator.setAdjustMode(#是否);
	结束 属性
	
	属性读 宽度宽() : 逻辑型
		code return commonNavigator.isAdjustMode();
	结束 属性
	
	属性写 滚动X(X : 小数)
		code commonNavigator.setScrollPivotX((float)#X);
	结束 属性
	
	属性读 滚动X() : 小数
		code return commonNavigator.getScrollPivotX();
	结束 属性
	
	属性写 支持滚动(是否 : 逻辑型)
		code commonNavigator.setEnablePivotScroll(#是否);
	结束 属性
	
	属性读 支持滚动() : 逻辑型
		code return commonNavigator.isEnablePivotScroll();
	结束 属性
	
	属性写 平滑滚动(是否 : 逻辑型)
		code commonNavigator.setSmoothScroll(#是否);
	结束 属性
	
	属性读 平滑滚动() : 逻辑型
		code return commonNavigator.isSmoothScroll();
	结束 属性
	
	属性写 跟随滚动(是否 : 逻辑型)
		code commonNavigator.setFollowTouch(#是否);
	结束 属性
	
	属性读 跟随滚动() : 逻辑型
		code return commonNavigator.isFollowTouch();
	结束 属性
	
	属性写 选中略过滚动(是否 : 逻辑型)
		code commonNavigator.setSkimOver(#是否);
	结束 属性
	
	属性读 选中略过滚动() : 逻辑型
		code return commonNavigator.isSkimOver();
	结束 属性
	
	属性写 左边距(边距 : 整数)
		code commonNavigator.setLeftPadding(#边距);
	结束 属性
	
	属性读 左边距() : 整数
		code return commonNavigator.getLeftPadding();
	结束 属性
	
	属性写 右边距(边距 : 整数)
		code commonNavigator.setRightPadding(#边距);
	结束 属性
	
	属性读 右边距() : 整数
		code return commonNavigator.getRightPadding();
	结束 属性
	
	属性写 顶部导航条(是否 : 逻辑型)
		code commonNavigator.setIndicatorOnTop(#是否);
	结束 属性
	
	属性读 顶部导航条() : 逻辑型
		code return commonNavigator.isIndicatorOnTop();
	结束 属性
	
	/*方法 分隔符(颜色 : 整数, 边距 : 整数, 显示位置 : 导航分隔符位置)
		@code
		android.widget.LinearLayout titleContainer = commonNavigator.getTitleContainer();
        titleContainer.setShowDividers(android.widget.LinearLayout.SHOW_DIVIDER_MIDDLE);
        titleContainer.setDividerPadding(#边距);
        titleContainer.setDividerDrawable(new android.graphics.drawable.ColorDrawable(#颜色));
		@end
	结束 方法*/
	
	方法 重置()
		code commonNavigator.onAttachToMagicIndicator();
	结束 方法
		
	定义事件 导航被单击(索引 : 整数) : 逻辑型
	定义事件 导航文本样式(索引 : 整数, 导航文本 : 文本) : 导航文本样式
	定义事件 导航条样式() : 导航条样式
	
结束 类

类 导航分隔符位置
	
	
	
结束 类

@禁止创建对象
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerTitleView")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgePagerTitleView")
类 导航文本样式 : 窗口组件
	@code
	public #<导航文本样式>(android.content.Context c){super(c);}
	public IPagerTitleView pt;
	public BadgePagerTitleView bg;
	public IPagerTitleView getIptv(){return pt;};
	public IPagerTitleView getView(){return bg == null ? pt : bg;}
	@end
	
	属性写 角标(角标 : 导航角标)
		code bg = #角标.getBadge();
		code bg.setInnerPagerTitleView(pt);
	结束 属性
	
结束 类

@导入Java("android.graphics.Typeface")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_普通 : 导航文本样式
	@code
	public #<导航文本样式_普通>(android.content.Context c){super(c);pt = new SimplePagerTitleView(c);}
	public SimplePagerTitleView getIptv(){return (SimplePagerTitleView)super.getIptv();}
	@end
	
	属性写 颜色_选中(颜色 : 整数)
		code getIptv().setSelectedColor(#颜色);
	结束 属性
	
	属性写 颜色_未选中(颜色 : 整数)
		code getIptv().setNormalColor(#颜色);
	结束 属性
	
	/*
	设置内容的对齐方式
	*/
	属性写 对齐方式(方式 : 整数)
		code getIptv().setGravity(#方式);
	结束 属性

	/*
	设置文本框类组件所显示的内容
	*/
	属性写 文本资源(资源: 文本资源)
		code getIptv().setText(#资源);
	结束 属性

	/*
	设置文本框类组件所显示的内容
	*/
	属性写 内容(值: 文本)
		code getIptv().setText(#值);
	结束 属性

	/*
	获取文本框类组件所显示(输入)的内容
	*/
	属性读 内容() : 文本
		code return getIptv().getText().toString();
	结束 属性

	//设置文本框内容粗体显示
	属性写 粗体(是否粗体 : 逻辑型)
		@code
		Typeface typeface = getIptv().getTypeface();
		if (#是否粗体) {
			if (typeface.isItalic()) {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD_ITALIC));
			} else {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD));
			}
		} else {
			if (typeface.isBold() && typeface.isItalic()) {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.ITALIC));
			} else {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.NORMAL));
			}
		}
		@end
	结束 属性

	//设置文本框内容斜体显示
	属性写 斜体(是否斜体 : 逻辑型)
		@code
		Typeface typeface = getIptv().getTypeface();
		if (#是否斜体) {
			if (typeface.isBold()) {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD_ITALIC));
			} else {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.ITALIC));
			}
		} else {
			if (typeface.isBold() && typeface.isItalic()) {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD));
			} else {
				getIptv().setTypeface(Typeface.defaultFromStyle(Typeface.NORMAL));
			}
		}
		@end
	结束 属性

	//设置文本框字体大小
	属性写 字体大小(字体大小 为 整数)
		code getIptv().setTextSize(#字体大小);
	结束 属性

	//获取字体大小
	属性读 字体大小() 为 整数
		code return (int)getIptv().getTextSize();
	结束 属性

	//设置文本框字体颜色
	属性写 字体颜色(字体颜色 为 整数)
		code getIptv().setTextColor(#字体颜色);
	结束 属性

	//获取文本框字体颜色
	属性读 字体颜色() 为 整数
		code return getIptv().getTextColors().getDefaultColor();
	结束 属性

	//设置组件的字体，字体路径可以为附加资源中字体文件名称，也可以是sdcard路径
	属性写 字体(字体路径 为 文本)
		@code
		if (#字体路径.charAt(0) == '/') {
			getIptv().setTypeface(Typeface.createFromFile(#字体路径));
		} else {
			getIptv().setTypeface(Typeface.createFromAsset(context.getAssets(), #字体路径));
		}
		@end
	结束 属性
	
结束 类


@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_颜色变换 : 导航文本样式_普通
	@code
	private float mChangePercent = 0.5f;
	public #<导航文本样式_颜色变换>(android.content.Context c){super(c);
		pt = new SimplePagerTitleView(c){
    		public void onLeave(int index, int totalCount, float leavePercent, boolean leftToRight) {
	        	if (leavePercent >= mChangePercent) setTextColor(mNormalColor);
  	      	else setTextColor(mSelectedColor);
	    	}
 	  	 public void onEnter(int index, int totalCount, float enterPercent, boolean leftToRight) {
	    	    if (enterPercent >= mChangePercent) setTextColor(mSelectedColor);
    		    else setTextColor(mNormalColor);
 	   	}
		};
	}
	public SimplePagerTitleView getIptv(){return (SimplePagerTitleView)super.getIptv();}
	@end
	
	属性写 伸拉程度(值 : 小数)
		code mChangePercent = 值;
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_渐变 : 导航文本样式_普通
	@code
	public #<导航文本样式_渐变>(android.content.Context c){super(c);pt = new ColorTransitionPagerTitleView(c);}
	public ColorTransitionPagerTitleView getIptv(){return (ColorTransitionPagerTitleView)super.getIptv();}
	@end
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_渐变缩放 : 导航文本样式_渐变
	@code
	private float mMinScale = 0.75f;
	public #<导航文本样式_渐变缩放>(android.content.Context c){
		super(c);
		pt = new ColorTransitionPagerTitleView(c){
    		public void onEnter(int index, int totalCount, float enterPercent, boolean leftToRight) {
   		     super.onEnter(index, totalCount, enterPercent, leftToRight);    // 实现颜色渐变
   		     setScaleX(mMinScale + (1.0f - mMinScale) * enterPercent);
  	   	   setScaleY(mMinScale + (1.0f - mMinScale) * enterPercent);
    		}
    		public void onLeave(int index, int totalCount, float leavePercent, boolean leftToRight) {
  		      super.onLeave(index, totalCount, leavePercent, leftToRight);    // 实现颜色渐变
   		     setScaleX(1.0f + (mMinScale - 1.0f) * leavePercent);
  		      setScaleY(1.0f + (mMinScale - 1.0f) * leavePercent);
  		  }
		};
	}
	public ColorTransitionPagerTitleView getIptv(){return (ColorTransitionPagerTitleView)super.getIptv();}
	@end
	
	属性写 缩小度(值 : 小数)
		code mMinScale = (float)#值;
	结束 属性
	
	属性读 缩小度() : 小数
		code return (double)mMinScale;
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_遮罩 : 导航文本样式
	@code
	public #<导航文本样式_遮罩>(android.content.Context c){super(c);pt = new ClipPagerTitleView(c);}
	public ClipPagerTitleView getIptv(){return (ClipPagerTitleView)super.getIptv();}
	@end
	
	/*
	设置文本框类组件所显示的内容
	*/
	属性写 内容(值: 文本)
		code getIptv().setText(#值);
	结束 属性

	/*
	获取文本框类组件所显示(输入)的内容
	*/
	属性读 内容() : 文本
		code return getIptv().getText();
	结束 属性

	//设置文本框字体大小
	属性写 字体大小(字体大小 为 整数)
		code getIptv().setTextSize(#字体大小);
	结束 属性

	//设置文本框字体颜色
	属性写 字体颜色(字体颜色 为 整数)
		code getIptv().setTextColor(#字体颜色);
	结束 属性
	
	属性写 遮罩颜色(颜色 为 整数)
		code getIptv().setClipColor(#颜色);
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_自定义 : 导航文本样式
	@code
	public #<导航文本样式_自定义>(android.content.Context c){super(c);pt = new CommonPagerTitleView(c);}
	public CommonPagerTitleView getIptv(){return (CommonPagerTitleView)super.getIptv();}
	@end
	
	方法 自定义布局(容器 : 组件容器)
		code getIptv().setContentView(#容器.getLayout().getView());
	结束 方法
	
	方法 自定义布局2(容器 : 组件容器, 宽 : 整数, 高 : 整数)
		code getIptv().setContentView(#容器.getLayout().getView(), new android.widget.FrameLayout.LayoutParams(#宽,#高));
	结束 方法
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.*")
类 导航文本样式_无字 : 导航文本样式
	@code
	public #<导航文本样式_无字>(android.content.Context c){super(c);pt = new DummyPagerTitleView(c);}
	public DummyPagerTitleView getIptv(){return (DummyPagerTitleView)super.getIptv();}
	@end
结束 类

@强制输出
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerTitleView")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgePagerTitleView")
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgeRule")
类 导航角标 : 导航文本样式
	@code
	public #<导航角标>(android.content.Context c){super(c);pt = new BadgePagerTitleView(c);}
	public BadgePagerTitleView getBadge(){return (BadgePagerTitleView)pt;}
	public IPagerTitleView getIptv(){return ((BadgePagerTitleView)pt).getInnerPagerTitleView();}
	@end
	
	属性写 布局(布局 : 组件容器)
		code getBadge().setBadgeView(#布局.getLayout().getView());
	结束 属性
	
	属性写 自动取消(是否 : 逻辑型)
		code getBadge().setAutoCancelBadge(#是否);
	结束 属性
	
	属性读 自动取消() : 逻辑型
		code return getBadge().isAutoCancelBadge();
	结束 属性
	
	方法 角标位置_X(位置 : 导航角标位置, 偏移 : 整数 = 0)
		code getBadge().setXBadgeRule(new BadgeRule(#位置, #偏移));
	结束 方法
	
	方法 角标位置_Y(位置 : 导航角标位置, 偏移 : 整数 = 0)
		code getBadge().setYBadgeRule(new BadgeRule(#位置, #偏移));
	结束 方法
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgeAnchor")
@指代类("net.lucode.hackware.magicindicator.buildins.commonnavigator.titles.badge.BadgeAnchor")
类 导航角标位置
	
	@静态
	常量 X_左 : 导航角标位置?
	@静态
	常量 X_右 : 导航角标位置?
	@静态
	常量 X_内容左 : 导航角标位置?
	@静态
	常量 X_内容右 : 导航角标位置?
	@静态
	常量 X_居中 : 导航角标位置?
	@静态
	常量 X_左居中 : 导航角标位置?
	@静态
	常量 X_右居中 : 导航角标位置?
	
	@静态
	常量 Y_顶 : 导航角标位置?
	@静态
	常量 Y_底 : 导航角标位置?
	@静态
	常量 Y_内容顶 : 导航角标位置?
	@静态
	常量 Y_内容底 : 导航角标位置?
	@静态
	常量 Y_居中 : 导航角标位置?
	@静态
	常量 Y_顶居中 : 导航角标位置?
	@静态
	常量 Y_底居中 : 导航角标位置?
	
	@code
	static{
		#X_左 = BadgeAnchor.LEFT;
		#X_右 = BadgeAnchor.RIGHT;
		#X_内容左 = BadgeAnchor.CONTENT_LEFT;
		#X_内容右 = BadgeAnchor.CONTENT_RIGHT;
		#X_居中 = BadgeAnchor.CENTER_X;
		#X_左居中 = BadgeAnchor.LEFT_EDGE_CENTER_X;
		#X_右居中 = BadgeAnchor.RIGHT_EDGE_CENTER_X;
		
		#Y_顶 = BadgeAnchor.TOP;
		#Y_底 = BadgeAnchor.BOTTOM;
		#Y_内容顶 = BadgeAnchor.CONTENT_TOP;
		#Y_内容底 = BadgeAnchor.CONTENT_BOTTOM;
		#Y_居中 = BadgeAnchor.CENTER_Y;
		#Y_顶居中 = BadgeAnchor.TOP_EDGE_CENTER_Y;
		#Y_底居中 = BadgeAnchor.BOTTOM_EDGE_CENTER_Y;
	}
	@end

结束 类

@禁止创建对象
类 导航条样式 : 窗口组件
	@code
	public #<导航条样式>(android.content.Context c){super(c);}
	public net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerIndicator Indicator;
	public net.lucode.hackware.magicindicator.buildins.commonnavigator.abs.IPagerIndicator getIdr(){return Indicator;};
	@end
结束 类

@强制输出
@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.indicators.*")
类 导航条样式_直线渐变 : 导航条样式
	@code
	public #<导航条样式_直线渐变>(android.content.Context c){super(c);Indicator = new LinePagerIndicator(c);}
	public LinePagerIndicator getIdr(){return (LinePagerIndicator)Indicator;}
	@end
	
	属性写 宽度(宽 : 小数)
		code getIdr().setLineWidth((float)#宽);
	结束 属性
	
	属性读 宽度() : 小数
		code return (double)getIdr().getLineWidth();
	结束 属性
	
	属性写 高度(高 : 小数)
		code getIdr().setLineHeight((float)#高);
	结束 属性
	
	属性读 高度() : 小数
		code return (double)getIdr().getLineHeight();
	结束 属性
	
	属性写 圆角(半径 : 小数)
		code getIdr().setRoundRadius((float)#半径);
	结束 属性
	
	属性读 圆角() : 小数
		code return (double)getIdr().getRoundRadius();
	结束 属性
	
	// 0：导航项宽度(默认)， 1：导航文本宽度， 2：完全
	属性写 模式(模式 : 导航条宽模式)
		code getIdr().setMode(#模式);
	结束 属性
	
	// 0：导航项宽度(默认)， 1：导航文本宽度， 2：完全
	属性读 模式() : 导航条宽模式
		code return getIdr().getMode();
	结束 属性
	
	属性写 偏移Y(Y : 小数)
		code getIdr().setYOffset((float)#Y);
	结束 属性
	
	属性读 偏移Y() : 小数
		code return (double)getIdr().getYOffset();
	结束 属性
	
	属性写 偏移X(X : 小数)
		code getIdr().setXOffset((float)#X);
	结束 属性
	
	属性读 偏移X() : 小数
		code return (double)getIdr().getXOffset();
	结束 属性
	
	属性写 渐变颜色组(颜色 : 整数[])
		code getIdr().setColors(java.util.Arrays.stream(#颜色).boxed().toArray(Integer[]::new));
	结束 属性
	
	属性写 滚动长度(值 : 小数)
		@code
		getIdr().setStartInterpolator(new android.view.animation.AccelerateInterpolator());
		getIdr().setEndInterpolator(new android.view.animation.DecelerateInterpolator((float)#值));
		@end
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.indicators.*")
类 导航条样式_弹球渐变 : 导航条样式
	@code
	public #<导航条样式_弹球渐变>(android.content.Context c){super(c);Indicator = new BezierPagerIndicator(c);}
	public BezierPagerIndicator getIdr(){return (BezierPagerIndicator)Indicator;}
	@end
	
	属性写 大圆半径(半径 : 小数)
		code getIdr().setMaxCircleRadius((float)#半径);
	结束 属性
	
	属性读 大圆半径() : 小数
		code return (double)getIdr().getMaxCircleRadius();
	结束 属性
	
	属性写 小圆半径(半径 : 小数)
		code getIdr().setMinCircleRadius((float)#半径);
	结束 属性
	
	属性读 小圆半径() : 小数
		code return (double)getIdr().getMinCircleRadius();
	结束 属性
	
	属性写 偏移Y(Y : 小数)
		code getIdr().setYOffset((float)#Y);
	结束 属性
	
	属性读 偏移Y() : 小数
		code return (double)getIdr().getYOffset();
	结束 属性
	
	属性写 渐变颜色组(颜色 : 整数[])
		code getIdr().setColors(java.util.Arrays.stream(#颜色).boxed().toArray(Integer[]::new));
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.indicators.*")
类 导航条样式_尖角 : 导航条样式
	@code
	public #<导航条样式_尖角>(android.content.Context c){super(c); Indicator = new TriangularPagerIndicator(c);}
	public TriangularPagerIndicator getIdr(){return (TriangularPagerIndicator)Indicator;}
	@end
	
	属性写 高度(高 : 整数)
		code getIdr().setLineHeight(#高);
	结束 属性
	
	属性读 高度() : 整数
		code return getIdr().getLineHeight();
	结束 属性
	
	属性写 尖宽度(宽 : 整数)
		code getIdr().setTriangleWidth(#宽);
	结束 属性
	
	属性读 尖宽度() : 整数
		code return getIdr().getTriangleWidth();
	结束 属性
	
	属性写 尖高度(高 : 整数)
		code getIdr().setTriangleHeight(#高);
	结束 属性
	
	属性读 尖高度() : 整数
		code return getIdr().getTriangleHeight();
	结束 属性
	
	属性写 颜色(颜色 : 整数)
		code getIdr().setLineColor(#颜色);
	结束 属性
	
	属性写 翻转(是否 : 逻辑型)
		code getIdr().setReverse(#是否);
	结束 属性
	
	属性读 翻转() : 逻辑型
		code return getIdr().isReverse();
	结束 属性
	
	属性写 偏移Y(Y : 小数)
		code getIdr().setYOffset((float)#Y);
	结束 属性
	
	属性读 偏移Y() : 小数
		code return (double)getIdr().getYOffset();
	结束 属性
	
结束 类

@导入Java("net.lucode.hackware.magicindicator.buildins.commonnavigator.indicators.*")
类 导航条样式_块 : 导航条样式
	@code
	public #<导航条样式_块>(android.content.Context c){super(c);Indicator = new WrapPagerIndicator(c);}
	public WrapPagerIndicator getIdr(){return (WrapPagerIndicator)Indicator;}
	@end
	
	属性写 纵向边距(边距 : 整数)
		code getIdr().setVerticalPadding(#边距);
	结束 属性
	
	属性读 纵向边距() : 整数
		code return getIdr().getVerticalPadding();
	结束 属性
	
	属性写 横向边距(边距 : 整数)
		code getIdr().setHorizontalPadding(#边距);
	结束 属性
	
	属性读 横向边距() : 整数
		code return getIdr().getHorizontalPadding();
	结束 属性
	
	属性写 颜色(颜色 : 整数)
		code getIdr().setFillColor(#颜色);
	结束 属性
	
	属性写 圆角(半径 : 小数)
		code getIdr().setRoundRadius((float)#半径);
	结束 属性
	
	属性读 圆角() : 小数
		code return (double)getIdr().getRoundRadius();
	结束 属性
	
结束 类

@常量类型(整数)
@需求值类型(整数)
类 导航条宽模式
	
	@静态
	常量 导航项宽度 : 导航条宽模式 = 0
	
	@静态
	常量 导航文本宽度 : 导航条宽模式 = 1
	
	@静态
	常量 自定义宽度 : 导航条宽模式 = 2
	
结束 类