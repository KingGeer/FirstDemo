<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        html { overflow-y: hidden; }
        body { overflow-y: hidden; }
    </style>
    <%
        DealMvc.Common.Config.SiteInfo m_SiteInfo = DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.SiteInfo>.Instance();

        DealMvc.Model.Base_Admins m_Admin = (DealMvc.Model.Base_Admins)ViewData["model"];
        string AdminPowerValues = m_Admin.A_Powervalues.ToLower().Replace("'", "").Replace("\"", "");
    %>
    <script>
        $(function () {
            Authority();

            $(".splitbar_collapse_h").click(function () {
                if ($(this).hasClass("hidd")) {
                    $(this).removeClass("hidd");
                    $(this).attr("title", "收缩");
                    $(".MList").show();
                }
                else {
                    $(this).addClass("hidd");
                    $(this).attr("title", "展出");
                    $(".MList").hide();
                }
            });
        });
        function Authority() {
            var QX = '<%=AdminPowerValues %>';
            if (QX == "all") return;
            QX = "|" + QX;
            $(".menu > span").each(function (i, v) {
                $(v).find("a").each(function (u, vv) {
                    if (($(vv).attr("href") == "#" || $(vv).attr("href") == "javascript:void(0)") && $(vv).parent().hasClass("title")) return true;
                    var url = $(vv).attr("href").toLowerCase().substring(1);
                    url = "|" + url.substring(0, url.indexOf(".")) + "#";
                    if (QX.indexOf(url) < 0) $(vv).parent().remove();
                });
            });
            $(".menu > span").each(function (i, v) {
                for (var u = 0; u < 12; u++) {
                    $(v).find("div").each(function (p, b) {
                        if ($(b).find("div").length == 0 && $(b).find("p").length <= 1)
                        { $(b).remove(); }
                    });
                }
            })
            for (var w = $(".menu > span").length - 1; w >= 0; w--) {
                if ($(".menu > span").eq(w).find("*").length == 0) {
                    $(".menu > a").eq(w).remove();
                    $(".menu > br").eq(w).remove();
                    $(".menu > span").eq(w).remove();
                }
            }
        }
    </script>
    <script src="/JS/Comm/tab.js" type="text/javascript"></script>
    <script>
        $(function () {
            $(".clearData").click(function () {
                $.ajax({
                    url: '<%=Url.Action("ClearWebCache","Cms") %>',
                    data: '',
                    type: 'POST',
                    success: function (msg) {
                        if (msg == "0") { alert("操作失败"); }
                        else { location.href = location.href; }
                    }
                });
            });

            //默认打开
            $(".default_open").click();
        });
    </script>
    <div style="text-align: left; margin: 0 auto;">
        <div class="cms_bj" style="width: 100%; height: 40px; color: #999; position: relative;
            overflow: hidden;">
            <div style="position: absolute; top: 5px; right: 5px; word-spacing: 5px; width: 620px;
                line-height: 32px; text-align: right;">
                <span>当前帐号:<%=m_Admin.A_UserName%>[<%=m_Admin.Base_RoleCate.RC_Name%>]</span>
                <span><a onclick='AddLabel("帐号信息","<%=Url.Action("UpDateInfo", "CmsAdmins", new { a_i_id = m_Admin.id })%>")'>
                    帐号信息</a></span> <span><a onclick='AddLabel("修改密码","<%=Url.Action("EAdminPwd", "CmsAdmins", new { a_i_id = m_Admin.id })%>")'>
                        修改密码</a></span> <span><a class="clearData">清空所有缓存</a></span> <span><a onclick="closeHiddLables()">
                            关闭所有隐藏标签</a></span> <span><a href="<%=DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.SiteInfo>.Instance().HomeUrl %>"
                                target="_blank">网站首页</a></span> <span><a href='<%=Url.Action("logout","cms") %>'>注销</a></span>
            </div>
        </div>
        <div class="menu" style="display: none;">
        <%Html.RenderPartial("~/Views/Shared/CmsMeun.ascx"); %>
        </div>
        <div style="margin-top: 0px; clear: both; width: 100%;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="MList" align="left" valign="top" style="width: 205px; height: 100%;">
                        <%--<div style="margin-left: 4px; background: #9DD4FB;">
                            <div class="cltop">
                            </div>
                            <div class="leftMenu" style="width: 187px; padding: 10px 0 20px 15px">
                            </div>
                            <div class="cltob">
                            </div>
                        </div>--%>
                        <div style="margin-left: 4px; background: #FFF; position: relative;">
                            <div class="cltop">
                            </div>
                            <div class="leftMenu" style="width: 187px; padding: 10px 0 20px 15px; overflow: auto;">
                            </div>
                            <div class="cltob">
                            </div>
                            <div class="MenuC">
                            </div>
                        </div>
                    </td>
                    <td class="splitbar_collapse_h" title="收缩" style="width: 3px; height: 100%; border-right: 1px solid #dddddd;">
                        <div style="width: 4px;">
                        </div>
                    </td>
                    <td align="left" valign="top" style="width: 100%;">
                        <div class="Ifr_Title" style="width: 100%; padding-top: 2px; overflow: hidden; background: #FFF;">
                            <div title="刷新" class="fl reload ifr_title">
                            </div>
                        </div>
                        <div class="Ifr_Content" style="width: 100%;">
                        </div>
                    </td>
                    <%--<td style="width: 4px; height: 100%;">
                        <div style="width: 4px;">
                        </div>
                    </td>--%>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
