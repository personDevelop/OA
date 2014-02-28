/*
 * author:卢永列
 * date: 2014/2/28 13:27:03
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sharp.Data;
using System.Data.Common;
using System.Data;
using Sharp.Common;
using OAEntity;

namespace OAManager
{
    /// <summary>
    /// 员工设置的逻辑层
    /// </summary> 
    public class UserSetManager : BaseManager
    { 
        /// <summary>
        /// 根据ID获取员工设置实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回员工设置实体</returns> 
        public UserSet GetItemById()
        {
            UserSet tem = new UserSet();
            tem = Dal.From<UserSet>().ToFirst<UserSet>();
            return tem;
        } 
        /// <summary>
        /// 保存员工设置实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的员工设置集合</param>
        /// <returns></returns> 
        public int Save(Sharp.Common.BaseEntity item)
        {
            
            int result = 0;
            try
            {
                result = Dal.Submit(item);

            }
            catch (Exception)
            {
                throw;

            }
            return result;
        }

    }



}