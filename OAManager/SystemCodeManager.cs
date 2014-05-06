/*
 * author:卢永列
 * date: 2014/2/20 21:02:25
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
    /// 系统参数表的逻辑层
    /// </summary> 
    public class SystemCodeManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取系统参数表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回系统参数表实体</returns> 
        public SystemCode GetItemById(Guid guid)
        {
            SystemCode tem = new SystemCode();
            tem = Dal.Find<SystemCode>(SystemCode._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取系统参数表集合
        /// </summary>
        /// <returns></returns> 
        public List<SystemCode> GetList()
        {
            List<SystemCode> tem = new List<SystemCode>();
            tem = Dal.From<SystemCode>().List<SystemCode>();
            return tem;
        }

        /// <summary>
        /// 获取系统参数表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<SystemCode>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取系统参数表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<SystemCode>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存系统参数表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的系统参数表集合</param>
        /// <returns></returns> 
        public int Save(List<Sharp.Common.BaseEntity> list)
        {
            DbTransaction tr = Dal.BeginTransaction();
            int result = 0;
            try
            {
                result = Dal.Submit(tr, list);

                Dal.CommitTransaction(tr);

            }
            catch (Exception)
            {
                Dal.RollbackTransaction(tr);
                throw;

            }
            return result;
        }

        /// <summary>
        /// 保存系统参数表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的系统参数表集合</param>
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


        /// <summary>
        /// 根据ID删除系统参数表实体
        /// </summary>
        /// <param name="guid">系统参数表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<SystemCode>(SystemCode._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public SystemCode GetItemById(WhereClip where)
        {
            return Dal.Find<SystemCode>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<SystemCode>(SystemCode._.ID.In(IDS.Split(',')));
        }
        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(SystemCode entity)
        {
            return Dal.Exists<SystemCode>(SystemCode._.ID != entity.ID && (SystemCode._.Code == entity.Code || SystemCode._.Name == entity.Name));
        }

        internal SystemCode GetItemByCode(string code)
        {
            return Dal.Find<SystemCode>(SystemCode._.Code ==  code );
   
        }












       
    }


}