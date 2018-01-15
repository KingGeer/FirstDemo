<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
       
        //当前登录管理员
        Base_Admins m_M_Admins = ViewData["Admins"] as Base_Admins;
    %>
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    <%=(bool)ViewData["isEdit"]?"编辑":"新增"%>角色</div>
                <div class="PageDetail">
                    角色说明信息</div>
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
        <tr>
            <td align="right">名称</td>
            <td>
                <input type="text" name="RC_Name" class="req noJ w450px" />
                <!--<span class="InputDetail">{名称}</span>-->
            </td>
        </tr>
        <%
            DealMvc.Common.Config.SiteInfo m_SiteInfo = DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.SiteInfo>.Instance();
            if (m_SiteInfo.PermissionsStatus == "1")
            {
        %>
        <tr class="quanxian">
            <td align="right" valign="top">权限内容 </td>
            <td><a href="#" class="all">全选</a>&nbsp;&nbsp;<a href="#" class="allF">反选</a>&nbsp;&nbsp;<a href="#" class="allEsc">全部取消</a>
                <% 
                    foreach (KeyValuePair<string, List<DealMvc.Filter.RoleAttribute>> Key in DealMvc.Filter.RoleFactory.GetAllAction())
                    { 
                %>
                <ul style="border: 1px solid #CCCCC2; margin: 2px 0; overflow: hidden; padding: 3px 10px;">
                    <li style="height: 26px; line-height: 26px; font-weight: 700;">
                        <%=Key.Key%>：<a onclick="ALL(this)">全选</a>&nbsp;&nbsp;<a onclick="ALLF(this)">反选</a></li>
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
                        <div style="padding: 5px 0px; width: 170px;" class="fl">
                            <input type="checkbox" class="qx" name="RC_Powervalues" value="<%=RA.ActionUrl%>#<%=RA.TwoName%>" />
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
                <%
                    } 
                %>
                <a href="#" class="all">全选</a>&nbsp;&nbsp;<a href="#" class="allF">反选</a>&nbsp;&nbsp;<a href="#" class="allEsc">全部取消</a> </td>
        </tr>
        <%
}        
        %>
        <tr>
            <td align="right">备注</td>
            <td>
                <input type="text" name="RC_Remarks" />
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

        //全选
        function ALL(obj) {

            $(obj).parents("ul").find("input").attr("checked", true);

        }

        //反选
        function ALLF(obj) {

            $(obj).parents("ul").find("input").each(function (i, v) {
                if ($(v).attr("checked"))
                    $(v).attr("checked", false);
                else
                    $(v).attr("checked", true);
            });
        }

    </script>
</asp:Content>
