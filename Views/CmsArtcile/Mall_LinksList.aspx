<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMall_Links")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识id"));
        myColumns.push(new Array("1", "L_Project", "所属项目(商城，社区)"));
        myColumns.push(new Array("1", "L_Type", "类型（文字、图片）"));
        myColumns.push(new Array("1", "L_Title", "标题"));
        myColumns.push(new Array("0", "L_Img", "图片"));
        myColumns.push(new Array("1", "L_Url", "链接地址"));
        myColumns.push(new Array("1", "L_IsTarget", "是否新窗口打开"));
        myColumns.push(new Array("1", "L_Rermark", "备注"));
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
                    友情链接列表</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Mall_Links> _Pager = (Pager<Mall_Links>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>
                所属项目:&nbsp;
                <%=DealMvc.Enum.EnumCommon.EnumToSD("L_Project", typeof(DealMvc.Enum.BaseEnum.Source), "", "", "==请选择==")%>
                &nbsp;
                类型:&nbsp;
                <%=DealMvc.Enum.EnumCommon.EnumToSD("L_Type", typeof(DealMvc.Enum.LinksEnum.L_Type), "", "", "==请选择==")%>
                &nbsp;
                标题:&nbsp;
                <input type="text" name="L_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <td colspan="18">
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
            <th class="C_olumn L_Project">
                所属项目(商城，社区)
            </th>
            <th class="C_olumn L_Type">
                类型（文字、图片）
            </th>
            <th class="C_olumn L_Title">
                标题
            </th>
            <th class="C_olumn L_Img">
                图片
            </th>
            <th class="C_olumn L_Url">
                链接地址
            </th>
            <th class="C_olumn L_IsTarget">
                是否新窗口打开
            </th>
            <th class="C_olumn L_Rermark">
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
        <%int i = 0; foreach (Mall_Links m_ml in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_ml.id %>'>
                  <td>
                      <input type="checkbox" name="ids" value='<%=m_ml.id %>' />
                  </td>
                  <td>
                      <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %>
                  </td>
                  <td class="C_olumn id" title="<%=m_ml.id.JHtmlEncode()%>">
                      <%=m_ml.id.JSubString(30)%>
                  </td>
                  <td class="C_olumn L_Project" title="<%=m_ml.L_Project.JHtmlEncode()%>">
                      <%=(DealMvc.Enum.BaseEnum.Source)m_ml.L_Project%>
                  </td>
                  <td class="C_olumn L_Type" title="<%=m_ml.L_Type.JHtmlEncode()%>">
                      <%=(DealMvc.Enum.LinksEnum.L_Type)m_ml.L_Type%>
                  </td>
                  <td class="C_olumn L_Title" title="<%=m_ml.L_Title.JHtmlEncode()%>">
                      <%=m_ml.L_Title.JSubString(30)%>
                  </td>
                  <td class="C_olumn L_Img" title="<%=m_ml.L_Img.JHtmlEncode()%>">
                      <%=m_ml.L_Img.JSubString(30)%>
                  </td>
                  <td class="C_olumn L_Url" title="<%=m_ml.L_Url.JHtmlEncode()%>">
                      <%=m_ml.L_Url.JSubString(30)%>
                  </td>
                  <td class="C_olumn L_IsTarget" title="<%=m_ml.L_IsTarget.JHtmlEncode()%>">
                      <%=m_ml.L_IsTarget.ToBoolIco()%>
                  </td>
                  <td class="C_olumn L_Rermark" title="<%=m_ml.L_Rermark.JHtmlEncode()%>">
                      <%=m_ml.L_Rermark.JSubString(30)%>
                  </td>
                  <td class="C_olumn OrderNum" title="<%=m_ml.OrderNum.JHtmlEncode()%>">
                      <%=m_ml.OrderNum.JSubString(30)%>
                  </td>
                  <td class="C_olumn UpTime" title="<%=m_ml.UpTime.JHtmlEncode()%>">
                      <%=m_ml.UpTime.JSubString(30)%>
                  </td>
                  <%--<td class="C_olumn A" title="<%=m_ml.A.JHtmlEncode()%>"><%=m_ml.A.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn B" title="<%=m_ml.B.JHtmlEncode()%>"><%=m_ml.B.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn C" title="<%=m_ml.C.JHtmlEncode()%>"><%=m_ml.C.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn D" title="<%=m_ml.D.JHtmlEncode()%>"><%=m_ml.D.JSubString(30)%></td>--%>
                  <%--<td class="C_olumn E" title="<%=m_ml.E.JHtmlEncode()%>"><%=m_ml.E.JSubString(30)%></td>--%>
                  <td>
                      <a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEMall_Links", new { id = m_ml.id })%>", location.href )'>
                          编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_ml.id %>')">删除</a>
                  </td>
              </tr>
        <%} %>
        <%if (_Pager.DataList.Count == 0)
          { %><tr>
              <td colspan="18">
                  暂时没有内容... ...
              </td>
          </tr>
        <%} %><tr>
            <td colspan="18">
                <input type="hidden" name="Page" value='<%=_Pager.PageIndex %>' /><a class="XshopCheckAll">全部选定</a>&nbsp;&nbsp;&nbsp;<a
                    class="XshopReverseCheck">反向选择</a>&nbsp;&nbsp;&nbsp;<a class="XshopDelCheck" onclick="DeleteSelectAllIds(this)">删除选中</a>
            </td>
        </tr>
    </table>
    <!--分页信息-->
    <div class="pagerhtml" style="padding-bottom: 10px;">
        <%=_Pager.PagerHTML(Page) %></div>
</asp:Content>
