/*
 * author:卢永列
 * date: 2014/2/24 23:53:24
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
    /// 文件列表的逻辑层
    /// </summary> 
    public class FileInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取文件列表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回文件列表实体</returns> 
        public FileInfo GetItemById(Guid guid)
        {
            FileInfo tem = new FileInfo();
            tem = Dal.Find<FileInfo>(FileInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取文件列表集合
        /// </summary>
        /// <returns></returns> 
        public List<FileInfo> GetList()
        {
            List<FileInfo> tem = new List<FileInfo>();
            tem = Dal.From<FileInfo>().List<FileInfo>();
            return tem;
        }

        /// <summary>
        /// 获取文件列表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<FileInfo>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取文件列表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<FileInfo>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存文件列表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的文件列表集合</param>
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
        /// 保存文件列表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的文件列表集合</param>
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
        /// 根据ID删除文件列表实体
        /// </summary>
        /// <param name="guid">文件列表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<FileInfo>(FileInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public FileInfo GetItemById(WhereClip where)
        {
            return Dal.Find<FileInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<FileInfo>(FileInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        //public bool ExitCodeAndName(FileInfo entity)
        //{
        //    return Dal.Exists<FileInfo>(FileInfo._.ID != entity.ID && (FileInfo._.Code == entity.Code || FileInfo._.Name == entity.Name));
        //}









    }


}
