/*
 * author:卢永列
 * date: 2014/2/20 20:10:24
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
    /// 工作信息表的逻辑层
    /// </summary> 
    public class WorkInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取工作信息表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回工作信息表实体</returns> 
        public WorkInfo GetItemById(Guid guid)
        {

            WorkInfo tem = new WorkInfo();

            tem = Dal.Find<WorkInfo>(WorkInfo._.ID == guid);
            return tem;
        }

       

        

        /// <summary>
        /// 分页获取获取工作信息表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string UserId, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {
            WhereClip wherenew = new WhereClip();
            if (!string.IsNullOrEmpty(UserId))
            {
                wherenew = wherenew && WorkHandLog._.DownEr == new Guid(UserId);
            }

            if (WhereClip.IsNullOrEmpty(where))
            {
                where = wherenew;

            }
            else
            {
                where = where && wherenew;
            }
            if (WhereClip.IsNullOrEmpty(where))
            {
                where.Append(@"  (handsequence is null or   handsequence = (select max(handsequence)  from [WorkHandLog] b where  [WorkInfo].[ID] = b.[WorkID])) ");

            }
            else
            {
                where.Append(@" and (handsequence is null or  handsequence = (select max(handsequence)  from [WorkHandLog] b where  [WorkInfo].[ID] = b.[WorkID]) )");
            }
            return Dal.From<WorkInfo>().Join<ShebeiInfo>(ShebeiInfo._.ID == WorkInfo._.SbID)
                .Join<WorkHandLog>(WorkInfo._.ID == WorkHandLog._.WorkID, JoinType.leftJoin)
                .Select(WorkInfo._.ID.All, ShebeiInfo._.Code, ShebeiInfo._.Name, ShebeiInfo._.GuiGe)
                .Where(where).OrderBy(orderby).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }

        /// <summary>
        /// 分页获取获取工作信息表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {

            WhereClip appendwhere = new WhereClip();
            appendwhere.Append("  (HandSequence is null or  HandSequence= (select max(HandSequence) from WorkHandLog where [WorkID]=[WorkInfo].[ID]))");

            return Dal.From<WorkInfo>().Join<ShebeiInfo>(ShebeiInfo._.ID == WorkInfo._.SbID)
                .Join<WorkHandLog>(WorkInfo._.ID == WorkHandLog._.WorkID && appendwhere, JoinType.leftJoin)
                .Select(WorkInfo._.ID.All, ShebeiInfo._.Code, ShebeiInfo._.Name, ShebeiInfo._.GuiGe)
                .Where(where).OrderBy(orderby).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }
        /// <summary>
        /// 保存工作信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的工作信息表集合</param>
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
        /// 保存工作信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的工作信息表集合</param>
        /// <returns></returns> 
        public int Save(WorkInfo item)
        {
            int result = 0;
            try
            {
                ShebeiInfo s = new ShebeiInfo();
                s.ID = item.SbID;
                s.RecordStatus = StatusType.update;
                s.State = "故障报修";
                result = Dal.Submit(item, s);

            }
            catch (Exception)
            {
                throw;

            }
            return result;
        }


        /// <summary>
        /// 根据ID删除工作信息表实体
        /// </summary>
        /// <param name="guid">工作信息表的主键ID</param>
        public void DelateById(Guid guid)
        {
            try
            {
                Dal.Delete<WorkInfo>(WorkInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public WorkInfo GetItemById(WhereClip where)
        {
            return Dal.Find<WorkInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<WorkInfo>(WorkInfo._.ID.In(IDS.Split(',')));
        }
        /// <summary>
        /// 根据条件获取待办任务
        /// </summary>
        /// <param name="p"></param>
        /// <param name="pageSize"></param>
        /// <param name="where"></param>
        /// <param name="orderByClip"></param>
        /// <param name="count"></param>
        /// <param name="recordCount"></param>
        /// <returns></returns>
        public DataTable GetDaiBanDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {
            WhereClip appendwhere = new WhereClip();
            appendwhere.Append("  (  HandSequence= (select max(HandSequence) from WorkHandLog where [WorkID]=[WorkInfo].[ID]))");

            return Dal.From<WorkHandLog>().Join<WorkInfo>(WorkInfo._.ID == WorkHandLog._.WorkID && appendwhere, JoinType.leftJoin)
                .Join<ShebeiInfo>(ShebeiInfo._.ID == WorkInfo._.SbID, JoinType.leftJoin)
                .Where(where && ShebeiInfo._.State != "正常").OrderBy(orderby)
                .Select(WorkHandLog._.ID.All,
                WorkInfo._.SbID, WorkInfo._.Address, WorkInfo._.ChuLiYiJian
                , WorkInfo._.CreaterName, WorkInfo._.CurrentUser, WorkInfo._.Guzhang, WorkInfo._.GuZhangXx
                , WorkInfo._.Note, WorkInfo._.PlanTime, WorkInfo._.RealTime, WorkInfo._.Status
                , WorkInfo._.Tel, WorkInfo._.City, WorkInfo._.Xian, WorkInfo._.Zhen
                , ShebeiInfo._.Code, ShebeiInfo._.Name, ShebeiInfo._.GuiGe, ShebeiInfo._.Note.Alias("SheBeiNote"))
                .ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);
        }

        /// <summary>
        /// 根据条件获取我的派工任务
        /// </summary>
        /// <param name="p"></param>
        /// <param name="pageSize"></param>
        /// <param name="where"></param>
        /// <param name="orderByClip"></param>
        /// <param name="count"></param>
        /// <param name="recordCount"></param>
        /// <returns></returns>
        public DataTable GetMyPaiGongDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {
            WhereClip appendwhere = new WhereClip();
            appendwhere.Append("  (  HandSequence= (select max(HandSequence) from WorkHandLog where [WorkID]=[WorkInfo].[ID]))");

            return Dal.From<WorkHandLog>().Join<WorkInfo>(WorkInfo._.ID == WorkHandLog._.WorkID && appendwhere, JoinType.leftJoin)
                .Join<ShebeiInfo>(ShebeiInfo._.ID == WorkInfo._.SbID, JoinType.leftJoin)
                .Where(where).OrderBy(orderby)
                .Select(WorkHandLog._.ID.All,
                WorkInfo._.SbID, WorkInfo._.Address, WorkInfo._.ChuLiYiJian
                , WorkInfo._.CreaterName, WorkInfo._.CurrentUser, WorkInfo._.GuZhangXx
                , WorkInfo._.Note, WorkInfo._.PlanTime, WorkInfo._.RealTime, WorkInfo._.Status
                , WorkInfo._.Tel, WorkInfo._.City, WorkInfo._.Xian, WorkInfo._.Zhen
                , ShebeiInfo._.Code, ShebeiInfo._.Name, ShebeiInfo._.GuiGe, ShebeiInfo._.Note.Alias("SheBeiNote"))
                .ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);
        }

        /// <summary>
        /// 根据条件获取报修设备
        /// </summary>
        /// <param name="p"></param>
        /// <param name="pageSize"></param>
        /// <param name="where"></param>
        /// <param name="orderByClip"></param>
        /// <param name="count"></param>
        /// <param name="recordCount"></param>
        /// <returns></returns>
        public DataTable GetGzDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {

            return Dal.From<WorkInfo>()
                .Join<ShebeiInfo>(ShebeiInfo._.ID == WorkInfo._.SbID)
                .Where(where).OrderBy(orderby)
                .Select(WorkInfo._.ID.All

                , ShebeiInfo._.Code, ShebeiInfo._.Name, ShebeiInfo._.GuiGe, ShebeiInfo._.Note.Alias("SheBeiNote"))
                .ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);
        }
        public DataTable GetDaiBanDataTable(WhereClip where, OrderByClip orderby)
        {
            return Dal.From<WorkHandLog>()
                .Where(where).OrderBy(orderby).ToDataTable();
        }

        public int GetMaxSequence(Guid workID)
        {
            int result = 1;
            object O = Dal.Max<WorkHandLog>(WorkHandLog._.WorkID == workID, WorkHandLog._.HandSequence);
            if (O is DBNull || O == null)
            {

            }
            else
            {
                result += (int)O;
            }
            return result;
        }

        public DataTable GetWorkInfo(string workid)
        {
            return Dal.From<WorkInfo>().Join<ShebeiInfo>(WorkInfo._.SbID == ShebeiInfo._.ID)
                .Where(WorkInfo._.ID == new Guid(workid))
                .Select(
                WorkInfo._.ChuLiYiJian,
                WorkInfo._.GuZhangXx,
                WorkInfo._.Status,
                ShebeiInfo._.Name.Alias("ShebeiName")

                ).ToDataTable();

        }

        public WorkHandLog GetLstWorkHandInfo(string workid)
        {
            WorkHandLog tem = Dal.From<WorkHandLog>()

                .Where(WorkHandLog._.WorkID == new Guid(workid))
                .OrderBy(WorkHandLog._.HandSequence).ToFirst<WorkHandLog>();
            return tem;

        }
    }


}