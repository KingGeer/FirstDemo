﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form method="post" class="form">
        <table class="table1">
            <tr>
                <th align="right" style="width: 120px; overflow: hidden;"></th><th></th>
            </tr>
            <tr>
                <td align="right">支付宝帐户 </td>
                <td>
                    <input type="text" name="seller_email" class="" />
                </td>
            </tr>
            <tr>
                <td align="right">合作者身份ID </td>
                <td>
                    <input type="text" name="partner" class="" />
                    {合作者身份(Partner ID)} </td>
            </tr>
            <tr>
                <td align="right">交易安全校验码 </td>
                <td>
                    <input type="text" name="key" class="" />
                    {安全校验码(Key)} </td>
            </tr>
            <tr>
            <td align="right">状态 </td>
            <td>
                <select name="IsOpen" class="Sreq">
                    <option value="">请选择</option>
                    <option value="True">开启</option>
                    <option value="False">关闭</option>
                </select>
                <span class="InputDetail">{ 选择开启或关闭}</span> </td>
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
