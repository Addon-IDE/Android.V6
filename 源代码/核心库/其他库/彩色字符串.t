@导入Java("android.widget. *")
@导入Java("android.os. *")
@导入Java("android.view. *")
@导入Java("android.view.View. *")
@导入Java("android.webkit. *")
@导入Java("android.graphics. *")
@导入Java("android.graphics.drawable. *") 
@导入Java("android.app. *")
@导入Java("android.content. *")
@导入Java("android.content.res. *")
@导入Java("android.text.style. *")
@导入Java("android.text. *")
@导入Java("android.graphics.drawable.Drawable. *")
@导入Java("java.io. *")
@导入Java("java.util.*")
类 彩色字符串

   @code
   private SpannableStringBuilder 操作字符串 = new SpannableStringBuilder();;
   @end

   定义事件 部分文字被点击(高亮内容 为 文本)

   方法 清空()
      @code
      操作字符串.delete(0,操作字符串.length());
      @end
   结束 方法

   方法 追加内容(数据 为 文本)
      @code
      操作字符串.append(#数据);
      @end
   结束 方法

   方法 插入内容(欲插入位置 为 整数,欲插入文本 为 文本)
      @code
      操作字符串.insert(#欲插入位置, #欲插入文本);
      @end
   结束 方法

   方法 删除文本(开始位置 为 整数,结束位置 为 整数)
      @code
      操作字符串.delete(#开始位置,#结束位置);
      @end
   结束 方法

   //此方法想要对目标组件设置"识别超链接"
   方法 设置部分点击(起始位置 为 整数,结束位置 为 整数)
      @code
      class CustomSpan extends ClickableSpan {  

         //private Context context;  
         private String data;  
         public CustomSpan(String data) {  
            //this.context = context;  
            this.data = data;  
         }  

         @Override
         public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setColor(Color.parseColor("#FF0090FF"));//设置颜色
            ds.setUnderlineText(false);//去掉下划线
         }

         @Override  
         public void onClick(View widget) {
            #部分文字被点击(data);
         }  
      }
      String data = 操作字符串.toString().substring(#起始位置,#结束位置);
      CustomSpan clickableSpan = new CustomSpan(data);
      操作字符串.setSpan(clickableSpan, #起始位置, #结束位置, Spannable.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置前景色(起始位置 为 整数,结束位置 为 整数,颜色 为 文本)
      @code
      ForegroundColorSpan colorSpan = new ForegroundColorSpan(Color.parseColor(#颜色));
      操作字符串.setSpan(colorSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置背景色(起始位置 为 整数,结束位置 为 整数,颜色 为 文本)
      @code
      BackgroundColorSpan colorSpan = new BackgroundColorSpan(Color.parseColor(#颜色));
      操作字符串.setSpan(colorSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置大小(起始位置 为 整数,结束位置 为 整数,大小 为 小数)
      @code
      RelativeSizeSpan sizeSpan = new RelativeSizeSpan(大小);
      操作字符串.setSpan(sizeSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置删除线(起始位置 为 整数,结束位置 为 整数)
      @code
      StrikethroughSpan strikethroughSpan = new StrikethroughSpan();
      操作字符串.setSpan(strikethroughSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置下划线(起始位置 为 整数,结束位置 为 整数)
      @code
      UnderlineSpan underlineSpan = new UnderlineSpan();
      操作字符串.setSpan(underlineSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置上标(起始位置 为 整数,结束位置 为 整数)
      @code
      SuperscriptSpan superscriptSpan = new SuperscriptSpan();
      操作字符串.setSpan(superscriptSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置下标(起始位置 为 整数,结束位置 为 整数)
      @code
      SubscriptSpan subscriptSpan = new SubscriptSpan();
      操作字符串.setSpan(subscriptSpan, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置粗体(起始位置 为 整数,结束位置 为 整数)
      @code
      StyleSpan styleSpan_B  = new StyleSpan(Typeface.BOLD);
      操作字符串.setSpan(styleSpan_B, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 设置斜体(起始位置 为 整数,结束位置 为 整数)
      @code
      StyleSpan styleSpan_I  = new StyleSpan(Typeface.ITALIC);
      操作字符串.setSpan(styleSpan_I, #起始位置, #结束位置, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   //修饰效果，模糊(4种)
   方法 设置修饰1(起始位置 为 整数,结束位置 为 整数,样式 为 整数,模糊度 为 整数)
      假如 样式
         是 0
            @code
            BlurMaskFilter filterINNER=new BlurMaskFilter(#模糊度,BlurMaskFilter.Blur.INNER);
            操作字符串.setSpan(new MaskFilterSpan(filterINNER),#起始位置, #结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            @end
         是 1
            @code
            BlurMaskFilter filterNORMAL=new BlurMaskFilter(#模糊度,BlurMaskFilter.Blur.NORMAL);
            操作字符串.setSpan(new MaskFilterSpan(filterNORMAL),#起始位置,#结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            @end
         是 2
            @code
            BlurMaskFilter filterOUTER=new BlurMaskFilter(#模糊度,BlurMaskFilter.Blur.OUTER);
            操作字符串.setSpan(new MaskFilterSpan(filterOUTER),#起始位置,*结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            @end
         是 3
            @code
            BlurMaskFilter filterSOLID=new BlurMaskFilter(#模糊度,BlurMaskFilter.Blur.SOLID);
            操作字符串.setSpan(new MaskFilterSpan(filterSOLID),#起始位置,#结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            @end
      结束 假如

   结束 方法

   //修饰效果，浮雕
   方法 设置修饰2(起始位置 为 整数,结束位置 为 整数)
      @code
      EmbossMaskFilter filter=new EmbossMaskFilter(new float[]{20,20,20},0.5f,1,10);
      操作字符串.setSpan(new MaskFilterSpan(filter),#起始位置,#结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);

      @end
   结束 方法

   方法 设置竖线(起始位置 为 整数,结束位置 为 整数)
      @code
      操作字符串.setSpan(new QuoteSpan(Color.RED),#起始位置,#结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
      @end
   结束 方法

   方法 绝对大小(起始位置 为 整数,结束位置 为 整数,大小 为 整数)
      code 操作字符串.setSpan(new AbsoluteSizeSpan(大小),起始位置,结束位置,Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
   结束 方法


   方法 设置图片(窗口环境 为 安卓窗口,起始位置 为 整数,结束位置 为 整数,资源ID 为 图片资源,x 为 整数,y 为 整数,长 为 整数,宽 为 整数)
      @code
      DynamicDrawableSpan drawableSpan = new DynamicDrawableSpan(DynamicDrawableSpan.ALIGN_BASELINE) {
         Resources res = #窗口环境.getResources();
         @Override

         public Drawable getDrawable() {

            Drawable d = res.getDrawable(#资源ID);

            d.setBounds(#x, #y, #长, #宽);

            return d;

         }

      };

      操作字符串.setSpan(drawableSpan, #起始位置,#结束位置, Spannable.SPAN_INCLUSIVE_EXCLUSIVE);

      @end
   结束 方法

   方法 设置图片2(窗口环境 为 安卓窗口,起始位置 为 整数,结束位置 为 整数,资源ID 为 整数,x 为 整数,y 为 整数,长 为 整数,宽 为 整数)
      @code
      Resources res = #窗口环境.getResources();
      Drawable drawable = res.getDrawable(#资源ID);
      drawable.setBounds(#x, #y, #长, #宽);
      ImageSpan verticalAlignImageSpan = new ImageSpan(drawable);
      操作字符串.setSpan(verticalAlignImageSpan,#起始位置 ,#结束位置,SpannableString.SPAN_INCLUSIVE_EXCLUSIVE);

      @end
   结束 方法



   方法 显示到文本框(目标组件 为 文本框)
      @code
      #目标组件.getView().setText(操作字符串);
      @end
   结束 方法

   方法 显示到编辑框(目标组件 为 编辑框)
      @code
      #目标组件.getView().setText(操作字符串);
      @end
   结束 方法

结束 类