<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteM_Admins")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识ID"));
        myColumns.push(new Array("1", "RoleCateId", "角色类型"));
        myColumns.push(new Array("1", "A_UserName", "账号"));
        myColumns.push(new Array("1", "A_RealName", "真实姓名"));
        myColumns.push(new Array("1", "A_Sex", "性别"));
        myColumns.push(new Array("1", "A_Mobilenumber", "手机号码"));
        myColumns.push(new Array("1", "A_Remarks", "备注"));
        myColumns.push(new Array("1", "OrderNum", "排序号"));
        myColumns.push(new Array("1", "UpTime", "更新时间"));
    </script>
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    管理员列表</div>
                <div class="PageDetail">
                    管理员说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Base_Admins> _Pager = (Pager<Base_Admins>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>账号&nbsp;
                <input type="text" name="A_UserName" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
                <input type="submit" value="搜索" />
            </td>
        </tr>
    </table>
    </form>
    <div class="peditHTML">
        <div class="editHTML">
        </div>
    </div>
    <!--数据信息-->
    <table class="table1" style="display: none;">
        <tr>
            <td colspan="26"><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
        <tr>
            <th class="editHtmlbtn" title="自定义" style="width: 30px; cursor: pointer;"></th>
            <th style="width: 30px;">编号</th>
            <th class="C_olumn id">主键--标识ID</th>
            <th class="C_olumn RoleCateId">角色类型</th>
            <th class="C_olumn A_UserName">账号</th>
            <th class="C_olumn A_RealName">真实姓名</th>
            <th class="C_olumn A_Sex">性别</th>
            <th class="C_olumn A_Mobilenumber">手机号码</th>
            <th class="C_olumn A_Powervalues">权限值</th>
            <th class="C_olumn A_Remarks">备注</th>
            <th class="C_olumn OrderNum">排序号</th>
            <th class="C_olumn UpTime">更新时间</th>
            <th style="width: 100px;">操作</th>
        </tr>
        <%
            int i = 0;
            foreach (Base_Admins m_ma in _Pager.DataList)
            {
                i++;
        %>
        <tr cid='<%=m_ma.id %>'>
            <td>
                <input type="checkbox" name="ids" value='<%=m_ma.id %>' /></td>
            <td>
                <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
            <td class="C_olumn id" title="<%=m_ma.id.JHtmlEncode()%>">
                <%=m_ma.id.JSubString(30)%></td>
            <td class="C_olumn RoleCateId" title="<%=m_ma.RoleCateId.JHtmlEncode()%>">
                <%=m_ma.Base_RoleCate.RC_Name%></td>
            <td class="C_olumn A_UserName" title="<%=m_ma.A_UserName.JHtmlEncode()%>">
                <%=m_ma.A_UserName.JSubString(30)%></td>
            <td class="C_olumn A_RealName" title="<%=m_ma.A_RealName.JHtmlEncode()%>">
                <%=m_ma.A_RealName.JSubString(30)%></td>
            <td class="C_olumn A_Sex" title="<%=m_ma.A_Sex.JHtmlEncode()%>">
                <%=m_ma.A_Sex.JSubString(30)%></td>
            <td class="C_olumn A_Mobilenumber" title="<%=m_ma.A_Mobilenumber.JHtmlEncode()%>">
                <%=m_ma.A_Mobilenumber.JSubString(30)%></td>
            <td class="C_olumn A_Remarks" title="<%=m_ma.A_Remarks.JHtmlEncode()%>">
                <%=m_ma.A_Remarks.JSubString(30)%></td>
            <td class="C_olumn OrderNum" title="<%=m_ma.OrderNum.JHtmlEncode()%>">
                <%=m_ma.OrderNum.JSubString(30)%></td>
            <td class="C_olumn UpTime" title="<%=m_ma.UpTime.JHtmlEncode()%>">
                <%=m_ma.UpTime.JSubString(30)%></td>
            <td>
                <%
                    if ((m_ma.A_UserName == "admin" && Model.id == m_ma.id) || m_ma.A_UserName != "admin")
                    {
                %>
                <a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEBase_Admins", new { id = m_ma.id,Page=_Pager.PageIndex })%>", location.href )'>编辑/查看</a>
                <% 
}
                    if (m_ma.A_IsLock)
                    {
                %>
                <a class='SmallButton' href="<%=Url.Action("Unlock", new { id = m_ma.id,Page=_Pager.PageIndex})%>">解锁</a>
                <% 
                    }
                    else if (m_ma.A_UserName != "admin")
                    {
                %>
                <a class='SmallButton' href="<%=Url.Action("Lock", new { id = m_ma.id,Page=_Pager.PageIndex })%>">锁定</a>
                <% 
                    }
                %>
                <%
                    if (m_ma.A_UserName != "admin")
                    {
                %>
                <a class='SmallButton' onclick="DeleteId('<%=m_ma.id %>')">删除</a>
                <% 
                    }
                %>
            </td>
        </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="26">暂时没有内容... ...</td>
          </tr>
        <%} %><tr>
            <td colspan="26">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
