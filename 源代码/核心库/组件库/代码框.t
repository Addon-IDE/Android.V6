@附加权限(安卓权限.文件权限_读取)
@附加权限(安卓权限.文件权限_写入)
@外部依赖库("../../../../依赖库/AarLib/code_editor.aar")
@外部Java文件("../../../../依赖库/Java/TextEditor.java")
@导入Java("com.jiesheng.editor.TextEditor")
@导入Java("com.myopicmobile.textwarrior.base.BaseLanguage")
@导入Java("com.myopicmobile.textwarrior.base.BaseLexer")
@导入Java("android.content.Context")
@导入Java("android.widget.TextView")
类 代码框:可视化组件
	//26条方法(2020.07.05 By：QQ399504016)
	//4.0bug修复2023.08.05
	//颜色配置请在夜间模式下使用
    @code
    private BaseLanguage lang;
    private Context 窗口环境;
	
    public #<代码框>(android.content.Context context) {
        super(context);
		窗口环境 = context;
    }

    @Override
    public com.jiesheng.editor.TextEditor onCreateView(android.content.Context context) {
        return new com.jiesheng.editor.TextEditor(context);
    }
	
   @Override
   public com.jiesheng.editor.TextEditor getView() {
      return (com.jiesheng.editor.TextEditor)super.getView();
   }
    @end
	
	方法 设置补全函数(函数 为 文本[])
      @code
      lang.setNames(#函数);
	  @end
   结束 方法

   方法 设置关键补全函数(函数 为 文本[])
      code lang.setKeywords(#函数);
   结束 方法
   
   方法 设置函数(函数 为 文本[])
      code getView().addNames(#函数);
   结束 方法

   方法 附加程序包(程序包名 为 文本, 函数 为 文本[])
      code getView().addPackage(#程序包名, #函数);
   结束 方法

   //取当前文件路径
   方法 取当前文件路径()为 文本
	   code return getView().getCurrentPath();
   结束 方法
   
   //设置夜间模式状态
   属性写 夜间模式(状态 为 逻辑型)
      code getView().setDark(#状态);
   结束 属性

   //获取夜间模式状态
   属性读 夜间模式() 为 逻辑型
      code return getView().getDark();
   结束 属性

   //设置函数
   方法 设置函数(函数 为 文本[])
      code getView().addNames(#函数);
   结束 方法

   //获取编辑框内容
   方法 获取内容() 为 文本
      code return getView().getText().toString();
   结束 方法
   
   方法 获取光标位置():整数
		code return getView().getSelectionStart();
	结束 方法

   //设置编辑框内容
   方法 设置内容(文本 为 文本)
      code getView().setText(#文本);
   结束 方法

   方法 设置代码框背景色(颜色 为 整数)
      code getView().setPanelBackgroundColor(#颜色);
   结束 方法

   方法 设置代码框前景色(颜色 为 整数)
     code getView().setPanelTextColor(#颜色);
   结束 方法

   方法 设置关键字颜色(颜色 为 整数)
     code getView().setKeywordColor(#颜色);
   结束 方法

   方法 设置基本颜色(颜色 为 整数)
     code getView().setBaseWordColor(#颜色);
   结束 方法

   方法 设置字符串颜色(颜色 为 整数)
     code getView().setStringColor(#颜色);
   结束 方法

   方法 设置方法名颜色(颜色 为 整数)
     code getView().setFunctionColor(#颜色);
   结束 方法

   方法 设置变量名颜色(颜色 为 整数)
     code getView().setVariantColor(#颜色);
   结束 方法

   方法 设置操作符颜色(颜色 为 整数)
     code getView().setOperatorColor(#颜色);
   结束 方法

   方法 设置注释颜色(颜色 为 整数)
     code getView().setCommentColor(#颜色);
   结束 方法

   方法 设置行号颜色(颜色 为 整数)
     code getView().setLineColor(#颜色);
   结束 方法

   方法 设置背景色(颜色 为 整数)
     code getView().setBackgroundColor(#颜色);
   结束 方法

   方法 设置用户字(颜色 为 整数)
     code getView().setTextColor(#颜色);
   结束 方法

   方法 设置选择文本的背景色(颜色 为 整数)
     code getView().setTextHighlightColor(#颜色);
   结束 方法

   //返回选中内容
   方法 取选中文本() 为 文本
      code return getView().getSelectedText().toString();
   结束 方法 

   //跳转行
   方法 转到行(行 为 整数)
      code getView().gotoLine(#行);
   结束 方法

   //在当前位置插入文本
   方法 插入文本(位置 为 整数,内容 为 文本)
      code getView().insert(#位置,#内容);
   结束 方法

   方法 撤销()
      code getView().undo();
   结束 方法

   方法 重做()
      code getView().redo();
   结束 方法

   //打开指定文件
   方法 打开文件(文件路径 为 文本)
      code getView().open(#文件路径);
   结束 方法

   //保存当前文件
   方法 保存文件(文件路径 为 文本)
	   code getView().save(#文件路径);
   结束 方法
   
   //设置自动换行
   方法 自动换行(自动换行 为 逻辑型)
	   code getView().setWordWrap(#自动换行);
   结束 方法
   
   //查找下一个文本
   方法 查找下一个(内容 为 文本)
      code getView().findNext(#内容);
   结束 方法

   方法 全选()
	   code getView().selectAll();
      //code getView().replaceAll();
   结束 方法

结束 类