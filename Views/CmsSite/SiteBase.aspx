<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<DealMvc.Common.Config.SiteInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form" enctype="multipart/form-data">
    <table class="table1">
        <tr>
            <th align="right" style="width: 120px; overflow: hidden;"></th>
            <th></th>
        </tr>
        <tr>
            <td align="right">公司名称 </td>
            <td>
                <input type="text" name="WebName" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">网站域名 </td>
            <td>
                <input type="text" name="HomeUrl" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">网站图标 </td>
            <td>
                <input type="file" name="WebIco" value="" />{ICO格式，宽16px；高16px} </td>
        </tr>
        <tr>
            <td align="right"></td>
            <td>
                <%=DealMvc.Common.HtmlStrings.ImgNone(Model.WebIco,"【暂无图】",40,40)%>
            </td>
        </tr>
        <%--            <tr>
                <td align="right">网站Logo </td>
                <td>
                    <input type="file" name="WebLogo" value="" /> </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <img src="<%=Model.WebLogo %>" width="120px" />
                </td>
            </tr>
        <tr>
            <td align="right">水印文字 </td>
            <td>
                <input type="text" name="ShuiYin" class="req" maxlength="50" />
            </td>
        </tr>--%>
        <tr>
            <td align="right">SEO标题 </td>
            <td>
                <input type="text" name="SEOTitle" class="req" maxlength="50" />
            </td>
        </tr>
        <tr>
            <td align="right">SEO关键词 </td>
            <td>
                <%= Html.TextArea("SEOKeyWord", new { @class = "req TextArea", style = "width:680px;height:60px;", maxlength = "220" })%>
            </td>
        </tr>
        <tr>
            <td align="right">SEO描述 </td>
            <td>
                <%= Html.TextArea("SEODescription", new { @class = "req TextArea", style = "width:680px;height:60px;", maxlength = "320" })%>
            </td>
        </tr>
        <tr>
            <td align="right">标题分隔符 </td>
            <td>
                <input type="text" name="BrowserTitleSeparator" class="req noJ" style="width: 20px;" />
            </td>
        </tr>
        <tr>
            <td align="right">网站版权 </td>
            <td>
                <input type="text" name="WebCopyRight" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">ICP备案号 </td>
            <td>
                <input type="text" name="WebICP" class="req" />
            </td>
        </tr>
        <tr>
            <td align="right">服务热线 </td>
            <td>
                <input type="text" name="ServiceHotline" class="req" /></td>
        </tr>
        <tr>
            <td align="right">联系地址 </td>
            <td>
                <input type="text" name="ContactAddress" class="req noJ" style="width: 450px" /></td>
        </tr>
        <tr>
            <td align="right">联系邮编 </td>
            <td>
                <input type="text" name="ContactZipCode" class="req noJ" style="width: 80px" /></td>
        </tr>
        <tr>
            <td align="right">联系E-mail </td>
            <td>
                <input type="text" name="ContactEmail" class="req " /></td>
        </tr>
        <tr>
            <td align="right">网站后台权限 </td>
            <td>
                <input type="radio" name="PermissionsStatus" id="PermissionsStatus1" value="1" /><label class="green" for="PermissionsStatus1">启用权限模块</label><input type="radio" id="PermissionsStatus0" name="PermissionsStatus" value="0" /><label class="red" for="PermissionsStatus0">关闭权限模块</label>
            </td>
        </tr>
        <tr>
            <td align="right">数据缓存设置 </td>
            <td>
                <input type="checkbox" value="1" name="OpenWebCache" />开启缓存&nbsp;&nbsp;&nbsp;&nbsp;缓存时间(秒)
                <input type="text" name="WebCache" class="req int noJ" style="width: 100px;" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">网站状态 </td>
            <td>
                <input type="radio" name="SiteStatus" id="SiteStatus1" value="1" /><label class="green" for="SiteStatus1">开启网站</label><input type="radio" id="SiteStatus0" name="SiteStatus" value="0" /><label class="red" for="SiteStatus0">关闭网站</label>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">关闭网站原因 </td>
            <td>
                <%=Html.TextArea("StopSiteStatusDes", new { @class = "J notips TextArea", style = "width:680px; height:200px;" })%>
                <script type="text/javascript">
                    KindEditor.ready(function (K) {
                        window.EditorObject = K.create('textarea[name="StopSiteStatusDes"]', {
                            resizeType: 1,
                            uploadJson: '/HtmlEditor/UploadImage',
                            fileManagerJson: '/HtmlEditor/ProcessRequest',
                            allowFileManager: true,
                            themeType: 'simple'
                        });
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td align="right">网站底部信息 </td>
            <td>
                <%=Html.TextArea("CopyrightFoot", new { @class = "J notips TextArea", style = "width:680px; height:200px;" })%>
                <script type="text/javascript">
                    KindEditor.ready(function (K) {
                        window.EditorObject = K.create('textarea[name="CopyrightFoot"]', {
                            resizeType: 1,
                            uploadJson: '/HtmlEditor/UploadImage',
                            fileManagerJson: '/HtmlEditor/ProcessRequest',
                            allowFileManager: true,
                            themeType: 'simple'
                        });
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td align="right">在线客服代码 </td>
            <td>
                <%=Html.TextArea("ServiceCode", new { @class = "J notips TextArea", style = "width:680px; height:250px;" })%>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="修改" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
