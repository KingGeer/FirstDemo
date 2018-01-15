using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DealMvc.Filter;

namespace DealMvc.Controllers
{
    [ControlInfo("管理员模块")]
    public class CmsAdminsController : ControllerBase
    {

        #region 业务逻辑

        /// <summary>
        /// 实例化 管理员业务逻辑
        /// </summary>
        public BLL.BLL_Base_Admins b_BLL_Base_Admins = new BLL.BLL_Base_Admins();


        /// <summary>
        /// 实例化 角色业务逻辑
        /// </summary>
        public BLL.BLL_Base_RoleCate b_BLL_M_RoleCate = new BLL.BLL_Base_RoleCate();

        /// <summary>
        /// 实例化 管理员操作日志业务逻辑
        /// </summary>
        public BLL.BLL_Base_AdminsLog b_BLL_Base_AdminsLog = new BLL.BLL_Base_AdminsLog();

        /// <summary>
        /// 当前登录管理员
        /// </summary>
        public Model.Base_Admins loginAdmins = DealMvc.BLL.BLL_Base_Admins.GetLoginAdmins();

        #endregion

        #region 角色管理

        #region 角色列表

        [Role("角色管理", "角色列表")]
        public ActionResult Base_RoleCateList(int? Page, string RC_Name, int? CompanyId)
        {

            DealMvc.Orm.PagerEx.Pager<Model.Base_RoleCate> _Pager = b_BLL_M_RoleCate.PagerList(Page, RC_Name);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("角色列表", "查看角色列表");

            #endregion

            return View(loginAdmins);
        }

        #endregion

        #region 添加/编辑角色

        [Role("角色管理", "添加/编辑角色")]
        public ActionResult AEBase_RoleCate(Model.Base_RoleCate p_M_RoleCate, string[] RC_Powervalues)
        {
            bool isEdit = p_M_RoleCate.id != null;

            ViewData["isEdit"] = isEdit;

            if (IsGet && isEdit)
            {
                try
                {
                    SetSaveFormCollection = b_BLL_M_RoleCate.NameValueCollectionEx(ref p_M_RoleCate);
                }
                catch { return RedirectToAction("M_RoleCateList"); }
            }

            if (IsPost)
            {
                try
                {

                    b_BLL_M_RoleCate.AEM_RoleCate(this, isEdit, ref p_M_RoleCate, RC_Powervalues);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "属性", isEdit ? "编辑" : "添加" + "了名称为" + p_M_RoleCate.RC_Name + "的角色信息");

                    #endregion

                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            }

            return View(loginAdmins);
        }

        #endregion

        #region 删除角色

        [Role("角色管理", "删除角色")]
        public ContentResult DeleteM_RoleCate(string ids)
        {
            return Content(b_BLL_M_RoleCate.DeleteM_RoleCate(ids, null).ToString2().ToLower());
        }

        #endregion

        #endregion

        #region 管理员管理

        #region 管理员列表

        [Role("管理员管理", "管理员列表")]
        public ActionResult Base_AdminsList(int? Page, int? RoleCateId, string A_UserName, string A_RealName, string A_Sex, string A_Mobilenumber)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Base_Admins> _Pager = b_BLL_Base_Admins.PagerList(Page, RoleCateId, A_UserName, A_RealName, A_Sex, A_Mobilenumber);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("管理员列表", "查看管理员列表");

            #endregion

            return View(loginAdmins);
        }

        #endregion

        #region 添加/编辑管理员

        [Role("管理员管理", "添加/编辑管理员")]
        public ActionResult AEBase_Admins(Model.Base_Admins p_Base_Admins, string[] A_Powervalues, string[] StoreInforId)
        {
            bool isEdit = p_Base_Admins.id != null;

            ViewData["isEdit"] = isEdit;

            if (IsGet && isEdit)
            {
                try
                {
                    SetSaveFormCollection = b_BLL_Base_Admins.NameValueCollectionEx(ref p_Base_Admins);
                }
                catch { return RedirectToAction("Base_AdminsList"); }
            }

            if (IsPost)
            {
                try
                {
                    b_BLL_Base_Admins.AEBase_Admins(this, isEdit, ref p_Base_Admins, A_Powervalues, StoreInforId);

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog(isEdit ? "编辑" : "添加" + "属性", isEdit ? "编辑"

: "添加" + "了账号为" + p_Base_Admins.A_UserName + "的管理员信息");

                    #endregion


                    if (!isEdit) return ViewAndEmpty();
                }
                catch (Exception ce) { IsSaveForm = true; DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce); }
            }

            ViewData["Admins"] = loginAdmins;


            return View(p_Base_Admins);
        }

        #endregion

        //#region 删除管理员

        //[Role("删除管理员", Description = "删除管理员", IsAuthorize = true)]
        //public ContentResult DeleteBase_Admins(string ids)
        //{
        //    return Content(b_BLL_Base_Admins.DeleteBase_Admins(ids, null).ToString2().ToLower());
        //}

        //#endregion

        #region 账号锁定

        /// <summary>
        /// 账号锁定
        /// </summary>
        /// <param name="id">编号</param>
        /// <param name="Page">页码</param>
        /// <returns></returns>
        [Role("管理员管理", "账号锁定")]
        public ActionResult Lock(int? id, int? Page)
        {
            Model.Base_Admins m_Base_Admins = Model.Base_Admins.GetModel(id);

            m_Base_Admins.A_IsLock = true;

            m_Base_Admins.Update();

            Common.ExceptionEx.MyExceptionLog.AlertMessage(this, "锁定成功", true);

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("账号锁定", "对账号" + m_Base_Admins.A_RealName + "进行了锁定操作。");

            #endregion


            return RedirectToAction("Base_AdminsList", new { Page = Page });
        }

        #endregion

        #region 账号解锁

        /// <summary>
        /// 账号解锁
        /// </summary>
        /// <param name="id">编号</param>
        /// <param name="Page">页码</param>
        /// <returns></returns>
        [Role("管理员管理", "账号解锁")]
        public ActionResult Unlock(int? id, int? Page)
        {
            Model.Base_Admins m_Base_Admins = Model.Base_Admins.GetModel(id);

            m_Base_Admins.A_IsLock = false;

            m_Base_Admins.Update();

            Common.ExceptionEx.MyExceptionLog.AlertMessage(this, "解锁成功", true);


            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("解锁成功", "对账号" + m_Base_Admins.A_RealName + "进行了解锁操作。");

            #endregion

            return RedirectToAction("Base_AdminsList", new { Page = Page });
        }

        #endregion

        #region 修改帐号密码

        [Role("管理员管理", "修改帐号密码")]
        public ActionResult EAdminPwd(int? a_i_id, string AdminPwd, string AdminPwd2)
        {

            if (!loginAdmins.IsNull)
            {
                NameValueCollectionEx _NameValueCollectionEx = new NameValueCollectionEx();
                _NameValueCollectionEx.Add("A_UserName", loginAdmins.A_UserName);

                SetSaveFormCollection = _NameValueCollectionEx;
            }

            if (IsPost)
            {
                try
                {
                    if (loginAdmins.IsNull)
                    {
                        throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("修改密码失败,请稍候在试");
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(AdminPwd) || AdminPwd != AdminPwd2)
                        {
                            throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("两次输入密码不一致");
                        }
                        else
                        {

                            loginAdmins.A_Loginpwd = Common.Net.DealString.MD5(AdminPwd);
                            loginAdmins.Update();

                            throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("修改密码成功");

                        }
                    }
                }
                catch (Exception ce)
                {
                    DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce);
                }
            }

            return View(loginAdmins);
        }

        #endregion

        #region 修改个人信息

        [Role("管理员管理", "修改个人信息")]
        public ActionResult UpDateInfo(Model.Base_Admins p_XShop_Admins)
        {
            try
            {
                Model.Base_Admins m_XShop_Admins = BLL.BLL_Base_Admins.GetLoginAdmins();

                if (m_XShop_Admins == null || m_XShop_Admins.IsNull)
                {
                    throw new Common.ExceptionEx.MyExceptionMessageBox("你没有权限操作!");

                }

                if (IsPost && p_XShop_Admins != null)
                {
                    m_XShop_Admins.A_RealName = p_XShop_Admins.A_RealName;        //A_RealName[Type=string] -  真实姓名
                    m_XShop_Admins.A_Sex = p_XShop_Admins.A_Sex;        //A_Sex[Type=string] - 性别
                    m_XShop_Admins.A_Mobilenumber = p_XShop_Admins.A_Mobilenumber;        //A_MobileNumber[Type=string] - 手机号码
                    m_XShop_Admins.A_Remarks = p_XShop_Admins.A_Remarks;        //A_Remarks[Type=string] - 备注
                    m_XShop_Admins.OrderNum = p_XShop_Admins.OrderNum ?? 1;        //A_Sort[Type=int?] - 排序
                    m_XShop_Admins.UpTime = p_XShop_Admins.UpTime ?? DateTime.Now;        //A_Time[Type=DateTime?] - 时间
                    m_XShop_Admins.Update();

                    #region 添加操作日志

                    BLL.BLL_Base_AdminsLog.AddAdminsLog("修改个人信息", "管理员" + m_XShop_Admins.A_RealName + "修改了个人的信息");
                    #endregion

                    throw new Common.ExceptionEx.MyExceptionMessageBox("更新资料成功!");


                }
            }
            catch (Exception ce)
            {
                Common.ExceptionEx.MyExceptionLog.AlertMessage(this, ce.Message, true);

                if (Request.UrlReferrer != null)
                {
                    return Redirect(Request.UrlReferrer.ToString());
                }
            }

            return View();
        }

        #endregion

        #region 获取帐号类型的权限值

        /// <summary>
        /// 获取帐号类型的权限值
        /// </summary>
        /// <returns></returns>
        public ContentResult GetAdminPowerValues(int? sort_id)
        {
            string output = "";
            try
            {
                output = Orm.EntityCore<Model.Base_RoleCate>.GetModel(sort_id ?? 0).RC_Powervalues;
            }
            catch { }
            return Content(output);
        }

        #endregion

        #region 恢复帐号权限

        public ContentResult ReQX(string ids)
        {
            string output = "0";
            try
            {
                SqlTranEx.SqlTranExtensions _SqlTranExtensions = new SqlTranEx.SqlTranExtensions();
                if (IsPost)
                {
                    string[] _ids = ids.Split(',');
                    for (int i = 0; i < _ids.Length; i++)
                    {
                        int id = _ids[i].ToInt32();
                        Model.Base_Admins m_Admin = Orm.EntityCore<Model.Base_Admins>.GetModel(id);
                        if (m_Admin.IsNull) { output = "0"; break; }
                        m_Admin.A_Powervalues = m_Admin.Base_RoleCate.RC_Powervalues;
                        Orm.EntityCore<Model.Base_Admins>.Update(m_Admin, _SqlTranExtensions);
                    }
                }
                _SqlTranExtensions.ExecuteSqlTran();
                output = "1";
            }
            catch { }
            return Content(output);
        }

        #endregion

        #endregion

        #region 操作日志列表

        [Role("操作日志管理", "管理员操作日志列表")]
        public ActionResult Base_AdminsLogList(int? Page, string AdminsName, string AL_Title)
        {
            DealMvc.Orm.PagerEx.Pager<Model.Base_AdminsLog> _Pager = b_BLL_Base_AdminsLog.PagerList(Page, ViewData["ProvinceId"].ToInt32(), ViewData["CityId"].ToInt32(), ViewData["RegionalId"].ToInt32(), ViewData["TownId"].ToInt32(), ViewData["VillageId"].ToInt32(), ViewData["StoreInforId"].ToInt32(), AdminsName, AL_Title);

            ViewData["Pager"] = _Pager;

            IsSaveForm = true;

            #region 添加操作日志

            BLL.BLL_Base_AdminsLog.AddAdminsLog("管理员操作日志列表", "查看管理员操作日志列表");

            #endregion

            return View(loginAdmins);
        }

        #endregion
    }

}