using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 员工设置实体
    /// </summary>  

    public class UserSet : BaseEntity
    {
        public static Column _ = new Column("UserSet");

        public UserSet()
        {
            this.TableName = "UserSet";
        }

        #region 私有变量
        private Guid _ID;
        private string _UserInfo;

        #endregion

        #region 属性
        /// <summary>
        /// 主键ID,
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
        /// 用户信息,
        /// </summary>


        [DbProperty(MapingColumnName = "UserInfo", DbTypeString = "Text", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string UserInfo
        {
            get
            {
                return this._UserInfo;
            }
            set
            {

                this.OnPropertyChanged("UserInfo", this._UserInfo, value);
                this._UserInfo = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                UserInfo = new PropertyItem("UserInfo", tableName);

            }
            /// <summary>
            /// 主键ID,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 用户信息,
            /// </summary> 
            public PropertyItem UserInfo = null;


        }
        #endregion
    }
}