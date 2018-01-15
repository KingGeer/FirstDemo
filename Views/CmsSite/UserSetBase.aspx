<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<DealMvc.Common.Config.UserSetInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form" enctype="multipart/form-data">
    <table class="table1">
        <tr>
            <th align="right" style="width: 120px; overflow: hidden;"></th>
            <th></th>
        </tr>
        <tr>
            <td align="right">API会员登录：</td>
            <td>
                <select name="IsMemberAPILogin">
                    <option value="1">开启</option>
                    <option value="0">关闭</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">会员登录：</td>
            <td>
                <select name="IsMemberLogin">
                    <option value="1">开启</option>
                    <option value="0">关闭</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">用户注册：</td>
            <td>
                <select name="IsMemberReg">
                    <option value="1">开启</option>
                    <option value="0">关闭</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right">收货址数量：</td>
            <td>
                <input type="text" name="MemberDeliveryAddressQuantity" class='noJ w80px req int' min="1" /></td>
        </tr>
        <tr>
            <td align="right">注册服务设置：</td>
            <td>
                <%=Html.TextArea("RegServerContent", new { @class = "J notips TextArea", style = "width:680px; height:200px;" })%>
                <script type="text/javascript">
                    KindEditor.ready(function (K) {
                        window.EditorObject = K.create('textarea[name="RegServerContent"]', {
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
            <td align="right">注册默认头像：</td>
            <td>
                <input type="file" name="RegMemberHead" value="" /></td>
        </tr>
        <tr>
            <td align="right"></td>
            <td>
                <%=DealMvc.Common.HtmlStrings.ImgNone(Model.RegMemberHead,"【暂无图片】",150,150) %></td>
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
