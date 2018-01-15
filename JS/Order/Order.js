$(function () {

    //计算运费
    //JiSuanFreght();

    /*选择物流公司*/
    $(".LogisticsCompanyCate").change(function () {
        //计算运费
        JiSuanFreght();
    });

    /*参加物流保险*/
    $(".CanWuLiuBao").click(function () {
        //订单金额
        var AlllPrice = parseFloat($(".AllSubTotal").attr("allsubtotal"));
        //参保
        if ($(this).val() == "True") {
            var baofei = parseFloat((AlllPrice * 0.03).toFixed(2));
            $(".WuLiuCanBao").attr("wuliucanbao", baofei);
            $(".WuLiuCanBao").text(baofei);
        }
        else {
            $(".WuLiuCanBao").attr("wuliucanbao", 0);
            $(".WuLiuCanBao").text("0");
        }

        JiSuanAllPrice(); //计算价格
    });

    /*
    点击使用优惠劵
    */
    $(".UseYHQ").click(function () {

        //优惠劵号码
        var YHQNumber = "";
        //优惠劵抵扣金额
        var YHQMoney = 0;

        var css_UseYHQ_Obj = {
            'background': 'none repeat scroll 0 0 #ff9900',
            'border': '0px',
            'cursor': 'pointer',
            'width': '66px',
            'height': '43px',
            'margin-top': '6px'
        };

        Dialog($(".YHQDiv"), "请选择您拥有的优惠劵", function () {
            var this_ck_obj = $(".yhq_one:checked");
            if (this_ck_obj.length == 0) {
                YHQNumber = "";
                YHQMoney = 0;
                $(".CounponNum").val("");
                $(".YHQMoney").text("");
            } else {
                $(".yhq_one:checked").each(function () {
                    var yhq_num = $(this).attr("cid");
                    YHQNumber = YHQNumber + yhq_num + ",";
                    var yhq_money = $(this).attr("cm");
                    YHQMoney = parseFloat(parseFloat(YHQMoney) + parseFloat(yhq_money)).toFixed(2);
                });


                //alert(YHQNumber);

                $(".CounponNum").val(YHQNumber);
                $(".YHQMoney").attr("YHQMoney", YHQMoney)
                $(".YHQMoney").text(YHQMoney);
            }
            DialogHide();

            JiSuanAllPrice(); //使用优惠劵重新计算

        }, true);

        //提交获取优惠劵
        $.ajax({
            url: "/Order/GetCouponList",
            data: { AllPrices: parseFloat($(".AllSubTotal").attr("allsubtotal")), r: new Date().getTime() },
            type: 'POST',
            async: false,
            success: function (result) {

                var Json = result;
                if (Json != null && Json.length > 0) {
                    var output = "";
                    for (var i = 0; i < Json.length; i++) {
                        output += "<div class='xuanxiang CP' style='line-height:22px;'><lable><input type='checkbox' manzujine='" + Json[i].ManZuMoney + "' cm='" + Json[i].CouponMoney + "' cid='" + Json[i].NumBer + "' class='yhq_one' style='line-height:22px; padding:0 4px;' name='yhq_one'/> <span>" + Json[i].Name + "&nbsp;&nbsp;" + Json[i].CouponMoney + "元现金劵（单笔金额满" + Json[i].ManZuMoney + "元可使用）&nbsp;&nbsp;过期时间:" + Json[i].GuoQiTime + "</span></lable></div>";
                    }
                    $(".YHQDiv").html("<div style='padding:7px 0 0 7px;'>" + output + "</div>");
                }
                else {
                    $(".YHQDiv").html("<div style='text-align:center;'>您没有符合条件的优惠券</div>");
                }
            }
        });
        //$(".Dialog .DTitle a").css({ 'background': 'none' });
        $(".Dialog").css({ 'border': '1px solid #EDDDA5' });
    });

    ////////////选择优惠劵执行事件/////////////////
    $("[name=yhq_one]").live("click", function () {

        var ALLYHQPrice = 0;

        //获取总价格
        var AllPrice = parseFloat($(".AllSubTotal").attr("allsubtotal"));

        var this_ck_obj = $(".yhq_one:checked");
        //alert(this_ck_obj.length);
        if (this_ck_obj.length == 0) {
            ALLYHQPrice = 0;
        } else {
            $(".yhq_one:checked").each(function () {
                var yhq_money = $(this).attr("manzujine");
                ALLYHQPrice = parseFloat(parseFloat(ALLYHQPrice) + parseFloat(yhq_money)).toFixed(2);
                if (ALLYHQPrice >= AllPrice) {
                    $(this).removeAttr("checked");
                    return false;
                }
            });
        }
    });

    /*
    发票信息
    */
    $("[name=IsInvoices]").change(function () {
        if ($(this).val() == "True") {
            $(".InvoicesLisShow").show();
        } else {
            $(".InvoicesLisShow").hide();
        }
    });

    /*
    提交订单
    */
    $(".SubmitOrder").click(function () {
        $(this).css("background", "none repeat scroll 0 0 #ccc");
        $(this).css("width", "170px");
        $(this).html("正在转向订单，请稍后...");

        $(".OrderFormSubmit").submit();
        $(".SubmitOrder").removeClass("SubmitOrder");
    });


    /*
    收货地址
    */
    new PCAS("DA_Province", "DA_City", "DA_Area");

    //添加地址
    $(".addAdressClick").click(function () {

        $("[name=DA_Id]").val("");
        $("[name=DA_Name]").val("");
        $("[name=DA_Province]").val("");
        $("[name=DA_City]").val("");
        $("[name=DA_Area]").val("");
        $("[name=DA_StreetAddress]").val("");
        $("[name=DA_PostCode]").val("");
        $("[name=DA_Email]").val("");
        $("[name=DA_MobileNumber]").val("");
        $("[name=DA_LandlineNumber]").val("");

        //
        if ($(this).attr("isadd") == "true") {
            $(".AdressDetail").show();
            $(this).attr("isadd", "false");
        } else {
            $(".AdressDetail").hide();
            $(this).attr("isadd", "true");
        }
    });

    /*
    编辑地址 --赋值
    */
    $(".cartAddress .MemberAdrssUpdate").click(function () {
        //展示地址编辑框
        $(".AdressDetail").show();

        var AddressId = $("[name=DA_Id]").val($(this).parent().parent().find(".DA_Id").val());

        $("[name=DA_Name]").val($(this).parent().parent().find(".DA_Name").val());

        //清空地址信息
        $("[name=DA_Province],[name=DA_City],[name=DA_Area]").empty();

        //赋值
        new PCAS("DA_Province", "DA_City", "DA_Area", $(this).parent().parent().find(".DA_Province").val(), $(this).parent().parent().find(".DA_City").val(), $(this).parent().parent().find(".DA_Area").val());

        $("[name=DA_StreetAddress]").val($(this).parent().parent().find(".DA_StreetAddress").val());
        $("[name=DA_PostCode]").val($(this).parent().parent().find(".DA_PostCode").val());
        $("[name=DA_Email]").val($(this).parent().parent().find(".DA_Email").val());
        $("[name=DA_MobileNumber]").val($(this).parent().parent().find(".DA_MobileNumber").val());
        $("[name=DA_LandlineNumber]").val($(this).parent().parent().find(".DA_LandlineNumber").val());
    });

    /*
    添加地址
    */
    $(".cartAddress .MemberAdressSub").click(function () {
        var AddressId = $("[name=DA_Id]").val();
        //提交更新值
        var Consignee = $("[name=DA_Name]").val();
        var SelectProvince = $("[name=DA_Province]").val();
        var SelectCity = $("[name=DA_City]").val();
        var SelectArea = $("[name=DA_Area]").val();
        var xxAddress = $("[name=DA_StreetAddress]").val();
        var PostNumber = $("[name=DA_PostCode]").val();
        var Email = $("[name=DA_Email]").val();
        var Mobile = $("[name=DA_MobileNumber]").val();
        var Tel = $("[name=DA_LandlineNumber]").val();

        if (Consignee == "") {
            $("body").showMessage("联系人不能为空");
            return;
        }
        if (SelectProvince == "" || SelectCity == "" || SelectArea == "") {
            $("body").showMessage("省，市，区 不能为空");
            return;
        }
        if (xxAddress == "") {
            $("body").showMessage("详细地址不能为空");
            return;
        }
        var reg2 = /^1[3|5|8][0-9]{9}$/;
        if (Mobile == "") {
            $("body").showMessage("手机不能为空");
            return;
        }
        if (Mobile != "" && !reg2.test(Mobile)) {
            $("body").showMessage("手机格式不正确");
            return;
        }
        var reg3 = /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/;
        if (Tel != "" && !reg3.test(Tel)) {
            $("body").showMessage("座机格式不正确");
            return;
        }
        var reg4 = /^[_\.0-9A-Za-z-]+@[0-9A-Za-z\-]+\.(com|cc|cn|tv|hk|name|mobi|net|biz|org|info|gov\.cn|com\.cn|net\.cn|org\.cn)$/;
        if (Email != "" && !reg4.test(Email)) {
            $("body").showMessage("邮箱格式不正确");
            return;
        }
        //添加
        $.ajax({
            url: "/Order/AE_Address",
            data: { id: AddressId, DA_Name: Consignee, DA_Province: SelectProvince, DA_City: SelectCity, DA_Area: SelectArea, DA_StreetAddress: xxAddress, DA_PostCode: PostNumber, DA_MobileNumber: Mobile, DA_Email: Email, DA_LandlineNumber: Tel },
            type: 'POST',
            success: function (result) {
                if (result == "1") {
                    location.href = location.href.replace("#", "");
                }
                else
                    $("body").showMessage(result);
            }
        });

    });

    /*
    删除地址
    */
    $(".cartAddress .MemberAdrssDelete").click(function () {
        if (window.confirm("确认要删除此收货地址")) {
            var AddressId = $(this).attr("madressid");
            //添加
            $.ajax({
                url: "/Order/Delete_Address",
                data: { id: AddressId },
                type: 'POST',
                success: function (result) {
                    if (result == "1") {
                        location.href = location.href.replace("#", "");
                    }
                    else
                        $("body").showMessage(result);
                }
            });
        }

    });
});



/*
收货地址点击
*/
function TrClick(obj) {
    if ($(obj).find("input[name='AddressId']").attr("checked")) {
        $(obj).find("input[name='AddressId']").attr("checked", "");
    }
    else {
        $(obj).find("input[name='AddressId']").attr("checked", "true");
    }
    //计算运费
    JiSuanFreght();
}

/*
计算价格
*/
function JiSuanAllPrice() {
    //获取总价格
    var AlllPrice = parseFloat($(".AllSubTotal").attr("allsubtotal"));

    //运费
    var Freight = parseFloat($(".Freight").attr("freight"));

    //物流参保
    var WuLiuCanBao = parseFloat($(".WuLiuCanBao").attr("wuliucanbao"));

    //优惠劵抵用金额
    var YHQPrice = parseFloat($(".YHQMoney").attr("yhqmoney"));
    //积分抵扣金额
    var IntePrice = parseFloat($(".IntegMoney").attr("integmoney"));

    //金额+运费金额+物流保险-优惠劵优惠金额
    AlllPrice = parseFloat(AlllPrice) + parseFloat(Freight) + parseFloat(WuLiuCanBao) - parseFloat(YHQPrice) - parseFloat(IntePrice);
    //alert(AlllPrice);
    //设置价格
    $(".AllSubTotal").text("￥" + parseFloat(AlllPrice).toFixed(2)); //算出商品总金额
}


/*计算运费*/
function JiSuanFreght() {
    //物流公司
    var LogisticsCompanyId = $(".LogisticsCompanyId").find("option:selected").val();
    //收货省
    var OrderDA_Prvice = $("[name=AddressId]:checked").parent().find(".DA_Province").val();
    if (LogisticsCompanyId == "" || OrderDA_Prvice == "") {
        $(".Freight").text("0.00");
        $(".Freight").attr("Freight", "0.00");
        return;
    } else {
        $.ajax({
            url: "/Order/JiSuanFreght",
            data: { LogisticsCompanyId: LogisticsCompanyId, OrderDA_Prvice: OrderDA_Prvice, AllWeight: $("[name=AllWeight]").val() },
            type: 'POST',
            success: function (result) {
                $(".Freight").text(parseFloat(result).toFixed(2));
                $(".Freight").attr("Freight", parseFloat(result).toFixed(2));
                JiSuanAllPrice(); //计算价格
            }
        });
    }
}


