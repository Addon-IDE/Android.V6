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
@导入Java("java.util. *")
@导入Java("java.io. *")
@导入Java("java.nio.charset.StandardCharsets")
类 字符串转十六

   //若要在布局里直接添加，必须要有此构造方法
   @静态
   方法 开始(字符串 为 文本)为 文本
      @code
      return strToHex(#字符串);
      @end
   结束 方法
   @code
   public static String strToHex(String str) {
      StringBuilder hexBuilder = new StringBuilder();

      byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
      for (byte b : bytes) {
         hexBuilder.append(String.format("%02X", b));
      }

      return hexBuilder.toString();
   }
   @end
结束 类