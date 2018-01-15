<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
        <table class="table1">
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;"></th>
                <th></th>
            </tr>
            <tr>
                <td align="right">邮箱SMTP </td>
                <td>
                    <input type="text" name="smtp" class="" />
                    <span class="InputDetail">{ 设置点的SMTP服务器地址。例如：mail.163.com}</span> </td>
            </tr>
            <tr>
                <td align="right">用户帐号 </td>
                <td>
                    <input type="text" name="emailname" class="" />
                    <span class="InputDetail">{ 设置站点的SMTP账号(登录名)。例如，example}</span> </td>
            </tr>
            <tr>
                <td align="right">邮箱地址 </td>
                <td>
                    <input type="text" name="email" class=" email" />
                    <span class="InputDetail">{ 设置站点的SMTP邮箱。例如，example@163.com}</span> </td>
            </tr>
            <tr>
                <td align="right">邮箱密码 </td>
                <td>
                    <input type="password" name="emailpwd" class="" />
                    <span class="InputDetail">{ 设置站点的SMTP密码。}</span> </td>
            </tr>
            <tr>
                <td align="right">邮箱发送端口 </td>
                <td>
                    <input type="text" name="port" class=" int" />
                    <span class="InputDetail">{ 设置站点的SMTP服务器端口。例如，25}</span> </td>
            </tr>
            <tr>
                <td align="right">状态 </td>
                <td>
                    <select name="IsOpen" class="Sreq">
                        <option value="">请选择</option>
                        <option value="True">开启</option>
                        <option value="False">关闭</option>
                    </select>
                    <span class="InputDetail">{ 选择开启或关闭}</span> </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="修改" />
                </td>
            </tr>
        </table>
    </form>
    <form method="post" class="form" action="<%=Url.Action("EmailBaseTest")%>">
        <table class="table1">
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;"></th>
                <th></th>
            </tr>
            <tr>
                <td align="right">发送测试 </td>
                <td>
                    <input type="text" name="TestEmail" class="req email" />
                    <span class="InputDetail">{ 填写测试电子邮件帐号进行发送测试。}</span> </td>
            </tr>
            <tr><td align="right">标题</td><td><input type="text" name="Title" class="req noJ w450px" /> <!--<span class="InputDetail">{标题}</span>--> </td></tr>
            <tr><td align="right">内容</td><td><%=Html.TextArea("Contents", new { @class = "J notips TextArea", style = "width:680px; height:350px;" })%> <%=HtmlStrings.KindEditorReady("Contents")%> <!--<span class="InputDetail">{内容}</span>--> </td></tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="测试" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
