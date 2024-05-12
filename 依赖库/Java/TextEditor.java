package com.jiesheng.editor;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.widget.Toast;
import com.myopicmobile.textwarrior.android.FreeScrollingTextField;
import com.myopicmobile.textwarrior.android.YoyoNavigationMethod;
import com.myopicmobile.textwarrior.scheme.ColorScheme;
import com.myopicmobile.textwarrior.scheme.ColorSchemeDark;
import com.myopicmobile.textwarrior.scheme.ColorSchemeLight;
import com.myopicmobile.textwarrior.common.Document;
import com.myopicmobile.textwarrior.common.DocumentProvider;
import com.myopicmobile.textwarrior.base.BaseLanguage;
import com.myopicmobile.textwarrior.language.java.JavaAutoCompletePanel;
import com.myopicmobile.textwarrior.language.java.LanguageJava;
import com.myopicmobile.textwarrior.language.s5d.LanguageS5d;
import com.myopicmobile.textwarrior.language.s5d.S5dAutoCompletePanel;
import com.myopicmobile.textwarrior.language.sly.LanguageSly;
import com.myopicmobile.textwarrior.language.sly.SlyAutoCompletePanel;
import com.myopicmobile.textwarrior.language.xml.LanguageXml;
import com.myopicmobile.textwarrior.common.LinearSearchStrategy;
import com.myopicmobile.textwarrior.common.ReadThread;
import com.myopicmobile.textwarrior.common.WriteThread;
import com.myopicmobile.textwarrior.language.xml.XmlAutoCompletePanel;

import java.io.File;

public class TextEditor extends FreeScrollingTextField {
    private Document _inputtingDoc;
    private boolean _isWordWrap;
    private Context mContext;
    private String _lastSelectFile;
    private int _index;
    private static boolean darkMode = false;
    private String mKeyword = "";
    private int idx;
    private LinearSearchStrategy finder;

    public TextEditor(Context context) {
        super(context);
        mContext = context;
        init();
    }

    public TextEditor(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        mContext = context;
        init();
    }

    private  void init() {
		setTypeface(Typeface.MONOSPACE);
        DisplayMetrics dm=mContext.getResources().getDisplayMetrics();
        //设置字体大小
        float size= TypedValue.applyDimension(2, BASE_TEXT_SIZE_PIXELS, dm);
        setTextSize((int)size);
        setShowLineNumbers(true);
        setAutoCompete(true);
        setHighlightCurrentRow(true);
        setWordWrap(false);
        setAutoIndentWidth(2);
        if (getLexer() != null)
            setLanguage(LanguageS5d.getInstance());
        setNavigationMethod(new YoyoNavigationMethod(this));
        int textColor = Color.BLACK;// 默认文字颜色
        int selectionText =Color.argb(255, 0, 120, 215);//选择文字颜色
        setTextColor(textColor);
        setTextHighlightColor(selectionText);
    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (_index != 0 && right > 0) {
            moveCaret(_index);
            _index = 0;
        }
    }

    public void setDark(boolean isDark) {
        if (isDark) {
            setColorScheme(new ColorSchemeDark());
            darkMode = true;
        } else
            setColorScheme(new ColorSchemeLight());
    }

    public void addNames(String[] names) {
        BaseLanguage lang= getLanguage();
        /*String[] old=lang.getNames();
        String[] news=new String[old.length + names.length];
        System.arraycopy(old, 0, news, 0, old.length);
        System.arraycopy(names, 0, news, old.length, names.length);*/
        lang.addNames(names);
        setLanguage(lang);
        respan();
        invalidate();
    }

    public void addPackage(String pkg, String[] names) {
        BaseLanguage lang = getLanguage();
        lang.addBasePackage(pkg, names);
        if (!pkg.startsWith("ROOT操作")
                || !pkg.startsWith("JSON操作")
                || !pkg.startsWith("文本型")) {
            addNames(new String[]{pkg});
        }
        setLanguage(lang);
        respan();
        invalidate();
    }

    public void addEvent(String pkg, String[] names) {
        LanguageS5d lang = (LanguageS5d) getLanguage();
        lang.addBaseEvent(pkg, names);
        setLanguage(lang);
        respan();
        invalidate();
    }

    public void clearUserWord() {
        getLanguage().clearUserWord();
    }

    public void clearVariants() {
        BaseLanguage lang = getLanguage();
        //lang.clearVariants();
        setLanguage(lang);
        respan();
        invalidate();
    }

    public static boolean getDark() {
        return darkMode;
    }

    public void setPanelBackgroundColor(int color) {
        getLanguage().getCodePanel().setBackgroundColor(color);
    }

    public void setPanelTextColor(int color) {
        getLanguage().getCodePanel().setTextColor(color);
    }

    public void setKeywordColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.KEYWORD, color);
    }

    public void setBaseWordColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.CLASS, color);
    }

    public void setStringColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.STRING, color);
    }

    public void setFunctionColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.FUNCTION, color);
    }

    public void setVariantColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.VARIANT, color);
    }

    public void setOperatorColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.OPERATOR, color);
    }

    public void setCommentColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.COMMENT, color);
    }

    public void setLineColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.NON_PRINTING_GLYPH, color);
    }

    public void setBackgroundColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.BACKGROUND, color);
    }

    public void setTextColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.FOREGROUND, color);
    }

    public void setTextHighlightColor(int color) {
        getColorScheme().setColor(ColorScheme.Colorable.SELECTION_BACKGROUND, color);
    }

    public String getSelectedText() {
        return  mDoc.subSequence(getSelectionStart(), getSelectionEnd() - getSelectionStart()).toString();
    }

    public void gotoLine(int line) {
        if (line > mDoc.getRowCount()) {
            line = mDoc.getRowCount();

        }
        int i=getText().getLineOffset(line - 1);
        setSelection(i);
    }

    @Override
    public boolean onKeyShortcut(int keyCode, KeyEvent event) {
        final int filteredMetaState = event.getMetaState() & ~KeyEvent.META_CTRL_MASK;
        if (KeyEvent.metaStateHasNoModifiers(filteredMetaState)) {
            switch (keyCode) {
                case KeyEvent.KEYCODE_A:
                    selectAll();
                    return true;
                case KeyEvent.KEYCODE_X:
                    cut();
                    return true;
                case KeyEvent.KEYCODE_C:
                    copy();
                    return true;
                case KeyEvent.KEYCODE_V:
                    paste();
                    return true;
            }
        }
        return super.onKeyShortcut(keyCode, event);
    }



    @Override
    public void setWordWrap(boolean enable) {
        _isWordWrap = enable;
        super.setWordWrap(enable);
    }

    public DocumentProvider getText() {
        return createDocumentProvider();
    }

    public File getOpenedFile() {
        if (_lastSelectFile != null)
            return  new File(_lastSelectFile);

        return  null;
    }

    public void setOpenedFile(String file) {
        _lastSelectFile = file;
    }

    public void insert(int idx, String text) {
        selectText(false);
        moveCaret(idx);
        paste(text);
    }


    public void replaceAll(CharSequence c) {
        replaceText(0, getLength() - 1, c.toString());
    }

    public void setText(CharSequence c) {
        Document doc=new Document(this);
        doc.setWordWrap(_isWordWrap);
        doc.setText(c);
        setDocumentProvider(new DocumentProvider(doc));
    }

    public void setSelection(int index) {
        selectText(false);
        if (!hasLayout())
            moveCaret(index);
        else
            _index = index;
    }

    public void undo() {

        DocumentProvider doc=createDocumentProvider();
        int newPosition = doc.undo();

        if (newPosition >= 0) {
            setEdited(true);
            respan();
            selectText(false);
            moveCaret(newPosition);
            invalidate();
        }

    }

    public void redo() {

        DocumentProvider doc = createDocumentProvider();
        int newPosition = doc.redo();

        if (newPosition >= 0) {
            setEdited(true);

            respan();
            selectText(false);
            moveCaret(newPosition);
            invalidate();
        }

    }

    @SuppressLint("HandlerLeak")
    private   Handler handler=new Handler()
    {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case ReadThread.MSG_READ_OK:
                    setText(msg.obj.toString());
                    break;
                case ReadThread.MSG_READ_FAIL:
                    showToast("打开失败");
                    break;
                case WriteThread.MSG_WRITE_OK:
                    //showToast("保存成功");
                    break;
                case WriteThread.MSG_WRITE_FAIL:
                    //showToast(mContext.getString(R.string.text_editor_save_failed));
                    break;
            }
        }
    };

    private String path;

    public void open(String filename) {
        path = filename;
        if (filename == null) {
            setText("未打开文件");
            return;
        }
        if (filename.endsWith(".java")) {
            LanguageJava lang = LanguageJava.getInstance();
            JavaAutoCompletePanel panel = new JavaAutoCompletePanel(this);
            lang.setCodePanel(panel);
            setLanguage(lang);
        } else if (filename.endsWith(".sly")) {
            LanguageSly lang = LanguageSly.getInstance();
            SlyAutoCompletePanel panel = new SlyAutoCompletePanel(this);
            lang.setCodePanel(panel);
            setLanguage(lang);
        } else if (filename.endsWith(".xml")) {
            LanguageXml lang = LanguageXml.getInstance();
            XmlAutoCompletePanel panel = new XmlAutoCompletePanel(this);
            lang.setCodePanel(panel);
            setLanguage(lang);
        } else {
            LanguageS5d lang = LanguageS5d.getInstance();
            S5dAutoCompletePanel panel = new S5dAutoCompletePanel(this);
            lang.setCodePanel(panel);
            setLanguage(lang);
        }
        _lastSelectFile = filename;
        File inputFile = new File(filename);
        _inputtingDoc = new Document(this);
        _inputtingDoc.setWordWrap(this.isWordWrap());
        ReadThread readThread = new ReadThread(inputFile.getAbsolutePath(), handler);
        readThread.start();
        paste("");
    }

    public void save() {
        save(path);
        System.out.println("保存了：" + path);
    }

    public String getCurrentPath() {
        return path;
    }

    /**
     * 保存文件
     * * @param file
     */
    public void save(String file) {
        if (file == null)
            return;
        WriteThread writeThread=new WriteThread(getText().toString(), file, handler);
        writeThread.start();
    }

    public boolean findNext(String keyword) {
        if (!keyword.equals(mKeyword)) {
            mKeyword = keyword;
            idx = 0;
        }
        finder = new LinearSearchStrategy();
        String kw = mKeyword;
        if (kw.isEmpty()) {
            selectText(false);
            return false;
        }
        idx = finder.find(getText(), kw, idx, getText().length(), false, false);
        if (idx == -1) {
            selectText(false);
            Toast.makeText(mContext, "没有了", Toast.LENGTH_SHORT).show();
            idx = 0;
            return false;
        }
        setSelection(idx, mKeyword.length());
        idx += mKeyword.length();
        moveCaret(idx);
        return true;
    }



    private Toast toast;
    private void showToast(CharSequence text) {
        if (toast == null) {
            toast = Toast.makeText(mContext, text, Toast.LENGTH_SHORT);
        } else {
            toast.setText(text);
        }
        toast.show();
    }
}

