<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteXShop_AdminsLog")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识ID"));
        myColumns.push(new Array("1", "AdminsName", "管理员账号"));
        myColumns.push(new Array("1", "AL_Title", "标题"));
        myColumns.push(new Array("1", "AL_Content", "内容"));
        myColumns.push(new Array("0", "OrderNum", "排序号"));
        myColumns.push(new Array("1", "UpTime", "添加时间"));
        //myColumns.push(new Array("0","A", "扩展A字段"));
        //myColumns.push(new Array("0","B", "扩展B字段"));
        //myColumns.push(new Array("0","C", "扩展C字段"));
        //myColumns.push(new Array("0","D", "扩展D字段"));
        //myColumns.push(new Array("0","E", "扩展E字段"));
    </script>
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    管理员操作日志列表</div>
                <div class="PageDetail">
                    管理员操作日志说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Base_AdminsLog> _Pager = (Pager<Base_AdminsLog>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>管理员账号：&nbsp;
                <input type="text" name="AdminsName" value='' class='noJ w180px Ber' maxlength='50' />&nbsp; 标题：&nbsp;
                <input type="text" name="AL_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <td colspan="15"><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
        <tr>
            <th class="editHtmlbtn" title="自定义" style="width: 30px; cursor: pointer;"></th>
            <th style="width: 30px;">编号</th>
            <th class="C_olumn id">主键--标识ID</th>
            <th class="C_olumn AdminsName">管理员账号</th>
            <th class="C_olumn AL_Title">标题</th>
            <th class="C_olumn AL_Content">内容</th>
            <th class="C_olumn OrderNum">排序号</th>
            <th class="C_olumn UpTime">添加时间</th>
            <%--<th class="C_olumn A">扩展A字段</th>--%>
            <%--<th class="C_olumn B">扩展B字段</th>--%>
            <%--<th class="C_olumn C">扩展C字段</th>--%>
            <%--<th class="C_olumn D">扩展D字段</th>--%>
            <%--<th class="C_olumn E">扩展E字段</th>--%>
            <th style="width: 100px;">操作</th>
        </tr>
        <%int i = 0; foreach (Base_AdminsLog m_xsal in _Pager.DataList)
          {
              i++;%>
        <tr cid='<%=m_xsal.id %>'>
            <td>
                <input type="checkbox" name="ids" value='<%=m_xsal.id %>' /></td>
            <td>
                <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
            <td class="C_olumn id" title="<%=m_xsal.id.JHtmlEncode()%>">
                <%=m_xsal.id.JSubString(30)%></td>
            <td class="C_olumn AdminsName" title="<%=m_xsal.AdminsName.JHtmlEncode()%>">
                <%=m_xsal.AdminsName.JSubString(30)%></td>
            <td class="C_olumn AL_Title" title="<%=m_xsal.AL_Title.JHtmlEncode()%>">
                <%=m_xsal.AL_Title.JSubString(30)%></td>
            <td class="C_olumn AL_Content" title="<%=m_xsal.AL_Content.JHtmlEncode()%>">
                <%=m_xsal.AL_Content.JSubString(30)%></td>
            <td class="C_olumn OrderNum" title="<%=m_xsal.OrderNum.JHtmlEncode()%>">
                <%=m_xsal.OrderNum.JSubString(30)%></td>
            <td class="C_olumn UpTime" title="<%=m_xsal.UpTime.JHtmlEncode()%>">
                <%=m_xsal.UpTime.JSubString(30)%></td>
            <%--<td class="C_olumn A" title="<%=m_xsal.A.JHtmlEncode()%>"><%=m_xsal.A.JSubString(30)%></td>--%>
            <%--<td class="C_olumn B" title="<%=m_xsal.B.JHtmlEncode()%>"><%=m_xsal.B.JSubString(30)%></td>--%>
            <%--<td class="C_olumn C" title="<%=m_xsal.C.JHtmlEncode()%>"><%=m_xsal.C.JSubString(30)%></td>--%>
            <%--<td class="C_olumn D" title="<%=m_xsal.D.JHtmlEncode()%>"><%=m_xsal.D.JSubString(30)%></td>--%>
            <%--<td class="C_olumn E" title="<%=m_xsal.E.JHtmlEncode()%>"><%=m_xsal.E.JSubString(30)%></td>--%>
            <td>
                <%--<a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEXShop_AdminsLog", new { id = m_xsal.id })%>", location.href )'>编辑/查看</a>--%>
                <a class='SmallButton' onclick="DeleteId('<%=m_xsal.id %>')">删除</a></td>
        </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="15">暂时没有内容... ...</td>
          </tr>
        <%} %><tr>
            <td colspan="15">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
