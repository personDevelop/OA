/*
 * author:卢永列
 * date: 2014/2/22 1:41:30
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
    /// 员工信息表的逻辑层
    /// </summary> 
    public class PersonInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取员工信息表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回员工信息表实体</returns> 
        public PersonInfo GetItemById(Guid guid)
        {
            PersonInfo tem = new PersonInfo();
            tem = Dal.Find<PersonInfo>(PersonInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取员工信息表集合
        /// </summary>
        /// <returns></returns> 
        public List<PersonInfo> GetList()
        {
            List<PersonInfo> tem = new List<PersonInfo>();
            tem = Dal.From<PersonInfo>().List<PersonInfo>();
            return tem;
        }

        /// <summary>
        /// 获取员工信息表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<PersonInfo>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取员工信息表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<PersonInfo>().OrderBy(orderby).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }

        /// <summary>
        /// 检查用户名和密码是否匹配
        /// </summary>
        /// <param name="passwd"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        public bool checkUserIndentity(string passwd, string username)
        {
            try
            {
                bool ex = Dal.Exists<PersonInfo>(PersonInfo._.UserName == username && PersonInfo._.Pwd == passwd);
                return ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 保存员工信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的员工信息表集合</param>
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
        /// 保存员工信息表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的员工信息表集合</param>
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
        /// 根据ID删除员工信息表实体
        /// </summary>
        /// <param name="guid">员工信息表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<PersonInfo>(PersonInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public PersonInfo GetItemById(WhereClip where)
        {
            return Dal.Find<PersonInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<PersonInfo>(PersonInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(PersonInfo entity)
        {
            return Dal.Exists<PersonInfo>(PersonInfo._.ID != entity.ID && PersonInfo._.UserName == entity.UserName);
        }

    }


}