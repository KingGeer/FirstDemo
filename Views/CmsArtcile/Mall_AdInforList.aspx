<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMall_AdInfor")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识id"));
        myColumns.push(new Array("1", "AdPositionsUniqueId", "广告位置唯一编号"));
        myColumns.push(new Array("1", "AI_Title", "广告语"));
        myColumns.push(new Array("1", "AI_Img", "广告图片"));
        myColumns.push(new Array("1", "AI_Href", "跳转地址"));
        myColumns.push(new Array("1", "AI_IsTaget", "是否新窗口打开"));
        myColumns.push(new Array("0", "AI_Rermark", "备注"));
        myColumns.push(new Array("1", "OrderNum", "排序号"));
        myColumns.push(new Array("0", "UpTime", "更新时间"));
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
                    广告信息列表</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Mall_AdInfor> _Pager = (Pager<Mall_AdInfor>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>
                广告位置&nbsp;
                <select name="AdPositionsUniqueId" class="Sreq">
                    <option value="">-请选择-</option>
                    <%=Mall_AdPositions.GetOptions()%>
                </select>&nbsp; 广告语&nbsp;
                <input type="text" name="AI_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <td colspan="17">
                <a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a
                    class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a>
            </td>
        </tr>
        <tr>
            <th class="editHtmlbtn" title="自定义" style="width: 30px; cursor: pointer;">
            </th>
            <th style="width: 30px;">
                编号
            </th>
            <th class="C_olumn id">
                主键--标识id
            </th>
            <th class="C_olumn AdPositionsUniqueId">
                广告位置唯一编号
            </th>
            <th class="C_olumn AI_Title">
                广告语
            </th>
            <th class="C_olumn AI_Img">
                广告图片
            </th>
            <th class="C_olumn AI_Href">
                跳转地址
            </th>
            <th class="C_olumn AI_IsTaget">
                是否新窗口打开
            </th>
            <th class="C_olumn AI_Rermark">
                备注
            </th>
            <th class="C_olumn OrderNum">
                排序号
            </th>
            <th class="C_olumn UpTime">
                更新时间
            </th>
            <%--<th class="C_olumn A">扩展A字段</th>--%>
            <%--<th class="C_olumn B">扩展B字段</th>--%>
            <%--<th class="C_olumn C">扩展C字段</th>--%>
            <%--<th class="C_olumn D">扩展D字段</th>--%>
            <%--<th class="C_olumn E">扩展E字段</th>--%>
            <th style="width: 100px;">
                操作
            </th>
        </tr>
        <%int i = 0; foreach (Mall_AdInfor m_mai in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_mai.id %>'>
                  <td>
                      <input type="checkbox" name="ids" value='<%=m_mai.id %>' />
                  </td>
                  <td>
                      <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %>
                  </td>
                  <td class="C_olumn id" title="<%=m_mai.id.JHtmlEncode()%>">
                      <%=m_mai.id.JSubString(30)%>
                  </td>
                  <td class="C_olumn AdPositionsUniqueId" title="<%=m_mai.AdPositionsUniqueId.JHtmlEncode()%>">
                      <%=m_mai.AdPositionsUniqueId.JSubString(30)%>
                  </td>
                  <td class="C_olumn AI_Title" title="<%=m_mai.AI_Title.JHtmlEncode()%>">
                      <%=m_mai.AI_Title.JSubString(30)%>
                  </td>
                  <td class="C_olumn AI_Img" title="<%=m_mai.AI_Img.JHtmlEncode()%>">
                      <%=HtmlStrings.ImgNone( m_mai.AI_Img,240,240)%>
                  </td>
                  <td class="C_olumn AI_Href" title="<%=m_mai.AI_Href.JHtmlEncode()%>">
                      <%=m_mai.AI_Href.ToString2()%>
                  </td>
                  <td class="C_olumn AI_IsTaget" title="<%=m_mai.AI_IsTaget.JHtmlEncode()%>">
                      <%=m_mai.AI_IsTaget.ToBoolIco()%>
                  </td>
                  <td class="C_olumn AI_Rermark" title="<%=m_mai.AI_Rermark.JHtmlEncode()%>">
                      <%=m_mai.AI_Rermark.JSubString(30)%>
                  </td>
                  <td class="C_olumn OrderNum" title="<%=m_mai.OrderNum.JHtmlEncode()%>">
                      <%=m_mai.OrderNum.JSubString(30)%>
                  </td>
                  <td class="C_olumn UpTime" title="<%=m_mai.UpTime.JHtmlEncode()%>">
                      <%=m_mai.UpTime.JSubString(30)%>
                  </td>
                  <%--<td class="C_olumn A" title="<%=m_mai.A.JHtmlEncode()%>"><%=m_mai.A.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn B" title="<%=m_mai.B.JHtmlEncode()%>"><%=m_mai.B.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn C" title="<%=m_mai.C.JHtmlEncode()%>"><%=m_mai.C.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn D" title="<%=m_mai.D.JHtmlEncode()%>"><%=m_mai.D.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn E" title="<%=m_mai.E.JHtmlEncode()%>"><%=m_mai.E.JSubString(30)%></td>--%>
                  <td>
                      <a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEMall_AdInfor", new { id = m_mai.id })%>", location.href )'>
                          编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_mai.id %>')">删除</a>
                  </td>
              </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="17">
                  暂时没有内容... ...
              </td>
          </tr>
        <%} %><tr>
            <td colspan="17">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a
                    class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a>
            </td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
