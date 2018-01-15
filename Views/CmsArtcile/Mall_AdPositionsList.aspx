<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSite.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        DeleteUrl = '<%=Url.Action("DeleteMall_AdPositions")%>'; 
    </script>
    <script>
        myColumns.push(new Array("0", "id", "主键--标识id"));
        myColumns.push(new Array("1", "UniqueId", "广告位置唯一编号"));
        myColumns.push(new Array("1", "AP_Title", "广告位置名称"));
        myColumns.push(new Array("1", "AP_Width", "图片宽度"));
        myColumns.push(new Array("1", "AP_Height", "图片高度"));
        myColumns.push(new Array("1", "AP_ImgCount", "图片数量"));
        myColumns.push(new Array("1", "AP_Remark", "备注"));
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
                    广告位置列表</div>
            </td>
        </tr>
    </table>
    <!--搜索信息-->
    <% Pager<Mall_AdPositions> _Pager = (Pager<Mall_AdPositions>)ViewData["Pager"]; %>
    <form>
    <table class="table1" style="">
        <tr>
            <td>
                唯一编号&nbsp;
                <input type="text" name="UniqueId" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
                位置名称&nbsp;
                <input type="text" name="AP_Title" value='' class='noJ w180px Ber' maxlength='50' />&nbsp;
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
            <th class="C_olumn UniqueId">
                广告位置唯一编号
            </th>
            <th class="C_olumn AP_Title">
                广告位置名称
            </th>
            <th class="C_olumn AP_Width">
                图片宽度
            </th>
            <th class="C_olumn AP_Height">
                图片高度
            </th>
            <th class="C_olumn AP_ImgCount">
                图片数量
            </th>
            <th class="C_olumn AP_Remark">
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
        <%int i = 0; foreach (Mall_AdPositions m_map in _Pager.DataList)
          {
              i++;%><tr cid='<%=m_map.id %>'>
            <td>
                <input type="checkbox" name="ids" value='<%=m_map.id %>' />
            </td>
            <td>
                <%=(_Pager.PageIndex-1)*_Pager.PageSize + i %>
            </td>
            <td class="C_olumn id" title="<%=m_map.id.JHtmlEncode()%>">
                <%=m_map.id.JSubString(30)%>
            </td>
            <td class="C_olumn UniqueId" title="<%=m_map.UniqueId.JHtmlEncode()%>">
                <%=m_map.UniqueId%>
            </td>
            <td class="C_olumn AP_Title" title="<%=m_map.AP_Title.JHtmlEncode()%>">
                <%=m_map.AP_Title.JSubString(30)%>
            </td>
            <td class="C_olumn AP_Width" title="<%=m_map.AP_Width.JHtmlEncode()%>">
                <%=m_map.AP_Width.JSubString(30)%>
            </td>
            <td class="C_olumn AP_Height" title="<%=m_map.AP_Height.JHtmlEncode()%>">
                <%=m_map.AP_Height.JSubString(30)%>
            </td>
            <td class="C_olumn AP_ImgCount" title="<%=m_map.AP_ImgCount.JHtmlEncode()%>">
                <%=m_map.AP_ImgCount.JSubString(30)%>
            </td>
            <td class="C_olumn AP_Remark" title="<%=m_map.AP_Remark.JHtmlEncode()%>">
                <%=m_map.AP_Remark.JSubString(30)%>
            </td>
            <td class="C_olumn OrderNum" title="<%=m_map.OrderNum.JHtmlEncode()%>">
                <%=m_map.OrderNum.JSubString(30)%>
            </td>
            <td class="C_olumn UpTime" title="<%=m_map.UpTime.JHtmlEncode()%>">
                <%=m_map.UpTime.JSubString(30)%>
            </td>
            <%--<td class="C_olumn A" title="<%=m_map.A.JHtmlEncode()%>"><%=m_map.A.JSubString(30)%></td>--%>
            <%--<td class="C_olumn B" title="<%=m_map.B.JHtmlEncode()%>"><%=m_map.B.JSubString(30)%></td>--%>
            <%--<td class="C_olumn C" title="<%=m_map.C.JHtmlEncode()%>"><%=m_map.C.JSubString(30)%></td>--%>
            <%--<td class="C_olumn D" title="<%=m_map.D.JHtmlEncode()%>"><%=m_map.D.JSubString(30)%></td>--%>
            <%--<td class="C_olumn E" title="<%=m_map.E.JHtmlEncode()%>"><%=m_map.E.JSubString(30)%></td>--%>
            <td>
                <a class='SmallButton' onclick='top.AddLabel("编辑信息","<%=Url.Action("AEMall_AdPositions", new { id = m_map.id })%>", location.href )'>
                    编辑/查看</a> <a class='SmallButton' onclick="DeleteId('<%=m_map.id %>')">删除</a>
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
