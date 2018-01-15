<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align="right" style="width: 120px; overflow: hidden;">
            </th>
            <th></th>
        </tr>
        <tr>
            <td align="right">
                app_key
            </td>
            <td>
                <input type="text" name="app_key" class="" />
            </td>
        </tr>
        <tr>
            <td align="right">
                app_secret
            </td>
            <td>
                <input type="text" name="app_secret" class="" />
            </td>
        </tr>
        
        <tr>
            <td align="right">
                meta property
            </td>
            <td>
                <input type="text" name="SinaMetaProperty" class=" noJ w450px" />
                
            </td>
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
            <td>
            </td>
            <td>
                <input type="submit" value="修改" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
