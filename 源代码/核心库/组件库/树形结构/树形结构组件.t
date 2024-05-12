@外部依赖库("../../../../../依赖库/JarLib/tree_view.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/collection-1.1.0.jar")
@外部依赖库("../../../../../绳包/安卓基本库/依赖库/androidx/recyclerview-1.1.0.aar")
@导入Java("android.view.*")
@导入Java("android.content.*")
@导入Java("com.hengx.tiexml.tree.widget.*")
@导入Java("com.hengx.tiexml.tree.base.*")
@强制输出
类 树形结构组件 : 可视化组件
	
	@code
	@Override
	public View onCreateView(Context context){
		return new TreeListView(context);
	}
	@Override
	public TreeListView getView(){
		return (TreeListView)super.getView();
	}
	
	public #<树形结构组件>(Context context) {
		super(context);
	}
	@end
	
	方法 置适配器(设置适配器 : 树形适配器)
		code getView().setAdapter(#设置适配器.getAdapter());
	结束 方法
	
	方法 取适配器() : 树形适配器
		@code
		TreeAdapter adp = (TreeAdapter)getView().getAdapter();
		return new #<树形适配器>(getView().getContext()).setAdapter(adp);
		@end
	结束 方法
	
	属性写 最大高度(高度 : 整数)
		code getView().setMaxHeight(#高度);
	结束 属性
	
	属性读 最大高度() : 整数
		code return getView().getMaxHeight();
	结束 属性
	
结束 类