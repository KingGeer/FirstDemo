<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
        <table class="table1">
            <tr>
                <th align='right' style='width: 120px; overflow: hidden;'></th>
                <th></th>
            </tr>
            <tr>
                <td align="right">登录帐号 </td>
                <td><b>
                    <%=Model.A_UserName%></b> </td>
            </tr>
            <tr>
                <td align="right">新帐号密码</td>
                <td>
                    <%=Html.Password("AdminPwd", "", new { @class = "req pwd ", maxlength = "20" })%></td>
                <td></td>
            </tr>
            <tr>
                <td align="right">新确认密码</td>
                <td>
                    <%=Html.Password("AdminPwd2", "", new { @sameid = "AdminPwd", @class = "req pwd same", msg = "密码两次输入不一致", tips = " ", maxlength = "20" })%></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="编辑" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
