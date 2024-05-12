@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/annotation-1.1.0.jar")
@外部Java文件("../../../../依赖库/Java/JsonAndXml/FileReader.java")
@外部Java文件("../../../../依赖库/Java/JsonAndXml/JsonToXml.java")
@外部Java文件("../../../../依赖库/Java/JsonAndXml/Node.java")
@外部Java文件("../../../../依赖库/Java/JsonAndXml/Tag.java")
@外部Java文件("../../../../依赖库/Java/JsonAndXml/XmlToJson.java")
@导入Java("fr.arnaudguyon.xmltojsonlib.XmlToJson")
@导入Java("fr.arnaudguyon.xmltojsonlib.JsonToXml")

类 JsonAndXml
	
	@静态
	方法 XML到JSON(xml内容 : 文本) : 文本
		@code
		String xmlString = #xml内容;
  	  XmlToJson xmlToJson = new XmlToJson.Builder(xmlString).build();
  	  String jsonString = xmlToJson.toString();
		return jsonString;
		@end
	结束 方法
	
	@静态
	方法 JSOM到XML(json内容 : 文本) : 文本
		@code
		String jsonString = #json内容;
  	  JsonToXml jsonToXml = new JsonToXml.Builder(jsonString).build();
  	  String xmlString = jsonToXml.toString();
		return xmlString;
		@end
	结束 方法
	
结束 类