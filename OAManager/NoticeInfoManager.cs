/*
 * author:卢永列
 * date: 2014/2/27 11:20:43
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
    /// 公告信息的逻辑层
    /// </summary> 
    public class NoticeInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取公告信息实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回公告信息实体</returns> 
        public NoticeInfo GetItemById(Guid guid)
        {
            NoticeInfo tem = new NoticeInfo();
            tem = Dal.Find<NoticeInfo>(NoticeInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取公告信息集合
        /// </summary>
        /// <returns></returns> 
        public List<NoticeInfo> GetList()
        {
            List<NoticeInfo> tem = new List<NoticeInfo>();
            tem = Dal.From<NoticeInfo>().List<NoticeInfo>();
            return tem;
        }

        /// <summary>
        /// 获取公告信息datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<NoticeInfo>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取公告信息datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<NoticeInfo>().Where(NoticeInfo._.ISUSED==true)
                .OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }

        /// <summary>
        /// 分页获取获取设备信息表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, WhereClip where, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<NoticeInfo>().Where(where).OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存公告信息实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的公告信息集合</param>
        /// <returns></returns> 
        public int Save(List<Sharp.Common.BaseEntity> list)
        {
            DbTransaction tr = Dal.BeginTransaction();
            int result = 0;
            try
            {
                result = Dal.Submit(tr, list);

            }
            catch (Exception)
            {
                throw;

            }
            return result;
        }

        /// <summary>
        /// 保存公告信息实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的公告信息集合</param>
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
        /// 根据ID删除公告信息实体
        /// </summary>
        /// <param name="guid">公告信息的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<NoticeInfo>(NoticeInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public NoticeInfo GetItemById(WhereClip where)
        {
            return Dal.Find<NoticeInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<NoticeInfo>(NoticeInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(NoticeInfo entity)
        {
            return Dal.Exists<NoticeInfo>(NoticeInfo._.ID != entity.ID && (NoticeInfo._.CODE == entity.CODE));
        }
    }


}
