@导入Java("java.io.BufferedReader")
@导入Java("java.io.FileReader")
@导入Java("java.io.IOException")

类 proc信息
	
	@静态
	方法 CPU信息() : 文本
		@code
		StringBuilder content = new StringBuilder();
        try {
            BufferedReader reader = new BufferedReader(new FileReader("/proc/cpuinfo"));
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line);
                content.append(System.lineSeparator());
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
		@end
	结束 方法
	
	@静态
	方法 内存信息() : 文本
		@code
		StringBuilder content = new StringBuilder();
        try {
            BufferedReader reader = new BufferedReader(new FileReader("/proc/meminfo"));
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line);
                content.append(System.lineSeparator());
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
		@end
	结束 方法
	
结束 类