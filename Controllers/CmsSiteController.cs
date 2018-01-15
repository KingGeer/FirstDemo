using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DealMvc.Common.Config;
using DealMvc.Filter;
using DealMvc.Common;
namespace DealMvc.Controllers
{
    [ControlInfo("系统模块")]
    public class CmsSiteController : ControllerBase
    {

        #region 业务逻辑

        /// <summary>
        /// 实例化 管理员操作日志业务逻辑
        /// </summary>
        public BLL.BLL_Base_AdminsLog b_BLL_Base_AdminsLog = new BLL.BLL_Base_AdminsLog();

        /// <summary>
        /// 当前登录管理员
        /// </summary>
        public Model.Base_Admins loginAdmins = DealMvc.BLL.BLL_Base_Admins.GetLoginAdmins();

        /// <summary>
        /// 信息模板业务逻辑
        /// </summary>
        public BLL.BLL_Base_MSGTemplate b_BLL_Base_MSGTemplate = new BLL.BLL_Base_MSGTemplate();


        #endregion


        #region 网站基本信息设置

        [Role("基础信息管理", "网站基本信息设置")]
        public ActionResult SiteBase(string WebName, string HomeUrl, string SEOTitle, string SEOKeyWord, string SEODescription, string BrowserTitleSeparator, string WebCopyRight, string WebICP, string ServiceHotline, string ContactAddress, string ContactZipCode, string ContactEmail, int? PermissionsStatus, int? OpenWebCache, int? WebCache, int? SiteStatus, string StopSiteStatusDes, string CopyrightFoot, string ServiceCode, string ProductDetailService, string ProductDetailHowBuy, string ShuiYin, string YanZhengPhoneCoun)
        {
            DealMvc.Common.Config.SiteInfo m_SiteInfo = ConfigInfo<SiteInfo>.Instance();
            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("WebName", m_SiteInfo.WebName);
                _NameValueCollectionEx.Add("HomeUrl", m_SiteInfo.HomeUrl);
                _NameValueCollectionEx.Add("ShuiYin", m_SiteInfo.ShuiYin);
                _NameValueCollectionEx.Add("SEOTitle", m_SiteInfo.SEOTitle);
                _NameValueCollectionEx.Add("SEOKeyWord", m_SiteInfo.SEOKeyWord);
                _NameValueCollectionEx.Add("SEODescription", m_SiteInfo.SEODescription);
                _NameValueCollectionEx.Add("BrowserTitleSeparator", m_SiteInfo.BrowserTitleSeparator);
                _NameValueCollectionEx.Add("WebCopyRight", m_SiteInfo.WebCopyRight);

                _NameValueCollectionEx.Add("WebICP", m_SiteInfo.WebICP);
                _NameValueCollectionEx.Add("ServiceHotline", m_SiteInfo.ServiceHotline);
                _NameValueCollectionEx.Add("ContactAddress", m_SiteInfo.ContactAddress);
                _NameValueCollectionEx.Add("ContactZipCode", m_SiteInfo.ContactZipCode);
                _NameValueCollectionEx.Add("ContactEmail", m_SiteInfo.ContactEmail);

                _NameValueCollectionEx.Add("PermissionsStatus", m_SiteInfo.PermissionsStatus);
                _NameValueCollectionEx.Add("OpenWebCache", m_SiteInfo.OpenWebCache);
                _NameValueCollectionEx.Add("WebCache", m_SiteInfo.WebCache);
                _NameValueCollectionEx.Add("SiteStatus", m_SiteInfo.SiteStatus);
                _NameValueCollectionEx.Add("StopSiteStatusDes", m_SiteInfo.StopSiteStatusDes);
                _NameValueCollectionEx.Add("CopyrightFoot", m_SiteInfo.CopyrightFoot);
                _NameValueCollectionEx.Add("ServiceCode", m_SiteInfo.ServiceCode);
                _NameValueCollectionEx.Add("ProductDetailService", m_SiteInfo.ProductDetailService);
                _NameValueCollectionEx.Add("ProductDetailHowBuy", m_SiteInfo.ProductDetailHowBuy);
                _NameValueCollectionEx.Add("YanZhengPhoneCoun", m_SiteInfo.YanZhengPhoneCoun);
                SetSaveFormCollection = _NameValueCollectionEx;
            }
            if (IsPost)
            {
                m_SiteInfo.WebName = WebName.ToString2();
                m_SiteInfo.HomeUrl = HomeUrl.ToString2();
                //网站图标
                Common.Globals.UpFileResult _UpFileResult = Common.Globals.Upload("WebIco");
                if (_UpFileResult.returnerror.Count == 0)
                {
                    if (_UpFileResult.returnfilename.Count > 0)
                    {
                        m_SiteInfo.WebIco = _UpFileResult.returnfilename[0].ToString();
                    }
                }
                else
                {
                    throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox(string.Join("<br/>", (string[])_UpFileResult.returnerror.ToArray(typeof(string))));
                }
                //网站Logo
                Common.Globals.UpFileResult _UpFileResultlogo = Common.Globals.Upload("WebLogo");
                if (_UpFileResultlogo.returnerror.Count == 0)
                {
                    if (_UpFileResultlogo.returnfilename.Count > 0)
                    {
                        m_SiteInfo.WebLogo = _UpFileResultlogo.returnfilename[0].ToString();
                    }
                }
                else
                {
                    throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox(string.Join("<br/>", (string[])_UpFileResult.returnerror.ToArray(typeof(string))));
                }
                //m_SiteInfo.WebIco = Common.HtmlString.UpFileClass("WebIco", m_SiteInfo.WebIco, "ICO");//网站图标
                //m_SiteInfo.WebLogo = Common.HtmlString.UpFileClass("WebLogo", m_SiteInfo.WebLogo);//网站Logo
                m_SiteInfo.ShuiYin = ShuiYin.ToString2();
                m_SiteInfo.SEOTitle = SEOTitle.ToString2();
                m_SiteInfo.SEOKeyWord = SEOKeyWord.ToString2();
                m_SiteInfo.SEODescription = SEODescription.ToString2();
                m_SiteInfo.BrowserTitleSeparator = BrowserTitleSeparator.ToString2();
                m_SiteInfo.WebCopyRight = WebCopyRight.ToString2();
                m_SiteInfo.WebICP = WebICP.ToString2();

                m_SiteInfo.ServiceHotline = ServiceHotline.ToString2();
                m_SiteInfo.ContactAddress = ContactAddress.ToString2();
                m_SiteInfo.ContactZipCode = ContactZipCode.ToString2();
                m_SiteInfo.ContactEmail = ContactEmail.ToString2();
                m_SiteInfo.PermissionsStatus = PermissionsStatus.ToInt32().ToString2();
                m_SiteInfo.OpenWebCache = OpenWebCache.ToInt32().ToString2();
                m_SiteInfo.WebCache = WebCache.ToInt32().ToString2();
                m_SiteInfo.SiteStatus = SiteStatus.ToInt32().ToString2();
                m_SiteInfo.StopSiteStatusDes = StopSiteStatusDes.ToString2();
                m_SiteInfo.CopyrightFoot = CopyrightFoot.ToString2();
                m_SiteInfo.ServiceCode = ServiceCode.ToString2();
                m_SiteInfo.ProductDetailService = ProductDetailService.ToString2();
                m_SiteInfo.ProductDetailHowBuy = ProductDetailHowBuy.ToString2();
                m_SiteInfo.YanZhengPhoneCoun = YanZhengPhoneCoun.ToString2();
                try
                {
                    ConfigInfo<SiteInfo>.Save();
                    return ViewAlert(this, "修改“网站基本配置”信息成功!", m_SiteInfo);
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示:" + ex.Message, m_SiteInfo);
                }
            }
            return View(m_SiteInfo);
        }
        #endregion


        #region 邮箱信息设置

        [Role("基础信息管理", "邮箱信息设置")]
        public ActionResult EmailBase(string smtp, string emailname, string email, string emailpwd, string port, bool? IsOpen)
        {
            DealMvc.Common.Config.EmailInfo m_EmailInfo = ConfigInfo<EmailInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("smtp", m_EmailInfo.smtp);
                _NameValueCollectionEx.Add("emailname", m_EmailInfo.emailname);
                _NameValueCollectionEx.Add("email", m_EmailInfo.email);
                _NameValueCollectionEx.Add("emailpwd", DealMvc.DBUtility.DESEncrypt.Decrypt(m_EmailInfo.emailpwd));
                _NameValueCollectionEx.Add("port", m_EmailInfo.port);
                _NameValueCollectionEx.Add("IsOpen", m_EmailInfo.IsOpen);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
                try
                {
                    if ((IsOpen ?? false) &&
                          (string.IsNullOrEmpty(smtp.ToString2Trim()) ||
                          string.IsNullOrEmpty(emailname.ToString2Trim()) ||
                          string.IsNullOrEmpty(email.ToString2Trim()) ||
                          string.IsNullOrEmpty(emailpwd.ToString2Trim()) ||
                          string.IsNullOrEmpty(port.ToString2Trim())
                          )
                      )
                        throw new Common.ExceptionEx.MyExceptionMessageBox("邮箱SMTP、用户帐号、邮箱地址、邮箱密码、邮箱发送端口 必须填写");

                    m_EmailInfo.smtp = smtp.ToString2Trim();
                    m_EmailInfo.emailname = emailname.ToString2Trim();
                    m_EmailInfo.email = email.ToString2Trim();
                    m_EmailInfo.emailpwd = DealMvc.DBUtility.DESEncrypt.Encrypt(emailpwd.ToString2Trim());
                    m_EmailInfo.port = port.ToString2Trim();
                    m_EmailInfo.IsOpen = (IsOpen ?? false).ToString();

                    ConfigInfo<EmailInfo>.Save();
                    return ViewAlert(this, "修改“邮箱设置”信息成功!", true, Url.Action("EmailBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示:" + ex.Message, true, Url.Action("EmailBase"));
                }

            return View();
        }

        #region 邮箱测试

        public ActionResult EmailBaseTest(string TestEmail, string Title, string Contents)
        {
            DealMvc.Common.Config.EmailInfo m_EmailInfo = DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.EmailInfo>.Instance(); if (m_EmailInfo.IsOpen != "True")
            { return ViewAlert(this, "邮箱未设置", true, Url.Action("EmailBase")); }
            if (IsPost)
                try
                {
                    DealMvc.SendMessage.EmailMessage.SendEmail(Title.ToString2Trim(), Contents.ToString2Trim(), TestEmail.ToString2());

                    MsgClass.AlertMsg(this, "邮箱信息已发送，请注意查看", true);
                }
                catch (Exception ex)
                {
                    DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ex);
                }
            return RedirectToAction("EmailBase");
        }

        #endregion

        #endregion


        #region 订单信息设置

        [Role("基础信息管理", "订单信息设置")]
        public ActionResult OrderSetBase(int? NonPaymentCanceledDay, string NonPaymentCanceledInfo,
                int? ShippedToAlreadyReceivingDay, string ShippedToAlreadyReceivingInfo,
            int? AlreadyReceivingDay, string AlreadyReceivingTitle, int? AlreadyReceivingRating, string AlreadyReceivingContent)
        {
            DealMvc.Common.Config.OrderSetInfo m_entity = ConfigInfo<OrderSetInfo>.Instance();
            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("NonPaymentCanceledDay", m_entity.NonPaymentCanceledDay);
                _NameValueCollectionEx.Add("NonPaymentCanceledInfo", m_entity.NonPaymentCanceledInfo);

                _NameValueCollectionEx.Add("ShippedToAlreadyReceivingDay", m_entity.ShippedToAlreadyReceivingDay);
                _NameValueCollectionEx.Add("ShippedToAlreadyReceivingInfo", m_entity.ShippedToAlreadyReceivingInfo);

                _NameValueCollectionEx.Add("AlreadyReceivingDay", m_entity.AlreadyReceivingDay);
                _NameValueCollectionEx.Add("AlreadyReceivingTitle", m_entity.AlreadyReceivingTitle);
                _NameValueCollectionEx.Add("AlreadyReceivingRating", m_entity.AlreadyReceivingRating);
                _NameValueCollectionEx.Add("AlreadyReceivingContent", m_entity.AlreadyReceivingContent);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_entity.NonPaymentCanceledDay = (NonPaymentCanceledDay ?? 0).ToString2();
                m_entity.NonPaymentCanceledInfo = NonPaymentCanceledInfo.ToString2();

                m_entity.ShippedToAlreadyReceivingDay = (ShippedToAlreadyReceivingDay ?? 0).ToString2();
                m_entity.ShippedToAlreadyReceivingInfo = ShippedToAlreadyReceivingInfo.ToString2();

                m_entity.AlreadyReceivingDay = (AlreadyReceivingDay ?? 0).ToString2();
                m_entity.AlreadyReceivingTitle = AlreadyReceivingTitle.ToString2();
                m_entity.AlreadyReceivingRating = (AlreadyReceivingRating ?? 0).ToString2();
                m_entity.AlreadyReceivingContent = AlreadyReceivingContent.ToString2();
                try
                {
                    ConfigInfo<OrderSetInfo>.Save();
                    return ViewAlert(this, "修改“订单信息设置”信息成功", true, Url.Action("OrderSetBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示:" + ex.Message, true, Url.Action("OrderSetBase"));
                }
            }

            return View(m_entity);
        }
        #endregion


        #region 网站上传文件设置

        [Role("基础信息管理", "网站上传文件设置")]
        public ActionResult UpLoadFileBase(string UploadFolder, string UploadExtension, string UploadSize)
        {
            DealMvc.Common.Config.UploadInfo m_UploadInfo = ConfigInfo<UploadInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("UploadFolder", m_UploadInfo.UploadFolder);
                _NameValueCollectionEx.Add("UploadExtension", m_UploadInfo.UploadExtension);
                _NameValueCollectionEx.Add("UploadSize", m_UploadInfo.UploadSize);
                ViewData["DefaultImg"] = m_UploadInfo.DefaultImg;
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_UploadInfo.UploadFolder = UploadFolder;
                m_UploadInfo.UploadExtension = UploadExtension;
                m_UploadInfo.UploadSize = UploadSize;

                //写到业务逻辑层
                Common.Globals.UpFileResult _UpFileResult = Common.Globals.Upload("DefaultImg", "", "", null);

                if (_UpFileResult.returnerror.Count == 0)
                {
                    if (_UpFileResult.returnfilename.Count > 0)
                    {
                        m_UploadInfo.DefaultImg = _UpFileResult.returnfilename[0].ToString();
                    }
                }

                try
                {
                    ConfigInfo<UploadInfo>.Save();
                    return ViewAlert(this, "修改“上传文件配置”信息成功", true, Url.Action("UpLoadFileBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示:" + ex.Message, true, Url.Action("UpLoadFileBase"));
                }
            }

            return View();
        }
        #endregion


        #region 评论敏感词设置

        [Role("基础信息管理", "过滤敏感词设置")]
        public ActionResult FilterKeysBase(string KeysContents, string ReplaceSymbol)
        {
            DealMvc.Common.Config.FilterKeys m_model = ConfigInfo<FilterKeys>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("KeysContents", m_model.KeysContents);
                _NameValueCollectionEx.Add("ReplaceSymbol", m_model.ReplaceSymbol);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_model.KeysContents = KeysContents;
                m_model.ReplaceSymbol = ReplaceSymbol;
                try
                {
                    ConfigInfo<FilterKeys>.Save();
                    return ViewAlert(this, "修改“过滤敏感词设置”信息成功", true, Url.Action("FilterKeysBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示", true, Url.Action("FilterKeysBase"));
                }
            }

            return View();
        }
        #endregion


        #region 用户信息设置

        [Role("基础信息管理", "用户信息设置")]
        public ActionResult UserSetBase(int? IsMemberAPILogin, int? IsMemberLogin, int? IsMemberReg, int? MemberDeliveryAddressQuantity, string RegServerContent)
        {
            DealMvc.Common.Config.UserSetInfo m_entity = ConfigInfo<UserSetInfo>.Instance();
            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("IsMemberAPILogin", m_entity.IsMemberAPILogin);
                _NameValueCollectionEx.Add("IsMemberLogin", m_entity.IsMemberLogin);
                _NameValueCollectionEx.Add("IsMemberReg", m_entity.IsMemberReg);
                _NameValueCollectionEx.Add("MemberDeliveryAddressQuantity", m_entity.MemberDeliveryAddressQuantity);
                _NameValueCollectionEx.Add("RegServerContent", m_entity.RegServerContent);

                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_entity.IsMemberAPILogin = (IsMemberAPILogin ?? 0).ToString2();
                m_entity.IsMemberLogin = (IsMemberLogin ?? 0).ToString2();
                m_entity.IsMemberReg = (IsMemberReg ?? 0).ToString2();
                m_entity.MemberDeliveryAddressQuantity = (MemberDeliveryAddressQuantity ?? 0).ToString2();
                m_entity.RegServerContent = (RegServerContent).ToString2();
                m_entity.RegMemberHead = DealMvc.Common.HtmlStrings.UpFileClass("RegMemberHead", m_entity.RegMemberHead);

                try
                {
                    ConfigInfo<UserSetInfo>.Save();

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog("修改用户信息设置", "修改用户信息设置");

                    #endregion

                    return ViewAlert(this, "修改“用户信息设置”信息成功", true, Url.Action("UserSetBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, ex.Message, true, Url.Action("UserSetBase"));
                }
            }

            return View(m_entity);
        }

        #endregion


        #region 积分信息设置

        [Role("基础信息管理", "积分信息设置")]
        public ActionResult IntegralBase(int? Tocomplete, int? Toreg, int? Tologin, int? ToProduct, int? TogoodFriend, int? ToPostcommodity, int? ToPostBug, int? ToMonthMoney)
        {
            //积分信息配置 {完成订单每消费1元钱即可获得} {Tocomplete}
            DealMvc.Common.Config.IntegralInfo m_entity = DealMvc.Common.Config.ConfigInfo<DealMvc.Common.Config.IntegralInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("Tocomplete", m_entity.Tocomplete);
                _NameValueCollectionEx.Add("Toreg", m_entity.Toreg);
                _NameValueCollectionEx.Add("Tologin", m_entity.Tologin);
                _NameValueCollectionEx.Add("Tologin", m_entity.ToProduct);
                _NameValueCollectionEx.Add("TogoodFriend", m_entity.TogoodFriend);
                _NameValueCollectionEx.Add("ToPostcommodity", m_entity.ToPostcommodity);
                _NameValueCollectionEx.Add("ToPostBug", m_entity.ToPostBug);
                _NameValueCollectionEx.Add("ToMonthMoney", m_entity.ToMonthMoney);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_entity.Tocomplete = Tocomplete.ToInt32().ToString2();
                m_entity.Toreg = Toreg.ToInt32().ToString2();
                m_entity.TogoodFriend = TogoodFriend.ToInt32().ToString2();
                m_entity.ToPostcommodity = ToPostcommodity.ToInt32().ToString2();
                m_entity.ToPostBug = ToPostBug.ToInt32().ToString2();
                m_entity.ToMonthMoney = ToMonthMoney.ToInt32().ToString2();
                m_entity.Tologin = Tologin.ToInt32().ToString2();
                m_entity.ToProduct = ToProduct.ToInt32().ToString2();
                try
                {
                    ConfigInfo<IntegralInfo>.Save();
                    return ViewAlert(this, "修改“积分配置”信息成功", true, Url.Action("IntegralBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示:" + ex.Message, true, Url.Action("IntegralBase"));
                }

            }
            return View();
        }

        #endregion


        #region 快捷登录信息设置

        #region 新浪微博接口信息

        [Role("快捷登录信息设置", "新浪微博接口信息")]
        public ActionResult SinaBase(string app_key, string app_secret, string SinaMetaProperty, bool? IsOpen)
        {
            DealMvc.Common.Config.SinaInfo m_entity = ConfigInfo<SinaInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("app_key", m_entity.app_key);
                _NameValueCollectionEx.Add("app_secret", m_entity.app_secret);
                _NameValueCollectionEx.Add("SinaMetaProperty", m_entity.SinaMetaProperty);
                _NameValueCollectionEx.Add("IsOpen", m_entity.IsOpen);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                if ((IsOpen ?? false) &&
                          (string.IsNullOrEmpty(app_key.ToString2Trim()) ||
                          string.IsNullOrEmpty(app_secret.ToString2())
                          )
                      )
                    throw new Common.ExceptionEx.MyExceptionMessageBox("app_key、app_secret 必须填写");
                m_entity.app_key = app_key.ToString2Trim();
                m_entity.app_secret = app_secret.ToString2Trim();
                m_entity.SinaMetaProperty = SinaMetaProperty.ToString2Trim();
                m_entity.IsOpen = (IsOpen ?? false).ToString();
                try
                {
                    ConfigInfo<SinaInfo>.Save();
                    return ViewAlert(this, "修改“新浪微博一键登录配置”信息成功", true, Url.Action("SinaBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示", true, Url.Action("SinaBase"));
                }
            }

            return View();
        }

        #endregion

        #region 腾讯QQ接口信息

        [Role("快捷登录信息设置", "腾讯QQ接口信息")]
        public ActionResult TencentBase(string app_id, string app_key, string TencentMetaProperty, bool? IsOpen)
        {
            DealMvc.Common.Config.TencentInfo m_entity = ConfigInfo<TencentInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("app_id", m_entity.app_id);
                _NameValueCollectionEx.Add("app_key", m_entity.app_key);
                _NameValueCollectionEx.Add("TencentMetaProperty", m_entity.TencentMetaProperty);
                _NameValueCollectionEx.Add("IsOpen", m_entity.IsOpen);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                if ((IsOpen ?? false) &&
                          (string.IsNullOrEmpty(app_id.ToString2Trim()) ||
                          string.IsNullOrEmpty(app_key.ToString2Trim())
                          )
                      )
                    throw new Common.ExceptionEx.MyExceptionMessageBox("app_id、app_key 必须填写");
                m_entity.app_id = app_id.ToString2Trim();
                m_entity.app_key = app_key.ToString2Trim();
                m_entity.TencentMetaProperty = TencentMetaProperty.ToString2Trim();
                m_entity.IsOpen = (IsOpen ?? false).ToString();
                try
                {
                    ConfigInfo<TencentInfo>.Save();
                    return ViewAlert(this, "修改“腾讯QQ一键登录配置”信息成功", true, Url.Action("TencentBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示", true, Url.Action("TencentBase"));
                }
            }

            return View();
        }

        #endregion

        #endregion


        #region 支付信息设置

        #region 支付宝信息设置

        [Role("支付信息设置", "支付宝信息设置")]
        public ActionResult AlipayBase(string partner, string key, string seller_email, bool? IsOpen)
        {
            DealMvc.Common.Config.AlipayInfo m_entity = ConfigInfo<AlipayInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("partner", m_entity.partner);
                _NameValueCollectionEx.Add("key", m_entity.key);
                _NameValueCollectionEx.Add("seller_email", m_entity.seller_email);
                _NameValueCollectionEx.Add("IsOpen", m_entity.IsOpen);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                m_entity.partner = partner;
                m_entity.key = key;
                m_entity.seller_email = seller_email;
                m_entity.IsOpen = (IsOpen ?? false).ToString();
                try
                {
                    ConfigInfo<AlipayInfo>.Save();
                    return ViewAlert(this, "修改“财付通配置”信息成功", true, Url.Action("AlipayBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示", true, Url.Action("AlipayBase"));
                }
            }

            return View();
        }
        #endregion

        #region 财付通信息设置

        [Role("支付信息设置", "财付通信息设置")]
        public ActionResult TenpayBase(string tenpay_account, string tenpay_key, bool? IsOpen)
        {
            DealMvc.Common.Config.TenpayInfo m_entity = ConfigInfo<TenpayInfo>.Instance();

            if (IsGet)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("tenpay_account", m_entity.tenpay_account);
                _NameValueCollectionEx.Add("tenpay_key", m_entity.tenpay_key);
                _NameValueCollectionEx.Add("IsOpen", m_entity.IsOpen);
                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                if ((IsOpen ?? false) &&
                          (string.IsNullOrEmpty(tenpay_account.ToString2Trim()) ||
                          string.IsNullOrEmpty(tenpay_key.ToString2())
                          )
                      )
                    throw new Common.ExceptionEx.MyExceptionMessageBox("财付通商户号、财付通密钥 必须填写");
                m_entity.tenpay_account = tenpay_account.ToString2Trim();
                m_entity.tenpay_key = tenpay_key.ToString2();
                m_entity.IsOpen = (IsOpen ?? false).ToString();
                try
                {
                    ConfigInfo<TenpayInfo>.Save();
                    return ViewAlert(this, "修改“财付通配置”信息成功", true, Url.Action("TenpayBase"));
                }
                catch (Exception ex)
                {
                    return ViewAlert(this, "错误提示", true, Url.Action("TenpayBase"));
                }

            }

            return View();
        }
        #endregion

        #endregion


        #region 模板管理

        #region 模板列表

        [Role("模板管理", "模板列表")]
        public ActionResult MSGTemplateList(int? Page, string MT_Remark, string MT_UniqueID)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Base_MSGTemplate> _Pager = b_BLL_Base_MSGTemplate.PagerList(Page, MT_UniqueID, MT_Remark);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            BLL.BLL_Base_AdminsLog.AddAdminsLog("模板列表", "查看模板列表");

            return View();
        }

        #endregion

        #region 添加/编辑模板

        [Role("模板管理", "添加/编辑模板")]
        public ActionResult AEMSGTemplate(Model.Base_MSGTemplate p_MSGTemplate, string[] MT_TableNames)
        {
            bool isEdit = true;
            if (p_MSGTemplate.id == null) { isEdit = false; }
            ViewData["isEdit"] = isEdit;
            string remark = "";
            if (IsGet)
            {
                if (isEdit)
                {
                    try
                    {
                        SetSaveFormCollection = b_BLL_Base_MSGTemplate.NameValueCollectionEx(ref p_MSGTemplate);
                    }
                    catch { return RedirectToAction("MSGTemplateList"); }
                }
            }
            if (IsPost)
            {
                try
                {
                    p_MSGTemplate.MT_TableNames = String.Join(",", MT_TableNames);
                    b_BLL_Base_MSGTemplate.AEBase_MSGTemplate(this, isEdit, ref  p_MSGTemplate);
                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce)
                {
                    remark = ce.Message;
                    IsSaveForm = true;
                    DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce);
                }

                #region 添加操作日志

                BLL.BLL_Base_AdminsLog.AddAdminsLog("编辑模板", "唯一编号:" + p_MSGTemplate.MT_UniqueID + ",:" + p_MSGTemplate.MT_TableNames
                        + "，是否HTML:" + p_MSGTemplate.MT_IsHtml + "\n内容:" + p_MSGTemplate.MT_Detail + ",备注:" + p_MSGTemplate.MT_Remark);

                #endregion


            }
            return View();

        }

        #endregion

        #region 编辑模板内容

        [Role("模板管理", "编辑模板内容")]
        public ActionResult AEMSGTemplate2(Model.Base_MSGTemplate p_MSGTemplate)
        {
            bool isEdit = true;
            if (p_MSGTemplate.id == null) { isEdit = false; }
            ViewData["isEdit"] = isEdit;
            string remark = "";
            if (IsGet)
            {
                if (isEdit)
                {
                    try
                    {
                        SetSaveFormCollection = b_BLL_Base_MSGTemplate.NameValueCollectionEx(ref p_MSGTemplate);
                    }
                    catch { return RedirectToAction("MSGTemplateList"); }
                }
            }
            if (IsPost)
            {
                try
                {
                    b_BLL_Base_MSGTemplate.AEBase_MSGTemplate2(this, isEdit, ref p_MSGTemplate);
                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce)
                {
                    remark = ce.Message;
                    IsSaveForm = true;
                    DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce);
                }

                #region 添加操作日志

                BLL.BLL_Base_AdminsLog.AddAdminsLog("编辑模板内容", "唯一编号:" + p_MSGTemplate.MT_UniqueID + ",:" + p_MSGTemplate.MT_TableNames
                        + "，是否HTML:" + p_MSGTemplate.MT_IsHtml + "\n内容:" + p_MSGTemplate.MT_Detail + ",备注:" + p_MSGTemplate.MT_Remark);

                #endregion

            }

            try
            {
                ViewData["IsHtml"] = p_MSGTemplate.MT_IsHtml;

            }
            catch { ViewData["IsHtml"] = false; }

            try { ViewData["MT_TableNames"] = p_MSGTemplate.MT_TableNames; }
            catch { }

            return View();

        }

        #endregion

        #region 删除模板

        [Role("模板管理", "删除模板")]
        public ContentResult DeleteMSGTemplate(string ids)
        {
            string msg = b_BLL_Base_MSGTemplate.DeleteBase_MSGTemplate(ids, null).ToString2().ToLower();


            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("删除模板", "模板标识ID:" + ids);

            #endregion

            return Content(msg);
        }

        #endregion

        #endregion

    }
}
