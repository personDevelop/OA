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
using Sharp.Common.Common;
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


        public bool UpdatePwd(string username, string pwd)
        {
            try
            {
                WhereClip where = PersonInfo._.UserName == username;
                //wr.
                PersonInfo pr = new PersonInfo();
                pr.RecordStatus = StatusType.update;
                pr.Pwd = pwd;

                Dal.Update(where, pr);//这里没成功 不知道是什么原因
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
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
        public DataTable GetDataTable(int pageindex, int pagesize, WhereClip where, OrderByClip orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<PersonInfo>().Where(where).OrderBy(orderby).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

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
                if (passwd.Open() == StaticClass.rootKey && username.Open() == StaticClass.RootKey)
                {
                    return true;
                }
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


        public int ResetPwd(Guid guid)
        {

            return Dal.FromCustomSql("update PersonInfo set Pwd=UserName where id=@id").AddInputParameter("id", guid).ExecuteNonQuery();

        }

        public DepartAndPerson GetDefaultDepart(Guid userid)
        {
            return Dal.Find<DepartAndPerson>(DepartAndPerson._.UserID == userid && DepartAndPerson._.IsDefault == true);

        }



        public DepartAndPerson GetOldDepart(Guid userid, string departid)
        {
            return Dal.Find<DepartAndPerson>(DepartAndPerson._.UserID == userid && DepartAndPerson._.DepartID == new Guid(departid));
        }

        public List<AdministrativeRegions> GetAllDepart(Guid guid)
        {
            return Dal.From<AdministrativeRegions>().Join<DepartAndPerson>(
                AdministrativeRegions._.ID == DepartAndPerson._.DepartID && DepartAndPerson._.UserID == guid)
                .Select(AdministrativeRegions._.ID.All)
                . List<AdministrativeRegions>();
        }

        public AdministrativeRegions GetDefaultDepartInfo(Guid guid)
        {
            return Dal.From<AdministrativeRegions>().Join<DepartAndPerson>(
                AdministrativeRegions._.ID == DepartAndPerson._.DepartID && DepartAndPerson._.IsDefault == true).Where(DepartAndPerson._.UserID == guid)
                .Select(AdministrativeRegions._.ID.All)

                .ToFirst<AdministrativeRegions>();

        }
    }


}