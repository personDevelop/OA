﻿/*
 * author:卢永列
 * date: 2014/2/22 22:20:15
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
    /// 地区表的逻辑层
    /// </summary> 
    public class AdministrativeRegionsManager : BaseManager
    {

        /// <summary>
        /// 根据ID获取地区表实体
        /// </summary>
        /// <param name="guid">主键ID</param>
        /// <returns>返回地区表实体</returns> 
        public AdministrativeRegions GetItemById(Guid guid)
        {
            AdministrativeRegions tem = new AdministrativeRegions();
            tem = Dal.Find<AdministrativeRegions>(AdministrativeRegions._.ID == guid);
            return tem;
        }

        /// <summary>
        /// 获取地区表集合
        /// </summary>
        /// <returns></returns> 
        public List<AdministrativeRegions> GetList()
        {
            List<AdministrativeRegions> tem = new List<AdministrativeRegions>();
            tem = Dal.From<AdministrativeRegions>().List<AdministrativeRegions>();
            return tem;
        }

        /// <summary>
        /// 获取地区表datatable
        /// </summary>
        /// <returns></returns>
        public DataTable GetDataTable()
        {
            return Dal.From<AdministrativeRegions>().ToDataTable();
        }

        /// <summary>
        /// 分页获取获取地区表datatable
        /// </summary>
        /// <param name="pageindex">当前页数</param>
        /// <param name="pagesize">每页显示条数</param>
        /// <param name="orderby">排序方式</param>
        /// <param name="pageCount">总页数</param>
        /// <param name="recordCount">总记录数</param>
        /// <returns></returns>
        public DataTable GetDataTable(int pageindex, int pagesize, string orderby, ref int pageCount, ref int recordCount)
        {


            return Dal.From<AdministrativeRegions>().OrderBy(new OrderByClip(orderby)).ToDataTable(pagesize, pageindex, ref pageCount, ref recordCount);

        }


        /// <summary>
        /// 保存地区表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的地区表集合</param>
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
        /// 保存地区表实体，包括添加、修改、删除
        /// </summary>
        /// <param name="list">待保存的地区表集合</param>
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
        /// 根据ID删除地区表实体
        /// </summary>
        /// <param name="guid">地区表的主键ID</param>
        public int DelateById(Guid guid)
        {
            int i = 0;
            DbTransaction tr = Dal.BeginTransaction();

            try
            {
                i = Dal.Delete<AdministrativeRegions>(tr, guid);
                i += Dal.Delete<DepartAndPerson>(DepartAndPerson._.DepartID == guid, tr);
                Dal.CommitTransaction(tr);
                return i;
            }
            catch (Exception)
            {
                Dal.RollbackTransaction(tr);
                throw;
            }

            
        }

        /// <summary>
        /// 根据where条件获取实体
        /// </summary>
        public AdministrativeRegions GetItemById(WhereClip where)
        {
            return Dal.Find<AdministrativeRegions>(where);
        }
        /// <summary>
        /// 批量删除ids格式为id1,id2,...的数据
        /// </summary>
        public int DelateById(string IDS)
        {
            return Dal.Delete<AdministrativeRegions>(AdministrativeRegions._.ID.In(IDS.Split(',')));
        }

        /// <summary>
        /// 是否存在相同编号，或名称
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool ExitCodeAndName(AdministrativeRegions entity)
        {
            return Dal.Exists<AdministrativeRegions>(AdministrativeRegions._.ID != entity.ID && (AdministrativeRegions._.Code == entity.Code || AdministrativeRegions._.Name == entity.Name));
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

        public DataTable GetPersonByDepartID(int pageindex, int pagesize, WhereClip wherefilrer, string departID, bool has, ref int pageCount, ref int recordCount)
        {
            if (string.IsNullOrEmpty(departID))
            {
                departID = Guid.NewGuid().ToString();
            }
            WhereClip where = null;
            if (has)
            {
                where = DepartAndPerson._.DepartID == departID;
                return Dal.From<PersonInfo>().Join<DepartAndPerson>(DepartAndPerson._.UserID == PersonInfo._.ID, JoinType.leftJoin)
                .Where(where)
                .Select(PersonInfo._.ID, PersonInfo._.UserName, PersonInfo._.RealName, DepartAndPerson._.ID.Alias("DepartPersonID"),
                DepartAndPerson._.DepartID).OrderBy(PersonInfo._.RealName).ToDataTable(pagesize, pageindex, ref pageCount,
                ref recordCount);
            }
            else
            {
                //过滤人员

                where = DepartAndPerson._.DepartID == departID;
                if (!WhereClip.IsNullOrEmpty(wherefilrer))
                {
                    where = where && wherefilrer;
                }
                return Dal.From<PersonInfo>().Join<DepartAndPerson>(DepartAndPerson._.UserID == PersonInfo._.ID && DepartAndPerson._.DepartID == departID, JoinType.leftJoin)
                .Where(DepartAndPerson._.DepartID == null)
                .Select(PersonInfo._.ID, PersonInfo._.UserName, PersonInfo._.RealName, DepartAndPerson._.ID.Alias("DepartPersonID"),
                DepartAndPerson._.DepartID).OrderBy(PersonInfo._.RealName).ToDataTable(pagesize, pageindex, ref pageCount,
                ref recordCount);
            } 
        }




        public int DelateDepartPersonById(Guid guid)
        {
            return Dal.Delete<DepartAndPerson>(guid);
        }
    }


}