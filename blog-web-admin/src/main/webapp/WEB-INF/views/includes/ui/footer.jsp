<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer id="footer" class="footer">
    <div class="copyright text-center">
        <p>Copyrights © 2018 All Rights Reserved by GW工作组</p>
        <p><a href="http://www.miitbeian.gov.cn/">粤ICP备19008558号</a></p>
    </div>
</footer>
<!-- END / FOOTER -->

<!-- END / PAGE WRAP -->
<!-- LOAD JQUERY -->
<script type="text/javascript" src="/static/assets/ui/home/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.owl.carousel.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.tweet.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/retina.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/scripts.js"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="/static/assets/metronic/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/static/assets/ui/js/DateTime.js"></script>

<script>
    function searchSoon(title) {
        $("#inputSoon").val(title);
        $("#searchSoon").submit();
    }
    $(function () {
        /* Begin Message */
        if(${commentResult.status == 200} ){
            swal({
                title: "恭喜娘子~",
                text :'${commentResult.message}',
                type :"success",
                timer: 3000,
                html:true,
                allowOutsideClick :"true",
                confirmButtonClass:"btn-success"
            });
        }
        else if(${commentResult.status == 500}){
            swal({
                title:"官人，别走~",
                text :'${commentResult.message}',
                type :"error",
                timer: 5000,
                html:true,
                allowOutsideClick :"true",
                confirmButtonClass:"btn-danger"
            });
        }
        /* End Message */
    })
</script>