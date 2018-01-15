<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Mall_Links>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>友情链接</div>
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
            <td align="right">所属项目 </td>
            <td>
                <%=DealMvc.Enum.EnumCommon.EnumToSD("L_Project",typeof(DealMvc.Enum.BaseEnum.Source),Model.L_Project.ToString2()) %>
                <!--<span class="InputDetail">{所属项目(商城，社区)}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">类型 </td>
            <td>
                <%=DealMvc.Enum.EnumCommon.EnumToSD("L_Project",typeof(DealMvc.Enum.LinksEnum.L_Type),Model.L_Type.ToString2()) %>
                <!--<span class="InputDetail">{类型（文字、图片）}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">标题 </td>
            <td>
                <input type="text" name="L_Title" class="req " />
                <!--<span class="InputDetail">{标题}</span>-->
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                图片
            </td>
            <td>
                <input type="text" name="L_Img" class="req noJ w450px" />
                <!--<span class="InputDetail">{图片}</span>-->
            </td>
        </tr>--%>
        <tr>
            <td align="right">链接地址 </td>
            <td>
                <input type="text" name="L_Url" class="req noJ w450px" />
                <!--<span class="InputDetail">{链接地址}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">是否新窗口打开 </td>
            <td>
                <%=DealMvc.Common.HtmlStrings.HtmlInputRadioTrueAndFalse("L_IsTarget", Model.L_IsTarget)%>
                <input type="text" name="L_IsTarget" class="req " />
                <!--<span class="InputDetail">{是否新窗口打开}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">备注 </td>
            <td>
                <input type="text" name="L_Rermark" class="noJ w450px" />
                <!--<span class="InputDetail">{备注}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">排序号 </td>
            <td>
                <input type="text" name="OrderNum" class=" int noJ w80px" value="0" />
                <!--<span class="InputDetail">{排序号}</span>-->
            </td>
        </tr>
        <%if ((bool)ViewData["isEdit"])
          { %>
        <tr>
            <td align="right">更新时间 </td>
            <td>
                <%=Model.UpTime.ToString2()%>
            </td>
        </tr>
        <%} %>
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
                  { %><input type="submit" value="添加" /><%} %>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
