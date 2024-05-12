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
类 十六转字符串 

   //若要在布局里直接添加，必须要有此构造方法
   @静态
   方法 开始(hex 为 文本)为 文本
      @code
      return hexToString(#hex);
      @end
   结束 方法
   @code
   public static String hexToString(String hex) {
      byte[] bytes = new byte[hex.length() / 2];
      for (int i = 0; i < bytes.length; i++) {
         int index = i * 2;
         int value = Integer.parseInt(hex.substring(index, index + 2), 16);
         bytes[i] = (byte) value;
      }
      return new String(bytes, StandardCharsets.UTF_8);
   }
   @end
结束 类