var HandleDatatable=function (url,columns) {
    handleDT=function (url,columns) {
        var grid=$('#myTable').DataTable();
        grid.init({
            // src:$("#myTable"),
            //开启服务器模式
            serverSide: true,
            //数据来源（包括处理分页，排序，过滤） ，即url，action，接口，等等
            ajax: url,
            "columns":columns,
        });
        return grid;
    }
    return{
        init:function () {
            return handleDT();
        }
    }
}();