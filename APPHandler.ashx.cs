using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DealMvc
{
    /// <summary>
    /// APPHandler 的摘要说明
    /// </summary>
    public class APPHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain"; 
            string callbackMethodName = context.Request.Params["jsoncallback"]; 
            string u = context.Request["u"]; 
            string p = context.Request["p"]; 
            string result = callbackMethodName + "({\"id\":" + "\"1\"})"; 
            context.Response.Write(result);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}