/*团购*/
function GroupBuy() {
    var GB = this;
    GB.GB_MaxCount;
    GB.GB_MinCount;
    GB.GB_Price;
}

/*限时抢购*/
function CountDown() {
    var GB = this;
    GB.CD_EndDateTime;
    GB.CD_Price;
}

/*促销信息（即时秒杀 = 1, 限量抢购 = 2, 限时抢购 = 3, 满额打折 = 4, 满额免运费 = 5, 买几送几 = 6）*/
function Promotion() {
    var Prom = this;
    Prom.ProductId; //商品id
    Prom.P_Type; //促销类型 
    Prom.P_Name; //促销名称

    /*限量抢购*/
    Prom.P_TotallCount; //抢购数量
    Prom.P_SellCount; //已售出数量
    /*满额打折*/
    Prom.P_SatisfyMoney; //满足金额
    Prom.P_Discount; //折扣

    /*买及送几*/
    Prom.P_BuyCount; //购买数量
    Prom.P_GiveAwayCount; //赠送数量

    Prom.P_STime; //开始时间
    Prom.P_ETime; //结束时间

    Prom.P_Price; //促销价格
}

/*
产品规格
*/
function ProductSpecification() {
    var PS = this;
    PS.id; //主键Id
    PS.ProductUniqueId; //产品唯一号
    PS.PS_AttributeNames; //规格名称
    PS.PS_AttributeValues; //规格值
    PS.PS_Inventory; //库存
    PS.PS_Weight; //重量
    PS.PS_MarketingPrice; //市场价
    PS.PS_FixedPrice; //商城价
    PS.PS_IsDefaultSelected; //是否默认选中
    PS.PS_IsShelves; //是否商家销售
    PS.PS_ArticleCode; //是否商家销售
}

/*产品规格值*/
function ProductSpecificationNameValues() {
    var PSNV = this;
    PSNV.Name;
    PSNV.Values = new Array();
}

/*产品类别*/
function ProductClass() {
    var P = this;

    P.pStyle = 0; //正常=0 即时秒杀 = 1, 限量抢购 = 2（没有时间）, 限时抢购 = 3, 满额打折 = 4, 满额免运费 = 5, 买几送几 = 6
    P.TimeInterval; //时间执行
    P.TimeObj; //时间标签
    P.PGroupBuy = null; //团购对象
    P.PCountDown = null; //限时抢购对象

    P.Promotion = null// 促销信息对象


    P.noGG = false; //是否存在规格
    P.DefaultValues = ""; //当前选择规格值（默认规格）
    P.ProductSpecificationList = new Array(); //规格集合
    P.ProductSpecificationNameValuesList = new Array(); //规格值集合

    /*商品自身属性*/
    P.id; //主键
    P.P_UniqueID; //唯一编号
    P.P_ArticleCode; //商品货号
    P.P_InventoryCount; //库存
    P.P_MarketingPrice; //市场价
    P.P_FixedPrice; //商城价
    P.P_MaxCount; //最大购买数量
    P.P_MinCount; //最小购买数量
    P.P_Weight; //商品重量


    /*添加促销活动*/
    P.AddPromotion = function (ProductId, P_Type, P_Name, P_TotallCount, P_SellCount, P_SatisfyMoney, P_Discount, P_BuyCount, P_GiveAwayCount, P_STime, P_ETime) {
        P.Promotion = new Promotion();
        P.Promotion.ProductId = ProductId;
        P.Promotion.P_Type = P_Type;
        P.Promotion.P_Name = P_Name;
        P.Promotion.P_TotallCount = P_TotallCount;
        P.Promotion.P_SellCount = P_SellCount;
        P.Promotion.P_SatisfyMoney = P_SatisfyMoney;
        P.Promotion.P_Discount = P_Discount;
        P.Promotion.P_BuyCount = P_BuyCount;
        P.Promotion.P_GiveAwayCount = P_GiveAwayCount;
        P.Promotion.P_STime = P_STime;
        P.Promotion.P_ETime = P_ETime;
    };

    /*展示促销活动信息*/
    P.ShowPromotion = function () {
        if (P.Promotion == null) {
            return;
        }

        P.pStyle = P.Promotion.P_Type;

        //即时秒杀 = 1, 限量抢购 = 2（没有时间）, 限时抢购 = 3, 满额打折 = 4, 满额免运费 = 5, 买几送几 = 6
        switch (P.pStyle) {
            case "1": //即时秒杀
                $(".PromtionType").text(P.Promotion.P_Name);
                P.TimeInterval = setInterval(function () { P.ShowTime(); }, 1000);
                P.Promotion.P_Price = parseFloat(P.P_FixedPrice * P.Promotion.P_Discount); //促销价格
                $(".AmountSaved").text(parseFloat(P.P_MarketingPrice - parseFloat(P.P_FixedPrice * P.Promotion.P_Discount)));//为您节省
                $(".shopcar").remove();
                break;
            case "2": //限量抢购 = 2（没有时间）
                $(".PromtionType").text(P.Promotion.P_Name + "[限购" + P.Promotion.P_TotallCount + "件,已售" + P.Promotion.P_SellCount + "件]");
                P.Promotion.P_Price = parseFloat(P.P_FixedPrice * P.Promotion.P_Discount); //促销价格
                $(".AmountSaved").text(parseFloat(P.P_MarketingPrice - parseFloat(P.P_FixedPrice * P.Promotion.P_Discount))); //为您节省
                $(".shopcar").remove();
                break;
            case "3": //限时抢购
                $(".PromtionType").text(P.Promotion.P_Name);
                P.Promotion.P_Price = parseFloat(P.P_FixedPrice * P.Promotion.P_Discount); //促销价格
                P.TimeInterval = setInterval(function () { P.ShowTime(); }, 1000);
                $(".AmountSaved").text(parseFloat(P.P_MarketingPrice - parseFloat(P.P_FixedPrice * P.Promotion.P_Discount))); //为您节省
                $(".shopcar").remove();
                break;
            case "4": //满额打折
                $(".PromtionType").text(P.Promotion.P_Name + "[满" + P.Promotion.P_SatisfyMoney + "元,打" + P.Promotion.P_Discount + "]");
                P.Promotion.P_Price = parseFloat(P.P_FixedPrice * P.Promotion.P_Discount); //促销价格
                P.TimeInterval = setInterval(function () { P.ShowTime(); }, 1000);
                $(".AmountSaved").text(parseFloat(P.P_MarketingPrice - parseFloat(P.P_FixedPrice * P.Promotion.P_Discount))); //为您节省
                $(".shopcar").remove();
                break;
            case "5": //满额免运费
                $(".PromtionType").text(P.Promotion.P_Name + "[满" + P.Promotion.P_SatisfyMoney + "元免运费]");
                P.TimeInterval = setInterval(function () { P.ShowTime(); }, 1000);
                $(".shopcar").remove();
                break;
            case "6": //买几送几
                $(".PromtionType").text(P.Promotion.P_Name + "[买" + P.Promotion.P_BuyCount + "送" + P.Promotion.P_GiveAwayCount + "]");
                P.TimeInterval = setInterval(function () { P.ShowTime(); }, 1000);
                $(".shopcar").remove();
                break;
        }
    }

    /*展示距离活动，多久结束时间*/
    P.ShowTime = function () {
        //当前时间
        var nowDate = new Date().getTime();
        //开始时间
        var begDate = null;
        //结束时间
        var endDate = null;
        //结束时间
        if (P.Promotion != null) {
            begDate = new Date(Date.parse(P.Promotion.P_STime.replace(/-/g, "/")));
            endDate = new Date(Date.parse(P.Promotion.P_ETime.replace(/-/g, "/")));
        }
        else {
            return;
        }

        //剩余时间
        var remainTime = null;
        var TimeCate = null;

        if (nowDate < begDate) {
            TimeCate = "距离开始:"
            remainTime = begDate - nowDate;
        } else if (nowDate > begDate) {
            TimeCate = "距离结束:"
            remainTime = endDate.getTime() - nowDate;
        }

        var leftsecond = parseInt(remainTime / 1000);
        var v_d = Math.floor(leftsecond / (60 * 60 * 24));
        var v_h = Math.floor((leftsecond - v_d * 24 * 60 * 60) / 3600);
        var v_m = Math.floor((leftsecond - v_d * 24 * 60 * 60 - v_h * 3600) / 60);
        var v_s = Math.floor(leftsecond - v_d * 24 * 60 * 60 - v_h * 3600 - v_m * 60);

        if (v_h == 0 && v_m == 0 && v_s == 0) {
            //清空定时器
            window.clearInterval(TimeInterval);
        }
        else {
            $(".timeobj").text(TimeCate + v_d + "天" + v_h + "时" + v_m + "分" + v_s + "秒");
        }
    };

    //添加一个产品
    P.AddProduct = function (id, P_UniqueID, P_ArticleCode, P_InventoryCount, P_MarketingPrice, P_FixedPrice, P_MaxCount, P_MinCount, P_Weight) {
        P.id = id;
        P.P_UniqueID = P_UniqueID;
        P.P_ArticleCode = P_ArticleCode;
        P.P_InventoryCount = parseInt(P_InventoryCount);
        P.P_MarketingPrice = parseFloat(P_MarketingPrice);
        P.P_FixedPrice = parseFloat(P_FixedPrice);
        P.P_MaxCount = parseInt(P_MaxCount);
        P.P_MinCount = parseInt(P_MinCount);
        P.P_Weight = parseFloat(P_Weight);
    }

    //添加规格集合
    P.AddProductSpecification = function (id, ProductUniqueId, PS_AttributeNames, PS_AttributeValues, PS_Inventory, PS_Weight, PS_MarketingPrice, PS_FixedPrice, PS_IsShelves, PS_IsDefaultSelected, PS_ArticleCode) {
        var _ProductSpecification = new ProductSpecification();
        _ProductSpecification.id = id;
        _ProductSpecification.ProductUniqueId = ProductUniqueId;
        _ProductSpecification.PS_AttributeNames = PS_AttributeNames;
        _ProductSpecification.PS_AttributeValues = PS_AttributeValues;
        _ProductSpecification.PS_Inventory = PS_Inventory;
        _ProductSpecification.PS_MarketingPrice = PS_MarketingPrice;

        _ProductSpecification.PS_FixedPrice = PS_FixedPrice;
        _ProductSpecification.PS_Weight = PS_Weight;
        _ProductSpecification.PS_IsShelves = PS_IsShelves;
        _ProductSpecification.PS_IsDefaultSelected = PS_IsDefaultSelected;
        _ProductSpecification.PS_ArticleCode = PS_ArticleCode;

        if (_ProductSpecification.PS_IsDefaultSelected == "True") {
            P.DefaultValues = _ProductSpecification.PS_AttributeValues;
        }
        P.ProductSpecificationList.push(_ProductSpecification);
    };

    //创建规格名称集合
    P.CreateProductSpecificationNameValues = function () {
        if (P.ProductSpecificationList.length > 0) {
            for (var k in P.ProductSpecificationList[0].PS_AttributeNames.split(',')) {
                var _ProductSpecificationNameValues = new ProductSpecificationNameValues();
                _ProductSpecificationNameValues.Name = P.ProductSpecificationList[0].PS_AttributeNames.split(',')[k];
                P.ProductSpecificationNameValuesList.push(_ProductSpecificationNameValues);
            }
            for (var i in P.ProductSpecificationList) {
                var vals = P.ProductSpecificationList[i].PS_AttributeValues.split(',');
                if (vals.length == P.ProductSpecificationNameValuesList.length) {
                    for (var u in vals) {
                        var val = vals[u];
                        var isHas = false;
                        for (var y in P.ProductSpecificationNameValuesList[parseInt(u)].Values) {
                            if (P.ProductSpecificationNameValuesList[parseInt(u)].Values[y] == val)
                                isHas = true;
                        }
                        if (!isHas)
                            P.ProductSpecificationNameValuesList[parseInt(u)].Values.push(val);
                    }
                }
            }
        }
    };

    /*展示*/
    P.Show = function () {
        for (var i in P.ProductSpecificationNameValuesList) {
            alert(P.ProductSpecificationNameValuesList[i].Name);
            alert(P.ProductSpecificationNameValuesList[i].Values);
        }
    };

    /*存在规格则展示*/
    P.ShowGG = function () {
        if (P.ProductSpecificationList.length > 0) {
            var HTML = $(".ShowGG").html();
            var ivv = 0;
            var FocusHtml = "<div class=\"One_Value CP  focus pv_itwo_ggli ck  {is_disabled}\">{focus}<div class=\"dimg\"></div></div>";
            var BlurHtml = "<div class=\"One_Value CP pv_itwo_ggli  {is_disabled}\">{blur}<div class=\"dimg\"></div></div>";
            $(".ShowGG").html("");
            for (var i in P.ProductSpecificationNameValuesList) {
                $(".ShowGG").append(HTML);
                $(".ShowGG .ShowGGOne").last().find(".ShowGGOne_Title").text(P.ProductSpecificationNameValuesList[i].Name + "：");
                $(".ShowGG .ShowGGOne").last().find(".ShowGGOne_Values").html("");
                for (var v in P.ProductSpecificationNameValuesList[i].Values) {
                    var focus = false;
                    for (var w in P.DefaultValues.split(',')) {
                        if (P.DefaultValues.split(',')[w] == P.ProductSpecificationNameValuesList[i].Values[v]) {
                            focus = true;
                            break;
                        }
                    }
                    var NewSpan = "";
                    if (focus)
                        NewSpan = FocusHtml.replace("{focus}", P.ProductSpecificationNameValuesList[i].Values[v]);
                    else
                        NewSpan = BlurHtml.replace("{blur}", P.ProductSpecificationNameValuesList[i].Values[v]);
                    /*add */
                    var v_Inventory = P.ProductSpecificationList[v].PS_Inventory;
                    var no_Inventory = v_Inventory == 0;
                    NewSpan = NewSpan.replace("{is_disabled}", no_Inventory ? "disabled" : "").replace("One_Value", no_Inventory ? "" : "One_Value");
                    /*add */
                    $(".ShowGG .ShowGGOne").last().find(".ShowGGOne_Values").append(NewSpan);
                }
            }
        } else
        { $(".ShowGG ").hide(); $(".ShowGGLI").hide(); P.noGG = true; }
    };

    /*展示规格值*/
    P.ShowGGValues = function () {
        if (P.ProductSpecificationList.length > 0) {
            var hasgg = false; var ir_ss = 0;
            for (var i in P.ProductSpecificationList) {
                if (P.ProductSpecificationList[i].PS_AttributeValues == P.DefaultValues) {
                    $(".GGValue .GGValue_ArticleCode").text(P.ProductSpecificationList[i].PS_ArticleCode);
                    $(".GGValue_Inventory_Product").text(P.ProductSpecificationList[i].PS_Inventory);
                    if (P.ProductSpecificationList[i].PS_Inventory == 0) {
                        $(".BuyCount").val("0");
                    } else {
                        $(".BuyCount").val(P.P_MinCount);
                    }

                    $(".GGValue .GGValue_Weight").text(P.ProductSpecificationList[i].PS_Weight);
                    $(".GGValue .GGValue_MarketingPrice").text(P.ProductSpecificationList[i].PS_MarketingPrice);
                    $(".GGValue .GGValue_FixedPrice").text(P.ProductSpecificationList[i].PS_FixedPrice);

                    P.SetP_FixedPrice(P.ProductSpecificationList[i].PS_FixedPrice);
                    $(".NowGG").text(P.DefaultValues);
                    hasgg = true;
                    break;
                }
            }
            if (!hasgg) {
                $(".GGValue .GGValue_ArticleCode").text("不可用");
                $(".GGValue_Inventory_Product").text("不可用");
                $(".GGValue .GGValue_Weight").text("不可用");

                $(".GGValue .GGValue_MarketingPrice").text("不可用");
                $(".GGValue .GGValue_MarketingPrice").text("不可用");
                $(".NowGG").text("无此规格的商品");
            }
        }
        else {
            $(".GGValue .GGValue_ArticleCode").text(P.P_ArticleCode);
            $(".GGValue_Inventory_Product").text(P.P_InventoryCount);
            $(".GGValue .GGValue_Weight").text(P.P_Weight);
            $(".GGValue .GGValue_MarketingPrice").text(P.P_MarketingPrice);
            $(".GGValue .GGValue_FixedPrice").text(P.P_FixedPrice);
            //
            P.SetP_FixedPrice(P.P_FixedPrice);

            $(".NowGG").parent().hide();
        }

        if ($(".BuyCount").val() == "") {
            if (P.P_InventoryCount > 0) {
                $(".BuyCount").val(P.P_MinCount);
            } else {
                $(".BuyCount").val("0");
            }
        }
        $(".BuyCount").blur();
    };

    /*设置规格值*/
    P.SetGGValues = function () {
        var obj = $(".ShowGG .ShowGGOne .ShowGGOne_Values .One_Value.focus");
        if ($(obj).length == P.ProductSpecificationNameValuesList.length) {
            var vals = new Array();
            $(obj).each(function (i, v) {
                vals.push($(v).text());
            });

            P.DefaultValues = vals.join(",");
            P.ShowGGValues();

        }
    };

    /*加入购物车*/
    P.AddShopCar = function (url) {
        var _ProductId = P.id; //商品Id
        var _ProductSpecificationId = ""; //商品规格Id
        if (!P.noGG) {
            var has = false;
            for (var i in P.ProductSpecificationList) {
                if (P.ProductSpecificationList[i].PS_AttributeValues == P.DefaultValues)
                { _ProductSpecificationId = P.ProductSpecificationList[i].id; has = true; break; }
            }
            if (!has) {
                $("body").showMessage("请选择正确的商品规格后再加入购物车");
                return;
            }
        }

        var Count = $(".BuyCount").val();
        if (Count <= 0) {
            $("body").showMessage("请选择正确的商品个数后再加入购物车");
            return;
        }

        //提交
        $.ajax({
            url: url,
            data: { ProductId: _ProductId, ProductSpecificationId: _ProductSpecificationId, Count: Count },
            type: 'POST',
            success: function (result) {
                if (result > 0) {
                    $("body").showMessage("该商品已经成功添加到购物车");
                } else {
                    $("body").showMessage(result);
                }
                //                var count = parseInt($(".I_ShoppingCar_Count").text());
                //                var Acount = count + parseInt(result);
                //                $(".I_ShoppingCar_Count").text(Acount);
            }
        });
    };

    /*设置价格，根据活动，规格等等*/
    P.SetP_FixedPrice = function (P_FixedPrice) {
        if (P.Promotion != null && P.Promotion.P_Price > 0) {//团购价
            P_FixedPrice = P.Promotion.P_Price;
        }

        //设置价格，根据促销类型
        $(".GGValue .GGValue_FixedPrice").text(P_FixedPrice);

        var p1 = parseFloat($(".GGValue_YJPrice").text().substr(1, 5));
        var p2 = parseFloat($(".GGValue .GGValue_PTPrice").text());

        //如果价格相等,则隐藏原价，空出一行信息
        if (p1 == p2) {
            $(".GGValue_YJPrice").hide();
        }
    };

    /*立即购买*/
    P.Buy = function (url) {
        var _Count = parseInt($(".BuyCount").val());
        var _P_UniqueID = P.P_UniqueID; //商品唯一编号
        var _ProductSpecification_UniqueID = "";     //商品规格唯一编号
        if (!P.noGG) {
            var has = false;
            for (var i in P.ProductSpecificationList) {
                if (P.ProductSpecificationList[i].PS_AttributeValues == P.DefaultValues) {
                    _ProductSpecification_UniqueID = P.ProductSpecificationList[i].PS_UniqueID;
                    has = true;
                    break;
                }
            }
            if (!has) {
                alert("请选择正确的商品规格后再购买");
                return;
            }
        }
        if (_Count <= 0) {
            alert("购买商品个数不能小于0");
            return;
        }

        //$(".msg").append(_P_UniqueID + "-" + _Product_UniqueID + "<br />");

        $("body").showMessage("购买正在建设中...");
        //        var Param = new Array();
        //        Param.push("order_style=" + P.pStyle);
        //        Param.push("BuyCount=" + _Count); 
        //        Param.push("puid=" + _P_UniqueID); Param.push("psuid=" + _ProductSpecification_UniqueID);
        //        location.href = url + "?" + Param.join("&");
    };

    /*点击数量增加*/
    $(".p_v_add").click(function () {

        if (P.pStyle == 1) {//限时秒杀
            P.P_MaxCount = P.Promotion.P_TotallCount;
        } else if (P.pStyle == 2) {//限量购买
            P.P_MaxCount = (P.Promotion.P_TotallCount - P.Promotion.P_SellCount);
            P.P_MinCount = P.P_MinCount;
        }
        $(".BuyCount").val($(".BuyCount").val().replace(/\D/g, ''));
        var count = parseInt($(".BuyCount").val());
        count += 1;
        $(".BuyCount").val(count);
        if (count < P.P_MinCount) {
            $(".BuyCount").val(P.P_MinCount);
            count = P.P_MinCount;
        }
        if (count > P.P_MaxCount && P.P_MaxCount != 0) {
            $(".errormsgdiv").text("单次购买数量不得超过" + P.P_MaxCount + "件");
            $(".BuyCount").val(P.P_MinCount);
            count = P.P_MinCount;
        }
        if (P.noGG) {
            if (count > P.P_InventoryCount)
                $(".BuyCount").val(P.P_InventoryCount)
        }
        else {
            var p = false;
            for (var i in P.ProductSpecificationList) {
                if (P.ProductSpecificationList[i].PS_AttributeValues == P.DefaultValues) {
                    if (count > parseInt(P.ProductSpecificationList[i].PS_Inventory))
                        $(".BuyCount").val(parseInt(P.ProductSpecificationList[i].PS_Inventory))
                    p = true;
                }
            }
            if (!p) {
                $(".BuyCount").val(0);
            }
        }
    });

    /*点击数量减*/
    $(".p_v_cut").click(function () {
        if (P.pStyle == 1) {//限时秒杀
            P.P_MaxCount = P.Promotion.P_TotallCount;
        } else if (P.pStyle == 2) {//限量购买
            P.P_MaxCount = (P.Promotion.P_TotallCount - P.Promotion.P_SellCount);
            P.P_MinCount = P.P_MinCount;
        }
        $(".BuyCount").val($(".BuyCount").val().replace(/\D/g, ''));
        var count = parseInt($(".BuyCount").val());
        if (count != 1) {
            count -= 1;
        }
        $(".BuyCount").val(count);
        if (count < P.P_MinCount) {
            $(".BuyCount").val(P.P_MinCount);
            count = P.P_MinCount;
        }
        if (count > P.P_MaxCount && P.P_MaxCount != 0) {
            $(".errormsgdiv").text("单次购买数量不得超过" + P.P_MaxCount + "件");
            $(".BuyCount").val(P.P_MinCount);
            count = P.P_MinCount;
        }
        if (P.noGG) {
            if (count > P.P_InventoryCount)
                $(".BuyCount").val(P.P_InventoryCount)
        }
        else {
            var p = false;
            for (var i in P.ProductSpecificationList) {
                if (count > parseInt(P.ProductSpecificationList[i].PS_Inventory))
                    $(".BuyCount").val(parseInt(P.ProductSpecificationList[i].PS_Inventory))
                p = true;

            }
            if (!p)
                $(".BuyCount").val(0);
        }
    });

    /*点击规格值增加样式*/
    $(".ShowGG .ShowGGOne .ShowGGOne_Values .One_Value").live("click", function () {
        $(this).parent().find(".focus").removeClass("focus");
        $(this).addClass("focus");
        P.SetGGValues();
    });

    /*数量输入框失去焦点*/
    $(".BuyCount").blur(function () {
        if (P.pStyle == 1) {//限时秒杀
            P.P_MaxCount = P.Promotion.P_TotallCount;
        } else if (P.pStyle == 2) {//限量购买
            P.P_MaxCount = (P.Promotion.P_TotallCount - P.Promotion.P_SellCount);
            P.P_MinCount = P.P_MinCount;
        }

        $(this).val($(this).val().replace(/\D/g, ''));
        var count = $(this).val();
        if (count < P.P_MinCount)
            $(this).val(P.P_MinCount);
        if (count > P.P_MaxCount && P.P_MaxCount != 0) {
            //$(".errormsgdiv").text("单次购买数量不得超过" + P.P_MaxCount + "件");
            $(this).val(P.P_MaxCount);
        }

        count = $(this).val();
        if (P.noGG) {
            if (count > P.P_InventoryCount)
                $(this).val(P.P_InventoryCount)
        }
        else {
            var p = false;
            for (var i in P.ProductSpecificationList) {

                if (P.ProductSpecificationList[i].PS_AttributeValues == P.DefaultValues) {
                    if (count > parseInt(P.ProductSpecificationList[i].PS_Inventory))
                        $(this).val(parseInt(P.ProductSpecificationList[i].PS_Inventory))
                    p = true;
                }
            }
            if (!p)
                $(this).val(0);
        }
    });
}