/*
 * author:卢永列
 * date: 2014/2/25 21:23:02
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
    /// 功能表的逻辑层
    /// </summary> 
    public class FunctionInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取功能表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回功能表实体</returns> 
        public FunctionInfo GetItemById(Guid guid)
        {
            FunctionInfo tem = new FunctionInfo();
            tem = Dal.Find<FunctionInfo>(FunctionInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取功能表集合
        /// </summary>
        /// <returns></returns> 
        public List<FunctionInfo> GetList()
        {
            List<FunctionInfo> tem = new List<FunctionInfo>();
            tem = Dal.From<FunctionInfo>().List<FunctionInfo>();
            return tem;
        }

        /// <summary>
        /// 获取功能表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<FunctionInfo>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取功能表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<FunctionInfo>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存功能表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的功能表集合</param>
        /// <returns></returns> 
        public int Save(List<Sharp.Common.BaseEntity> list)
        {
            return Dal.Submit(list);

        }

        /// <summary>
        /// 保存功能表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的功能表集合</param>
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
        /// 根据ID删除功能表实体
        /// </summary>
        /// <param name="guid">功能表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<FunctionInfo>(FunctionInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public FunctionInfo GetItemById(WhereClip where)
        {
            return Dal.Find<FunctionInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<FunctionInfo>(FunctionInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(FunctionInfo entity)
        {
            return Dal.Exists<FunctionInfo>(FunctionInfo._.ID != entity.ID && (FunctionInfo._.Code == entity.Code || FunctionInfo._.Name == entity.Name));
        }













    }


}