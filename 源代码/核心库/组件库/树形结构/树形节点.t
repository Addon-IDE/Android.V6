@外部依赖库("../../../../../依赖库/JarLib/tree_view.jar")
@导入Java("com.hengx.tiexml.tree.base.*")
@指代类("com.hengx.tiexml.tree.base.Node")
@强制输出
类 树形节点
	
	方法 添加节点(节点 : 树形节点)
		code #this.add(#节点);
	结束 方法
	
	方法 删除节点(索引 : 整数)
		code #this.remove(#索引);
	结束 方法
	
	方法 获取节点(索引 : 整数) : 树形节点
		code return #this.get(#索引);
	结束 方法
	
	方法 清空节点()
		code #this.clear();
	结束 方法
	
	方法 项目数量() : 整数
		code return #this.length();
	结束 方法
	
	属性读 展开() : 逻辑型
		code return #this.isExpand();
	结束 属性
	
	属性写 展开(参数 : 逻辑型)
		code #this.setExpand(#参数);
	结束 属性
	
	属性读 可展开() : 逻辑型
		code return #this.isCanExpand();
	结束 属性
	
	属性写 可展开(参数 : 逻辑型)
		code #this.setCanExpand(#参数);
	结束 属性
	
	方法 查找节点(节点 : 树形节点) : 整数
		code return #this.items.indexOf(#节点);
	结束 方法
	
	方法 取父节点() : 树形节点
		code return #this.getParent();
	结束 方法
	
	//可保存任何数据
	方法 置数据(名称 : 文本, 数据 : 对象)
		code #this.putData(#名称, #数据);
	结束 方法
	
	方法 取数据(名称 : 文本) : 对象
		code return #this.getData(#名称);
	结束 方法
	
	方法 包含数据(名称 : 文本) : 逻辑型
		code return #this.hasData(#名称);
	结束 方法
	
	方法 移除数据(名称 : 文本)
		code #this.removeData(#名称);
	结束 方法
	
	属性读 名称() : 文本
		code return #this.getName();
	结束 属性
	
	属性写 名称(名称 : 文本)
		code #this.setName(#名称);
	结束 属性
	
	//获取节点在父节点中的索引
	属性读 索引() : 整数
		code return #this.getIndex();
	结束 属性
	
	//获取节点的层级数
	属性读 层级() : 整数
		code return #this.getGrade();
	结束 属性
	
	//设置了按钮后才有按钮的动画效果
	属性写 展开按钮(按钮 : 图片框)
		code #this.putData("button", #按钮.getView());
	结束 属性
	
	@嵌入式代码
	@运算符重载
	方法 =(名称 : 文本)
		code new com.hengx.tiexml.tree.base.Node(#名称);
	结束 方法
	
	@运算符重载
	方法 [](名称 : 文本) : 对象
		返回 取数据(名称)
	结束 方法
	
	@运算符重载
	方法 []=(名称 : 文本, 数据 : 对象)
		置数据(名称, 数据)
	结束 方法
	
	@运算符重载
	方法 ?(名称 : 文本) : 逻辑型
		返回 包含数据(名称)
	结束 方法
	
结束 类