@外部依赖库("../../../../../依赖库/JarLib/tree_view.jar")
@导入Java("com.hengx.tiexml.tree.widget.*")
@导入Java("com.hengx.tiexml.tree.base.*")
@导入Java("android.content.*")
@导入Java("android.view.*")
@导入Java("androidx.recyclerview.widget.*")
@导入Java("android.content.res.Resources")
@导入Java("android.util.TypedValue")
@导入Java("android.content.res.TypedArray")
@强制输出
类 树形适配器 : 窗口组件
	
	@code
	private TreeAdapter adapter;
	
	public #<树形适配器>(Context context){
		super(context);
		this.adapter = new TreeAdapter(context) {
			@Override
			public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
				Node node = items[i];
				MyViewMap map = (MyViewMap)viewHolder;
				#加载项目(i, map.map, node);
				if(node.hasData("button")){
					View view = (View)node.getData("button");
					Resources.Theme theme = view.getContext().getTheme();
      			  TypedValue typedValue = new TypedValue();
     			   theme.resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, typedValue, true);
     			   int[] attribute = new int[] { android.R.attr.selectableItemBackgroundBorderless };
     			   TypedArray typedArray = theme.obtainStyledAttributes(typedValue.resourceId, attribute);
     			   view.setBackground(typedArray.getDrawable(0));
					view.setOnClickListener(new View.OnClickListener(){
						@Override
						public void onClick(View v){
							#节点被展开(node);
							#展开节点(node);
						}
					});
				}
				View view = map.map.getLayout().getView();
				view.setOnClickListener(new View.OnClickListener(){
					@Override
					public void onClick(View v){
						#节点被单击(node);
					}
				});
				view.setOnLongClickListener(new View.OnLongClickListener(){
					@Override
					public boolean onLongClick(View v){
						#节点被长按(node);
						return true;
					}
				});
			}
	
			@Override
			public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
				MyViewMap map = new MyViewMap(#创建组件(i));
				if(viewGroup != null) {
					ViewGroup.LayoutParams lpm = viewGroup.getLayoutParams();
					if(lpm == null) lpm = new ViewGroup.LayoutParams(-2, -2);
					lpm.width = -1;
					lpm.height = -2;
					viewGroup.setLayoutParams(lpm);
				}
				View view = map.map.getLayout().getView();
				lpm: {
					ViewGroup.LayoutParams lpm = view.getLayoutParams();
					if(lpm == null) lpm = new ViewGroup.LayoutParams(-2, -2);
					lpm.width = -1;
					lpm.height = -2;
					view.setLayoutParams(lpm);
				}
				return map;
			}
		};
	}
	
	private static class MyViewMap extends RecyclerView.ViewHolder {
		public #<组件容器> map;
		public MyViewMap(#<组件容器> m){
			super(m.getLayout().getView());
			this.map = m;
		}
	}
	
	public #<树形适配器> setAdapter(TreeAdapter adapter) {
		this.adapter = adapter;
		return this;
	}
	
	public TreeAdapter getAdapter() {
		return this.adapter;
	}
	@end
	
	//添加根节点
	方法 添加项目(节点 : 树形节点)
		code adapter.add(#节点);
	结束 方法
	
	//删除根节点
	方法 删除节点(索引 : 整数)
		code adapter.remove(#索引);
	结束 方法
	
	//获取根节点
	方法 获取项目(索引 : 整数) : 树形节点
		code return adapter.get(#索引);
	结束 方法
	
	//清空列表框
	方法 清空项目()
		code adapter.clear();
	结束 方法
	
	//获取根节点的数量
	属性读 项目数量() : 整数
		code return adapter.getItemCount();
	结束 属性
	
	//展开或折叠一个节点，带动画
	方法 展开节点(节点 : 树形节点)
		code adapter.expand(#节点);
	结束 方法
	
	//刷新列表框，不带动画
	方法 更新列表()
		code adapter.update(true);
	结束 方法
	
	//仅更新数据，不刷新列表
	方法 更新数据()
		code adapter.update(false);
	结束 方法
	
	//该事件用于创建列表项目的组件，和列表数据没有关系
	定义事件 创建组件(索引 : 整数) : 组件容器
	
	//该事件用于绑定列表数据
	定义事件 加载项目(索引 : 整数, 容器 : 组件容器, 节点 : 树形节点)
	
	定义事件 节点被单击(节点 : 树形节点)
	
	定义事件 节点被长按(节点 : 树形节点)
	
	定义事件 节点被展开(节点 : 树形节点)
	
结束 类