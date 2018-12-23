<!--函数对象-->
var Validate = function () {
    //私有方法
    var handlerInitValidate = function (form_id) {
        if(form_id == null){
            form_id = "inputForm";
        }
        //出错提示和警告颜色
        $("#"+form_id).validate({
            errorElement: 'span',
            errorClass: 'help-block',
            rule: {

            },
            messages: {

            },

            errorPlacement: function (error, element) {
                element.parent().parent().attr("class", "form-group has-error");
                error.insertAfter(element);
            }
        });
        //自定义校验规则
        $.validator.addMethod("mobile", function(value, element) {
            var length = value.length;
            var mobile =  /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误");
    };

    //暴露私有方法
    return {
        init:function () {
            handlerInitValidate();
        },
        myValidate: function (form_id) {
            handlerInitValidate(form_id)
        }
    };
}();

//自动加载
$(document).ready(function () {
    Validate.init();
})