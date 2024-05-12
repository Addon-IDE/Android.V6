类 其他_转换

	@静态
	方法 转换文件大小(大小 : 长整数) : 文本
		如果 大小 <= 1024 则
			返回 大小+" B"
		否则 大小 >= 1024 && 大小 <= 1024*1024
			返回 大小/1024 +" KB"
		否则 大小 >= 1024*1024 && 大小 <= 1024*1024*1024
			返回 四舍五入(大小/1024F/1024F,2) +" MB"
		否则 大小 >= 1024*1024*1024 
			返回 四舍五入(大小/1024F/1024F/1024F,2) +" GB"
		结束 如果
		返回 ""
	结束 方法

	@静态
	方法 转换(值 为 文本,值的进制 为 整数,改为的进制 为 整数) 为 文本
		如果 值的进制 >= 2 且 值的进制 <= 36 且 改为的进制 >= 2 且 改为的进制 <= 36 则
			code return transRadix(#值,#值的进制,#改为的进制);
		否则
			返回 "出错"
		结束 如果
	结束 方法

	@code
   static char chs[] = new char[36];
   static {
      for(int i = 0; i < 10 ; i++) {
         chs[i] = (char)('0' + i);
      }
      for(int i = 10; i < chs.length; i++) {
         chs[i] = (char)('a' + (i - 10));
      }
   }
   static String transRadix(String num, int fromRadix, int toRadix) {
   int number = Integer.valueOf(num, fromRadix);
   if (number == 0) {
      return "0";
   }
   StringBuilder sb = new StringBuilder();
   while (number != 0) {
      sb.append(chs[number % toRadix]);
      number = number / toRadix;
   }
   return sb.reverse().toString();
}
   @end

结束 类