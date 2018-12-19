<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div>
</div>

<!-- _________________________ Finish Page __________________________ -->
<%--<script src="/static/assets/metromic/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<script type="text/javascript"> if (window.jQuery == undefined) document.write( unescape('%3Cscript src="/static/assets/back/js/jquery-1.6.4.min.js" type="text/javascript"%3E%3C/script%3E') ); </script>
<script src="/static/assets/back/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="/static/assets/back/js/script.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        if (jQuery.browser.msie && jQuery.browser.version < 9){
            var $windowWidth = jQuery(window).width()+17;
            var $windowHeight = jQuery(window).height()+17;
        } else {
            var $windowWidth = window.innerWidth;
            var $windowHeight = window.innerHeight;
        }

        var $image = jQuery('.bgImage img');
        var img = new Image();

        img.src = jQuery($image).attr('src');

        var intervalId = setInterval(function(){
            if (img.complete){
                var $imgWidth = img.width;
                var $imgHeight = img.height;
                var $widthFactor = parseFloat($imgWidth/$windowWidth);
                var $heightFactor = parseFloat($imgHeight/$windowHeight);

                if ($widthFactor < $heightFactor){
                    jQuery($image).css({width:$windowWidth+'px', height:parseInt($imgHeight/$widthFactor)+'px', top:'-'+parseInt((parseInt($imgHeight/$widthFactor)-$windowHeight)/2)+'px', left:0});
                } else {
                    jQuery($image).css({width:parseInt($imgWidth/$heightFactor)+'px', height:$windowHeight+'px', top:0, left:'-'+parseInt((parseInt($imgWidth/$heightFactor)-$windowWidth)/2)+'px'});
                }

                clearInterval(intervalId);
                LoadImageStart();
            }
        }, 50);

        function LoadImageStart(){
            $image.parent().fadeIn(500, function(){
                jQuery(this).css({display:'block'});
            });
        }

        jQuery(window).resize(function(){
            if (jQuery.browser.msie && jQuery.browser.version < 9){
                var $windowWidth = jQuery(window).width()+17;
                var $windowHeight = jQuery(window).height();
            } else {
                var $windowWidth = window.innerWidth;
                var $windowHeight = window.innerHeight;
            }

            var $imgWidth = img.width;
            var $imgHeight = img.height;
            var $widthFactor = parseFloat($imgWidth/$windowWidth);
            var $heightFactor = parseFloat($imgHeight/$windowHeight);

            if ($widthFactor < $heightFactor){
                jQuery($image).css({width:$windowWidth+'px', height:parseInt($imgHeight/$widthFactor)+'px', top:'-'+parseInt((parseInt($imgHeight/$widthFactor)-$windowHeight)/2)+'px', left:0});
            } else {
                jQuery($image).css({width:parseInt($imgWidth/$heightFactor)+'px', height:$windowHeight+'px', top:0, left:'-'+parseInt((parseInt($imgWidth/$heightFactor)-$windowWidth)/2)+'px'});
            }
        });
    });
</script>

<script src="/static/assets/metromic/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="/static/assets/metromic/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="/static/assets/metromic/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="/static/assets/metromic/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>

<script type="text/javascript">
    //<!CDATA[
    var bodyBgs = [];
    bodyBgs[5] = "/static/assets/back/mp3/theFirstTown.mp3";
    bodyBgs[4] = "/static/assets/back/mp3/swordland.mp3";
    bodyBgs[2] = "/static/assets/back/mp3/ADAMAS.mp3";
    bodyBgs[3] = "/static/assets/back/mp3/STYXHELIX.mp3";
    bodyBgs[0] = "/static/assets/back/mp3/aLIEz.mp3";
    bodyBgs[1] = "/static/assets/back/mp3/partytime.mp3";
    var randomBgIndex = Math.round( Math.random() * 5 ); document.write('<audio src=\''+bodyBgs[randomBgIndex]+ '\'autoplay=\'autoplay\'></audio>');
    //]]>
</script>