<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMall_NavMenu")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识id"));
        myColumns.push(new Array("1", "NM_Project", "所属项目(商城，社区)"));
        myColumns.push(new Array("1", "NM_Title", "标题"));
        myColumns.push(new Array("1", "NM_Url", "跳转地址"));
        myColumns.push(new Array("1", "NM_IsTarget", "是否新窗口打开"));
        myColumns.push(new Array("1", "NM_Default", "是否默认"));
        myColumns.push(new Array("1", "NM_Enable", "是否启用"));
        myColumns.push(new Array("1", "NM_Rermark", "备注"));
        myColumns.push(new Array("1", "OrderNum", "排序号"));
        myColumns.push(new Array("1", "UpTime", "更新时间"));
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
                    导航菜单列表</div>
                <div class="PageDetail">
                    导航菜单说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Mall_NavMenu> _Pager = (Pager<Mall_NavMenu>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>
                项目&nbsp;
                <select name="NM_Project">
                    <option value="">--不限--</option>
                    <%=DealMvc.Enum.EnumCommon.GetSelect(DealMvc.Enum.BaseEnum.Source.论坛.GetType(),DealMvc.Enum.EnumCommon.EnumValueType.数字)%>
                </select>
                标题&nbsp;
                <input type="text" name="NM_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <td colspan="18"><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
        <tr>
            <th class="editHtmlbtn" title="自定义" style="width: 30px; cursor: pointer;"></th>
            <th style="width: 30px;">编号</th>
            <th class="C_olumn id">主键--标识id</th>
            <th class="C_olumn NM_Project">所属项目</th>
            <th class="C_olumn NM_Title">标题</th>
            <th class="C_olumn NM_Url">跳转地址</th>
            <th class="C_olumn NM_IsTarget">是否新窗口打开</th>
            <th class="C_olumn NM_Default">是否默认</th>
            <th class="C_olumn NM_Enable">是否启用</th>
            <th class="C_olumn NM_Rermark">备注</th>
            <th class="C_olumn OrderNum">排序号</th>
            <th class="C_olumn UpTime">更新时间</th>
            <%--<th class="C_olumn A">扩展A字段</th>--%>
            <%--<th class="C_olumn B">扩展B字段</th>--%>
            <%--<th class="C_olumn C">扩展C字段</th>--%>
            <%--<th class="C_olumn D">扩展D字段</th>--%>
            <%--<th class="C_olumn E">扩展E字段</th>--%>
            <th style="width: 100px;">操作</th>
        </tr>
        <%int i = 0; foreach (Mall_NavMenu m_mnm in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_mnm.id %>'>
                  <td>
                      <input type="checkbox" name="ids" value='<%=m_mnm.id %>' /></td>
                  <td>
                      <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
                  <td class="C_olumn id" title="<%=m_mnm.id.JHtmlEncode()%>">
                      <%=m_mnm.id.JSubString(30)%></td>
                  <td class="C_olumn NM_Project" title="<%=m_mnm.NM_Project.JHtmlEncode()%>">
                      <%= typeof(DealMvc.Enum.BaseEnum.Source).JGetEnumStringByInt(m_mnm.NM_Project??0)%></td>
                  <td class="C_olumn NM_Title" title="<%=m_mnm.NM_Title.JHtmlEncode()%>">
                      <%=m_mnm.NM_Title.JSubString(30)%></td>
                  <td class="C_olumn NM_Url" title="<%=m_mnm.NM_Url.JHtmlEncode()%>">
                      <%=m_mnm.NM_Url%></td>
                  <td class="C_olumn NM_IsTarget" title="<%=m_mnm.NM_IsTarget.JHtmlEncode()%>">
                      <%=m_mnm.NM_IsTarget==true?"是":"否"%></td>
                  <td class="C_olumn NM_Default" title="<%=m_mnm.NM_Default.JHtmlEncode()%>">
                      <%=m_mnm.NM_Default == true ? "是" : "否"%></td>
                  <td class="C_olumn NM_Enable" title="<%=m_mnm.NM_Enable.JHtmlEncode()%>">
                      <%=m_mnm.NM_Enable == true ? "是" : "否"%></td>
                  <td class="C_olumn NM_Rermark" title="<%=m_mnm.NM_Rermark.JHtmlEncode()%>">
                      <%=m_mnm.NM_Rermark.JSubString(30)%></td>
                  <td class="C_olumn OrderNum" title="<%=m_mnm.OrderNum.JHtmlEncode()%>">
                      <%=m_mnm.OrderNum.JSubString(30)%></td>
                  <td class="C_olumn UpTime" title="<%=m_mnm.UpTime.JHtmlEncode()%>">
                      <%=m_mnm.UpTime.JSubString(30)%></td>
                  <%--<td class="C_olumn A" title="<%=m_mnm.A.JHtmlEncode()%>"><%=m_mnm.A.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn B" title="<%=m_mnm.B.JHtmlEncode()%>"><%=m_mnm.B.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn C" title="<%=m_mnm.C.JHtmlEncode()%>"><%=m_mnm.C.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn D" title="<%=m_mnm.D.JHtmlEncode()%>"><%=m_mnm.D.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn E" title="<%=m_mnm.E.JHtmlEncode()%>"><%=m_mnm.E.JSubString(30)%></td>--%>
                  <td><a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEMall_NavMenu", new { id = m_mnm.id })%>", location.href )'>编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_mnm.id %>')">删除</a></td>
              </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="18">暂时没有内容... ...</td>
          </tr>
        <%} %><tr>
            <td colspan="18">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a></td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
