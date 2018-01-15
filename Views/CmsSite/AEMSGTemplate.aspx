<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align='right' style='width: 120px; overflow: hidden;'>
            </th>
            <th>
            </th>
        </tr>
        <%--<tr>
            <td align="right">
                主键--标识ID
            </td>
            <td>
                <input type="text" name="id" class="req" />
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                唯一编号
            </td>
            <td>
                <input type="text" name="MT_UniqueID" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                备注
            </td>
            <td>
                <input type="text" name="MT_Remark" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                是否HTML
            </td>
            <td>
                <%--<input type="text" name="MT_IsHtml" class="req" />--%>
                <input type="radio" name="MT_IsHtml" value="False" checked="checked" />纯文本格式
                <input type="radio" name="MT_IsHtml" value="True" />HTML格式
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                内容
            </td>
            <td>
                <input type="text" name="MT_Detail" class="req" />
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                表集合
            </td>
            <td>
                <%
                    List<DealMvc.Orm.TableAttribute> TablesList = DealMvc.Filter.TableNamesFactory.GetAllTableName();
                    foreach (DealMvc.Orm.TableAttribute _TA in TablesList)
                    {
                %>
                <div class="fl" style="width:240px; line-height:24px; padding:6px;"><input type="checkbox" name="MT_TableNames" value="<%=_TA.Name%>" /><%=_TA.Info%><br />(<%=_TA.Name%>)</div>
                <%} %>
                <div class="cb"></div>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                扩展A字段
            </td>
            <td>
                <input type="text" name="A" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                扩展B字段
            </td>
            <td>
                <input type="text" name="B" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                扩展C字段
            </td>
            <td>
                <input type="text" name="C" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                扩展D字段
            </td>
            <td>
                <input type="text" name="D" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">
                扩展E字段
            </td>
            <td>
                <input type="text" name="E" class="req" />
            </td>
        </tr>--%>
        <tr>
            <td>
            </td>
            <td>
                <%if ((bool)ViewData["isEdit"])
                  { %><input type="submit" value="编辑" /><%}
                  else
                  { %><input
                    type="submit" value="添加" /><%} %>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
