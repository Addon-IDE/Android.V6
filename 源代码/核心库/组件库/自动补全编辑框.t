@导入Java("android.widget.*")
类 自动补全编辑框 继承 编辑框
	@code
	private android.text.TextWatcher watcher;
	public #<自动补全编辑框>(android.content.Context context) {
        super(context);
    }

    @Override
    public AutoCompleteTextView onCreateView(android.content.Context context) {
        AutoCompleteTextView view = new AutoCompleteTextView(context);
        return view;
    }

   @Override
   public AutoCompleteTextView getView() {
      return (AutoCompleteTextView)super.getView();
   }
   @end

	方法 设置补全内容(窗口环境 为 安卓环境,内容 为 文本[])
		@code
      ArrayAdapter < String > adapter = new ArrayAdapter < String >(#窗口环境, android.R.layout.simple_list_item_1, #内容);
      getView().setAdapter(adapter);
      @end
	结束 方法

	属性写 最低补全字数(字数 为 整数)
		code getView().setThreshold(#字数);
	结束 属性

结束 类