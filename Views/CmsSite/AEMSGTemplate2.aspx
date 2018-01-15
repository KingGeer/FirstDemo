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
        <tr>
            <td align="right">
                模板替换符(区分大小写)
            </td>
            <td>
                <%
                    string TableNames = ViewData["MT_TableNames"].ToString2();
                    string[] tables = TableNames.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string t in tables)
                    {
                        List<DealMvc.Orm.CheckAttribute> _CAL = DealMvc.Filter.TableNamesFactory.GetAllTableColumnAttribute(t);
                %>
                <div style="line-height: 20px; padding-bottom: 6px; font-family: Arial;">
                    <div>
                        表：<%=t %></div>
                    <div style="padding-left: 40px;">
                        <ul>
                            <%foreach (DealMvc.Orm.CheckAttribute _ca in _CAL)
                              { %>
                            <li>
                                <%=_ca.Name%>
                                <span style="color: #999;">(<%=_ca.Des%>)</span> &nbsp;&nbsp;&nbsp;替换符->&nbsp;&nbsp;&nbsp;
                                <%="#" + t + "_" + _ca.Name + "#"%>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                </div>
                <%} %>
            </td>
        </tr>
        <%if ((bool)ViewData["IsHtml"])
          { %>
        <tr>
            <td align="right">
                模板内容(Html格式)
            </td>
            <td>
                <%--<input type="text" name="MT_Detail" class="" />--%>
                <%=Html.TextArea("MT_Detail", new { @class = "ckeditor", style = "width:680px;height:200px;" })%>
                <script>                    Editor("Detail");</script>
            </td>
        </tr>
        <%}
          else
          { %>
        <tr>
            <td align="right">
                模板内容(文本格式)
            </td>
            <td>
                <%--<input type="text" name="MT_Detail" class="" />--%>
                <%=Html.TextArea("MT_Detail", new { style = "width:680px;height:200px;" })%>
            </td>
        </tr>
        <%} %>
        <tr>
            <td>
            </td>
            <td>
                <%if ((bool)ViewData["isEdit"])
                  { %><input type="submit" value="编辑" /><%}
                  else
                  { %><input type="submit" value="添加" /><%} %>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
