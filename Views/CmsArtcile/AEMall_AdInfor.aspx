<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Mall_AdInfor>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>广告信息</div>
            </td>
        </tr>
    </table>
    <!--表单信息-->
    <form method="post" class="form" enctype="multipart/form-data">
    <table class="table1">
        <tr>
            <th align='right' style='width: 120px; overflow: hidden;'>
            </th>
            <th>
            </th>
        </tr>
        <%--<tr><td align="right">主键--标识id</td><td><input type="text" name="id" class="req  int noJ w80px" /> <!--<span class="InputDetail">{主键--标识id}</span>--> </td></tr>--%>
        <tr>
            <td align="right">
                广告位置唯一编号
            </td>
            <td>
                <select name="AdPositionsUniqueId" class="Sreq">
                    <option value="">-请选择-</option>
                    <%=Mall_AdPositions.GetOptions()%>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">
                广告语
            </td>
            <td>
                <input type="text" name="AI_Title" class="req noJ w450px" />
                <!--<span class="InputDetail">{广告语}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                广告图片
            </td>
            <td>
                <input type="file" name="AI_Img" />
                <!--<span class="InputDetail">{广告图片}</span>-->
            </td>
        </tr>
        <%if (!string.IsNullOrEmpty(Model.AI_Img))
          { %>
        <tr>
            <td align="right">
                广告图片
            </td>
            <td>
                <%=HtmlStrings.ImgNone(Model.AI_Img, 300, 300)%>
            </td>
        </tr>
        <%} %>
        <tr>
            <td align="right">
                跳转地址
            </td>
            <td>
                <input type="text" name="AI_Href" class="req " />
                <span class="InputDetail">请以http://开头;列如：http://www.baidu.com</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                是否新窗口打开
            </td>
            <td>
                <%=HtmlStrings.HtmlInputRadioTrueAndFalse("AI_IsTaget",Model.AI_IsTaget) %>
                <!--<span class="InputDetail">{是否新窗口打开}</span>-->
            </td>
        </tr>
        <tr>
            <td align="right">
                备注
            </td>
            <td>
                <input type="text" name="AI_Rermark" class="req noJ w450px" />
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
                <!--<span class="InputDetail">{更新时间}</span>-->
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
