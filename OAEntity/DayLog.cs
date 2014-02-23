using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 日志信息表实体
    /// </summary>  

    public class DayLog : BaseEntity
    {
        public static Column _ = new Column("DayLog");

        public DayLog()
        {
            this.TableName = "DayLog";
        }

        #region 私有变量
        private Guid _ID;
        private string _Content;
        private DateTime _WordDate;
        private Guid _UserID;
        private DateTime _CreateDate;
        private string _UserName;
        private string _GS;

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
        /// 工作内容,
        /// </summary>


        [DbProperty(MapingColumnName = "Content", DbTypeString = "Text", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Content
        {
            get
            {
                return this._Content;
            }
            set
            {

                this.OnPropertyChanged("Content", this._Content, value);
                this._Content = value;
            }
        }
        /// <summary>
        /// 工作日期,
        /// </summary>


        [DbProperty(MapingColumnName = "WordDate", DbTypeString = "DateTime", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime WordDate
        {
            get
            {
                return this._WordDate;
            }
            set
            {

                this.OnPropertyChanged("WordDate", this._WordDate, value);
                this._WordDate = value;
            }
        }
        /// <summary>
        /// 填报人ID,
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
        /// 填报时间,
        /// </summary>


        [DbProperty(MapingColumnName = "CreateDate", DbTypeString = "DateTime", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime CreateDate
        {
            get
            {
                return this._CreateDate;
            }
            set
            {

                this.OnPropertyChanged("CreateDate", this._CreateDate, value);
                this._CreateDate = value;
            }
        }
        /// <summary>
        /// 填报人,
        /// </summary>


        [DbProperty(MapingColumnName = "UserName", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 20, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string UserName
        {
            get
            {
                return this._UserName;
            }
            set
            {

                this.OnPropertyChanged("UserName", this._UserName, value);
                this._UserName = value;
            }
        }
        /// <summary>
        /// 工时,
        /// </summary>


        [DbProperty(MapingColumnName = "GS", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 10, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string GS
        {
            get
            {
                return this._GS;
            }
            set
            {

                this.OnPropertyChanged("GS", this._GS, value);
                this._GS = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                Content = new PropertyItem("Content", tableName);
                WordDate = new PropertyItem("WordDate", tableName);
                UserID = new PropertyItem("UserID", tableName);
                CreateDate = new PropertyItem("CreateDate", tableName);
                UserName = new PropertyItem("UserName", tableName);
                GS = new PropertyItem("GS", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 工作内容,
            /// </summary> 
            public PropertyItem Content = null;
            /// <summary>
            /// 工作日期,
            /// </summary> 
            public PropertyItem WordDate = null;
            /// <summary>
            /// 填报人ID,
            /// </summary> 
            public PropertyItem UserID = null;
            /// <summary>
            /// 填报时间,
            /// </summary> 
            public PropertyItem CreateDate = null;
            /// <summary>
            /// 填报人,
            /// </summary> 
            public PropertyItem UserName = null;
            /// <summary>
            /// 工时,
            /// </summary> 
            public PropertyItem GS = null;


        }
        #endregion
    }
}