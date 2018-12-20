var Toastr = function () {
    
    var handleInitToastr = function () {
        toastr.options = {
            closeButton: true,
            debug: false,
            positionClass: "toast-top-center",
            onclick: null,
            showDuration: "1000",
            hideDuration: "1000",
            timeOut: "2000",
            extendedTimeOut: "1000",
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut"
        };


    }

    return {
        initToastr : function () {
            handleInitToastr();
        }
    }
}();

jQuery(document).ready(Toastr.initToastr());