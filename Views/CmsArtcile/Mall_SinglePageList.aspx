<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMall_SinglePage")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识id"));
        myColumns.push(new Array("1", "SP_Title", "标题"));
        myColumns.push(new Array("0", "SP_Content", "内容"));
        myColumns.push(new Array("1", "SP_IsTarget", "是否新窗口打开"));
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
                    单页面列表</div>
                <div class="PageDetail">
                    单页面说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Mall_SinglePage> _Pager = (Pager<Mall_SinglePage>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>标题&nbsp;
                <input type="text" name="SP_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <th class="C_olumn id">主键--标识id</th>
            <th class="C_olumn SP_Title">标题</th>
            <th class="C_olumn SP_Content">内容</th>
            <th class="C_olumn SP_IsTarget">是否新窗口打开</th>
            <th class="C_olumn OrderNum">排序号</th>
            <th class="C_olumn UpTime">更新时间</th>
            <%--<th class="C_olumn A">扩展A字段</th>--%>
            <%--<th class="C_olumn B">扩展B字段</th>--%>
            <%--<th class="C_olumn C">扩展C字段</th>--%>
            <%--<th class="C_olumn D">扩展D字段</th>--%>
            <%--<th class="C_olumn E">扩展E字段</th>--%>
            <th style="width: 100px;">操作</th>
        </tr>
        <%int i = 0; foreach (Mall_SinglePage m_msp in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_msp.id %>'>
                  <td>
                      <input type="checkbox" name="ids" value='<%=m_msp.id %>' /></td>
                  <td>
                      <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
                  <td class="C_olumn id" title="<%=m_msp.id.JHtmlEncode()%>">
                      <%=m_msp.id.JSubString(30)%></td>
                  <td class="C_olumn SP_Title" title="<%=m_msp.SP_Title.JHtmlEncode()%>">
                      <%=m_msp.SP_Title.JSubString(30)%></td>
                  <td class="C_olumn SP_Content" title="<%=m_msp.SP_Content.JHtmlEncode()%>">
                      <%=m_msp.SP_Content.JSubString(30)%></td>
                  <td class="C_olumn SP_IsTarget" title="<%=m_msp.SP_IsTarget.JHtmlEncode()%>">
                      <%=m_msp.SP_IsTarget==true?"是":"否"%></td>
                  <td class="C_olumn OrderNum" title="<%=m_msp.OrderNum.JHtmlEncode()%>">
                      <%=m_msp.OrderNum.JSubString(30)%></td>
                  <td class="C_olumn UpTime" title="<%=m_msp.UpTime.JHtmlEncode()%>">
                      <%=m_msp.UpTime.JSubString(30)%></td>
                  <%--<td class="C_olumn A" title="<%=m_msp.A.JHtmlEncode()%>"><%=m_msp.A.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn B" title="<%=m_msp.B.JHtmlEncode()%>"><%=m_msp.B.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn C" title="<%=m_msp.C.JHtmlEncode()%>"><%=m_msp.C.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn D" title="<%=m_msp.D.JHtmlEncode()%>"><%=m_msp.D.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn E" title="<%=m_msp.E.JHtmlEncode()%>"><%=m_msp.E.JSubString(30)%></td>--%>
                  <td><a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEMall_SinglePage", new { id = m_msp.id })%>", location.href )'>编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_msp.id %>')">删除</a></td>
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
