<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Mall_SinglePage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>单页面</div>
                <div class="PageDetail">
                    单页面说明信息</div>
            </td>
        </tr>
    </table>
    <!--表单信息-->
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align='right' style='width: 120px; overflow: hidden;'></th>
            <th></th>
        </tr>
        <%--<tr><td align="right">主键--标识id</td><td><input type="text" name="id" class="req  int noJ w80px" /> <!--<span class="InputDetail">{主键--标识id}</span>--> </td></tr>--%>
        <tr>
            <td align="right">标题</td>
            <td>
                <input type="text" name="SP_Title" class="req noJ w450px" max="100" />
                <!--<span class="InputDetail">{标题}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">内容</td>
            <td>
                <%=Html.TextArea("SP_Content", new { @class = "J notips TextArea", style = "width:680px; height:350px;" })%>
                <%=HtmlStrings.KindEditorReady("SP_Content")%>
                <!--<span class="InputDetail">{内容}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">是否新窗口打开</td>
            <td>
                <%=HtmlStrings.HtmlInputRadioTrueAndFalse("SP_IsTarget", Model.SP_IsTarget ?? true)%>
                <!--<span class="InputDetail">{是否新窗口打开}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">排序号</td>
            <td>
                <input type="text" name="OrderNum" class="req  int noJ w80px" value="0" />
                <!--<span class="InputDetail">{排序号}</span>-->
            </td>
        </tr>
        <%--<tr><td align="right">扩展A字段</td><td><input type="text" name="A" class="req noJ w450px" /> <!--<span class="InputDetail">{扩展A字段}</span>--> </td></tr>--%>
        <%--<tr><td align="right">扩展B字段</td><td><input type="text" name="B" class="req noJ w450px" /> <!--<span class="InputDetail">{扩展B字段}</span>--> </td></tr>--%>
        <%--<tr><td align="right">扩展C字段</td><td><input type="text" name="C" class="req noJ w450px" /> <!--<span class="InputDetail">{扩展C字段}</span>--> </td></tr>--%>
        <%--<tr><td align="right">扩展D字段</td><td><input type="text" name="D" class="req noJ w450px" /> <!--<span class="InputDetail">{扩展D字段}</span>--> </td></tr>--%>
        <%--<tr><td align="right">扩展E字段</td><td><input type="text" name="E" class="req noJ w450px" /> <!--<span class="InputDetail">{扩展E字段}</span>--> </td></tr>--%>
        <tr>
            <td></td>
            <td>
                <%if ((bool)ViewData["isEdit"])
                  { %><input type="submit" value="编辑" /><%}
                  else
                  { %><input type="submit" value="添加" /><%} %></td>
        </tr>
    </table>
    </form>
</asp:Content>
