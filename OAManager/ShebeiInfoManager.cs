/*
 * author:卢永列
 * date: 2014/2/24 22:10:21
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
    /// 设备信息表的逻辑层
    /// </summary> 
    public class ShebeiInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取设备信息表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回设备信息表实体</returns> 
        public ShebeiInfo GetItemById(Guid guid)
        {
            ShebeiInfo tem = new ShebeiInfo();
            tem = Dal.Find<ShebeiInfo>(ShebeiInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取设备信息表集合
        /// </summary>
        /// <returns></returns> 
        public List<ShebeiInfo> GetList()
        {
            List<ShebeiInfo> tem = new List<ShebeiInfo>();
            tem = Dal.From<ShebeiInfo>().List<ShebeiInfo>();
            return tem;
        }

        /// <summary>
        /// 获取设备信息表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<ShebeiInfo>().ToDataTable();
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
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<ShebeiInfo>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存设备信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的设备信息表集合</param>
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
        /// 保存设备信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的设备信息表集合</param>
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
        /// 根据ID删除设备信息表实体
        /// </summary>
        /// <param name="guid">设备信息表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<ShebeiInfo>(ShebeiInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public ShebeiInfo GetItemById(WhereClip where)
        {
            return Dal.Find<ShebeiInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<ShebeiInfo>(ShebeiInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(ShebeiInfo entity)
        {
            return Dal.Exists<ShebeiInfo>(ShebeiInfo._.ID != entity.ID && (ShebeiInfo._.Code == entity.Code || ShebeiInfo._.Name == entity.Name));
        }













    }


}
