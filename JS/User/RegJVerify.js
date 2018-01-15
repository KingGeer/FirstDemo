
var FormClassName = ".formuser"; //form表单样式

var NormalBorderColor = "#CCCCCC #999999 #999999 #CCCCC2"; //input边框
var NormalColor = "#666666"; //input字体颜色
var ErrorColor = "Red"; //错误提示颜色
var TipsColor = "#FFFFFF"; //正常提示颜色 
var RightColor = "Green"; //正常提示颜色

var reqTips = "";
var reqMsg = "";

var form_VerifyList = new Array();
form_VerifyList.push(new Array("verify_req", reqTips, reqMsg));
form_VerifyList.push(new Array("verify_email", "", "邮箱格式错误"));
form_VerifyList.push(new Array("verify_loginname", "", "4-15个英文、数字、汉字字符"));
form_VerifyList.push(new Array("verify_pwd", "", "6-20位英文、数字或符号"));
form_VerifyList.push(new Array("verify_same", "", "输入数据不一致")); //参数 sameid
form_VerifyList.push(new Array("verify_phone", "", "手机格式错误"));


//必填
function verify_req(obj, tips, msg) {
    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) set_flag_verify(obj, msg, tips, false);
    else set_flag_verify(obj, msg, tips, true);
}
//验证手机号码：13、15、18
function verify_phone(obj, tips, msg) {

    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        set_flag_verify(obj, "手机号码必填！", tips, false);
        return false;
    }
    var reg = /^1[3|5|8][0-9]{9}$/;

    if (!reg.test($(obj).val())) {
        set_flag_verify(obj, msg, "很抱歉！您的手机号格式错误。", false);
        return false;
    }
    $.ajax({
        url: '/AX_User/ExPhoneApi',
        async: false,
        type: "POST",
        data: { mobile: $(obj).val(), r: new Date().getTime() },
        success: function (msg) {
            if (msg == 'True') {
                set_flag_verify(obj, "很抱歉！该手机号码已被注册！", tips, false);
                return false;
            } else if (json.msg == 'success') {
                set_flag_verify(obj, msg, "恭喜您！该手机号码未被注册。", true);
            }

        }
    });
}
//校验登录账号
function verify_loginname(obj, tips, msg) {
    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        set_flag_verify(obj, "登录账号必填！", tips, false);
        return false;
    }
    var v_len = C_ASIIC($(obj).val().replace(/(^\s*)|(\s*$)/g, "")).length;
    //2-20个字符，一个汉字为两个字符，推荐使用中文果粉。一旦注册成功果粉不能修改。
    if (v_len < 4 || v_len > 15) {
        set_flag_verify(obj, "登录账号在4-15个字符内。", tips, false);
        return false
    }
    var v_userName = $(obj).val();
    if (/^\d*$/.test(v_userName)) {
        set_flag_verify(obj, "登录账号不能全为数字。", tips, false);
        return false
    }
    var chines = /^[^!@#$%^&*()\-=+]+$/;
    if (!chines.test(v_userName)) {
        set_flag_verify(obj, "非法的登录账号。", tips, false);
        return false
    }
    $.ajax({
        url: '/User/CheckUserName',
        async: false,
        type: "POST",
        data: { M_UserName: v_userName, r: new Date().getTime() },
        success: function (msg) {
            if (msg == 'True') {
                set_flag_verify(obj, "很抱歉！该登录账号已被注册。", tips, false);
                return false;
            } else if (json.msg == 'success') {
                set_flag_verify(obj, "", "恭喜您！该登录账号未被注册。", true);
            }
        }
    });
}

//密码
function verify_pwd(obj, tips, msg) {

    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        set_flag_verify(obj, "密码必填！", tips, false);
        return false;
    }
    var password = $(obj).val().replace(/(^\s*)|(\s*$)/g, "");
    if (password.length < 6 || password.length > 20) {
        set_flag_verify(obj, "密码在6-20个字符内。", "", false);
        return false
    }
    if (/^\d*$/.test(password)) {
        set_flag_verify(obj, "密码不能全为数字。", "", false);
        return false
    }
    if (/^[a-zA-Z]*$/.test(password)) {
        set_flag_verify(obj, "密码不能全为字母。", "", false);
        return false
    }
    if (/^(\S)\1*$/.test(password)) {
        set_flag_verify(obj, "您的密码过于简单，请不要使用连续相同字符。", "", false);
        return false
    }
    set_flag_verify(obj, msg, "恭喜您！请记住哦。", true);
}

//邮件
function verify_email(obj, tips, msg) {
    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        set_flag_verify(obj, "电子邮件必填！", tips, false);
        return false;
    }
    var reg = /^[_\.0-9A-Za-z-]+@[0-9A-Za-z\-]+\.(com|cc|cn|tv|hk|name|mobi|net|biz|org|info|gov\.cn|com\.cn|net\.cn|org\.cn)$/;

    if (!reg.test($(obj).val().replace(/(^\s*)|(\s*$)/g, ""))) {
        set_flag_verify(obj, msg, tips, false);
        return false;
    }
    $.ajax({
        url: '/User/CheckEmail',
        async: false,
        type: "POST",
        data: { MC_Email: $(obj).val(), r: new Date().getTime() },
        success: function (msg) {
            if (msg == 'True') {
                set_flag_verify(obj, "很抱歉！该邮箱已被注册！", tips, false);
                return false;
            } else if (json.msg == 'success') {
                set_flag_verify(obj, msg, "恭喜您！该邮箱未被注册。", true);
            }
        }
    });
}

//验证两次输入密码是否相同
function verify_same(obj, tips, msg) {
    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0) {
        set_flag_verify(obj, "密码必填！", tips, false);
        return false;
    }
    var value1 = $("#" + $(obj).attr("sameid")).val(); //原始值 

    if ($(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0 || value1.replace(/(^\s*)|(\s*$)/g, "").length == 0 || $(obj).val() != value1)
        set_flag_verify(obj, msg, tips, false);
    else
        set_flag_verify(obj, msg, "验证成功！", true);
}


//验证函数
function set_flag_verify(obj, msg, tips, value)
{ set_flag_verify(obj, msg, tips, value, false); }
//验证函数
function set_flag_verify(obj, msg, tips, value, first) {

    msg = getInputMsg(obj, msg);
    tips = getInputTips(obj, tips);

    if ($(obj).val() != null && $(obj).val().replace(/(^\s*)|(\s*$)/g, "").length == 0 && !$(obj).hasClass("req")) { value = true; }

    removeMsgTips(obj);


    if (value == false) {
        addErrorSpan(obj, msg);
        $(obj).addClass("inputError");
    }
    else {
        addTipsSpan(obj, tips, first ? !first : true);
        $(obj).removeClass("inputError");
    }
}


//获取自定义错误提示信息
function getInputMsg(obj, msg) {
    if (HasAttr(obj, "msg"))
        return $(obj).attr('msg');

    return msg;
}
//获取自定义--第一次信息
function getInputFirstShowTips(obj, stips) {
    if (HasAttr(obj, "stxt"))
        return $(obj).attr('stxt');

    return stips;
}
//获取自定义正常提示信息
function getInputTips(obj, tips) {
    if (HasAttr(obj, "tips"))
        return $(obj).attr('tips');

    return tips;
}
//获取自定义显示区
function getInputShowClass(obj) {
    if (HasAttr(obj, "showclass"))
        return $(obj).attr('showclass');

    return "";
}

function GetArrValue(obj, ArrName) {
    if (HasAttr(obj, ArrName))
        return $(obj).attr(ArrName);
    return "";
}

//是否有此属性
function HasAttr(obj, attrName)
{ return $(obj).attr(attrName) != undefined && $(obj).attr(attrName) != null && $(obj).attr(attrName).length > 0; }

//获取焦点
function inputFocus(obj, tips) {
    tips = getInputTips(obj, tips);


    removeMsgTips(obj);
    $(obj).removeClass("inputError");
    addTipsSpan(obj, tips, false);

}
//移除提示span
function removeMsgTips(obj) {
    var P = $(obj).parents(FormClassName);
    $(P).find("span[id='msg_" + $(obj).attr('name') + "']").remove();
    $(P).find("span[id='tips_" + $(obj).attr('name') + "']").remove();
}
//增加错误提示span
function addErrorSpan(obj, msg) {
    if ($(obj).hasClass("req")) {
        if (msg.indexOf(reqMsg) < 0)
        { msg = reqMsg + " " + msg; }
    }

    var sclass = getInputShowClass(obj);
    if (sclass.length <= 0)
        $(obj).after("<span class='spanError' style='color:" + ErrorColor + "' id='msg_" + $(obj).attr('name') + "'> " + msg + "</span>");
    else {
        $("." + sclass).html("<span class='spanError' style='color:" + ErrorColor + "' id='msg_" + $(obj).attr('name') + "'> " + msg + "</span>");
        $("." + sclass).css("color", ErrorColor);
    }

    //$(obj).css("border", "1px solid " + ErrorColor);
    $(obj).addClass("red");
}
//增加正常提示span
function addTipsSpan(obj, tips, S) {
    if ($(obj).hasClass("req")) {
        if (tips.indexOf(reqTips) < 0)
        { tips = reqTips + " " + tips; }
    }
    var hidden = $(obj).hasClass("notips") ? "display:none;" : "";

    var pic = "";
    var color = "";
    if (S) {
        pic = "spanRight";
        color = RightColor;
    }
    else {
        pic = "spanTips";
        color = TipsColor;
        tips = getInputFirstShowTips(obj, tips)
    }

    var sclass = getInputShowClass(obj);
    if (sclass.length <= 0)
        $(obj).after("<span  class='" + pic + "' style='" + hidden + "color:" + color + "' id='tips_" + $(obj).attr('name') + "'> " + tips + "</span>");
    else {
        $("." + sclass).html("<span  class='" + pic + "' style='" + hidden + "color:" + color + "' id='tips_" + $(obj).attr('name') + "'> " + tips + "</span>");
        $("." + sclass).css("color", color);
    }

    //$(obj).css("border-width", "1px");
    //$(obj).css("border-style", "solid");
    //$(obj).css("border-color", NormalBorderColor);
    $(obj).removeClass("red");
}

//把一个双字节转换为ww
function C_ASIIC(val) {
    return val.replace(/[^\x00-\xff]/g, "ww");
}

//表单submit时验证
function verfy_submit(_obj) {

    var obj = $(_obj);

    if ($(obj).find(".inputError").not(".Rreq,.Creq").length > 0) return false;

    var output = "";
    for (var i = 0; i < form_VerifyList.length; i++) {
        var tips = form_VerifyList[i][1];
        var msg = form_VerifyList[i][2];
        var functionName = form_VerifyList[i][0];
        var className = "";
        try {
            className = functionName.split("_")[1];
        } catch (ce) { continue; }
        if (className == "") { continue; }

        output += "$(obj).find(\"." + className + "\").each(function(u, v){" + functionName + "($(v),'" + tips + "','" + msg + "');});";
    }
    eval(output);

    return $(obj).find(".inputError").length == 0 ? true : false;
}

//初始验证函数
$(function () {
    $(FormClassName).each(function (fi, fv) {
        for (var i = 0; i < form_VerifyList.length; i++) {
            var functionName = form_VerifyList[i][0];
            var tips = form_VerifyList[i][1]; //正常提示信息
            var msg = form_VerifyList[i][2];  //错误提示信息
            var className = "";
            try {
                className = functionName.split("_")[1];
            } catch (ce) { continue; }
            if (className == "") { continue; }

            $(fv).find("." + className).each(function (ui, vi) {
                $(vi).attr("tips", GetArrValue($(vi), "tips") + tips);
            });

            eval("$(fv).find(\"." + className + "\").blur(function(){if(!$(this).hasClass('noBlur')){" + functionName + "($(this),'" + tips + "','" + msg + "'); } });");
            eval("$(fv).find(\"." + className + "\").focus(function(){if(!$(this).hasClass('noFocus')){ inputFocus($(this),'" + tips + "'); } });");

            $(fv).find("." + className).each(function (ui, vi) {
                //初始显示提示
                eval("set_flag_verify($(this), '" + msg + "', '" + tips + "', true, true);");
            });

            var isRes = true;
            if (form_VerifyList[i][3] != undefined) { isRes = form_VerifyList[i][3]; }
            if (!isRes) { $(fv).find("." + className).hide(); $(fv).find("." + className).val("&nbsp;"); }

        }

        //增加submit方法
        $(fv).submit(function () { return verfy_submit($(this)); });
    });
});


