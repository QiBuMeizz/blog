var Editor = function () {
    var E = window.wangEditor;

    /**
     * 初始化 wangEditor
     * @param editorId 编辑器 ID
     * @param textareaId 表单隐藏域 ID
     */
    var handlerInitWangEditor = function (editorId, textareaId) {
        var editor = new E('#' + editorId);
        editor.customConfig.uploadImgServer = '/upload';
        editor.customConfig.uploadFileName = 'editorFiles';
        editor.customConfig.onchange = function (html) {
            $("#" + textareaId).val(html);
        };
        editor.create();
        $("#" + textareaId).val(editor.txt.html());
    };

    return {
        initWangEditor: function (editorId, textareaId) {
            handlerInitWangEditor(editorId, textareaId);
        }
    }
}();