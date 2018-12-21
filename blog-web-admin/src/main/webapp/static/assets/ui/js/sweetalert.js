var SweetAlert = function () {

    var handleSweetAlert = function () {
        $('.mt-sweetalert').each(function () {
            var sa_title = $(this).data('title');
            var sa_message = $(this).data('message');
            var sa_type = $(this).data('type');
            var sa_allowOutsideClick = $(this).data('allow-outside-click');
            var sa_showConfirmButton = $(this).data('show-confirm-button');
            var sa_showCancelButton = $(this).data('show-cancel-button');
            var sa_closeOnConfirm = $(this).data('close-on-confirm');
            var sa_closeOnCancel = $(this).data('close-on-cancel');
            var sa_confirmButtonText = $(this).data('confirm-button-text');
            var sa_cancelButtonText = $(this).data('cancel-button-text');
            var sa_popupTitleSuccess = $(this).data('popup-title-success');
            var sa_popupMessageSuccess = $(this).data('popup-message-success');
            var sa_popupTitleCancel = $(this).data('popup-title-cancel');
            var sa_popupMessageCancel = $(this).data('popup-message-cancel');
            var sa_confirmButtonClass = $(this).data('confirm-button-class');
            var sa_cancelButtonClass = $(this).data('cancel-button-class');

            var sa_post_url = $(this).data('post-url');
            var sa_get_url = $(this).data('get-url');

            $(this).click(function () {
                //console.log(sa_btnClass);
                var array = [];
                $(".children:checked").each(function () {
                    array.push($(this).attr("value"));
                });

                swal({
                        title: sa_title,
                        text: sa_message,
                        type: sa_type,
                        allowOutsideClick: sa_allowOutsideClick,
                        showConfirmButton: sa_showConfirmButton,
                        showCancelButton: sa_showCancelButton,
                        confirmButtonClass: sa_confirmButtonClass,
                        cancelButtonClass: sa_cancelButtonClass,
                        closeOnConfirm: sa_closeOnConfirm,
                        closeOnCancel: sa_closeOnCancel,
                        confirmButtonText: sa_confirmButtonText,
                        cancelButtonText: sa_cancelButtonText
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            //批量删除
                            if (typeof(sa_get_url) == "undefined") {
                                $.post(sa_post_url, "array=" + array, function (data) {
                                    if (data === 'error'){
                                        swal("错误警告:", "删除失败,你还没有选择任何一条数据", "error");
                                    }
                                    else {
                                        swal(sa_popupTitleSuccess, sa_popupMessageSuccess, "success");
                                        setInterval(function () {
                                            window.location.reload();
                                        }, 1000);
                                    }
                                });

                            }
                            //单个删除
                            else {
                                swal(sa_popupTitleSuccess, sa_popupMessageSuccess, "success");
                                setInterval(function () {
                                    window.location.href = sa_get_url;
                                }, 1000);
                            }
                        } else {
                            swal(sa_popupTitleCancel, sa_popupMessageCancel, "error");
                        }
                    });


            });
        });
    };

    return{
        initHandleSweetAlert : function () {
            handleSweetAlert();
        }
    }
}();

jQuery(document).ready(function () {
    SweetAlert.initHandleSweetAlert();
});