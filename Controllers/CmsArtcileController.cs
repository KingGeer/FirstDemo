using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DealMvc.Filter;

namespace DealMvc.Controllers
{

    [ControlInfo("信息模块")]
    public class CmsArtcileController : ControllerBase
    {


        #region 业务逻辑

        /// <summary>
        /// 实例化 广告位置业务逻辑
        /// </summary>
        public BLL.Mall.BLL_Mall_AdPositions b_BLL_Mall_AdPositions = new BLL.Mall.BLL_Mall_AdPositions();

        /// <summary>
        /// 实例化 广告信息业务逻辑
        /// </summary>
        public BLL.Mall.BLL_Mall_AdInfor b_BLL_Mall_AdInfor = new BLL.Mall.BLL_Mall_AdInfor();

        /// <summary>
        /// 实例化 单页面业务逻辑
        /// </summary>
        public BLL.Mall.BLL_Mall_SinglePage b_BLL_Mall_SinglePage = new BLL.Mall.BLL_Mall_SinglePage();


        /// <summary>
        /// 实例化 导航菜单业务逻辑
        /// </summary>
        public BLL.Mall.BLL_Mall_NavMenu b_BLL_Mall_NavMenu = new BLL.Mall.BLL_Mall_NavMenu();

        /// <summary>
        /// 实例化 友情链接业务逻辑
        /// </summary>
        public BLL.Mall.BLL_Mall_Links b_BLL_Mall_Links = new BLL.Mall.BLL_Mall_Links();

        #endregion

        #region 广告管理

        #region 广告位置

        [Role("广告位置管理", "广告位置列表")]
        public ActionResult Mall_AdPositionsList(int? Page, string UniqueId, string Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Mall_AdPositions> _Pager = b_BLL_Mall_AdPositions.PagerList(Page, UniqueId, Title);
            ViewData["Pager"] = _Pager;
            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("广告位置列表", "查询广告位置列表");

            #endregion

            return View();
        }

        [Role("广告位置管理", "添加/编辑广告位置")]
        public ActionResult AEMall_AdPositions(Model.Mall_AdPositions p_Mall_AdPositions)
        {
            bool isEdit = p_Mall_AdPositions.id != null;
            ViewData["isEdit"] = isEdit;
            if (IsGet && isEdit)
                try
                {
                    SetSaveFormCollection = b_BLL_Mall_AdPositions.NameValueCollectionEx(ref p_Mall_AdPositions);
                }
                catch { return RedirectToAction("Mall_AdPositionsList"); }
            if (IsPost)
                try
                {
                    b_BLL_Mall_AdPositions.AEMall_AdPositions(this, isEdit, ref p_Mall_AdPositions);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "属性", isEdit ? "编辑" : "添加" + "了名称为" + p_Mall_AdPositions.UniqueId + "的广告位置信息");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            return View(p_Mall_AdPositions ?? new Model.Mall_AdPositions());
        }

        [Role("广告位置管理", "删除广告位置")]
        public ContentResult DeleteMall_AdPositions(string ids)
        {
            return Content(b_BLL_Mall_AdPositions.DeleteMall_AdPositions(ids, null).ToString2().ToLower());
        }

        #endregion

        #region 广告信息

        [Role("广告信息管理", "广告信息列表")]
        public ActionResult Mall_AdInforList(int? Page, string AdPositionsUniqueId, string AI_Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Mall_AdInfor> _Pager = b_BLL_Mall_AdInfor.PagerList(Page, AdPositionsUniqueId, AI_Title);
            ViewData["Pager"] = _Pager;
            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("广告信息列表", "查询广告信息列表");

            #endregion

            return View();
        }

        [Role("广告信息管理", "添加/编辑广告信息")]
        public ActionResult AEMall_AdInfor(Model.Mall_AdInfor p_Mall_AdInfor)
        {
            bool isEdit = p_Mall_AdInfor.id != null;
            ViewData["isEdit"] = isEdit;
            if (IsGet && isEdit)
                try
                {
                    SetSaveFormCollection = b_BLL_Mall_AdInfor.NameValueCollectionEx(ref p_Mall_AdInfor);
                }
                catch { return RedirectToAction("Mall_AdInforList"); }
            if (IsPost)
                try
                {
                    b_BLL_Mall_AdInfor.AEMall_AdInfor(this, isEdit, ref p_Mall_AdInfor);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "属性", isEdit ? "编辑" : "添加" + "了名称为" + p_Mall_AdInfor.AI_Title + "的广告信息");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            return View(p_Mall_AdInfor ?? new Model.Mall_AdInfor());
        }

        [Role("广告信息管理", "删除广告信息")]
        public ContentResult DeleteMall_AdInfor(string ids)
        {
            return Content(b_BLL_Mall_AdInfor.DeleteMall_AdInfor(ids, null).ToString2().ToLower());
        }

        #endregion

        #endregion

        #region 单页面管理

        #region 单页面列表

        [Role("单页面管理", "单页面列表")]
        public ActionResult Mall_SinglePageList(int? Page, string SP_Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Mall_SinglePage> _Pager = b_BLL_Mall_SinglePage.PagerList(Page, SP_Title);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("单页面列表", "查询单页面列表");

            #endregion

            return View();
        }

        #endregion

        #region 添加/编辑单页面

        [Role("单页面管理", "添加/编辑单页面")]
        public ActionResult AEMall_SinglePage(Model.Mall_SinglePage p_Mall_SinglePage)
        {
            bool isEdit = p_Mall_SinglePage.id != null;
            ViewData["isEdit"] = isEdit;
            if (IsGet && isEdit)
                try
                {
                    SetSaveFormCollection = b_BLL_Mall_SinglePage.NameValueCollectionEx(ref p_Mall_SinglePage);
                }
                catch { return RedirectToAction("Mall_SinglePageList"); }
            if (IsPost)
                try
                {
                    b_BLL_Mall_SinglePage.AEMall_SinglePage(this, isEdit, ref p_Mall_SinglePage);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "单页面", isEdit ? "编辑" : "添加" + "了名称为" + p_Mall_SinglePage.SP_Title + "的单页面");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            return View(p_Mall_SinglePage);
        }

        #endregion

        #region 删除单页面

        [Role("单页面管理", "删除单页面")]
        public ContentResult DeleteMall_SinglePage(string ids)
        {
            return Content(b_BLL_Mall_SinglePage.DeleteMall_SinglePage(ids, null).ToString2().ToLower());
        }

        #endregion

        #endregion

        #region 导航菜单管理

        #region 导航菜单列表

        [Role("导航菜单管理", "导航菜单列表")]
        public ActionResult Mall_NavMenuList(int? Page, int? NM_Project, string NM_Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Mall_NavMenu> _Pager = b_BLL_Mall_NavMenu.PagerList(Page, NM_Project, NM_Title);
            ViewData["Pager"] = _Pager;
            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("导航菜单列表", "查询导航菜单列表");

            #endregion

            return View();
        }

        #endregion

        #region 添加/编辑导航菜单

        [Role("导航菜单管理", "添加/编辑导航菜单")]
        public ActionResult AEMall_NavMenu(Model.Mall_NavMenu p_Mall_NavMenu)
        {
            bool isEdit = p_Mall_NavMenu.id != null;
            ViewData["isEdit"] = isEdit;
            if (IsGet && isEdit)
                try
                {
                    SetSaveFormCollection = b_BLL_Mall_NavMenu.NameValueCollectionEx(ref p_Mall_NavMenu);
                }
                catch { return RedirectToAction("Mall_NavMenuList"); }
            if (IsPost)
                try
                {
                    b_BLL_Mall_NavMenu.AEMall_NavMenu(this, isEdit, ref p_Mall_NavMenu);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "导航菜单", isEdit ? "编辑" : "添加" + "了名称为" + p_Mall_NavMenu.NM_Title + "的导航菜单");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            return View(p_Mall_NavMenu);
        }

        #endregion

        #region 删除导航菜单

        [Role("导航菜单管理", "删除导航菜单")]
        public ContentResult DeleteMall_NavMenu(string ids)
        {
            return Content(b_BLL_Mall_NavMenu.DeleteMall_NavMenu(ids, null).ToString2().ToLower());
        }

        #endregion

        #endregion

        #region 友情链接

        #region 友情链接列表

        [Role("友情链接管理", "友情链接列表")]
        public ActionResult Mall_LinksList(int? Page, int? L_Project, int? L_Type, string L_Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Mall_Links> _Pager = b_BLL_Mall_Links.PagerList(Page, L_Project, L_Type, L_Title);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("友情链接列表", "查询友情链接列表");

            #endregion

            return View();
        }

        #endregion

        #region 添加/编辑友情链接

        [Role("友情链接管理", "添加/编辑友情链接")]
        public ActionResult AEMall_Links(Model.Mall_Links p_Mall_Links)
        {
            bool isEdit = p_Mall_Links.id != null;
            ViewData["isEdit"] = isEdit;
            if (IsGet && isEdit)
                try
                {
                    SetSaveFormCollection = b_BLL_Mall_Links.NameValueCollectionEx(ref p_Mall_Links);
                }
                catch { return RedirectToAction("Mall_LinksList"); }
            if (IsPost)
                try
                {
                    b_BLL_Mall_Links.AEMall_Links(this, isEdit, ref p_Mall_Links);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "友情链接", isEdit ? "编辑" : "添加" + "了名称为" + p_Mall_Links.L_Title + "的友情链接");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            return View(p_Mall_Links);
        }

        #endregion

        #region 删除友情链接

        [Role("友情链接管理", "删除友情链接")]
        public ContentResult DeleteMall_Links(string ids)
        {
            return Content(b_BLL_Mall_Links.DeleteMall_Links(ids, null).ToString2().ToLower());
        }

        #endregion

        #endregion

    }

}