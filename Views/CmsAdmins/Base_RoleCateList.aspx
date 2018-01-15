<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage<Base_Admins>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteM_RoleCate")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识ID"));
        myColumns.push(new Array("1", "CompanyId", "公司"));
        myColumns.push(new Array("1", "RC_Name", "名称"));
        myColumns.push(new Array("0", "RC_Powervalues", "权限内容"));
        myColumns.push(new Array("1", "RC_Remarks", "备注"));
        myColumns.push(new Array("1", "OrderNum", "排序号"));
        myColumns.push(new Array("1", "UpTime", "更新时间"));
    </script>
    <!--功能说明-->
    <table class="table1">
        <tr>
            <td>
                <div class="PageTitle">
                    角色列表</div>
                <div class="PageDetail">
                    角色说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Base_RoleCate> _Pager = (Pager<Base_RoleCate>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>名称&nbsp;
                <input type="text" name="RC_Name" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <td colspan="14"><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
        <tr>
            <th class="editHtmlbtn" title="自定义" style="width: 30px; cursor: pointer;"></th>
            <th style="width: 30px;">编号</th>
            <th class="C_olumn id">主键--标识ID</th>
            <th class="C_olumn RC_Name">名称</th>
            <th class="C_olumn RC_Powervalues">权限内容</th>
            <th class="C_olumn RC_Remarks">备注</th>
            <th class="C_olumn OrderNum">排序号</th>
            <th class="C_olumn UpTime">更新时间</th>
            <th style="width: 100px;">操作</th>
        </tr>
        <%int i = 0; foreach (Base_RoleCate m_mrc in _Pager.DataList)
          {
              i++;%>
        <tr cid='<%=m_mrc.id %>'>
            <td>
                <input type="checkbox" name="ids" value='<%=m_mrc.id %>' /></td>
            <td>
                <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
            <td class="C_olumn id" title="<%=m_mrc.id.JHtmlEncode()%>">
                <%=m_mrc.id.JSubString(30)%></td>
            <td class="C_olumn RC_Name" title="<%=m_mrc.RC_Name.JHtmlEncode()%>">
                <%=m_mrc.RC_Name.JSubString(30)%></td>
            <td class="C_olumn RC_Powervalues" title="<%=m_mrc.RC_Powervalues.JHtmlEncode()%>">
                <%=m_mrc.RC_Powervalues.JSubString(30)%></td>
            <td class="C_olumn RC_Remarks" title="<%=m_mrc.RC_Remarks.JHtmlEncode()%>">
                <%=m_mrc.RC_Remarks.JSubString(30)%></td>
            <td class="C_olumn OrderNum" title="<%=m_mrc.OrderNum.JHtmlEncode()%>">
                <%=m_mrc.OrderNum.JSubString(30)%></td>
            <td class="C_olumn UpTime" title="<%=m_mrc.UpTime.JHtmlEncode()%>">
                <%=m_mrc.UpTime.JSubString(30)%></td>
            <td>
                <%
                    if (m_mrc.RC_Name != "超级管理员")
                    {
                %>
                <a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEBase_RoleCate", new { id = m_mrc.id })%>", location.href )'>编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_mrc.id %>')">删除</a></td>
            <%
                }
            %>
        </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="14">暂时没有内容... ...</td>
          </tr>
        <%} %><tr>
            <td colspan="14">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
