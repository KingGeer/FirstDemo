<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Mall_AdPositions>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>广告位置</div>
            </td>
        </tr>
    </table>
    <!--表单信息-->
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
                位置唯一编号
            </td>
            <td>
                <%if ((bool)ViewData["isEdit"])
                  { 
                %>
                <%=Model.UniqueId.ToString2() %>
                <%
                    }
                  else
                  {
                %>
                <input type="text" name="UniqueId" class="req noJ w450px" />
                <!--<span class="InputDetail">{广告位置唯一编号}</span>-->
                <%
                    }%>
            </td>
        </tr>
        <tr>
            <td align="right">
                广告位置名称
            </td>
            <td>
                <input type="text" name="AP_Title" class="req noJ w450px" />
                <!--<span class="InputDetail">{广告位置名称}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                图片宽度
            </td>
            <td>
                <input type="text" name="AP_Width" class="req  int noJ w80px" />
                <!--<span class="InputDetail">{图片宽度}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                图片高度
            </td>
            <td>
                <input type="text" name="AP_Height" class="req  int noJ w80px" />
                <!--<span class="InputDetail">{图片高度}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                图片数量
            </td>
            <td>
                <input type="text" name="AP_ImgCount" class="req  int noJ w80px" />
                <!--<span class="InputDetail">{图片数量}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                备注
            </td>
            <td>
                <input type="text" name="AP_Remark" class="req noJ w450px" />
                <!--<span class="InputDetail">{备注}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                排序号
            </td>
            <td>
                <input type="text" name="OrderNum" class="req  int noJ w80px" />
                <!--<span class="InputDetail">{排序号}</span>-->
            </td>
        </tr>
        <%if ((bool)ViewData["isEdit"])
          { %>
        <tr>
            <td align="right">
                更新时间
            </td>
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
