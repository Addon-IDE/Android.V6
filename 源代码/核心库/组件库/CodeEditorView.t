//资源
@安卓资源("../../../../资源库/核心库资源/SoraCodeEditor")
//安卓
@导入Java("android.graphics.Typeface")
@导入Java("java.io.InputStreamReader")
//依赖库
@外部依赖库("../../../../依赖库/JarLib/google_gson.jar")
@外部依赖库("../../../../依赖库/JarLib/org_jcodings.jar")
@外部依赖库("../../../../依赖库/JarLib/org_joni.jar")
@外部依赖库("../../../../依赖库/JarLib/w3c_css_sac.jar")
@外部依赖库("../../../../依赖库/JarLib/xml-apis-2.0.0.jar")
@外部依赖库("../../../../依赖库/JarLib/textmate-core.jar")
@外部依赖库("../../../../依赖库/JarLib/antlr-4.9.2-complete.jar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/annotation-1.1.0.jar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/material/material-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/cardview-1.0.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/appcompat-1.1.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/core-1.3.0.aar")
@外部依赖库("../../../../绳包/安卓基本库/依赖库/androidx/coordinatorlayout-1.1.0.aar")
//editor
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/annotations/Experimental.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/data/BlockLine.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/data/CompletionItem.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/data/NavigationItem.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/data/ObjectAllocator.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/data/Span.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/graphics/BufferedDrawPoints.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/graphics/FontCache.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/EditorEventListener.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/AutoCompleteProvider.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/CodeAnalyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/EditorLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/ExternalRenderer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/EditorTextActionPresenter.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/interfaces/NewlineHandler.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/langs/EmptyLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/BlocksUpdater.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/CachedIndexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/CharPosition.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/Content.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/ContentLine.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/ContentListener.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/Cursor.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/FormatThread.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/Indexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/LineRemoveListener.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/LineNumberCalculator.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/NoCacheIndexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/SpanMapUpdater.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/SpanRecycler.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/TextAnalyzeResult.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/TextAnalyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/TextLayoutHelper.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/TextUtils.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/text/UndoManager.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/util/ArrayList.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/util/BinaryHeap.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/util/IntPair.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/util/LongArrayList.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/util/ThemeUtils.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeEclipse.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/HTMLScheme.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeDarcula.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeGitHub.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeNotepadXX.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemePurple.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeVS2019.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeDefault.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/schemes/SchemeDefaultNight.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/AbstractLayout.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/CodeEditor.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/CursorAnimator.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/CursorBlink.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/DefaultCompletionItemAdapter.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorAutoCompleteWindow.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorBasePopupWindow.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorColorScheme.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorCompletionAdapter.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorInputConnection.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorSearcher.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorTextActionModeStarter.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorTextActionWindow.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/EditorTouchEventHandler.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/HwAcceleratedRenderer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/KeyMetaStates.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/Layout.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/LineBreakLayout.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/MaterialEdgeEffect.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/Magnifier.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/Row.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/RowIterator.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/SymbolChannel.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/SymbolInputView.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/SymbolPairMatch.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/TextActionPopupWindow.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/TextComposeBasePopup.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/editor/widget/WordwrapLayout.java")
@导入Java("io.github.rosemoe.sora.widget.CodeEditor")
//language-base
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-base/IdentifierAutoComplete.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-base/internal/MyCharacter.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-base/internal/Pinyin.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-base/internal/TrieTree.java")
//language-universal
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/CDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/CppDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/JavaScriptDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/PhpDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/JsonDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/desc/FunctionDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/universal/LanguageDescription.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/universal/UniversalLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/universal/UniversalTokenizer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language-universal/universal/UniversalTokens.java")
//textmate-languageconfiguration
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/CharacterPair.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/AutoClosingPairConditional.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/CharacterPairSupport.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/CommentSupport.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/Comments.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/EnterAction.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/EnterActionAndIndent.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/Folding.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/IndentationRule.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/OnEnterRule.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/supports/OnEnterSupport.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/utils/RegExpUtils.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/LanguageConfigurator.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/internal/LanguageConfiguration.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/textmate-languageconfiguration/ILanguageConfiguration.java")
//Java 语言
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/css3/CSS3Analyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/css3/CSS3Language.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/css3/CSS3Lexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/html/HTMLAnalyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/html/HTMLAutoComplete.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/html/HTMLLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/html/HTMLLexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/java/JavaCodeAnalyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/java/JavaLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/java/JavaTextTokenizer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/java/Tokens.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/python/PythonCodeAnalyzer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/python/PythonLanguage.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/python/PythonLexer.java")
@外部Java文件("../../../../依赖库/Java/SoraCodeEditor/language/python/PythonLexerBase.java")
@导入Java("io.github.rosemoe.sora.langs.css3.CSS3Language")
@导入Java("io.github.rosemoe.sora.langs.html.HTMLLanguage")
@导入Java("io.github.rosemoe.sora.langs.java.JavaLanguage")
@导入Java("io.github.rosemoe.sora.langs.python.PythonLanguage")
//设置主题
@导入Java("io.github.rosemoe.sora.widget.EditorColorScheme")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeDarcula")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeEclipse")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeGitHub")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeNotepadXX")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemePurple")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeVS2019")
@导入Java("io.github.rosemoe.sora.widget.schemes.HTMLScheme")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeDefault")
@导入Java("io.github.rosemoe.sora.widget.schemes.SchemeDefaultNight")
//语言相关
@导入Java("io.github.rosemoe.sora.interfaces.EditorLanguage")
@导入Java("io.github.rosemoe.sora.langs.universal.UniversalLanguage")
@导入Java("io.github.rosemoe.sora.langs.desc.CDescription")
@导入Java("io.github.rosemoe.sora.langs.desc.CppDescription")
@导入Java("io.github.rosemoe.sora.langs.desc.JavaScriptDescription")
@导入Java("io.github.rosemoe.sora.langs.desc.PhpDescription")
@导入Java("io.github.rosemoe.sora.langs.desc.JsonDescription")
@导入Java("io.github.rosemoe.sora.langs.desc.FunctionDescription")
//其他
@导入Java("io.github.rosemoe.sora.text.Cursor")
@导入Java("io.github.rosemoe.sora.text.Content")
@导入Java("io.github.rosemoe.sora.widget.EditorColorScheme")
@导入Java("android.graphics.Color")

类 CodeEditorView : 可视化组件

	@code
	public #<CodeEditorView>(android.content.Context context) {
        super(context);
		getView().setOnCodeChangedListener(new CodeEditor.OnCodeChangedListener(){
			@Override
			public void onCodeChanged(String imports) {
				#最近输入(imports);
			}
			@Override
			public void onCodeChanged2(String content) {
				#最近删除(content);
			}
		});
    }

    @Override
    public io.github.rosemoe.sora.widget.CodeEditor onCreateView(android.content.Context context) {
        io.github.rosemoe.sora.widget.CodeEditor view = new io.github.rosemoe.sora.widget.CodeEditor(context);
		return view;
    }
	
	@Override
    public io.github.rosemoe.sora.widget.CodeEditor getView() {
        return (io.github.rosemoe.sora.widget.CodeEditor) view;
    }
	@end
	
	//获取代码框
	属性读 代码框() : CodeEditorView
		code return getView();
	结束 属性
	//获取是否启用放大镜
	属性读 获取放大镜() : 逻辑型
		code return getView().isMagnifierEnabled();
	结束 属性
	//获取是否启用固定行号
	属性读 获取固定行号() : 逻辑型
		code return getView().isLineNumberPinned();
	结束 属性
	//获取是否启用第一个行号始终可见
	属性读 获取第一个行号始终可见() : 逻辑型
		code return getView().isFirstLineNumberAlwaysVisible();
	结束 属性
	//获取是否启用全部全屏
	属性读 获取全部全屏() : 逻辑型
		code return getView().isFullscreenAllowed();
	结束 属性
	//获取是否启用类型连字
	属性读 是否启用了连接() : 逻辑型
		code return getView().isLigatureEnabled();
	结束 属性
	//获取是否启用高亮突出显示当前代码块
	属性读 获取高亮显示当前块() : 逻辑型
		code return getView().isHighlightCurrentBlock();
	结束 属性
	//获取是否启用高亮显示当前行
	属性读 获取高亮显示当前行() : 逻辑型
		code return getView().isHighlightCurrentLine();
	结束 属性
	//获取块线宽
	属性读 获取块线宽() : 单精度小数
		code return getView().getBlockLineWidth();
	结束 属性
	//获取是否启用自动换行
	属性读 获取自动换行() : 逻辑型
		code return getView().isWordwrap();
	结束 属性
	//获取是否启用光标动画
	属性读 获取光标动画() : 逻辑型
		code return getView().isCursorAnimationEnabled();
	结束 属性
	//获取是否启用滚动显示行号面板
	属性读 获取滚动显示行号面板() : 逻辑型
		code return getView().isDisplayLnPanel();
	结束 属性
	//获取是否启用滚动行号前提示
	属性读 获取滚动行号前提示() : 文本
		code return getView().getLnTip();
	结束 属性
	//获取是否启用自动缩进
	属性读 获取自动缩进() : 逻辑型
		code return getView().isAutoIndentEnabled();
	结束 属性
	//获取是否水平滚动条
	属性读 获取水平滚动条() : 逻辑型
		code return getView().isHorizontalScrollBarEnabled();
	结束 属性
	//获取是否启用垂直滚动条
	属性读 获取垂直滚动条() : 逻辑型
		code return getView().isVerticalScrollBarEnabled();
	结束 属性
	//获取获取文本大小PX
	属性读 获取文本大小() : 单精度小数
		code return getView().getTextSizePx();
	结束 属性
	//获取是否启用硬件加速绘制
	属性读 获取硬件加速绘制() : 逻辑型
		code return getView().isHardwareAcceleratedDrawAllowed();
	结束 属性
	//获取行信息文本大小
	属性读 获取行信息文本大小() : 单精度小数
		code return getView().getLineInfoTextSize();
	结束 属性
	//获取是否启用撰写时设置自动完成
	属性读 获取撰写时设置自动完成() : 逻辑型
		code return getView().isAutoCompletionOnComposing();
	结束 属性
	//获取是否启用自动补全
	属性读 获取自动补全() : 逻辑型
		code return getView().isAutoCompletionEnabled();
	结束 属性
	//获取不可打印的绘画标志
	属性读 获取不可打印的绘画标志() : 整数
		code return getView().getNonPrintableFlags();
	结束 属性
	//获取是否启用高亮显示所选文本。
	属性读 获取高亮显示所选文本() : 逻辑型
		code return getView().isHighlightSelectedText();
	结束 属性
	//获取制表符宽度
	属性读 获取制表符宽度() : 整数
		code return getView().getTabWidth();
	结束 属性
	//获取是否启用截取父级水平滚动
	属性读 获取截取父级水平滚动() : 逻辑型
		code return getView().isInterceptParentHorizontalScrollEnabled();
	结束 属性
	//获取输入类型
	属性读 获取输入类型() : 整数
		code return getView().getInputType();
	结束 属性
	//检查是否可以撤销
	属性读 可以撤销() : 逻辑型
		code return getView().canUndo();
	结束 属性
	//检查是否可以重做
	属性读 可以重做() : 逻辑型
		code return getView().canRedo();
	结束 属性
	//是否启用撤销
	属性读 是否启用撤销() : 逻辑型
		code return getView().isUndoEnabled();
	结束 属性
	//是否可以拖动
	属性读 是否拖动() : 逻辑型
		code return getView().isDrag();
	结束 属性
	//是否可以过度滚动
	属性读 是否过度滚动() : 逻辑型
		code return getView().isOverScrollEnabled();
	结束 属性
	//获取分割线边距
	属性读 获取分割线边距() : 单精度小数
		code return getView().getDividerMargin();
	结束 属性
	//获取分割线宽度
	属性读 获取分割线宽度() : 单精度小数
		code return getView().getDividerWidth();
	结束 属性
	//获取行数
	属性读 获取行数() : 整数
		code return getView().getLineCount();
	结束 属性
	//获取屏幕上的第一个可见行
	属性读 获取第一条可见的线() : 整数
		code return getView().getFirstVisibleLine();
	结束 属性
	//获取第一个可见行
	属性读 获取第一个可见行() : 整数
		code return getView().getFirstVisibleRow();
	结束 属性
	//获取最后一个可见行
	属性读 获取最后一个可见行() : 整数
		code return getView().getLastVisibleRow();
	结束 属性
	//获取滚动X
	属性读 获取偏移量X() : 整数
		code return getView().getOffsetX();
	结束 属性
	//获取滚动Y
	属性读 获取偏移量Y() : 整数
		code return getView().getOffsetY();
	结束 属性
	//获取是否可以编辑
	属性读 是否可以编辑() : 逻辑型
		code return getView().isEditable();
	结束 属性
	//获取是否可缩放
	属性读 是否可以缩放() : 逻辑型
		code return getView().isScalable();
	结束 属性
	//获取是否代码块线已启用
	属性读 代码快线是否已启用() : 逻辑型
		code return getView().isBlockLineEnabled();
	结束 属性
	//获取是否显示行号
	属性读 是否可以显示行号() : 逻辑型
		code return getView().isLineNumberEnabled();
	结束 属性
	//获取游标代码块索引
	属性读 获取块索引() : 整数
		code return getView().getBlockIndex();
	结束 属性
	//获取当前行的位置
	属性读 获取当前行的位置() : 整数
		@code
		Cursor cur = getView().getText().getCursor();
		return cur.getRightLine();
		@end
	结束 属性
	//获取当前行的光标位置
	属性读 获取当前行的光标位置() : 整数
		@code
		Cursor cur = getView().getText().getCursor();
		return cur.getRightColumn();
		@end
	结束 属性
	//获取光标Y轴
	属性读 获取光标Y轴() : 单精度小数
		@code
		int line = getView().getCursor().getLeftLine();
        float Y = getView().getOffset2(line, getView().getCursor().getLeftColumn());
		return Y;
		@end
	结束 属性

	//获取文本
	方法 获取文本() : 文本
		code return getView().getText().toString();
	结束 方法

	//设置是否开启放大镜
	方法 设置放大镜(选中 : 逻辑型)
		code getView().setMagnifierEnabled(#选中);
	结束 方法

	//设置行号区域横向滚动的时候固定行号，默认是随代码框横向滚动
	方法 设置行号固定(选中 : 逻辑型)
		code getView().setPinLineNumber(#选中);
	结束 方法

	//在+换行模式下显示屏幕中的第一行编号
	方法 设置第一个行号始终可见(选中 : 逻辑型)
		code getView().setFirstLineNumberAlwaysVisible(#选中);
	结束 方法

	//经过零或负周期时，光标将始终显示
	方法 设置光标闪烁周期(数值 : 整数)
		code getView().setCursorBlinkPeriod(#数值);
	结束 方法

	//如果您不希望编辑器在屏幕尺寸较小的设备上全屏显示，请设置为{@code false}。
	方法 设置全部全屏(选中 : 逻辑型)
		code getView().setAllowFullscreen(#选中);
	结束 方法

	//启用/禁用所有类型的连字（“rlig”除外）
	方法 设置类型连字(选中 : 逻辑型)
		code getView().setLigatureEnabled(#选中);
	结束 方法

	//设置编辑器使用的所有绘制的字体功能设置
	//设置字体功能设置(enabled ? null : "'liga' 0,'hlig' 0,'dlig' 0,'clig' 0");
	方法 设置字体功能设置(内容 : 文本)
		code getView().setFontFeatureSettings(#内容);
	结束 方法

	//编辑器是否应该使用不同的颜色来绘制
	//当前代码块的行以及此代码块的开始行和结束行。*背景。
	方法 设置高亮显示当前块(选中 : 逻辑型)
		code getView().setHighlightCurrentBlock(#选中);
	结束 方法

	//指定编辑器是否应使用不同的颜色进行绘制，当前行的背景
	方法 设置高亮显示当前行(选中 : 逻辑型)
		code getView().setHighlightCurrentLine(#选中);
	结束 方法

	//设置代码块行的宽度
	方法 设置块线宽(DP : 单精度小数)
		code getView().setBlockLineWidth(#DP);
	结束 方法

	//设置编辑器中的文本是否应换行以适合其大小
	方法 设置自动换行(选中 : 逻辑型)
		code getView().setWordwrap(#选中);
	结束 方法

	//设置光标动画
	方法 设置光标动画(选中 : 逻辑型)
		code getView().setCursorAnimationEnabled(#选中);
	结束 方法

	//滚动时是否显示垂直滚动条
	方法 设置滚动条(选中 : 逻辑型)
		code getView().setScrollBarEnabled(#选中);
	结束 方法

	//是否在垂直滚动条旁边显示行号面板
	方法 设置滚动显示行号面板(选中 : 逻辑型)
		code getView().setDisplayLnPanel(#选中);
	结束 方法

	//为“行号”面板设置行号前的提示文本，设置滚动显示行号面板相互使用
	方法 设置滚动行号前提示(内容 : 文本)
		code getView().setLnTip(#内容);
	结束 方法

	//设置用户输入时是否执行自动缩进
	方法 设置自动缩进(选中 : 逻辑型)
		code getView().setAutoIndentEnabled(#选中);
	结束 方法

	//设置水平滚动设置
	方法 设置水平滚动条(选中 : 逻辑型)
		code getView().setHorizontalScrollBarEnabled(#选中);
	结束 方法

	//设置垂直滚动条
	方法 设置垂直滚动条(选中 : 逻辑型)
		code getView().setVerticalScrollBarEnabled(#选中);
	结束 方法

	//设置字体大小PX
	方法 设置字体大小(PX : 单精度小数)
		code getView().setTextSizePx(#PX);
	结束 方法

	//设置字体大小
	方法 设置字体大小2(PxDirect : 单精度小数)
		code getView().setTextSizePxDirect(#PxDirect);
	结束 方法

	//设置硬件加速允许绘制
	方法 设置硬件加速绘制(选中 : 逻辑型)
		code getView().setHardwareAcceleratedDrawAllowed(#选中);
	结束 方法

	//设置边缘效果颜色
	方法 设置边缘效果颜色(颜色 : 整数)
		code getView().setEdgeEffectColor(#颜色);
	结束 方法

	//设置行信息面板的文本大小
	方法 设置行信息文本(选中 : 逻辑型)
		code getView().setVerticalScrollBarEnabled(#选中);
	结束 方法

	//指定是否在输入法处于合成状态时显示自动完成窗口
	方法 设置撰写时设置自动完成(选中 : 逻辑型)
		code getView().setAutoCompletionOnComposing(#选中);
	结束 方法

	//指定是否应提供任何自动完成功能
	方法 设置自动补全(选中 : 逻辑型)
		code getView().setAutoCompletionEnabled(#选中);
	结束 方法

	//设置不可打印的绘画标志
	方法 设置不可打印的绘画标志(flags : 整数)
		code getView().setNonPrintablePaintingFlags(#flags);
	结束 方法

	//使所选内容可见
	方法 确保选择可见()
		code getView().ensureSelectionVisible();
	结束 方法

	//使给定的字符位置可见
	方法 确保位置可见(行 : 整数,列 : 整数)
		code getView().ensurePositionVisible(#行,#列);
	结束 方法

	//设置高亮显示所选的文本
	方法 设置高亮显示选定文本(选中 : 逻辑型)
		code getView().setHighlightSelectedText(#选中);
	结束 方法

	//设置制表符宽度
	方法 设置制表符宽度(宽度 : 整数)
		code getView().setTabWidth(#宽度);
	结束 方法

	//设置用户缩放可使用的最大和最小文本大小。
	方法 设置缩放范围文本大小(最小 : 单精度小数,最大 : 单精度小数)
		code getView().setHighlightSelectedText(#最小,#最大);
	结束 方法

	//当父是可滚动视图组时，
	//请求它不允许水平滚动被拦截。
	//直到代码无法水平滚动
	//截取父级水平滚动是否强制水平滚动
	方法 如果需要设置截取父级水平滚动(选中 : 逻辑型)
		code getView().setInterceptParentHorizontalScrollIfNeeded(#选中);
	结束 方法

	//指定编辑器的输入类型,默认输入类型为零
	方法 设置输入类型(类型 : 整数)
		code getView().setInputType(#类型);
	结束 方法

	//撤消上一个操作
	方法 撤销()
		code getView().undo();
	结束 方法

	//重做上一个操作
	方法 重做()
		code getView().redo();
	结束 方法
	
	//插入内容
	方法 插入文本(内容 : 文本,选择偏移 : 整数 = 0)
		@code
        if (#选择偏移 < 0 || #选择偏移 > #内容.length()) {
            throw new IllegalArgumentException("selectionOffset is invalid");
        }
        Cursor cur = getView().getText().getCursor();
        if (cur.isSelected()) {
            cur.onDeleteKeyPressed();
            getView().notifyExternalCursorChange();
        }
        getView().getText().insert(cur.getRightLine(), cur.getRightColumn(), #内容);
        getView().notifyExternalCursorChange();
        if (#选择偏移 != #内容.length()) {
            getView().setSelection(cur.getRightLine(), cur.getRightColumn() - (#内容.length() - #选择偏移));
        }
		@end
	结束 方法

	//启用/禁用撤消管理器
	方法 设置开启撤销(选中 : 逻辑型)
		code getView().setUndoEnabled(#选中);
	结束 方法

	//设置是否拖动模式
	方法 设置是否拖动(选中 : 逻辑型)
		code getView().setDrag(#选中);
	结束 方法

	//是否允许过度滚动
	//启用过度滚动时，用户将能够滚动退出显示
	//如果用户滚动速度足够快，则为界限。
	方法 设置过度滚动(选中 : 逻辑型)
		code getView().setOverScrollEnabled(#选中);
	结束 方法

	//开始搜索操作模式
	方法 开始搜索模式()
		code getView().beginSearchMode();
	结束 方法

	//设置分隔线的左右边距
	方法 设置分隔线边距(dividerMargin : 单精度小数)
		code getView().setDividerMargin(#dividerMargin);
	结束 方法

	//设置分隔线的宽度
	方法 设置分隔线宽度(dividerWidth : 单精度小数)
		code getView().setDividerWidth(#dividerWidth);
	结束 方法

	//设置行号字体
	方法 设置行号字体(字体路径 : 文本,内部存储路径 : 逻辑型 = 真)
		@code
		if (#内部存储路径) {
			getView().setTypefaceLineNumber(Typeface.createFromFile(#字体路径));
		} else {
			getView().setTypefaceLineNumber(Typeface.createFromAsset(context.getAssets(), #字体路径));
		}
		@end
	结束 方法

	//设置文本字体
	方法 设置字体(字体路径 : 文本,内部存储路径 : 逻辑型 = 真)
		@code
		if (#内部存储路径) {
			getView().setTypefaceText(Typeface.createFromFile(#字体路径));
		} else {
			getView().setTypefaceText(Typeface.createFromAsset(context.getAssets(), #字体路径));
		}
		@end
	结束 方法

	//设置光标宽度
	方法 设置光标宽度(width : 单精度小数)
		code getView().setCursorWidth(#width);
	结束 方法

	//设置是否可以编辑
	方法 可以编辑(选中 : 逻辑型)
		code getView().setEditable(#选中);
	结束 方法

	//允许通过缩略图缩放文本大小
	方法 设置可缩放(选中 : 逻辑型)
		code getView().setScalable(#选中);
	结束 方法

	//启用代码块线
	方法 设置代码块线已启用(选中 : 逻辑型)
		code getView().setBlockLineEnabled(#选中);
	结束 方法

	//下移所选内容
	//如果显示“自动完成”面板，请将面板中的选择移动到下一个
	方法 下移所选内容()
		code getView().moveSelectionDown();
	结束 方法

	//上移所选内容
	//如果显示“自动完成”面板，请将面板中的选择移动到上一个
	方法 上移所选内容()
		code getView().moveSelectionUp();
	结束 方法

	//向左移动所选内容
	方法 向左移动所选内容()
		code getView().moveSelectionLeft();
	结束 方法

	//向右移动所选内容
	方法 向右移动所选内容()
		code getView().moveSelectionRight();
	结束 方法

	//移动选择结束
	方法 移动选择结束()
		code getView().moveSelectionEnd();
	结束 方法

	//将所选内容移回原位
	方法 将所选内容移回原位()
		code getView().moveSelectionHome();
	结束 方法

	//设置选择选中
	方法 设置选中(行 : 整数,列 : 整数,可见 : 逻辑型 = 真)
		code getView().setSelection(#行,#列,#可见);
	结束 方法

	//全部选择
	方法 全选()
		code getView().selectAll();
	结束 方法

	//设置选择区域
	方法 设置选择区域(行左 : 整数,列左 : 整数,行右 : 整数,列右 : 整数,可见 : 逻辑型 = 真)
		code getView().setSelectionRegion(#行左,#列左,#行右,#列右,#可见);
	结束 方法

	//移至下一页
	方法 移动向下分页()
		code getView().movePageDown();
	结束 方法

	//移至上一页
	方法 移动向上分页()
		code getView().movePageUp();
	结束 方法

	//从选中剪贴板粘贴文本
	方法 粘贴文本()
		code getView().pasteText();
	结束 方法

	//将选中文本复制到剪贴板
	方法 复制文本()
		code getView().copyText();
	结束 方法

	//将选中文本复制到剪贴板并删除
	方法 剪切文本()
		code getView().cutText();
	结束 方法

	//设置文本
	方法 设置文本(内容 :文本)
		code getView().setText(#内容);
	结束 方法

	//设置文本字体
	方法 设置文本大小(textSize : 单精度小数)
		code getView().setTextSize(#textSize);
	结束 方法

	//设置是否显示行号
	方法 设置显示行号(选中 : 逻辑型)
		code getView().setLineNumberEnabled(#选中);
	结束 方法

	//跳转行
	方法 跳转行(行 :整数)
		code getView().jumpToLine(#行);
	结束 方法

	//如果有分析仪，请进行分析
	方法 多分析()
		code getView().doAnalyze();
	结束 方法

	//隐藏自动完成窗口（如果显示）
	方法 隐藏自动完成窗口()
		code getView().hideAutoCompleteWindow();
	结束 方法

	//显示软输入法
	方法 显示输入法()
		code getView().showSoftInput();
	结束 方法

	//隐藏软输入法
	方法 隐藏输入法()
		code getView().hideSoftInput();
	结束 方法
	
	//搜索文本
	方法 搜索文本(搜索内容 : 文本)
		code getView().getSearcher().search(#搜索内容);
	结束 方法
	//上一个
	方法 搜索文本_上一个()
		code getView().getSearcher().gotoLast();
	结束 方法
	//下一个
	方法 搜索文本_下一个()
		code getView().getSearcher().gotoNext();
	结束 方法
	//替换
	方法 搜索文本_替换(新内容 : 文本)
		code getView().getSearcher().replaceThis(#新内容);
	结束 方法
	//全部替换
	方法 搜索文本_全部替换(新内容 : 文本)
		code getView().getSearcher().replaceAll(#新内容);
	结束 方法
	//停止搜索
	方法 搜索文本_停止()
		code getView().getSearcher().stopSearch();
	结束 方法
	
	//获取当前行的文字数量
	方法 获取当前行的文字数量(行 : 整数) : 整数
		@code
		Content con = getView().getText();
		return con.getColumnCount(#行);
		@end
	结束 方法
	
	//获取当前行的文本
	方法 获取当前行的文本(行 : 整数) : 文本
		@code
		Content con = getView().getText();
		return con.getLineString(#行);
		@end
	结束 方法
	
	//将（行，列）位置转换为索引
	方法 获取字符索引(行 : 整数,列 : 整数) : 整数
		@code
		Content con = getView().getText();
		return con.getCharIndex(#行,#列);
		@end
	结束 方法
	
	//将内容插入此对象
	方法 文本插入(行 : 整数,列 : 整数,内容 : 文本)
		@code
		Content con = getView().getText();
		con.insert(#行,#列,#内容);
		@end
	结束 方法
	
	//删除字符（开始，结束）
	方法 删除字符(开始 : 整数,结束S : 整数)
		@code
		Content con = getView().getText();
		con.delete(#开始,#结束S);
		@end
	结束 方法
	
	//删除给定区域中的文本
	方法 删除字符2(开始行 : 整数,开始列 : 整数,结束行 : 整数,结束列 : 整数)
		@code
		Content con = getView().getText();
		con.delete(#开始行,#开始列,#结束行,#结束列);
		@end
	结束 方法
	
	方法 设置主题(主题名 : 整数)
		@code
		switch (#主题名) {
		  case 0:
			getView().setColorScheme(new HTMLScheme());
      		  break;		
  		  case 1:
			getView().setColorScheme(new SchemeDarcula());
      		  break;
		    case 2:
			getView().setColorScheme(new SchemeEclipse());
    		    break;
		    case 3:
			getView().setColorScheme(new SchemeGitHub());
  		      break;
		    case 4:
			getView().setColorScheme(new SchemeNotepadXX());
  		      break;	
		    case 5:
			getView().setColorScheme(new SchemePurple());
  		      break;
		    case 6:
			getView().setColorScheme(new SchemeVS2019());
  		      break;
			case 7:
			getView().setColorScheme(new SchemeDefault());
				break;
			case 8:
			getView().setColorScheme(new SchemeDefaultNight());
  		      break;	
   		 default:
			//不进行任何操作
  		      break;
		}
		@end
	结束 方法

	//加载语言
	方法 设置语言(语言类型 : 整数)
		@code
		   try {
			switch (#语言类型) {
			case 0:
			getView().setEditorLanguage(new UniversalLanguage(new CDescription()));
      		 break;		
  	 	 case 1:
			getView().setEditorLanguage(new UniversalLanguage(new CppDescription()));
      		  break;
		   case 2:
			getView().setEditorLanguage(new UniversalLanguage(new JavaScriptDescription()));
    		    break;
		    case 3:
			getView().setEditorLanguage(new UniversalLanguage(new PhpDescription()));
  		      break;
		    case 4:
			getView().setEditorLanguage(new CSS3Language());
  		      break;	
		    case 5:
			getView().setEditorLanguage(new HTMLLanguage());
  		      break;
		    case 6:
			getView().setEditorLanguage(new JavaLanguage());
  		      break;
		    case 7:
			getView().setEditorLanguage(new PythonLanguage());
  		      break;				
			case 8:
			getView().setEditorLanguage(new UniversalLanguage(new JsonDescription()));
  		      break;			
			case 9:
			getView().setEditorLanguage(new UniversalLanguage(new FunctionDescription()));
  		      break;					
   		 default:
			getView().setEditorLanguage(null);
  		      break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		@end
	结束 方法
	
	定义事件 最近输入(输出 : 文本)
	定义事件 最近删除(删除 : 文本)

结束 类

类 CodeEditorView_Scheme

	@静态
	变量 HTMLScheme : 整数 = 0 //夜间主题

	@静态
	变量 SchemeDarcula : 整数 = 1 //夜间主题

	@静态
	变量 SchemeEclipse : 整数 = 2 //白天主题

	@静态
	变量 SchemeGitHub : 整数 = 3 //白天主题

	@静态
	变量 SchemeNotepadXX : 整数 = 4 //白天主题

	@静态
	变量 SchemePurple : 整数 = 5 //白天主题

	@静态
	变量 SchemeVS2019 : 整数 = 6 //夜间主题
	
	@静态
	变量 CodeEditorScheme : 整数 = 7 //默认主题
	
	@静态
	变量 SchemeDefaultNight : 整数 = 8 //默认夜间主题

结束 类

类 CodeEditorView_Language
	
	@静态
	变量 null : 整数 = -1

	@静态
	变量 C : 整数 = 0

	@静态
	变量 Cpp : 整数 = 1

	@静态
	变量 JavaScript : 整数 = 2

	@静态
	变量 Php : 整数 = 3

	@静态
	变量 Css3 : 整数 = 4

	@静态
	变量 Html : 整数 = 5

	@静态
	变量 Java : 整数 = 6

	@静态
	变量 Python : 整数 = 7
	
	@静态
	变量 Json : 整数 = 8
	
	@静态
	变量 McFunction : 整数 = 9

结束 类