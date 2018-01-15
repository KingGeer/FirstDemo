using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DealMvc.Controllers
{
    /// <summary>
    /// 登录相关
    /// </summary>
    public class CmsController : ControllerBase
    {

        #region 后台登陆页面

        /// <summary>
        /// 后台登陆页面
        /// </summary>
        /// <param name="username"></param>
        /// <param name="userpwd"></param>
        /// <param name="usercode"></param>
        /// <returns></returns>
        public ActionResult Index(string username, string userpwd, string usercode)
        {
            if (IsPost)
            {
                try
                {
                    string code = DealMvc.Common.Globals.getCode();

                    if (code.ToLower() != usercode.ToLower())
                    {
                        throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("验证码不正确");
                    }

                    DealMvc.Common.Net.CreateParameter _C = new Common.Net.CreateParameter();
                    _C.CanShu.Add("@A_UserName", System.Data.SqlDbType.NVarChar, username);
                    _C.CanShu.Add("@A_Loginpwd", System.Data.SqlDbType.NVarChar, DealMvc.Common.Net.DealString.MD5(userpwd));

                    List<Model.Base_Admins> m_AdminList = DealMvc.Orm.EntityCore<DealMvc.Model.Base_Admins>.GetModelList("A_UserName=@A_UserName and A_Loginpwd=@A_Loginpwd", _C.Re_SqlParameter()).List;

                    if (m_AdminList.Count == 0)
                    {
                        throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("帐号或密码不正确");
                    }
                    else if (m_AdminList[0].A_IsLock)
                    {
                        throw new DealMvc.Common.ExceptionEx.MyExceptionMessageBox("账号已经被锁定了，不能再登录了。");
                    }

                    //跟新帐号的登录时间
                    m_AdminList[0].UpTime = DateTime.Now;

                    DealMvc.Orm.EntityCore<DealMvc.Model.Base_Admins>.Update(m_AdminList[0]);

                    DealMvc.Common.Globals.setAdminName(m_AdminList[0].A_UserName);

                    return RedirectToAction("do");
                }
                catch (DealMvc.Common.ExceptionEx.MyExceptionMessageBox cex)
                {
                    ViewData["AlertMessage"] = cex.Message;
                }
                catch (Exception ce)
                {
                    DealMvc.Common.ExceptionEx.MyExceptionLog.WriteLog(this, ce);
                }
            }

            return View();
        }

        #endregion

        #region 后台主业

        /// <summary>
        /// 后台主业
        /// </summary>
        /// <returns></returns>
        public ActionResult Do()
        {
            try
            {
                if (!DealMvc.Common.Globals.isAdminLogin())
                {
                    return RedirectToAction("Index");
                }

                Model.Base_Admins m_XShop_Admins = Model.Base_Admins.GetModel(t => t.A_UserName == DealMvc.Common.Globals.getAdminName());

                if (m_XShop_Admins == null || m_XShop_Admins.IsNull)
                {
                    return RedirectToAction("index");
                }

                ViewData["model"] = m_XShop_Admins;
            }
            catch { }

            return View();
        }

        #endregion

        #region 注销

        /// <summary>
        /// 注销
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            DealMvc.Common.Globals.setAdminName("");
            return RedirectToAction("index");
        }

        #endregion

        #region 没有权限提示页面

        /// <summary>
        /// 没有权限提示页面
        /// </summary>
        /// <returns></returns>
        public ActionResult NoAuthorize()
        {
            return View();
        }

        #endregion

        #region 清空所有的数据缓存

        /// <summary>
        /// 清空所有的数据缓存
        /// </summary>
        /// <returns></returns>
        public ContentResult ClearWebCache()
        {
            if (IsPost)
            {
                try
                {
                    //数据缓存
                    Common.WebCache.Clear();
                }
                catch { return Content("0"); }
                return Content("1");
            }
            return Content("0");
        }

        #endregion

    }
}
