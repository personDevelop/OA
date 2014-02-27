using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 角色人员关系表实体
    /// </summary>  

    public class RolePerson : BaseEntity
    {
        public static Column _ = new Column("RolePerson");

        public RolePerson()
        {
            this.TableName = "RolePerson";
        }

        #region 私有变量
        private Guid _ID;
        private Guid _RoleID;
        private Guid _PersonID;

        #endregion

        #region 属性
        /// <summary>
        /// 主键,
        /// </summary>
        [PrimaryKey]

        [DbProperty(MapingColumnName = "ID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid ID
        {
            get
            {
                return this._ID;
            }
            set
            {

                this.OnPropertyChanged("ID", this._ID, value);
                this._ID = value;
            }
        }
        /// <summary>
        /// 角色ID,
        /// </summary>


        [DbProperty(MapingColumnName = "RoleID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid RoleID
        {
            get
            {
                return this._RoleID;
            }
            set
            {

                this.OnPropertyChanged("RoleID", this._RoleID, value);
                this._RoleID = value;
            }
        }
        /// <summary>
        /// 人员ID,
        /// </summary>


        [DbProperty(MapingColumnName = "PersonID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid PersonID
        {
            get
            {
                return this._PersonID;
            }
            set
            {

                this.OnPropertyChanged("PersonID", this._PersonID, value);
                this._PersonID = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                RoleID = new PropertyItem("RoleID", tableName);
                PersonID = new PropertyItem("PersonID", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 角色ID,
            /// </summary> 
            public PropertyItem RoleID = null;
            /// <summary>
            /// 人员ID,
            /// </summary> 
            public PropertyItem PersonID = null;


        }
        #endregion
    }
}