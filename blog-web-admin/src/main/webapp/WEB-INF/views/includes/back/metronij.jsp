<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="/static/assets/metronic/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/back/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/apps/model/toastr.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>

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
        toastr.error("${baseResult.message}");
    }

    <%--带标题的消息框--%>
    if(${baseResult.status == 200}){
        toastr.success("${baseResult.message}");
    }

</script>


