/*
 * author:卢永列
 * date: 2014/2/22 20:29:16
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
    /// 日志信息表的逻辑层
    /// </summary> 
    public class DayLogManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取日志信息表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回日志信息表实体</returns> 
        public DayLog GetItemById(Guid guid)
        {
            DayLog tem = new DayLog();
            tem = Dal.Find<DayLog>(DayLog._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取日志信息表集合
        /// </summary>
        /// <returns></returns> 
        public List<DayLog> GetList()
        {
            List<DayLog> tem = new List<DayLog>();
            tem = Dal.From<DayLog>().List<DayLog>();
            return tem;
        }

        /// <summary>
        /// 获取日志信息表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<DayLog>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取日志信息表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<DayLog>().Where(where).OrderBy(orderby).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存日志信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的日志信息表集合</param>
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
        /// 保存日志信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的日志信息表集合</param>
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
        /// 根据ID删除日志信息表实体
        /// </summary>
        /// <param name="guid">日志信息表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<DayLog>(DayLog._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public DayLog GetItemById(WhereClip where)
        {
            return Dal.Find<DayLog>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<DayLog>(DayLog._.ID.In(IDS.Split(',')));
        }

        public bool ExitDayLog(DayLog entity)
        {
            return Dal.Exists<DayLog>(DayLog._.ID != entity.ID && DayLog._.UserID == entity.UserID && DayLog._.WordDate == entity.WordDate);
        }
    }


}