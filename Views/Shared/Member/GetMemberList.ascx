<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<style type="text/css">
    .MemberBox th { height: 30px; line-height: 28px; background-color: rgb(221, 240, 253); text-align: center; padding: 5px; }
    .MemberBox td { text-align: center; padding: 10px; border-bottom: 1px solid #e1e1e1; }
</style>
<div class="MemberBox hide" style="width: 701px; height: auto;">
    <div class="MemberBoxSearch" style="line-height: 30px;">
        <form class="MemberBoxForm">
        会员账号:&nbsp;
        <input type="text" name="M_UserName" value='' class='noJ w180px ' />
        <input type="button" value="搜索" onclick="GetMemberList()" />
        </form>
    </div>
    <div style="height:355px; overflow-y: auto; overflow-x: hidden;">
        <table class="MemberTable" cellspacing="0" cellpadding="0" style="width: 100%;">
        </table>
    </div>
</div>
<script id="MemberTr" type="text/html">
        [%if(head){%]
        <tr>
            <th>&nbsp; </th>
            <th>会员账号</th>
            <th>等级</th>
            <th>登录次数</th>
            <th>最后登录时间</th>
        </tr>
        [%}%]
        <tr class="CP" onclick="TrClick(this)">
            <td><input type="radio" value="[%=id%]" name="mid"/></td>
            <td>[%=M_UserName%]</td>
            <td>[%=MR_Name%]</td>
            <td>[%=M_LoginCount%]</td>
            <td>[%=M_LastTime%]</td>
        </tr>
</script>
<script type="text/javascript">
    
    //点击事件
    function TrClick(obj) {

        if ($(obj).find("input[name='mid']").attr("checked")) {
            $(obj).find("input[name='mid']").attr("checked", "");
        }
        else {
            $(obj).find("input[name='mid']").attr("checked", "true");
        }
    }

    function GetMemberList() {

        var param = $(".MemberBoxForm").serialize();

        $.ajax({
            url: '<%=Url.Action("GetMemberList","Comm")%>',
            data: param,
            type: 'POST',
            dataType: "json",
            success: function (data) {

                var html = "";

                var Json = eval(data);

                for (var i in Json) {
                    if (i == 0) {
                        Json[i].head = true;
                    } else {
                        Json[i].head = false;
                    }

                    html += template('MemberTr', Json[i]);
                }

                $(".MemberTable").html(html);
            }
        });
    }


    //赠送活动劵
    function GiveCoupon(id) {

        var aid = id;

        Dialog($(".MemberBox"), "选择赠送会员", function () {

            if ($(".MemberBox table").find(":checked").length != 0) {

                $(".MemberBox table").find(":checked").each(function (i, v) {

                    var mid = $(v).val();

                    $.ajax({
                        url: '<%=Url.Action("GiveCoupon")%>',
                        async: false,
                        data: { aid: aid, mid: mid },
                        type: 'POST',
                        success: function (result) {
                            $("body").showMessage(result)
                        }
                    });

                    location.reload();

                });
            } else {
                
                alert("请选择一个商品!");

            }

        }, true);

        GetMemberList();

    }
</script>
