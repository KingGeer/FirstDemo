<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<script type="text/javascript">

    function ChangePagerAHref()
    {
        var vals = new Array();
        $(".editHTML").find("input").each(function ()
        {
            if ($(this).prop("checked").toString().toLowerCase() == "true") vals.push($(this).val());
        });

        $(".pagerhtml > span > a").each(function ()
        {
            var MnewUrl = $(this).attr("href");
            if (MnewUrl == null || MnewUrl == "#" || MnewUrl == undefined || MnewUrl.toLowerCase() == "javascript:void(0)") { return true; }
            var UUrl = new QueryString(MnewUrl);
            var newA = new Array();
            for (var u = 0; u < UUrl.length; u++)
            {
                if (UUrl[u][0].toString().toLowerCase() != ColumnUrl.toLowerCase())
                { newA.push(UUrl[u][0] + "=" + UUrl[u][1]); }
            }
            newA.push(ColumnUrl + "=" + vals.join("^"));
            MnewUrl = MnewUrl.substr(0, MnewUrl.indexOf("?"));
            var NewCan = "";
            if (newA.length > 0) { NewCan = "?" + newA.join("&"); }
            $(this).attr("href", MnewUrl + NewCan);
        });
        SaveValueToHidden(vals.join("^"));
    }
    function SaveValueToHidden(values)
    {
        $("form").each(function ()
        {
            if ($(this).find(":hidden[name='" + ColumnUrl + "']").length > 0)
            {
                if (values != "^^")
                    $(this).find(":hidden[name='" + ColumnUrl + "']").val(values);
            }
            else
            {
                if (values != "^^")
                    $(this).append("<input type='hidden' name='" + ColumnUrl + "' value='" + values + "' />");
            }
        });
    }
    function SetIIframeHeight()
    {
        $("iframe").each(function (i, v) { try { SetWinHeight($(this)[0]); } catch (e) { } });
    }


    $(function ()
    {
        $("a").each(function ()
        {
            if ($(this).attr("href") == "#" || $(this).attr("href") == null || $(this).attr("href") == undefined)
            { $(this).attr("href", "javascript:void(0)"); }
            $(this).css("cursor", "pointer");
        });

        $(".table1").parent().css("textAlign", "center");

        $(".table1").width("98%");
        $(".table1").css("margin", "10px auto");
        $(".table1").find("th").css("backgroundColor", "#0097dc");

        $(".table1").find("th").each(function (i, v)
        {
            if ($(this).html().replace(/(^\s*)|(\s*$)/g, "") == "") { $(this).html("&nbsp;"); }
        });

        $(".table1").find("th").css("padding", "6px 5px");
        $(".table1").find("td").css("padding", "3px 5px");
        $(".table1").find("td,th").each(function (i, v)
        {
            if ($(this).attr("align") != "right") $(this).attr("align", "left");
        });
        $(".table1").find(":text").height("20px");
        $(".table1").find(":text").not($(".noJ")).width("280px"); //引用noJ可以自定义width

        setInterval("SetIIframeHeight()", 1000);
        //setTimeout("SetIIframeHeight()", 1000);
        $(".table1 tr").hover(function ()
        {
            $(this).addClass("hover");
        }, function ()
        {
            $(this).removeClass("hover");
        });
    });
    //<%
    //string ColumnUrl = "ColumnsCan";
    //%>
    var RequestC = "^" + '<%=Request["ColumnsCan"]%>' + "^";
    var ColumnUrl = 'ColumnsCan';
    var myColumns = new Array();
    $(function ()
    {
        SaveValueToHidden(RequestC);

        var Len = $(".table1").find("tr > th").length;
        $(".table1").find(".C_olumn").hide();
        var HTML = "<ul>";
        for (var q = 0; q < myColumns.length; q++)
        {
            var id = "CHE" + q;
            var che = "";
            if ((myColumns[q][0] == "1" && RequestC == "^^") || RequestC.toLowerCase().indexOf("^" + myColumns[q][1].toLowerCase() + "^") >= 0)
            {
                $(".table1").find("." + myColumns[q][1]).show();
                che = "checked='checked'";
            }
            HTML += "<li class='fl' title='" + myColumns[q][2] + "'><input id='" + id + "' name='Columns' type='checkbox' value='" + myColumns[q][1] + "' " + che + " /><label for='" + id + "'>" + myColumns[q][2] + "</label></li>";
        }
        HTML += "</ul>";
        HTML += "<div class='cb'></div>";
        $(".editHTML").html("<div style='line-height:24px;'><span class='defaultVal'>还原默认值</span> <span class='fanVal'>反选</span> <span class='allOrNotVal' title='全部选中'>全部</span></div>" + HTML);

        $(".editHTML").find("input").each(function (i, v)
        {
            $(v).click(function ()
            {
                var val = $(this).val();
                if ($(this).prop("checked").toString().toLowerCase() == "true")
                    $(".table1").find("." + val).show();
                else
                    $(".table1").find("." + val).hide();
                ChangePagerAHref();
            });
        });
        $(".editHtmlbtn").toggle(function () { $(".editHTML").slideDown(); }, function () { $(".editHTML").slideUp(); });
        $(".editHTML .defaultVal").click(function ()
        {
            for (var q = 0; q < myColumns.length; q++)
            {
                var id = "CHE" + q;
                var IsC = false;
                if (myColumns[q][0] == "1") { IsC = true; }
                $(".editHTML").find("#" + id).prop("checked", IsC);
                if (IsC)
                    $(".table1").find("." + $(".editHTML").find("#" + id).val()).show();
                else
                    $(".table1").find("." + $(".editHTML").find("#" + id).val()).hide();
            }
            ChangePagerAHref();
        });
        $(".editHTML .fanVal").click(function ()
        {
            $(".editHTML ul :checkbox").each(function ()
            {
                if ($(this).prop("checked").toString().toLowerCase() == "true")
                {
                    $(this).prop("checked", false);
                    $(".table1").find("." + $(this).val()).hide();
                }
                else
                {
                    $(this).prop("checked", true);
                    $(".table1").find("." + $(this).val()).show();
                }
            });
            ChangePagerAHref();
        });
        $(".editHTML .allOrNotVal").click(function ()
        {
            var isS = true;
            if ($(this).attr("title") != "全部选中")
            { isS = false; $(this).attr("title", "全部选中"); }
            else { $(this).attr("title", "全部取消"); }
            $(".editHTML ul :checkbox").each(function ()
            {
                if (isS)
                { $(this).prop("checked", true); $(".table1").find("." + $(this).val()).show(); }
                else { $(this).prop("checked", false); $(".table1").find("." + $(this).val()).hide(); }
            });
            ChangePagerAHref();
        });

        $(".pagerhtml").css("paddingBottom", parseInt($(".pagerhtml").css("paddingBottom")) + $(".editHTML").height() + $(".pagerhtml").height() + 50);
        $(".peditHTML").css("background", "#DDF0FD").css("width", "98%").css("margin", "8px auto 0 auto").css("textAlign", "center");
        $(".editHTML").css("padding", "10px").css("overflow", "hidden").css("display", "none").css("textAlign", "left");
        $(".editHTML").find("li").css("padding", "0 10px;").width(120).height(20).css("textAlign", "left").css("overflow", "hidden").css("cursor", "default");
        $(".editHTML .defaultVal,.fanVal,.allOrNotVal").css("cursor", "pointer");

        ChangePagerAHref();
        $(".table1").show();
    });

    //<select class='Tab'></select>
    $(function ()
    {
        setTimeout(function ()
        {
            $("select.Tab").each(function (i, v)
            {
                var selectObj = $(v);
                var selectName = $(v).attr("name");
                var selectVal = $(v).val();

                var TabName = selectName + "_Tab";
                var Sresult = "<div class='" + TabName + "' style='padding:6px 0 24px 0;'>";
                $(v).find("option").each(function (ii, vv)
                {
                    var value = $(vv).attr("value");
                    var text = $(vv).text();
                    var Sn = selectVal == value ? "n" : "";
                    Sresult += "<span class='Tab_span CP " + Sn + "' val='" + value + "'>" + text + "</span>";
                });
                Sresult += "</div>";
                $(v).after(Sresult);

                $("." + TabName + " .Tab_span").each(function (u, q)
                {
                    $(q).click(function ()
                    {
                        var Nval = $(this).attr("val");
                        $(selectObj).val(Nval);
                        $(selectObj).parents("form").submit();
                    });
                });
            });
        }, 30);
    });

    //<select class='Search'></select>
    $(function ()
    {
        function selectSearch_tostring(val)
        {
            if (val == null || val == undefined)
                return "";
            else
                return val.toString();
        }
        function selectSearch_CheckValsHTML(val, text)
        {
            return "<span style='background: rgb(255, 102, 51);border-radius: 10px; color:#FFF; cursor:pointer; float:left; padding:3px 4px; margin-right:15px;margin-bottom:10px;' val='" + val + "'>" + text + " <a style='color:#FFF;' class='CheckVals_Close'>×</a></span>";
        }
        function selectSearch_DaiValsHTML(val, text)
        {
            return "<span class='selectSearchBtn_Dig_valone' style='background: rgb(0, 102, 153);border-radius: 10px; color:#FFF; cursor:pointer; float:left; padding:3px 4px; margin-right:15px;margin-bottom:10px;' val='" + val + "'>" + text + "</span>";
        }
        setTimeout(function ()
        {

            $(".selectSearchBtn").live("click", function ()
            {
                var sign = $(this).attr("sign");

                var selectObj = $(this).parent().next();
                var selectName = $(selectObj).attr("name");

                var selectSearchBtn_Dig;
                if ($(this).attr("HH") == undefined)
                {
                    selectSearchBtn_Dig = $(this).parent().find(".selectSearchBtn_Dig");
                    var HH = "";
                    try
                    {
                        HH = $(selectSearchBtn_Dig)[0].outerHTML;
                    } catch (e) { }
                    $(this).attr("HH", HH);
                }
                else
                {
                    $(".selectSearchBtn_Dig[sign='" + sign + "']").remove();
                    var HH = $(this).attr("HH");
                    $(this).parent().append(HH);
                    selectSearchBtn_Dig = $(this).parent().find(".selectSearchBtn_Dig");
                }

                var CheckValsHTML = "";
                for (var i = 0; i < $(selectObj)[0].options.length; i++)
                {
                    if ($(selectObj)[0].options[i].value == 0) continue;
                    if ($(selectObj)[0].options[i].selected)
                        CheckValsHTML += selectSearch_CheckValsHTML($(selectObj)[0].options[i].value, $(selectObj)[0].options[i].text);
                }
                $(selectSearchBtn_Dig).find(".CheckVals").html(CheckValsHTML);

                if (selectObj.attr("url") == undefined)
                {
                    var DaiValsHTML = "";
                    for (var i = 0; i < $(selectObj)[0].options.length; i++)
                    {
                        if ($(selectObj)[0].options[i].value == 0) continue;
                        DaiValsHTML += selectSearch_DaiValsHTML($(selectObj)[0].options[i].value, $(selectObj)[0].options[i].text);
                    }
                    $(selectSearchBtn_Dig).find(".DaiVals").html(DaiValsHTML);
                }

                Dialog(selectSearchBtn_Dig, "筛 选", function ()
                {
                    var _selectSearchBtn_Dig = $(".selectSearchBtn_Dig[sign='" + sign + "']");
                    var _selectObj = $("select[sign='" + sign + "']");

                    if (_selectObj.attr("url") == undefined)
                    {
                        for (var u = 0; u < $(_selectObj)[0].options.length; u++)
                        {
                            $(_selectObj)[0].options[u].selected = "";
                        }
                        $(_selectSearchBtn_Dig).find(".CheckVals > span").each(function (ii, vv)
                        {
                            var val = $(vv).attr("val");
                            var text = $(vv).text();

                            for (var u = 0; u < $(_selectObj)[0].options.length; u++)
                            {
                                if ($(_selectObj)[0].options[u].value == val)
                                {
                                    $(_selectObj)[0].options[u].selected = true;
                                }
                            }
                        });
                    }
                    else
                    {
                        for (var u = $(_selectObj)[0].options.length - 1; u >= 0; u--)
                        {
                            if ($(_selectObj)[0].options[u].getAttribute("old") == "true")
                            { $(_selectObj)[0].options[u].selected = ""; }
                            else
                            { $(_selectObj)[0].options[u] = null; }
                        }
                        $(_selectSearchBtn_Dig).find(".CheckVals > span").each(function (ii, vv)
                        {
                            var val = $(vv).attr("val");
                            var text = $(vv).text().replace($(vv).find("a").text(), "");
                            var varOption = new Option(text, val);
                            varOption.setAttribute("selected", "selected");
                            $(_selectObj)[0].options.add(varOption);
                        });
                    }

                    $(_selectObj).change().blur();

                    return true;
                }, true);
                if (selectObj.attr("url") != undefined)
                {
                    $(selectSearchBtn_Dig).find(".DaiSBtn").click();
                }
            });

            $(".selectSearchBtn_Dig .DaiSBtn").live("click", function ()
            {
                var searchText = $.trim($(this).prev().val()).toString();

                var selectObj = $("select[sign='" + $(this).attr("sign") + "']");
                var selectSearchBtn_Dig = $(this).parent().parent().parent();

                var DaiValsHTML = "";
                if (selectObj.attr("url") == undefined)
                {
                    for (var i = 0; i < $(selectObj)[0].options.length; i++)
                    {
                        if ($(selectObj)[0].options[i].value == 0) continue;
                        if ($(selectObj)[0].options[i].text.indexOf(searchText) >= 0 || searchText.length == 0)
                            DaiValsHTML += selectSearch_DaiValsHTML($(selectObj)[0].options[i].value, $(selectObj)[0].options[i].text);
                    }
                    $(selectSearchBtn_Dig).find(".DaiVals").html(DaiValsHTML);
                }
                else
                {
                    $(selectSearchBtn_Dig).find(".DaiVals").html("数据加载中...");
                    $.ajax({
                        url: selectObj.attr("url"),
                        data: { key: searchText },
                        type: 'post',
                        datatype: 'json',
                        success: function (json)
                        {
                            if (json.length < 1)
                            {
                                $(selectSearchBtn_Dig).find(".DaiVals").html("没有搜索出任何数据，请更换关键词再次搜索");
                            }
                            else
                            {
                                for (var i in json)
                                {
                                    DaiValsHTML += selectSearch_DaiValsHTML(json[i].id, json[i].text);
                                }
                                $(selectSearchBtn_Dig).find(".DaiVals").html(DaiValsHTML);
                            }
                        }
                    });
                }

            });

            $(".selectSearchBtn_Dig_valone").live("click", function ()
            {
                var val = $(this).attr("val");
                var text = $(this).text();

                var sign = $(this).parent().parent().parent().attr("sign");
                var _selectObj = $("select[sign='" + sign + "']");

                var selectSearchBtn_Dig = $(this).parent().parent().parent();

                if ($(_selectObj).prop("multiple") != true)
                {
                    //只支持单选
                    $(selectSearchBtn_Dig).find(".CheckVals").html("");
                }

                if ($(selectSearchBtn_Dig).find(".CheckVals > span[val='" + val + "']").length > 0)
                {
                    alert("该项已经存在");
                }
                else
                {
                    $(selectSearchBtn_Dig).find(".CheckVals").append(selectSearch_CheckValsHTML(val, text));
                }
            });

            $(".CheckVals_Close").live("click", function ()
            {
                var sign = $(this).parent().parent().parent().parent().attr("sign");
                var _selectObj = $("select[sign='" + sign + "']");
                if ($(_selectObj).prop("multiple") != true && $(_selectObj).hasClass("Sreq"))
                {
                    alert("至少需要选择一项");
                }
                else
                    $(this).parent().remove();
            });

            $("select.Search").each(function (i, v)
            {
                var select_sign = Date.parse(new Date()) + "_" + i;

                var selectObj = $(v);
                $(selectObj).attr("sign", select_sign)

                var __BtnWidth = parseInt($(selectObj).width()) < 60 ? 60 : parseInt($(selectObj).width());

                $(selectObj).before("<div>" +
                                        "<input type='button' class='selectSearchBtn' sign='" + select_sign + "'  style='width:" + __BtnWidth + "px;' value='筛 选' />" +
                                        "<div class='selectSearchBtn_Dig' sign='" + select_sign + "' style='display:none;width:600px;height:400px;'>" +
                                            "<div style='padding-bottom:20px; padding-top:10px;'>" +
                                                "<div style='font-size:14px;color:#000;font-weight:700; padding-bottom:5px;padding-left:12px;'>已选中的项</div>" +
                                                "<div class='CheckVals' style='color:#666; padding-left:12px;'></div>" +
                                            "</div>" +
                                            "<div style='padding-bottom:20px; padding-top:10px;clear:both;'>" +
                                                "<div style='font-size:14px;color:#000;font-weight:700; padding-bottom:5px;padding-left:12px;'>请从中选择相应的项</div>" +
                                                "<div style='padding-bottom:10px; padding-left:12px;'><input style='width:529px;' type='text' class='DaiSText' value='' placeholder='请输入关键词进行筛选或搜索' /><input sign='" + select_sign + "' type='button' class='DaiSBtn' value='搜 索' /></div>" +
                                                "<div class='DaiVals'  style='color:#666; padding-left:12px ;height: 275px; overflow: auto;'></div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>");
            });

            //初始ajax值
            $("select.Search").each(function (i, v)
            {
                var selectObj = $(v);
                if (selectObj.attr("url") == undefined) { return true; };
                var _Search_name = $(selectObj).attr("name");
                for (var i = 0; i < myValues.length; i++)
                {
                    var key = myValues[i][0]; var value = myValues[i][1];
                    if (key == _Search_name)
                    {
                        $.ajax({
                            url: selectObj.attr("url"),
                            data: { id: value },
                            type: 'post',
                            datatype: 'json',
                            success: function (json)
                            {
                                if (json.text == "" || json.id == "")
                                { }
                                else
                                {
                                    var varOption = new Option(json.text, json.id);
                                    varOption.setAttribute("selected", "selected");
                                    $(selectObj)[0].options.add(varOption);
                                }
                            }
                        });
                    }
                }
            });
        }, 30);
    });
    
</script>
