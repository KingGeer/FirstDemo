<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
    <table class="table1">
        <tr>
            <th align="right" style="width: 120px; overflow: hidden;"></th>
            <th></th>
        </tr>
        <tr>
            <td align="right" style="width: 210px;">完成订单每消费1元钱 </td>
            <td>
                <input type="text" name="Tocomplete" class="req noJ int" style="width: 100px;" />积分 
                <span class="InputDetail">{如：设置0则代表用户不能获取积分}</span>
            </td>
        </tr>
        <tr>
            <td align="right">注册成为会员</td>
            <td><input type="text" name="Toreg" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <tr>
            <td align="right">每次登陆</td>
            <td><input type="text" name="Tologin" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <tr>
            <td align="right">购买商品</td>
            <td><input type="text" name="ToProduct" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <<tr>
            <td align="right">成功邀请一位好友注册并消费</td>
            <td>
                <input type="text" name="TogoodFriend" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <tr>
            <td align="right">成功发表一条商品评价 </td>
            <td>
                <input type="text" name="ToPostcommodity" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <%-- <tr>
            <td align="right">成功提交一条网站意见 </td>
            <td>
                <input type="text" name="ToPostBug" class="req noJ int" style="width: 100px;" />积分 </td>
        </tr>
        <tr>
                <td align="right">每月消费两次以上，次月 </td>
                <td>
                    <input type="text" name="ToMonthMoney" class="req noJ int" style="width:100px;" />积分</td>
            </tr>--%>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="修改" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
