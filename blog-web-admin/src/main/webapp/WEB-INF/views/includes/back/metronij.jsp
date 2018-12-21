<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="/static/assets/metronic/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/back/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>

<script src="/static/assets/metronic/assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/apps/model/toastr.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>

<div class="modal fade" id="zModel" tabindex="-1" role="basic" aria-hidden="true" style="color: #0a001f">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">选择父类别</h4>
            </div>
            <div class="modal-body" style="color: #0a001f">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
                <button type="button" class="btn green" data-dismiss="modal">保存</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
    //<!CDATA[
    var bodyBgs = [];
    bodyBgs[0] = "/static/assets/back/mp3/onj001.mp3";
    var randomBgIndex = Math.round( Math.random() * 1 ); document.write('<audio src=\''+bodyBgs[randomBgIndex]+ '\'autoplay=\'autoplay\'></audio>');
    //]]>
</script>
<script>
    <%--带标题的消息框--%>
    if(${baseResult.status == 500}){
        toastr.error("${baseResult.message}","温馨提示:");
    }

    <%--带标题的消息框--%>
    if(${baseResult.status == 200}){
        toastr.success("${baseResult.message}","温馨提示:");
    }

</script>


