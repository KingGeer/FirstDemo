using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace DealMvc
{
    /// <summary>
    /// WebService基类
    /// </summary>
    public class WebService : System.Web.Services.WebService
    {

        #region 将数据转换为Json格式

        /// <summary>
        /// 将数据转换为Json格式
        /// </summary>
        [Serializable]
        public class ReJson
        {
            public ReJson()
            {
            }

            public ReJson(int ret, string retmsg)
            {
                this.ret = ret;
                this.retmsg = retmsg;
                moredata = false;
            }

            /// <summary>
            /// 判断是否成功:成功1，失败0
            /// </summary>
            private int ret;

            /// <summary>
            /// 返回消息
            /// </summary>
            private string retmsg;

            /// <summary>
            /// 是否还有下一页
            /// </summary>
            private bool moredata;

            /// <summary>
            /// 下一页是否有数据(只针对分页数据)
            /// </summary>
            /// <returns></returns>
            public bool getMoredata()
            {
                return moredata;
            }

            /// <summary>
            /// 下一页是否有数据(只针对分页数据)
            /// </summary>
            /// <returns></returns>
            public void setMoredata(bool moredata)
            {
                this.moredata = moredata;
            }

            /// <summary>
            /// 判断是否成功(1成0失败)
            /// </summary>
            /// <returns></returns>
            public int getRet()
            {

                return this.ret;
            }

            /// <summary>
            /// 判断是否成功(1成0失败)
            /// </summary>
            /// <returns></returns>
            public void setRet(int ret)
            {
                this.ret = ret;
            }

            /// <summary>
            /// 返回Json数据
            /// </summary>
            /// <returns></returns>
            public string getRetMsg()
            {
                return this.retmsg;
            }

            /// <summary>
            /// 返回Json数据
            /// </summary>
            /// <returns></returns>
            public void setRetMsg(string retmsg)
            {
                this.retmsg = retmsg;
            }

        }

        #endregion

        #region 通过Header验证访问是否被授权

        /// <summary>
        /// 通过Header验证访问是否被授权
        /// </summary>
        public class MySoapHeader : System.Web.Services.Protocols.SoapHeader
        {
            private string _token = string.Empty;//webservice访问用户名  

            public string Token
            {
                get { return _token; }
                set { _token = value; }
            }

            public MySoapHeader()
            {
                //  
                //TODO: 在此处添加构造函数逻辑  
                //  
            }
            public MySoapHeader(string token)
            {
                init(token);
            }
            private void init(string token)
            {
                this._token = token;
            }

            //验证用户是否有权访问内部接口  
            public bool isValid(string UserId, string PswdMd5, string Token)
            {

                //判断Token解密出来的UserId与传入的UserId是否相同
                if (UserId.ToString().Equals(Encrype.DecrypeDES(Token, PswdMd5)))
                    return true;
                return false;
            }
        }

        #endregion

        #region 加密类

        public class Encrype
        {

            //默认密钥向量        
            private static byte[] Keys = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

            /// <summary>   
            /// DES加密字符串   
            /// </summary>  
            /// <param name="encryptString">待加密的字符串</param>       
            /// <param name="encryptKey">加密密钥,要求为8位</param>   
            /// <returns>加密成功返回加密后的字符串，失败返回源串</returns> 
            public static string EncrypeDES(string encryptString, string encryptKey)
            {
                try
                {
                    byte[] rgbKey = Encoding.UTF8.GetBytes(encryptKey.Substring(0, 8));
                    byte[] rgbIV = Keys;
                    byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
                    DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
                    MemoryStream mStream = new MemoryStream();
                    CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                    cStream.Write(inputByteArray, 0, inputByteArray.Length);
                    cStream.FlushFinalBlock();
                    return Convert.ToBase64String(mStream.ToArray());
                }
                catch
                {
                    return encryptString;
                }
            }

            /// <summary>   
            /// DES解密字符串       
            /// </summary>   
            /// <param name="decryptString">待解密的字符串</param>   
            /// <param name="decryptKey">解密密钥,要求为8位,和加密密钥相同</param>   
            /// <returns>解密成功返回解密后的字符串，失败返源串</returns> 
            public static string DecrypeDES(string decryptString, string decryptKey)
            {
                try
                {
                    byte[] rgbKey = Encoding.UTF8.GetBytes(decryptKey.Substring(0, 8));
                    byte[] rgbIV = Keys; byte[] inputByteArray = Convert.FromBase64String(decryptString);
                    DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider(); MemoryStream mStream = new MemoryStream();
                    CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                    cStream.Write(inputByteArray, 0, inputByteArray.Length);
                    cStream.FlushFinalBlock();
                    return Encoding.UTF8.GetString(mStream.ToArray());
                }
                catch
                {
                    return decryptString;
                }
            }
        }

        #endregion
    }
}