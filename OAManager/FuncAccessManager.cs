/*
 * author:卢永列
 * date: 2014/3/2 14:40:44
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
using Sharp.Common.Common;

namespace OAManager
{
    /// <summary>
    /// 功能权限表的逻辑层
    /// </summary> 
    public class FuncAccessManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取功能权限表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回功能权限表实体</returns> 
        public FuncAccess GetItemById(Guid guid)
        {
            FuncAccess tem = new FuncAccess();
            tem = Dal.Find<FuncAccess>(FuncAccess._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取功能权限表集合
        /// </summary>
        /// <returns></returns> 
        public List<FuncAccess> GetList()
        {
            List<FuncAccess> tem = new List<FuncAccess>();
            tem = Dal.From<FuncAccess>().List<FuncAccess>();
            return tem;
        }

        /// <summary>
        /// 获取功能权限表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<FuncAccess>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取功能权限表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<FuncAccess>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存功能权限表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的功能权限表集合</param>
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
        /// 保存功能权限表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的功能权限表集合</param>
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
        /// 根据ID删除功能权限表实体
        /// </summary>
        /// <param name="guid">功能权限表的主键ID</param>
        public int DelateById(Guid guid)
        {
            try
            {
                return Dal.Delete<FuncAccess>(FuncAccess._.ID == guid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public FuncAccess GetItemById(WhereClip where)
        {
            return Dal.Find<FuncAccess>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<FuncAccess>(FuncAccess._.ID.In(IDS.Split(',')));
        }






        /// <summary>
        /// 根据角色ID,获取所有功能，包含无权限的功能
        /// </summary>
        /// <param name="roleID"></param>
        /// <returns></returns>
        public DataTable GetDataTable(Guid roleID)
        {
            return Dal.From<FunctionInfo>().Join<FuncAccess>(FunctionInfo._.ID == FuncAccess._.FunctID
                   && (FuncAccess._.RoleID == roleID || FuncAccess._.RoleID == null), JoinType.leftJoin)
                   .Select(FunctionInfo._.ID.All,
                   FuncAccess._.ID.Alias("FuncAccessID"),
                   FuncAccess._.IsEnable.Alias("FaccIsEnable"),
                   FuncAccess._.IsView,
                  FuncAccess._.RoleID)
                   .ToDataTable();



        }

        public void Save(Guid roleId, List<BaseEntity> list)
        {
            DbTransaction tr = Dal.BeginTransaction();
            try
            {
                Dal.Delete<FuncAccess>(FuncAccess._.RoleID == roleId, tr);
                Dal.Submit(tr, list);
                Dal.CommitTransaction(tr);
            }
            catch (Exception)
            {
                Dal.RollbackTransaction(tr);
                throw;
            }
        }

        /// <summary>
        /// 根据用户ID 获取有权限 的功能
        /// </summary>
        /// <param name="userid"></param>
        /// <returns></returns>
        public DataTable GetAccess(string userid, string userName)
        {
            if (userName.Open() == StaticClass.RootKey)
            {
                return Dal.From<FunctionInfo>().OrderBy(FunctionInfo._.OrderNo).ToDataTable();
            }
            else
            {

                string[] rolelist = Dal.From<RolePerson>().Where(RolePerson._.PersonID == new Guid(userid)).Select(RolePerson._.RoleID).ToSinglePropertyArray();
                if (rolelist==null || rolelist.Length==0)
                {
                    throw new Exception("当前用户还没有设置人员角色");
                    
                }
                return Dal.From<FunctionInfo>().Join<FuncAccess>(FunctionInfo._.ID == FuncAccess._.FunctID
                      && FuncAccess._.RoleID.In(rolelist))
                      .OrderBy(FunctionInfo._.OrderNo)
                      .Where(FunctionInfo._.IsEnable == true && FuncAccess._.IsEnable == true && FuncAccess._.IsView == true)
                      .Select(FunctionInfo._.ID.All).Distinct()
                      .ToDataTable();
            }

        }

        public bool HasAccess(string userid, string userName, string funcUrl)
        {
            if (userName.Open() == StaticClass.RootKey)
            {
                return true;
            }
            else
            {
                string[] rolelist = Dal.From<RolePerson>().Where(RolePerson._.PersonID == new Guid(userid)).Select(RolePerson._.RoleID).ToSinglePropertyArray();
              DataTable dt=  Dal.From<FunctionInfo>().Join<FuncAccess>(FunctionInfo._.ID == FuncAccess._.FunctID
                     && FuncAccess._.RoleID.In(rolelist))
                     .Where(FunctionInfo._.IsEnable == true && FuncAccess._.IsEnable == true && FuncAccess._.IsView == true
                     && FunctionInfo._.Url == funcUrl)
                     .Select(FunctionInfo._.ID)
                     .ToDataTable();
              return dt.Rows.Count>0;
            }
        }
    }


}