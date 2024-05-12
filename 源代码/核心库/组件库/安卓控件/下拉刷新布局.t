@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/swiperefreshlayout-1.1.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/interpolator-1.0.0.aar")
@导入Java("androidx.swiperefreshlayout.widget.SwipeRefreshLayout")
@导入Java("androidx.core.view.NestedScrollingParent3")
@导入Java("androidx.interpolator.view.animation.FastOutSlowInInterpolator")


类 下拉刷新布局 : 可调整边距布局组件
	@code
    public #<下拉刷新布局>(android.content.Context context) {
        super(context);
		getView().setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener(){
			@Override
			public void onRefresh() {
				#下拉被刷新();
			}
		});
    }
	
    @Override
    public androidx.swiperefreshlayout.widget.SwipeRefreshLayout onCreateView(android.content.Context context) {
        androidx.swiperefreshlayout.widget.SwipeRefreshLayout view = new androidx.swiperefreshlayout.widget.SwipeRefreshLayout(context);
        return view;
    }

    @Override
    public androidx.swiperefreshlayout.widget.SwipeRefreshLayout getView() {
        return (androidx.swiperefreshlayout.widget.SwipeRefreshLayout) view;
    }
    @end
	
	方法 刷新(刷新:逻辑型)
		code getView().setRefreshing(#刷新);
	结束 方法
	
	定义事件 下拉被刷新()
	
结束 类