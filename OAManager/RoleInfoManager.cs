/*
 * author:卢永列
 * date: 2014/2/23 23:00:19
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
    /// 角色表的逻辑层
    /// </summary> 
    public class RoleInfoManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取角色表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回角色表实体</returns> 
        public RoleInfo GetItemById(Guid guid)
        {
            RoleInfo tem = new RoleInfo();
            tem = Dal.Find<RoleInfo>(RoleInfo._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取角色表集合
        /// </summary>
        /// <returns></returns> 
        public List<RoleInfo> GetList()
        {
            List<RoleInfo> tem = new List<RoleInfo>();
            tem = Dal.From<RoleInfo>().List<RoleInfo>();
            return tem;
        }

        /// <summary>
        /// 获取角色表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<RoleInfo>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取角色表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<RoleInfo>()
                .OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存角色表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的角色表集合</param>
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
        /// 保存角色表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的角色表集合</param>
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
        /// 根据ID删除角色表实体
        /// </summary>
        /// <param name="guid">角色表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<RoleInfo>(RoleInfo._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public RoleInfo GetItemById(WhereClip where)
        {
            return Dal.Find<RoleInfo>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {

            return Dal.Delete<RoleInfo>(RoleInfo._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(RoleInfo entity)
        {
            return Dal.Exists<RoleInfo>(RoleInfo._.ID != entity.ID && (RoleInfo._.Code == entity.Code || RoleInfo._.Name == entity.Name));
        }


        /// <summary>
        /// 分页获取获取待选的人员
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetPersonByRoleID(int pageindex, int pagesize, string roleID, bool has, ref int pageCount, ref int recordCount)
        {
            if (string.IsNullOrEmpty(roleID))
            {
                roleID = Guid.NewGuid().ToString();
            }
            WhereClip where = null;
            if (has)
            {
                where = RolePerson._.RoleID == roleID;
                return Dal.From<PersonInfo>().Join<RolePerson>(RolePerson._.PersonID == PersonInfo._.ID, JoinType.leftJoin)
                .Where(where)
                .Select(PersonInfo._.ID, PersonInfo._.UserName, PersonInfo._.RealName, RolePerson._.ID.Alias("RolePersonID"),
                RolePerson._.RoleID).OrderBy(PersonInfo._.RealName).ToDataTable(pagesize, pageindex, ref pageCount,
                ref recordCount);
            }
            else
            {
                where = RolePerson._.RoleID == roleID;
                return Dal.From<PersonInfo>().Join<RolePerson>(RolePerson._.PersonID == PersonInfo._.ID && RolePerson._.RoleID == roleID, JoinType.leftJoin)
                .Where(RolePerson._.RoleID == null)
                .Select(PersonInfo._.ID, PersonInfo._.UserName, PersonInfo._.RealName, RolePerson._.ID.Alias("RolePersonID"),
                RolePerson._.RoleID).OrderBy(PersonInfo._.RealName).ToDataTable(pagesize, pageindex, ref pageCount,
                ref recordCount);
            }

            //            
            //            return Dal.FromCustomSql(@"select * from personinfo
            //where ID NOT IN (   SELECT        PersonID
            //FROM         RolePerson INNER JOIN
            //                       RoleInfo ON  RoleID = RoleInfo.ID
            //                 WHERE RoleId=@RoleId    )  order by RealName").AddInputParameter("RoleId", new Guid(roleID)).ToDataTable();
        }








        public int DelateRolePersonById(Guid guid)
        {
            return Dal.Delete<RolePerson>(guid);
        }
    }


}