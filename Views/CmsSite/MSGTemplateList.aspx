<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMSGTemplate")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识ID"));
        myColumns.push(new Array("1", "MT_UniqueID", "唯一编号"));
        myColumns.push(new Array("1", "MT_Remark", "备注"));
        myColumns.push(new Array("1", "MT_IsHtml", "是否HTML"));
        //myColumns.push(new Array("0", "MT_Detail", "内容"));
        myColumns.push(new Array("0", "MT_TableNames", "表集合"));
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
                    信息模板表列表</div>
                <div class="PageDetail">
                    信息模板表说明信息</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Base_MSGTemplate> _Pager = (Pager<Base_MSGTemplate>)ViewData["Pager"]; %>
    <form>
        <table class="table1" style="">
            <tr>
                <td>备注&nbsp;
                    <input type="text" name="MT_Remark" value='' class='noJ w180px Ber' />&nbsp;
                    编号&nbsp;
                    <input type="text" name="MT_UniqueID" value='' class='noJ w180px Ber' />&nbsp;
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
            <th class="C_olumn MT_UniqueID">唯一编号</th>
            <th class="C_olumn MT_Remark">备注</th>
            <th class="C_olumn MT_IsHtml">是否HTML</th>
            <%-- <th class="C_olumn MT_Detail">内容</th>--%>
            <th class="C_olumn MT_TableNames">表集合</th>
            <%--<th class="C_olumn A">扩展A字段</th>--%>
            <%--<th class="C_olumn B">扩展B字段</th>--%>
            <%--<th class="C_olumn C">扩展C字段</th>--%>
            <%--<th class="C_olumn D">扩展D字段</th>--%>
            <%--<th class="C_olumn E">扩展E字段</th>--%>
            <th style="width: 100px;">操作</th>
        </tr>
        <%int i = 0; foreach (Base_MSGTemplate m_xsmsgt in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_xsmsgt.id %>'>
                  <td>
                      <input type="checkbox" name="ids" value='<%=m_xsmsgt.id %>' /></td>
                  <td>
                      <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %></td>
                  <td class="C_olumn id" title="<%=m_xsmsgt.id%>">
                      <%=m_xsmsgt.id.JSubString(30)%></td>
                  <td class="C_olumn MT_UniqueID" title="<%=m_xsmsgt.MT_UniqueID%>">
                      <%=m_xsmsgt.MT_UniqueID%></td>
                  <td class="C_olumn MT_Remark" title="<%=m_xsmsgt.MT_Remark%>">
                      <%=m_xsmsgt.MT_Remark.JSubString(30)%></td>
                  <td class="C_olumn MT_IsHtml" title="<%=m_xsmsgt.MT_IsHtml%>">
                      <%=HtmlStrings.HtmlImgTrueAndFalse(m_xsmsgt.MT_IsHtml)%></td>
                  <%-- <td class="C_olumn MT_Detail" title="<%=m_xsmsgt.MT_Detail%>">
                <%=m_xsmsgt.MT_Detail.JSubString(30)%></td>--%>
                  <td class="C_olumn MT_TableNames" title="<%=m_xsmsgt.MT_TableNames%>">
                      <%=m_xsmsgt.MT_TableNames.JSubString(30)%></td>
                  <%--<td class="C_olumn A" title="<%=m_xsmsgt.A%>"><%=m_xsmsgt.A.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn B" title="<%=m_xsmsgt.B%>"><%=m_xsmsgt.B.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn C" title="<%=m_xsmsgt.C%>"><%=m_xsmsgt.C.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn D" title="<%=m_xsmsgt.D%>"><%=m_xsmsgt.D.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn E" title="<%=m_xsmsgt.E%>"><%=m_xsmsgt.E.JSubString(30)%></td>--%>
                  <td><a onclick='top.AddLabel("编辑信息模板表","<%=Url.Action("AEMSGTemplate", new { id = m_xsmsgt.id })%>", location.href )'>编辑</a> <a onclick='top.AddLabel("内容","<%=Url.Action("AEMSGTemplate2", new { id = m_xsmsgt.id })%>", location.href )'>内容</a> <a onclick="DeleteId('<%=m_xsmsgt.id %>')">删除</a> </td>
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
