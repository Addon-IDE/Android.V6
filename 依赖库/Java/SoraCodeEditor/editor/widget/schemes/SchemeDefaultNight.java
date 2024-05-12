package io.github.rosemoe.sora.widget.schemes;

import io.github.rosemoe.sora.widget.EditorColorScheme;


public class SchemeDefaultNight extends EditorColorScheme {

    @Override
    public void applyDefault() {
      super.applyDefault();
        //注解
        setColor(ANNOTATION, 0xFFF0F0F0);
        //函数名称
        setColor(FUNCTION_NAME, 0xFF9CDCFE);
        //标识符名称
        setColor(IDENTIFIER_NAME, 0xFF9B9BC8);
        //标识符变量
        setColor(IDENTIFIER_VAR, 0xFF9B9BC8);
        //常量
        setColor(LITERAL, 0xFFD9D9D9);
        //操作符
        setColor(OPERATOR, 0xFFD69D85);
        //注释
        setColor(COMMENT, 0xFF60AE6F);
        //关键字
        setColor(KEYWORD, 0xFF569CD6);
        //背景
        setColor(WHOLE_BACKGROUND, 0xFF262626);
        //文本正常
        setColor(TEXT_NORMAL, 0xFFC8C8C8);
        //行号背景
        setColor(LINE_NUMBER_BACKGROUND, 0xFF262626);
        //行号文本
        setColor(LINE_NUMBER, 0xFF535353);
        //行号分割线
        setColor(LINE_DIVIDER, 0xFF535353);
        //滚动条缩略图
        setColor(SCROLL_BAR_THUMB, 0xFFC8C8C8);
        //滚动条按下
        setColor(SCROLL_BAR_THUMB_PRESSED, 0xFFC8C8C8);
        //选定的文本背景
        setColor(SELECTED_TEXT_BACKGROUND, 0xFF2196F3);
		//搜索结果突出显示颜色
        setColor(MATCHED_TEXT_BACKGROUND, 0xFFFFFF00);
        //当前行的背景色
        setColor(CURRENT_LINE, 0xFF101010);
        //光标颜色
        setColor(SELECTION_INSERT, 0xFFFFFFFF);
        //选择时光标颜色
        setColor(SELECTION_HANDLE, 0xFF2196F3);
        //代码区块画线处
        setColor(BLOCK_LINE, 0xFF535353);
        //当前区块画线处
        setColor(BLOCK_LINE_CURRENT, 0xFF569CD6);
        //空白符颜色
        setColor(NON_PRINTABLE_CHAR, 0xFFC8C8C8);
        
        //问题警告
        setColor(PROBLEM_WARNING, 0xFFFFC561);
        //问题错误
        setColor(PROBLEM_ERROR, 0xFFFD0100);
        //属性值
        setColor(ATTRIBUTE_VALUE, 0xFF9B9BC8);
        //属性名称
        setColor(ATTRIBUTE_NAME, 0xFF9B9BC8);
        //HTML标记
        setColor(HTML_TAG, 0xFF4EC9B0);
        //文本选定
        setColor(TEXT_SELECTED, 0xFFFFFFFF);
        //自动补全面板角
        setColor(AUTO_COMP_PANEL_CORNER, 0xFFFFFFFF);
        //自动补全面板背景
        setColor(AUTO_COMP_PANEL_BG, 0xFF222222);
        //行块标签
        setColor(LINE_BLOCK_LABEL, 0xFFE0E0E0);
        //行号面板文本
        setColor(LINE_NUMBER_PANEL_TEXT, 0xFFFFFFFF);
        //行号面板
        setColor(LINE_NUMBER_PANEL, 0xFF24292E);
        //滚动条轨道
        setColor(SCROLL_BAR_TRACK, 0xFF28292B);
        //下划线
        setColor(UNDERLINE, 0xFF3F51B5);
   }

}