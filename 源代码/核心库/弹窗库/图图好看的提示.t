@导入Java("android.content.Context")
@导入Java("android.graphics.drawable.GradientDrawable")
@导入Java("android.widget.TextView")
@导入Java("android.widget.Toast")
类 图图好看的提示
	
	@code
	private static android.content.Context c;
    private static android.widget.Toast toast;
    private static android.widget.TextView tv;
    private static int errorBkColor = -2485742;
    private static int errorPaddingColor = 0x77da1212;
    private static int errortextColor = -2485742;
    private static int successBkColor = -11953586;
    private static int successPaddingColor = 0x77499a4e;
    private static int successtextColor = -11953586;
    private static int infoBkColor = -11574595;
    private static int infoPaddingColor = 0x774f62bd;
    private static int infotextColor = -11574595;
    private static int warningBkColor = -19950;
    private static int warningPaddingColor = 0x77ffb212;
    private static int warningtextColor = -19950;
	
	
	public #<图图好看的提示>(android.content.Context context) {
	    //super(context);
        c = context;
        tv = new android.widget.TextView(context);
	}
	
	
	
	private static void myDrawable(int i, int i2) {
        android.graphics.drawable.GradientDrawable gradientDrawable = new android.graphics.drawable.GradientDrawable();
        gradientDrawable.setSize(700, 100);
        gradientDrawable.setStroke(5, i);
        gradientDrawable.setColor(i2);
        gradientDrawable.setCornerRadius(45);
        tv.setBackground(gradientDrawable);
    }
	
	private static Toast msg(android.content.Context context, String str, int i, int i2, int i3, int i4) {
        if (toast != null) {
            toast.cancel();
        }
        tv = new TextView(context);
        tv.setText(str);
        tv.setTextColor(i2);
        tv.setTextSize(18);
        tv.setGravity(17);
        tv.setPadding(5, 5, 5, 5);
        myDrawable(i3, i4);
        toast = new Toast(context);
        toast.setView(tv);
        toast.setDuration(i);
        toast.setGravity(80, 0, 70);
        return toast;
    }
	
	 private static Toast errorMsg(android.content.Context context, String str, int i) {
        return msg(context, str, i, errortextColor, errorBkColor, errorPaddingColor);
    }

    private static Toast successMsg(android.content.Context context, String str, int i) {
        return msg(context, str, i, successtextColor, successBkColor, successPaddingColor);
    }

    private static Toast infoMsg(android.content.Context context, String str, int i) {
        return msg(context, str, i, infotextColor, infoBkColor, infoPaddingColor);
    }

    private static Toast warningMsg(android.content.Context context, String str, int i) {
        return msg(context, str, i, warningtextColor, warningBkColor, warningPaddingColor);
    }
	@end
	
	@静态 
	方法 错误(环境 : 安卓环境, 内容 : 文本, 角度 : 整数) : 安卓提示框
		code return errorMsg(#环境,#内容,#角度);
	结束 方法
	
	@静态 
	方法 成功(环境 : 安卓环境, 内容 : 文本, 角度 : 整数) : 安卓提示框
		code return successMsg(#环境,#内容,#角度);
	结束 方法
	
	@静态 
	方法 温馨(环境 : 安卓环境, 内容 : 文本, 角度 : 整数) : 安卓提示框
		code return infoMsg(#环境,#内容,#角度);
	结束 方法
	
	@静态 
	方法 警告(环境 : 安卓环境, 内容 : 文本, 角度 : 整数) : 安卓提示框
		code return warningMsg(#环境,#内容,#角度);
	结束 方法
结束 类