<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="line-height: 600px; font-size: 30px; width: 100%; text-align: center;">
        <a href="<%=Url.Action("Login","User") %>" style="margin: 50px;">登录</a><a href="<%=Url.Action("Reg","User") %>" style="margin: 50px;">注册</a><a href="<%=Url.Action("List","Product") %>" style="margin: 50px;">商品列表</a><a href="<%=Url.Action("index","ShoppingCart") %>" style="margin: 50px;">购物车</a></div>
</asp:Content>
