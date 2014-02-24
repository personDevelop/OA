/*
 * author:卢永列
 * date: 2014/2/22 22:54:01
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
    /// 员工考勤的逻辑层
    /// </summary> 
    public class YuanGongKaoQinManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取员工考勤实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回员工考勤实体</returns> 
        public YuanGongKaoQin GetItemById(Guid guid)
        {
            YuanGongKaoQin tem = new YuanGongKaoQin();
            tem = Dal.Find<YuanGongKaoQin>(YuanGongKaoQin._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取员工考勤集合
        /// </summary>
        /// <returns></returns> 
        public List<YuanGongKaoQin> GetList()
        {
            List<YuanGongKaoQin> tem = new List<YuanGongKaoQin>();
            tem = Dal.From<YuanGongKaoQin>().List<YuanGongKaoQin>();
            return tem;
        }

        /// <summary>
        /// 获取员工考勤datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable(DateTime kaoqindate)
        {
            return Dal.From<PersonInfo>().Join<YuanGongKaoQin>(PersonInfo._.ID == YuanGongKaoQin._.UserID && YuanGongKaoQin._.KQRQ == kaoqindate
                , JoinType.leftJoin)
                .Select(PersonInfo._.RealName, PersonInfo._.ID.Alias("PersonID"), YuanGongKaoQin._.ID.All)

                .OrderBy(PersonInfo._.RealName)
                .ToDataTable();
        }

        /// <summary>
        /// 分页获取获取员工考勤datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<YuanGongKaoQin>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存员工考勤实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的员工考勤集合</param>
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
        /// 保存员工考勤实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的员工考勤集合</param>
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
        /// 根据ID删除员工考勤实体
        /// </summary>
        /// <param name="guid">员工考勤的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<YuanGongKaoQin>(YuanGongKaoQin._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public YuanGongKaoQin GetItemById(WhereClip where)
        {
            return Dal.Find<YuanGongKaoQin>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<YuanGongKaoQin>(YuanGongKaoQin._.ID.In(IDS.Split(',')));
        }

    }


}