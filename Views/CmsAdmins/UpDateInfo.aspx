<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        Base_Admins m_M_Admins = DealMvc.BLL.BLL_Base_Admins.GetLoginAdmins();
    %>
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align='right' style='width: 120px; overflow: hidden;'></th>
            <th></th>
        </tr>
        <tr>
            <td align="right">登录名</td>
            <td>
                <%=m_M_Admins.A_UserName%></td>
        </tr>
        <tr>
            <td align="right">真实姓名</td>
            <td>
                <%=Html.TextBox("A_RealName", m_M_Admins.A_RealName, new { @class = "noJ w120px", maxlength = "20" })%></td>
        </tr>
        <tr>
            <td align="right">性别</td>
            <td>
                <select name="A_Sex" class="w120px noJ">
                    <option>--请选择性别--</option>
                    <%=DealMvc.Enum.EnumCommon.GetSelect(DealMvc.Enum.BaseEnum.Sex.男.GetType(),DealMvc.Enum.EnumCommon.EnumValueType.文字, m_M_Admins.A_Sex)%>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">手机号码</td>
            <td>
                <%=Html.TextBox("A_Mobilenumber", m_M_Admins.A_Mobilenumber, new { @class = "noJ w120px" })%></td>
        </tr>
        <tr>
            <td align="right">备注</td>
            <td>
                <%= Html.TextArea("A_Remarks", m_M_Admins.A_Remarks, new { @class = "TextArea", style = "width:480px;height:80px;", maxlength = "500" })%>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="更新信息" /></td>
        </tr>
    </table>
    </form>
</asp:Content>
