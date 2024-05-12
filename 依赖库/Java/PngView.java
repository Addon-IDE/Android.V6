package com.ht.hz;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;


public class PngView extends View {

    private Canvas mCanvas;  //创建画布
    private Bitmap mCacheBitmap;  //画纸
    private Path mPath;  //绘图路径
    private Paint mPaint;  
    private Paint paint;  //画笔
    private TouchEvent to;
	private int view_width, view_height;// 屏幕的高度与宽度
    
    private RectF mRectF;
    private boolean isText = false;
    private boolean start = false;
    private float preX;  //之前X坐标的位置
    private float preY; //之前Y坐标的位置

    public PngView(Context context) {
        super(context);
        mPath = new Path();
        mPaint = new Paint();
        paint = new Paint();
        mPaint.setColor(Color.BLACK);
        paint.setColor(Color.BLACK);
        mPaint.setStyle(Paint.Style.STROKE);
        mPaint.setStrokeCap(Paint.Cap.ROUND);
mCacheBitmap = Bitmap.createBitmap(context.getWallpaperDesiredMinimumHeight(), context.getWallpaperDesiredMinimumHeight(), Bitmap.Config.ARGB_8888);
        mCanvas = new Canvas(mCacheBitmap);
        mCanvas.drawColor(0X00FFFFFF);
    }

    public PngView(Context context, AttributeSet attrs) {
        super(context, attrs);
        mPath = new Path();
        mPaint = new Paint();
        paint = new Paint();
        mPaint.setColor(Color.BLACK);
        paint.setColor(Color.BLACK);
        mPaint.setStyle(Paint.Style.STROKE);
        mPaint.setStrokeCap(Paint.Cap.ROUND);
mCacheBitmap = Bitmap.createBitmap(context.getWallpaperDesiredMinimumHeight(), context.getWallpaperDesiredMinimumHeight(), Bitmap.Config.ARGB_8888);
        mCanvas = new Canvas(mCacheBitmap);
        mCanvas.drawColor(Color.WHITE);
    }

    @Override
    public void draw(Canvas canvas) {
        super.draw(canvas);
        //canvas.drawPath(mPath,mPaint);
        canvas.drawBitmap(mCacheBitmap, 0.0f, 0.0f, null);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction();
        switch (action) {
        case MotionEvent.ACTION_DOWN:
            mPath.moveTo(event.getX(), event.getY());
            preX = event.getX();
            preY = event.getY();
            break;
        case MotionEvent.ACTION_MOVE:
            if (start) {
                if (isText == false) {
                    mPath.quadTo(preX, preY, event.getX(), event.getY());
                    preX = event.getX();
                    preY = event.getY();
                } else {
                    to.move(event.getX(), event.getY());
                }
            }
            break;
        }
        mCanvas.drawPath(mPath, mPaint);
        invalidate();
        return true;
    }


    public void setSize(float size) {
        mPaint.setStrokeWidth(size);
    }

    public void setTextSize(float size) {
        paint.setTextSize(size);
    }

    public void suppress() {
        start = false;
    }

    public void setColor(String ys) {
    
    int hbys = android.graphics.Color.parseColor(ys);
       mPaint.setColor(hbys);
    }

    public void setTextColor(int color) {
        paint.setColor(color);
    }

    public void start() {
        start = true;
    }
    

    public void addText(String text, float x, float y) {
        mCanvas.drawText(text, x, y, paint);
        invalidate();
    }

    public void drawBitmap(String path, int x, int y) {
        mCanvas.drawBitmap(BitmapFactory.decodeFile(path), x, y, paint);
        invalidate();
    }

    public void setTouchEvent(TouchEvent touch) {
        to = touch;
    }

    public void save(String fi) {
        //创建一个文件用于存放图片
        File file = new File(fi);
        if (file.exists()) {
            file.delete();
        }
        OutputStream outputStream = null;
        try {
            //输出到这个文件
            outputStream = new FileOutputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        //压缩形成输出流
        mCacheBitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream);
    }

    public void clear() {
        if (mPath != null) {
            mPath.reset();
            mCanvas.drawColor(0X00FFFFFF);
            invalidate();
        }
    }

    public abstract interface TouchEvent {
        abstract public void move(float x, float y);
    }
    
    
     //画线
   public void hx(int yx, int yy, int xx, int xy, int cx, String ys) 
   {
   //画笔设置
    Paint xpaint = new Paint();
    int xcolor = android.graphics.Color.parseColor(ys);
    xpaint.setColor(xcolor);
    xpaint.setStrokeWidth(cx);
    //线条绘制
	mCanvas.drawLine(yx, yy, xx, xy, xpaint);
	}
    
    
	//画实心矩形
    public void hsxjx(int qdx, int qdy, int zdx, int zdy, String ys)
    {
     Paint jxpaint = new Paint();
     jxpaint.setStyle(Paint.Style.FILL);//实心
	 int jxcolor = android.graphics.Color.parseColor(ys);
     jxpaint.setColor(jxcolor);
     
     mCanvas.drawRect(qdx, qdy, zdx, zdy, jxpaint);
    }
    
    //画空心矩形
    public void hkxjx(int qdx, int qdy, int zdx, int zdy, int cx, String ys)
    {
     Paint jx1paint = new Paint();
	 int jx1color = android.graphics.Color.parseColor(ys);
     jx1paint.setColor(jx1color);
     jx1paint.setStyle(Paint.Style.STROKE);//空心
     jx1paint.setStrokeWidth(cx);//宽度
    
     mCanvas.drawRect(qdx, qdy, zdx, zdy, jx1paint);
    }
    
    
    //画实心圆
    public void sxy(int y1, int y2, int y3, String ys) 
   {
   //画笔设置
    Paint hypaint = new Paint();
    hypaint.setStyle(Paint.Style.FILL);//实心
    hypaint.setStrokeWidth(20);//宽度
    
    
    int hycolor = android.graphics.Color.parseColor(ys);
    hypaint.setColor(hycolor);
    //线条绘制
	mCanvas.drawCircle(y1, y2, y3, hypaint);
	}
    
    
    //画空心圆
    public void kxy(int y1, int y2, int y3,int y4, String ys) 
   {
   //画笔设置
    Paint hkypaint = new Paint();
    hkypaint.setStyle(Paint.Style.STROKE);//空心
    hkypaint.setStrokeWidth(y4);//宽度
    
    int hkycolor = android.graphics.Color.parseColor(ys);
    hkypaint.setColor(hkycolor);
    //线条绘制
	mCanvas.drawCircle(y1, y2, y3, hkypaint);
	}
    
    
    //画多边形
    public int 空心多边(int cx,String ys,int... a) 
   {
   //画笔设置
          Paint kxdbx = new Paint();
          kxdbx.setStrokeWidth(cx);
          kxdbx.setStyle(Paint.Style.STROKE);//空心
          int kxys = android.graphics.Color.parseColor(ys);
          kxdbx.setColor(kxys);
   
   	Path 路径 = new Path();  
       if( a.length > 5 )  //长度大于三个点的xy才会执行
       {
       	路径.moveTo(a[0], a[1]);// 此点为多边形的起点  
           if( (a.length % 2 ) == 0 )
           {
       	     for(int k = 2; k < a.length; k++)
          	 {
            	    路径.lineTo(a[k++], a[k]);  
          	  }
            } else
            {
              for(int k = 2; k < a.length; k++)
          	 {
                   if (( a.length - k) ==  1)
                   {
            	        路径.lineTo( 0 , a[k]);  
                    }
                    else
                    {
                        路径.lineTo(a[k++], a[k]);  
                    }
          	  }
            }
            
       	  路径.close(); // 使这些点构成封闭的多边形 
             
             mCanvas.drawPath(路径, kxdbx);
       }
   return 0;
}

//画实心多边形
        public int 实心多边(int... a) 
   {
   //画笔设置
          Paint kxdbx = new Paint();
   	Path 路径 = new Path();  
       if( a.length > 5 )  //长度大于三个点的xy才会执行
       {
       	路径.moveTo(a[0], a[1]);// 此点为多边形的起点  
           if( (a.length % 2 ) == 0 )
           {
       	     for(int k = 2; k < a.length; k++)
          	 {
            	    路径.lineTo(a[k++], a[k]);  
          	  }
            } else
            {
              for(int k = 2; k < a.length; k++)
          	 {
                   if (( a.length - k) ==  1)
                   {
            	        路径.lineTo( 0 , a[k]);  
                    }
                    else
                    {
                        路径.lineTo(a[k++], a[k]);  
                    }
          	  }
            }
            
       	  路径.close(); // 使这些点构成封闭的多边形 
             
             mCanvas.drawPath(路径, kxdbx);
       }
       return 0;
       }
       
       public void 空心扇形(int cx, String ys, int b, int c, int[] d)
       {
           if(d.length == 4 )
           {
            Paint hx = new Paint();
            hx.setStyle(Paint.Style.STROKE);//设置空心 
            hx.setStrokeWidth(cx);
            int hxys = android.graphics.Color.parseColor(ys);
            hx.setColor(hxys);
            RectF ova = new RectF(d[0],d[1],d[2],d[3]);
            mCanvas.drawArc(ova,b,c,true,hx);//小弧形  
            }
       }
       
       public void 实心扇形(String ys, int b, int c, int[] d)
       {
           if(d.length == 4 )
           {
            Paint hx = new Paint();
            int hxys = android.graphics.Color.parseColor(ys);
            hx.setColor(hxys);
            RectF ova = new RectF(d[0],d[1],d[2],d[3]);
            mCanvas.drawArc(ova,b,c,true,hx);//小弧形  
            }
       }
       
       public void 空心弧形(int cx, String ys, int b, int c, int[] d)
       {
           if(d.length == 4  )
           {
            Paint hx = new Paint();
            hx.setStyle(Paint.Style.STROKE);//设置空心 
            hx.setStrokeWidth(cx);
            int hxys = android.graphics.Color.parseColor(ys);
            hx.setColor(hxys);
            RectF ova = new RectF(d[0],d[1],d[2],d[3]);
            mCanvas.drawArc(ova,b,c,false,hx);//小弧形  
            }
       }
       
       public void 实心弧形(String ys, int b, int c, int[] d)
       {
           if(d.length == 4  )
           {
            Paint hx = new Paint();
            int hxys = android.graphics.Color.parseColor(ys);
            hx.setColor(hxys);
            RectF ova = new RectF(d[0],d[1],d[2],d[3]);
            mCanvas.drawArc(ova,b,c,false,hx);//小弧形  
            }
       }
       
       //实心圆角矩形
       public void 实心圆角矩形(int g, String ys, int b, int c, int e, int f)
       {
        Paint yj = new Paint();
        RectF ov = new RectF(b, c, e, f);// 设置个新的长方形
        int yjys = android.graphics.Color.parseColor(ys);
        yj.setColor(yjys);
        yj.setAntiAlias(true);// 设置画笔的锯齿效果 
        mCanvas.drawRoundRect(ov, g, g, yj);
       }
       
       //空心圆角矩形
        public void 空心圆角矩形(int cx, int g, String ys, int b, int c, int e, int f)
       {
        Paint yj = new Paint();
        RectF ov = new RectF(b, c, e, f);// 设置个新的长方形
        yj.setStyle(Paint.Style.STROKE);//设置空心 
        yj.setStrokeWidth(cx);
        
        int yjys = android.graphics.Color.parseColor(ys);
        yj.setColor(yjys);
        yj.setAntiAlias(true);// 设置画笔的锯齿效果 
        mCanvas.drawRoundRect(ov, g, g, yj);
       }
       
       
       //画点
      public void hd(int a, String ys, int x, int y) {
   	paint.setStrokeWidth(a);
       int yys = android.graphics.Color.parseColor(ys);
       paint.setColor(yys);
       
       mCanvas.drawPoint(x, y, paint);
       invalidate();
    }
    
    
    public void 贝塞尔曲线(int cx, String ys, int a, int b, int c, int d, int e, int f, boolean n){
     //画贝塞尔曲线 
     Paint bsr = new Paint();
     
     bsr.setStrokeWidth(cx);
     int bsrys = android.graphics.Color.parseColor(ys);
     bsr.setColor(bsrys);
     if (n == false)
     {
     bsr.setStyle(Paint.Style.STROKE);
     }
     Path path2 = new Path();
     path2.moveTo(a,b);//设置Path的起点
     path2.quadTo(c,d,e,f);//设置贝塞尔曲线的控制点坐标和终点坐标 
     mCanvas.drawPath(path2,bsr);//画出贝塞尔曲线  
    }
    
    
} 