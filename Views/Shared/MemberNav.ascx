<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="fl memberSideNav" style="background: #fcfcfc;">
    <ul>
        <li>
            <div class="name">
                <a href="">
                    <img src="/App_Themes/UI/Image/memberIco4.gif" />订单中心</a></div>
            <ul>
                <li><a href="<%=Url.Action("OrderList", "Member")%>">我的订单</a></li>
                <li><a href="<%=Url.Action("MyExchangeLog", "Member")%>">我的积分兑换记录</a></li>
            </ul>
        </li>
        <li>
            <div class="name">
                <a href="">
                    <img src="/App_Themes/UI/Image/memberIco4.gif" />账号中心</a></div>
            <ul>
                <li><a href="<%=Url.Action("MInfo", "Member")%>">个人资料</a></li>
                <li><a href="<%=Url.Action("MInfo","Member") %>">修改头像</a></li>
                <li><a href="<%=Url.Action("AddressList", "Member")%>">收货地址</a></li>
                <li><a href="<%=Url.Action("SecurityCenter", "Member")%>">安全设置</a></li>
                <li><a href="<%=Url.Action("SponsorLogList","Member") %>">邀请记录</a></li>
                <li><a href="<%=Url.Action("SiteMsg","Member") %>">我的信箱</a></li>
                <li><a href="<%=Url.Action("FavList","Member") %>">我收藏的商品</a></li>
            </ul>
        </li>
        <li>
            <div class="name">
                <a href="">
                    <img src="/App_Themes/UI/Image/memberIco4.gif" />我的活动卷</a></div>
            <ul>
                <li><a href="<%=Url.Action("MyCashCouponList", "Member")%>">我的现金劵</a></li>
                <li><a href="<%=Url.Action("MyGiftCouponList", "Member")%>">我的礼品劵</a></li>
            </ul>
        </li>
        <li>
            <div class="name">
                <a href="">
                    <img src="/App_Themes/UI/Image/memberIco4.gif" />预存款中心</a></div>
            <ul>
                <li><a href="<%=Url.Action("AccountLog", "Member")%>">资金明细</a></li>
                <li><a href="<%=Url.Action("AccountPointLog", "Member")%>">积分明细</a></li>
                <li><a href="<%=Url.Action("Recharge","Member") %>">账户充值</a></li>
            </ul>
        </li>
    </ul>
</div>
