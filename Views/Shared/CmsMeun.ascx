<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<span class="sub">
    <p><a class="Icon Icon1 " href='<%=Url.Action("SiteBase", "CmsSite")%>'>网站基本信息</a> </p>
    <p><a class="Icon Icon1" href='<%=Url.Action("EmailBase", "CmsSite")%>'>网站邮箱设置</a> </p>
    <p><a class="Icon Icon1" href='<%=Url.Action("OrderSetBase", "CmsSite")%>'>订单信息设置</a> </p>
    <p><a class="Icon Icon1" href='<%=Url.Action("UpLoadFileBase", "CmsSite")%>'>网站上传文件设置</a> </p>
    <p><a class="Icon Icon1" href='<%=Url.Action("FilterKeysBase", "CmsSite")%>'>评论敏感词设置</a></p>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">快捷登录信息设置</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("TencentBase", "CmsSite")%>'>腾讯QQ接口信息</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("SinaBase", "CmsSite")%>'>新浪微博接口信息</a></p>
    </div>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">支付信息设置</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AlipayBase", "CmsSite")%>'>支付宝信息设置</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("TenpayBase", "CmsSite")%>'>财付通信息设置</a></p>
    </div>
    <p><a class="Icon Icon1" href='<%=Url.Action("UserSetBase", "CmsSite")%>'>用户信息设置</a></p>
    <p><a class="Icon Icon1" href='<%=Url.Action("IntegralBase", "CmsSite")%>'>积分信息设置</a></p>
    <div>
        <p class="title"><a class="Icon Icon1" href="">信息模板版块</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("MSGTemplateList", "CmsSite")%>'>信息模板列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMSGTemplate", "CmsSite")%>'>添加信息模板</a></p>
    </div>
</span><a><span class="Icon Icon1">系统模块</span></a>
<br />
<span class="sub">
    <div>
        <p class="title"><a class="Icon Icon1" href="#">角色管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Base_RoleCateList", "CmsAdmins")%>'>角色列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEBase_RoleCate", "CmsAdmins")%>'>添加角色</a></p>
    </div>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">管理员管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Base_AdminsList", "CmsAdmins")%>'>管理员列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEBase_Admins", "CmsAdmins")%>'>添加管理员</a></p>
    </div>
    <p><a class="Icon Icon1" href='<%=Url.Action("Base_AdminsLogList", "CmsAdmins")%>'>管理员操作日志列表</a></p>
</span><a><span class="Icon Icon1">管理员模块</span></a>
<br />
<!--信息模块-->
<span class="sub">
    <div>
        <p class="title"><a class="Icon Icon1" href="#">广告位置管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Mall_AdPositionsList", "CmsArtcile")%>'>广告位置列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMall_AdPositions", "CmsArtcile")%>'>增加广告位置</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Mall_AdInforList", "CmsArtcile")%>'>广告信息列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMall_AdInfor", "CmsArtcile")%>'>增加广告信息</a></p>
    </div>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">单页面管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Mall_SinglePageList", "CmsArtcile")%>'>单页面列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMall_SinglePage", "CmsArtcile")%>'>增加单页面</a></p>
    </div>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">导航菜单管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Mall_NavMenuList", "CmsArtcile")%>'>导航菜单列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMall_NavMenu", "CmsArtcile")%>'>增加导航菜单</a></p>
    </div>
    <div>
        <p class="title"><a class="Icon Icon1" href="#">友情链接管理</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("Mall_LinksList", "CmsArtcile")%>'>友情链接列表</a></p>
        <p><a class="Icon Icon1" href='<%=Url.Action("AEMall_Links", "CmsArtcile")%>'>增加友情链接</a></p>
    </div>
</span><a><span class="Icon Icon1">信息模块</span></a>
<br />
