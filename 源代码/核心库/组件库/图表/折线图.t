包名 我的.类库.图表类库

/**
 * 折线图类库_1.0
 * Github：https://github.com/PhilJay/MPAndroidChart
 *
 * 本类库作者：WYstudio QQ：1519258319
 * 最后一次编辑日期：2023-1-22
 */

@外部依赖库("../../../../../依赖库/AarLib/MPAndroidChart-v3.1.0.aar")
@导入Java("android.content.Context")
@导入Java("com.github.mikephil.charting.charts.LineChart")
@导入Java("com.github.mikephil.charting.data.LineData")
@导入Java("com.github.mikephil.charting.components.XAxis")
@导入Java("com.github.mikephil.charting.components.YAxis")
@导入Java("com.github.mikephil.charting.data.Entry")
@导入Java("com.github.mikephil.charting.data.LineDataSet")
@导入Java("com.github.mikephil.charting.interfaces.datasets.ILineDataSet")
@导入Java("com.github.mikephil.charting.components.Description")
@导入Java("java.util.ArrayList")
@导入Java("android.graphics.Color")
@强制输出
类 普通折线图 : 可视化组件
	@code
	public LineData lineData;
	public LineChart chart;
	public XAxis xAxis;
	public YAxis yAxis;
	private ArrayList<ILineDataSet> dataSets = new ArrayList<ILineDataSet>();
	public #<普通折线图>(Context context) {
        super(context);
    }
	
	@Override
    public LineChart onCreateView(android.content.Context context) {
        LineChart view = new LineChart(context);
        LineData data = new LineData();
        view.setData(data);
        return view;
    }

    @Override
    public LineChart getView() {
        return (LineChart) view;
    }
	@end
	
	方法 初始化()
		@code
		chart = getView();
		xAxis = chart.getXAxis();
		yAxis = chart.getAxisLeft();
		//设置X轴显示的位置
        xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
        //设置X轴的最小值
        xAxis.setAxisMinimum(0f);
		@end
	结束 方法
	
	方法 设置图表是否可拖拽(值 : 逻辑型)
		@code
		chart.setDragEnabled(#值);
		@end
	结束 方法
	
	方法 设置图表是否可缩放(值 : 逻辑型)
		@code
		chart.setScaleEnabled(#值);
		@end
	结束 方法
	
	方法 设置图表是否可双击缩放(值 : 逻辑型)
		@code
		chart.setDoubleTapToZoomEnabled(#值);
		@end
	结束 方法
	
	方法 设置图表描述信息(是否显示 : 逻辑型,描述信息 : 文本 = "折线图")
		@code
		Description description = new Description();
		description.setEnabled(#是否显示);
		description.setText(#描述信息);
		chart.setDescription(description);
		@end
	结束 方法
	
	方法 设置图表背景颜色(颜色 : 文本)
		@code
		chart.setBackgroundColor(Color.parseColor(#颜色));
		@end
	结束 方法
	
	方法 设置是否显示X轴(值 : 逻辑型)
		@code
		xAxis.setEnabled(#值);
		@end
	结束 方法
	
	方法 设置是否以X轴缩放(值 : 逻辑型)
		@code
		chart.setScaleXEnabled(#值);
		@end
	结束 方法
	
	方法 设置X坐标轴样式(坐标轴颜色 : 文本 = "#000000",坐标轴宽度 : 单精度小数 = 1f)
		@code
		xAxis.setAxisLineColor(Color.parseColor(#坐标轴颜色));
		xAxis.setAxisLineWidth(#坐标轴宽度);
		@end
	结束 方法
	
	方法 设置X轴文字样式(字体大小 ：单精度小数 = 10f,字体颜色 : 文本 = "#000000")
		@code
		xAxis.setTextSize(#字体大小);
		xAxis.setTextColor(Color.parseColor(#字体颜色));
		@end
	结束 方法
	
	方法 设置是否显示X轴网格线(值 : 逻辑型)
		@code
		xAxis.setDrawGridLines(#值);
		@end
	结束 方法
	
	方法 设置是否显示Y轴(值 : 逻辑型)
		@code
		yAxis.setEnabled(#值);
		@end
	结束 方法
	
	方法 设置Y轴是否跟随缩放(值 : 逻辑型)
		@code
		chart.setPinchZoom(#值);
		@end
	结束 方法
	
	方法 设置Y轴坐标轴样式(坐标轴颜色 : 文本 = "#000000",坐标轴宽度 : 单精度小数 = 1f)
		@code
		yAxis.setAxisLineColor(Color.parseColor(#坐标轴颜色));
		yAxis.setAxisLineWidth(#坐标轴宽度);
		@end
	结束 方法
	
	方法 设置Y轴文字样式(字体大小 ：单精度小数 = 10f,字体颜色 : 文本 = "#000000")
		@code
		yAxis.setTextSize(#字体大小);
		yAxis.setTextColor(Color.parseColor(#字体颜色));
		@end
	结束 方法
	
	方法 设置是否显示Y轴网格线(值 : 逻辑型)
		@code
		yAxis.setDrawGridLines(#值);
		@end
	结束 方法
	
	方法 添加数据(数据 : 单精度小数, 折线id : 整数)
		@code
		addData(#数据,#折线id);
		@end
	结束 方法
	
	方法 添加折线(名称 : 文本, 颜色 : 文本 = "#000000")
		@code
		createNewLine(#颜色,#名称);
		@end
	结束 方法
	
	方法 显示折线(节点字体颜色 : 文本 = "#888888",节点字体大小 : 单精度小数 = 5f)
		@code
		LineData data = new LineData(dataSets);
        data.setValueTextColor(Color.parseColor(#节点字体颜色));
		data.setValueTextSize(#节点字体大小);
        chart.setData(data);
        //刷新图表
        chart.invalidate();
		@end
	结束 方法
	
	方法 删除所有数据()
		@code
		reset();
		@end
	结束 方法
	
	@code
	private void init(){
        //可拖拽
        chart.setDragEnabled(true);
        //可缩放
        chart.setScaleEnabled(true);
        //设置背景颜色，和APP背景融合
        chart.setBackgroundColor(Color.parseColor("#fafafa"));
        initX(chart.getXAxis());
        initY(chart.getAxisLeft());
    }

    /**
     * 初始化三条折线
     */
    private void initLines(){
        //X方向
        createNewLine("#607d8b","X");
        //Y方向
        createNewLine("#e91e63","Y");
        //Z方向
        createNewLine("#673ab7","Z");
        LineData data = new LineData(dataSets);
        data.setValueTextColor(Color.GRAY);
        chart.setData(data);
        //刷新图表
        chart.invalidate();
    }
	
	/**
     * 初始化X轴设置
     */
	private void initX(XAxis xAxis){
        //设置X轴显示的位置
        xAxis.setPosition(XAxis.XAxisPosition.BOTTOM);
        //设置X轴的最小值
        xAxis.setAxisMinimum(0f);
        //关闭X轴的网格线
        xAxis.setDrawGridLines(false);
    }

    /**
     * 初始化Y轴设置
     */
    private void initY(YAxis yAxis){
    }
	
    /**
     * 追加数据
     * @param val 数据
     * @param line 折线id
     */	
	public void addData(float val,int line){
        //获取所有的图标数据
        LineData data =chart.getData();
        //获取指定折线id的数据
        ILineDataSet dataSet=data.getDataSetByIndex(line);
        //获取最后一个X轴的坐标
        int lastXIndex=dataSet.getEntryCount();
        //追加数据
        data.addEntry(new Entry(lastXIndex,val),line);
        //通知线性表数据已经更新
        chart.notifyDataSetChanged();
        //设置X轴的显示间隔，数据滚动更新
        chart.setVisibleXRange(4,8);
        //移动到最后一个X轴的位置
        chart.moveViewToX(lastXIndex);
    }
	
	/**
     * 新建一条折线
     * @param lineColor 折线的背景颜色
     */
    public void createNewLine(String lineColor,String lineLabel){
        ArrayList<Entry> yValue = new ArrayList<>();
        yValue.add(new Entry(0,0));
        final LineDataSet dataSet=new LineDataSet(yValue,lineLabel);
        dataSet.setColor(Color.parseColor(lineColor));
        dataSet.setLineWidth(2f);
        dataSets.add(dataSet);
    }
	
	public LineData getData(){
        return chart.getData();
    }

    public LineChart getChart(){
        return chart;
    }

    public ArrayList<ILineDataSet> getDataSets(){
        return dataSets;
    }

    public void reset(){
        chart.removeAllViews();
    }
	@end
结束 类