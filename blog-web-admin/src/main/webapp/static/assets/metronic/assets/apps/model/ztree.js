var ZTree = function () {

    var handleInitZTree = function (url, callback) {
        // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
        var setting = {

            async: {
                enable: true,
                url:url,
                autoParam:["id=parentId"],
            },
            callback:{
                onClick : callback
            }

        };
        // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
        $.fn.zTree.init($("#treeDemo"), setting);
    }

    return {
        initZTree : function (url, callback) {
            handleInitZTree(url, callback);
        }
    }
}();