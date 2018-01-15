<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form" enctype="multipart/form-data">
        <table class="table1">
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;">一、</th>
                <th>订单未付款几天取消订单</th>
            </tr>
            <tr>
                <td align="right">天数：</td>
                <td>
                    <input type="text" name="NonPaymentCanceledDay" class='noJ w80px req int' />
                    <span class="InputDetail">{订单未付款几天取消订单}</span>
                </td>
            </tr>
            <tr>
                <td align="right">说明：</td>
                <td>
                    <input type="text" name="NonPaymentCanceledInfo" class='noJ w450px req' />
                </td>
            </tr>
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;">二、</th>
                <th>订单已发货几天未确认收货，系统处理为已收货</th>
            </tr>
            <tr>
                <td align="right">天数：</td>
                <td>
                    <input type="text" name="ShippedToAlreadyReceivingDay" class='noJ w80px req int' />
                </td>
            </tr>
            <tr>
                <td align="right">说明：</td>
                <td>
                    <input type="text" name="ShippedToAlreadyReceivingInfo" class='noJ w450px req' />
                </td>
            </tr>
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;">三、</th>
                <th>订单已确认收货几天未评价，系统自动给好评</th>
            </tr>
            <tr>
                <td align="right">天数：</td>
                <td>
                    <input type="text" name="AlreadyReceivingDay" class='noJ w80px req int' />
                </td>
            </tr>
            <tr>
                <td align="right">标题：</td>
                <td>
                    <input type="text" name="AlreadyReceivingTitle" class='req' />
                </td>
            </tr>
            <tr>
                <td align="right">等级：</td>
                <td>
                    <select name="AlreadyReceivingRating">
                        <option value="1">一星</option>
                        <option value="2">二星</option>
                        <option value="3">三星</option>
                        <option value="4">四星</option>
                        <option value="5">五星</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">内容：</td>
                <td>
                    <input type="text" name="AlreadyReceivingContent" class='req noJ w450px' />
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
