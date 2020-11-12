//JS验证码
var code; //在全局 定义验证码   
function createCode() {
    code = "";
    var codeLength = 4; //验证码的长度   
    var checkCode = document.getElementById("checkCode");
    //定义字符数组  
    var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'); //所有候选组成验证码的字符，当然也可以用中文的   

    for (var i = 0; i < codeLength; i++) {
        //随即获取字符
        var charIndex = Math.floor(Math.random() * 35);
        code += selectChar[charIndex];
    }
    //将验证码的值保存到Hidden中，用于验证码是否输入正确;
    checkCode.className = "code";
    checkCode.value = code;

}

$(function () {
    $("#btn_login").click(function () {
        var username = $("#txt_username").val();
        var pwd = $("#txt_pwd").val();
        var code = $("#txt_code").val();
        $("#lbl_username").text("");
        $("#lbl_pwd").text("");
        if (username == "") {
            $("#lbl_username").text("*");
            alert("用户名不能为空!");
            return;
        }
        if (pwd == "") {
            $("#lbl_pwd").text("*");
            alert("密码不能为空!");
            return;
        }
        if (code == "") {
            alert("验证码不能为空!");
            return;
        }
        if (document.getElementById("checkCode").value.toLowerCase() != code.toLowerCase()) {

            alert("验证码输入错误");
            createCode();
            return;
        }

        $.ajax({
            url: "AjaxFile/Login.ashx",
            data: { "username": username, "pwd": pwd },
            type: "post",
            success: function (msg) {
                $("#lbl_username").text("");
                $("#lbl_pwd").text("");

                if (msg == "1") {
                    location.href = 'xkxy.aspx';
                }
                if (msg == "0") {
                    $("#lbl_username").text("*");
                    alert("用户名不存在，请重新输入！");
                }
                if (msg == "-1") {
                    alert("用户登录异常！");
                }
                if (msg == "-2") {
                    $("#lbl_username").text("*");
                    $("#lbl_pwd").text("*");
                    alert("用户密码错误，请重新输入！");
                }
                createCode();
            }

        })

    })
})   