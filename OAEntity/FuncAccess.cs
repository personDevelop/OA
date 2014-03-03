using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 功能权限表实体
    /// </summary>  

    public class FuncAccess : BaseEntity
    {
        public static Column _ = new Column("FuncAccess");

        public FuncAccess()
        {
            this.TableName = "FuncAccess";
        }

        #region 私有变量
        private Guid _ID;
        private Guid _RoleID;
        private string _FunctID;
        private bool _IsEnable;
        private bool _IsView;

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
        /// 功能标识,
        /// </summary>


        [DbProperty(MapingColumnName = "FunctID", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string FunctID
        {
            get
            {
                return this._FunctID;
            }
            set
            {

                this.OnPropertyChanged("FunctID", this._FunctID, value);
                this._FunctID = value;
            }
        }
        /// <summary>
        /// 可用,
        /// </summary>


        [DbProperty(MapingColumnName = "IsEnable", DbTypeString = "Bit", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool IsEnable
        {
            get
            {
                return this._IsEnable;
            }
            set
            {

                this.OnPropertyChanged("IsEnable", this._IsEnable, value);
                this._IsEnable = value;
            }
        }
        /// <summary>
        /// 可见,
        /// </summary>


        [DbProperty(MapingColumnName = "IsView", DbTypeString = "Bit", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool IsView
        {
            get
            {
                return this._IsView;
            }
            set
            {

                this.OnPropertyChanged("IsView", this._IsView, value);
                this._IsView = value;
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
                FunctID = new PropertyItem("FunctID", tableName);
                IsEnable = new PropertyItem("IsEnable", tableName);
                IsView = new PropertyItem("IsView", tableName);

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
            /// 功能标识,
            /// </summary> 
            public PropertyItem FunctID = null;
            /// <summary>
            /// 可用,
            /// </summary> 
            public PropertyItem IsEnable = null;
            /// <summary>
            /// 可见,
            /// </summary> 
            public PropertyItem IsView = null;


        }
        #endregion
    }
}