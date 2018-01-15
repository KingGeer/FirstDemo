<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        //当前登录管理员
        Base_Admins m_M_Admins = DealMvc.BLL.BLL_Base_Admins.GetLoginAdmins();
    %>
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align='right' style='width: 120px; overflow: hidden;'></th>
            <th></th>
        </tr>
        <%
            if ((bool)ViewData["isEdit"])
            {
        %>
        <tr>
            <td align="right">账号 </td>
            <td>
                <%=Model.A_UserName%>
            </td>
        </tr>
        <%
            }
            else
            {
        %>
        <tr>
            <td align="right">账号 </td>
            <td>
                <input type="text" name="A_UserName" class="req" min="4" max="12" />
            </td>
        </tr>
        <%
            }

            if (!(bool)ViewData["isEdit"])
            {
        %>
        <tr>
            <td align="right">帐号密码 </td>
            <td>
                <input type="password" name="A_Loginpwd" class="req" min="5" max="16" />
            </td>
        </tr>
        <tr>
            <td align="right">重复帐号密码 </td>
            <td>
                <input type="password" name="A_Loginpwd2" class="req" min="5" max="16" />
            </td>
        </tr>
        <%
            } 
        %>
        <tr>
            <td align="right">真实姓名 </td>
            <td>
                <input type="text" name="A_RealName" max="20" class="J" />
            </td>
        </tr>
        <tr>
            <td align="right">性别 </td>
            <td>
                <input type="radio" name="A_Sex" value="男" checked="checked" />男
                <input type="radio" name="A_Sex" value="女" />女 </td>
        </tr>
        <tr>
            <td align="right">手机号码 </td>
            <td>
                <input type="text" name="A_Mobilenumber" max="20" class="J" />
            </td>
        </tr>
        <tr>
            <td align="right">备注 </td>
            <td>
                <%=Html.TextArea("A_Remarks", new { cols = "60", rows = "4", style = "border-width: 1px;" })%>
            </td>
        </tr>
        <%
            if (Request["a_i_id"] == null)
            { 
        %>
        <tr>
            <td align="right">排序 </td>
            <td>
                <input type="text" name="OrderNum" class="req int" value="0" />
            </td>
        </tr>
        <%
            if (Model.A_UserName != "admin")
            {
        %>
        <tr>
            <td align="right">角色类型</td>
            <td>
                <select name="RoleCateId" class="Sreq RoleCateId">
                    <option value="">-选择角色类型-</option>
                    <%=Base_RoleCate.GetOptions()%>
                </select>
            </td>
        </tr>
        <% 
            }
            else
            {
        %>
        <tr class="hide">
            <td align="right">角色类型</td>
            <td>
                <input type="hidden" name="RoleCateId" value="0" />
            </td>
        </tr>
        <%   
            }      
        %>
        <%
            DealMvc.Common.Config.SiteInfo m_SiteInfo = DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.SiteInfo>.Instance();
            if (m_SiteInfo.PermissionsStatus == "1" && Model.A_UserName != "admin")
            {
        %>
        <tr class="quanxian">
            <td align="right" valign="top">账户类型权限 </td>
            <td><a href="#" class="all">全选</a>&nbsp;&nbsp;<a href="#" class="allF">反选</a>&nbsp;&nbsp;<a href="#" class="allEsc">全部取消</a>
                <% 
                    foreach (KeyValuePair<string, List<DealMvc.Filter.RoleAttribute>> Key in DealMvc.Filter.RoleFactory.GetAllAction())
                    { %>
                <ul style="border: 1px solid #CCCCC2; margin: 2px 0; overflow: hidden; padding: 3px 10px;">
                    <li style="height: 26px; line-height: 26px; font-weight: 700;">
                        <%= Key.Key%>：</li>
                    <li style="line-height: 26px;" class="RoleAttribute">
                        <% 
                            var name = "";
                            foreach (DealMvc.Filter.RoleAttribute RA in Key.Value)
                            {
                                if (!Model.A_Powervalues.Contains(RA.ActionUrl) && Model.A_Powervalues != "all" && !string.IsNullOrEmpty(Model.A_Powervalues) && m_M_Admins.A_Powervalues != "all")
                                {
                                    continue;
                                }

                                if (string.IsNullOrEmpty(name))
                                {
                                    name = RA.OneName;
                        %>
                        <li style="line-height: 26px; overflow: hidden;" class="RoleAttribute">
                            <div style="padding: 5px 0px 0px 10px; width: 100px;" class="fl">
                                <b>
                                    <%=RA.OneName%>:</b>
                            </div>
                            <%
}
                                else if (name != RA.OneName)
                                {
                                    name = RA.OneName; 
                            %>
                        </li>
                        <li style="line-height: 26px; overflow: hidden;" class="RoleAttribute">
                            <div style="padding: 5px 0px 0px 10px; width: 100px;" class="fl">
                                <b>
                                    <%=RA.OneName%>:</b>
                            </div>
                            <%
}
                                
                            %>
                            <div style="width: 125px;" class="fl">
                                <input type="checkbox" class="qx" name="A_Powervalues" value="<%=RA.ActionUrl%>#<%= RA.TwoName%>" />
                                <span>
                                    <%=RA.TwoName%></span>
                            </div>
                            <% 
} 
                            %>
                        </li>
                        <div class="cb">
                        </div>
                </ul>
                <%} %>
                <a href="#" class="all">全选</a>&nbsp;&nbsp;<a href="#" class="allF">反选</a>&nbsp;&nbsp;<a href="#" class="allEsc">全部取消</a> </td>
        </tr>
        <%  
}
            else if (Model.A_UserName == "admin")
            {
        %>
        <tr class="hide">
            <td></td>
            <td>
                <input type="hidden" name="A_Powervalues" value="all" /></td>
        </tr>
        <% 
            }
            } 
        %>
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
    <script type="text/javascript">
        $(function () {

            $(".all").click(function () {
                $(".qx").attr("checked", true);
            });

            $(".allF").click(function () {
                $(".qx").each(function (i, v) {
                    if ($(v).attr("checked"))
                        $(v).attr("checked", false);
                    else
                        $(v).attr("checked", true);
                });
            });

            $(".allEsc").click(function () {
                $(".qx").attr("checked", false);
            });

            //            //判断是否需要隐藏
            //            $(".quanxian .RoleAttribute").each(function (a, b) {

            //                if ($(b).find("div").length == 0) {
            //                    $(b).parent("ul").hide();
            //                }

            //            });
        });
    </script>
</asp:Content>
