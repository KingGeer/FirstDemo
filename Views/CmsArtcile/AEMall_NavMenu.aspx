<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Mall_NavMenu>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>导航菜单</div>
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
            <td align="right">所属项目</td>
            <td>
                <select name="NM_Project">
                    <%=DealMvc.Enum.EnumCommon.GetSelect(DealMvc.Enum.BaseEnum.Source.论坛.GetType(),DealMvc.Enum.EnumCommon.EnumValueType.数字)%>
                </select>
                <!--<span class="InputDetail">{所属项目(商城，社区)}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">标题</td>
            <td>
                <input type="text" name="NM_Title" class="req noJ w450px" max="100" />
                <!--<span class="InputDetail">{标题}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">跳转地址</td>
            <td>
                <input type="text" name="NM_Url" class="req noJ w450px" />
                <!--<span class="InputDetail">{跳转地址}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">是否新窗口打开</td>
            <td>
                <%=HtmlStrings.HtmlInputRadioTrueAndFalse("NM_IsTarget", (Model.NM_IsTarget ?? true))%>
                <!--<span class="InputDetail">{是否新窗口打开}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">是否默认</td>
            <td>
                <%=HtmlStrings.HtmlInputRadioTrueAndFalse("NM_Default", (Model.NM_Default ?? true))%>
                <!--<span class="InputDetail">{是否默认}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">是否启用</td>
            <td>
                <%=HtmlStrings.HtmlInputRadioTrueAndFalse("NM_Enable", (Model.NM_Enable ?? true))%>
                <!--<span class="InputDetail">{是否启用}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">备注</td>
            <td>
                <input type="text" name="NM_Rermark" class="noJ w450px" max="1000" />
                <!--<span class="InputDetail">{备注}</span>-->
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
