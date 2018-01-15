<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
        <table class="table1">
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;"></th><th></th>
            </tr>
            <tr>
                <td align="right">敏感词： </td>
                <td>
                    <%= Html.TextArea("KeysContents", new { @class = "req TextArea", style = "width:680px;height:360px;" })%>
                </td>
            </tr>
            <tr>
                <td align="right">说明： </td>
                <td class="hcolor">您填入的敏感词必须是以“|”分割，如：敏感词|敏感词|敏感词 </td>
            </tr>
            <tr>
                <td align="right">替换符号： </td>
                <td>
                    <input type="text" name="ReplaceSymbol" class = "req noJ w80px" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="修改" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
