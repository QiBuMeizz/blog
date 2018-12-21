var UiValidate = function () {
    /**
     * 校验邮箱格式
     * @param email
     * @returns {boolean}
     */
    var handleInitUiValidateEmail = function (email) {
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
        if(email === ""){ //输入不能为空
            return false;
        }else if(!reg.test(email)){ //正则验证不通过，格式不对
            return false;
        }else{
            return true;
        }
    };
    /**
     * 校验名字、邮箱、评论
     * @param name
     * @param email
     * @param text
     */
    var handleInitUiValidate = function (name,email,text) {
        var message = '';
        if(name == ''){
            message = message+'名字不能为空\r\n';
        }
        else if(name.length < 2 || name.length > 20){
            message = message+'名字字符长度位于 2--20 之间\r\n';
        }
        if(email == ''){
            message = message+'邮箱不能为空\r\n';
        }
        else if(!handleInitUiValidateEmail(email)){
            message = message+'邮箱格式不正确\r\n';
        }
        if(text == ''){
            message = message+'评论内容不能为空\r\n';
        }
        return message;
    };
    return{
        validateEmail: function (email) {
            handleInitUiValidateEmail(email);
        },
        initUiValidate: function (name, email, text) {
            return handleInitUiValidate(name,email,text);
        }
    }
}();