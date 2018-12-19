<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

        jQuery('body').append('<div id="preloaderMotion" />');
        jQuery('a.header_arrow').addClass('hidden');

        var $slider = '#sliderMotion';
        var $preloader = '#preloaderMotion';
        var $images = jQuery($slider+' li img');
        var $max = $images.length;

        $images.each(function(){
            var img = new Image();

            img.src = jQuery(this).attr('src');

            var intervalId = setInterval(function(){
                if (img.complete){
                    clearInterval(intervalId);

                    $max--;

                    jQuery($preloader).append('<img id="nMotion'+$max+'" src="'+img.src+'" width="60" height="35" alt="" />');
                    jQuery($preloader).find('img#nMotion'+$max).animate({opacity:1}, 500);

                    if ($max == 0){
                        LoadImageStart(jQuery($slider));
                        jQuery($preloader).fadeOut(500, function(){
                            jQuery(this).css({display:'none'});
                            showHideContent();
                        });
                    }
                }
            }, 50);
        });

        function LoadImageStart(slider){
            slider.cmsmsMotionSlider({
                sliderWidth:$windowWidth,
                sliderHeight:$windowHeight,
                pauseOnHover:false,
                showPause:false
            });

            jQuery('a[rel="prettyPhoto[bgSlider]"]').prettyPhoto({animationSpeed:'normal', deeplinking:false, social_tools:false});
        }

        jQuery(window).resize(function(){
            if (jQuery.browser.msie && jQuery.browser.version < 9){
                var $windowWidth = jQuery(window).width()+17;
                var $windowHeight = jQuery(window).height();
            } else {
                var $windowWidth = window.innerWidth;
                var $windowHeight = window.innerHeight;
            }

            jQuery('.cmsmsMotionSliderContainer, .cmsmsMotionSlides, .cmsmsMotionSlides canvas, .cmsmsMotionSlides img, .cmsmsMotionSlides iframe').css({width:$windowWidth+'px', height:$windowHeight+'px'});
            jQuery('.cmsmsMotionControl').css({height:$windowHeight+'px'});
            jQuery('.cmsmsMotionNavigation').css({height:parseInt($windowHeight - 195)+'px'});
        });
    });
</script>
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
