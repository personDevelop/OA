using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 部门人员关系实体
    /// </summary>  

    public class DepartAndPerson : BaseEntity
    {
        public static Column _ = new Column("DepartAndPerson");

        public DepartAndPerson()
        {
            this.TableName = "DepartAndPerson";
        }

        #region 私有变量
        private Guid _ID;
        private Guid _DepartID;
        private Guid _UserID;
        private bool _IsDefault;

        #endregion

        #region 属性
        /// <summary>
        /// ID,
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
        /// 部门ID,
        /// </summary>


        [DbProperty(MapingColumnName = "DepartID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid DepartID
        {
            get
            {
                return this._DepartID;
            }
            set
            {

                this.OnPropertyChanged("DepartID", this._DepartID, value);
                this._DepartID = value;
            }
        }
        /// <summary>
        /// 人员ID,
        /// </summary>


        [DbProperty(MapingColumnName = "UserID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid UserID
        {
            get
            {
                return this._UserID;
            }
            set
            {

                this.OnPropertyChanged("UserID", this._UserID, value);
                this._UserID = value;
            }
        }
        /// <summary>
        /// 是否默认部门,
        /// </summary>


        [DbProperty(MapingColumnName = "IsDefault", DbTypeString = "Bit", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool IsDefault
        {
            get
            {
                return this._IsDefault;
            }
            set
            {

                this.OnPropertyChanged("IsDefault", this._IsDefault, value);
                this._IsDefault = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                DepartID = new PropertyItem("DepartID", tableName);
                UserID = new PropertyItem("UserID", tableName);
                IsDefault = new PropertyItem("IsDefault", tableName);

            }
            /// <summary>
            /// ID,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 部门ID,
            /// </summary> 
            public PropertyItem DepartID = null;
            /// <summary>
            /// 人员ID,
            /// </summary> 
            public PropertyItem UserID = null;
            /// <summary>
            /// 是否默认部门,
            /// </summary> 
            public PropertyItem IsDefault = null;


        }
        #endregion
    }
}