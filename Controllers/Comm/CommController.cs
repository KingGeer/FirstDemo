using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Text;
using System.IO;
using DealMvc.Common.Config;

namespace DealMvc.Controllers
{
    /// <summary>
    /// 公用类
    /// </summary>
    public class CommController : ControllerBase
    {
        #region 快递接口

        #region 快递类型转换

        /// <summary>
        /// 快递类型转换
        /// </summary>
        /// <param name="typeCom"></param>
        /// <returns></returns>
        public string TypeChange(string typeCom)
        {
            if (typeCom == "AAE全球专递")
            {
                typeCom = "aae";
            }
            if (typeCom == "安捷快递")
            {
                typeCom = "anjiekuaidi";
            }
            if (typeCom == "安信达快递")
            {
                typeCom = "anxindakuaixi";
            }
            if (typeCom == "百福东方")
            {
                typeCom = "baifudongfang";
            }
            if (typeCom == "彪记快递")
            {
                typeCom = "biaojikuaidi";
            }
            if (typeCom == "BHT")
            {
                typeCom = "bht";
            }
            if (typeCom == "BHT")
            {
                typeCom = "bht";
            }
            if (typeCom == "希伊艾斯快递")
            {
                typeCom = "cces";
            }
            if (typeCom == "中国东方")
            {
                typeCom = "Coe";
            }
            if (typeCom == "长宇物流")
            {
                typeCom = "changyuwuliu";
            }
            if (typeCom == "大田物流")
            {
                typeCom = "datianwuliu";
            }
            if (typeCom == "德邦物流")
            {
                typeCom = "debangwuliu";
            }
            if (typeCom == "DPEX")
            {
                typeCom = "dpex";
            }
            if (typeCom == "DHL")
            {
                typeCom = "dhl";
            }
            if (typeCom == "D速快递")
            {
                typeCom = "dsukuaidi";
            }
            if (typeCom == "fedex")
            {
                typeCom = "fedex";
            }
            if (typeCom == "飞康达物流")
            {
                typeCom = "feikangda";
            }
            if (typeCom == "凤凰快递")
            {
                typeCom = "fenghuangkuaidi";
            }
            if (typeCom == "港中能达物流")
            {
                typeCom = "ganzhongnengda";
            }
            if (typeCom == "广东邮政物流")
            {
                typeCom = "guangdongyouzhengwuliu";
            }
            if (typeCom == "汇通快运")
            {
                typeCom = "huitongkuaidi";
            }
            if (typeCom == "恒路物流")
            {
                typeCom = "hengluwuliu";
            }
            if (typeCom == "华夏龙物流")
            {
                typeCom = "huaxialongwuliu";
            }
            if (typeCom == "佳怡物流")
            {
                typeCom = "jiayiwuliu";
            }
            if (typeCom == "京广速递")
            {
                typeCom = "jinguangsudikuaijian";
            }
            if (typeCom == "急先达")
            {
                typeCom = "jixianda";
            }
            if (typeCom == "佳吉物流")
            {
                typeCom = "jiajiwuliu";
            }
            if (typeCom == "加运美")
            {
                typeCom = "jiayunmeiwuliu";
            }
            if (typeCom == "快捷速递")
            {
                typeCom = "kuaijiesudi";
            }
            if (typeCom == "联昊通物流")
            {
                typeCom = "lianhaowuliu";
            }
            if (typeCom == "龙邦物流")
            {
                typeCom = "longbanwuliu";
            }
            if (typeCom == "民航快递")
            {
                typeCom = "minghangkuaidi";
            }
            if (typeCom == "配思货运")
            {
                typeCom = "peisihuoyunkuaidi";
            }
            if (typeCom == "全晨快递")
            {
                typeCom = "quanchenkuaidi";
            }
            if (typeCom == "全际通物流")
            {
                typeCom = "quanjitong";
            }
            if (typeCom == "全日通快递")
            {
                typeCom = "quanritongkuaidi";
            }
            if (typeCom == "全一快递")
            {
                typeCom = "quanyikuaidi";
            }
            if (typeCom == "盛辉物流")
            {
                typeCom = "shenghuiwuliu";
            }
            if (typeCom == "速尔物流")
            {
                typeCom = "suer";
            }
            if (typeCom == "盛丰物流")
            {
                typeCom = "shengfengwuliu";
            }
            if (typeCom == "天地华宇")
            {
                typeCom = "tiandihuayu";
            }
            if (typeCom == "天天快递")
            {
                typeCom = "tiantian";
            }
            if (typeCom == "TNT")
            {
                typeCom = "tnt";
            }
            if (typeCom == "UPS")
            {
                typeCom = "ups";
            }
            if (typeCom == "万家物流")
            {
                typeCom = "wanjiawuliu";
            }
            if (typeCom == "文捷航空速递")
            {
                typeCom = "wenjiesudi";
            }
            if (typeCom == "伍圆速递")
            {
                typeCom = "wuyuansudi";
            }
            if (typeCom == "万象物流")
            {
                typeCom = "wanxiangwuliu";
            }
            if (typeCom == "新邦物流")
            {
                typeCom = "xinbangwuliu";
            }
            if (typeCom == "信丰物流")
            {
                typeCom = "xinfengwuliu";
            }
            if (typeCom == "星晨急便")
            {
                typeCom = "xingchengjibian";
            }
            if (typeCom == "鑫飞鸿物流")
            {
                typeCom = "xinhongyukuaidi";
            }
            if (typeCom == "亚风速递")
            {
                typeCom = "yafengsudi";
            }
            if (typeCom == "一邦速递")
            {
                typeCom = "yibangwuliu";
            }
            if (typeCom == "优速物流")
            {
                typeCom = "youshuwuliu";
            }
            if (typeCom == "远成物流")
            {
                typeCom = "yuanchengwuliu";
            }
            if (typeCom == "圆通速递")
            {
                typeCom = "yuantong";
            }
            if (typeCom == "源伟丰快递")
            {
                typeCom = "yuanweifeng";
            }
            if (typeCom == "元智捷诚快递")
            {
                typeCom = "yuanzhijiecheng";
            }
            if (typeCom == "越丰物流")
            {
                typeCom = "yuefengwuliu";
            }
            if (typeCom == "韵达快递")
            {
                typeCom = "yunda";
            }
            if (typeCom == "源安达")
            {
                typeCom = "yuananda";
            }
            if (typeCom == "运通快递")
            {
                typeCom = "yuntongkuaidi";
            }
            if (typeCom == "宅急送")
            {
                typeCom = "zhaijisong";
            }
            if (typeCom == "中铁快运")
            {
                typeCom = "zhongtiewuliu";
            }
            if (typeCom == "中通速递")
            {
                typeCom = "zhongtong";
            }
            if (typeCom == "中邮物流")
            {
                typeCom = "zhongyouwuliu";
            }

            return typeCom;
        }




        #endregion

        #region 返回运单详情

        /// <summary>
        /// 返回运单详情
        /// </summary>
        /// <param name="typeCom">快递公司</param>
        /// <param name="nu">运单号</param>
        /// <returns></returns>
        public string KuaiDiAPINoVali(string typeCom, string nu)
        {

            DealMvc.Common.Config.KuaiDi100Info m_KuaiDi100Info = ConfigInfo<KuaiDi100Info>.Instance();

            //请把ea81cb6341791a62修改成您在快递100网站申请的APIKey
            string ApiKey = m_KuaiDi100Info.ApiKey;

            string powered = "快递数据由: <a href=\"http://www.kuaidi100.com/\" target=\"_blank\">快递100</a> 提供";
            string apiurl = "http://api.kuaidi100.com/api?id=" + ApiKey + "&com=" + TypeChange(typeCom) + "&nu=" + nu + "&show=2&muti=1&order=asc";
            //Response.Write (apiurl);
            WebRequest request = WebRequest.Create(@apiurl);
            WebResponse response = request.GetResponse();
            Stream stream = response.GetResponseStream();
            Encoding encode = Encoding.UTF8;
            StreamReader reader = new StreamReader(stream, encode);
            string detail = reader.ReadToEnd();

            return (detail + "<br/>" + powered).ToString2();
        }

        #endregion

        #endregion
    }

}