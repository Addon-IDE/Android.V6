包名 我的.类库.图表类库

@外部依赖库("../../../../../依赖库/AarLib/MPAndroidChart-v3.1.0.aar")
@导入Java("android.content.Context")
@导入Java("com.github.mikephil.charting.charts.LineChart")
@强制输出
类 普通饼状图 : 可视化组件
	@code
	public #<普通饼状图>(Context context) {
        super(context);
    }
	
	@Override
    public LineChart onCreateView(android.content.Context context) {
        LineChart view = new LineChart(context);
        return view;
    }

    @Override
    public LineChart getView() {
        return (LineChart) view;
    }
	@end
结束 类