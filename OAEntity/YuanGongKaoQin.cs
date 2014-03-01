using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 员工考勤实体
    /// </summary>  

    public class YuanGongKaoQin : BaseEntity
    {
        public static Column _ = new Column("YuanGongKaoQin");

        public YuanGongKaoQin()
        {
            this.TableName = "YuanGongKaoQin";
        }

        #region 私有变量
        private Guid _ID;
        private Guid? _UserID;
        private string _UserName;
        private string _StartTime;
        private string _EndTime;
        private DateTime _KQRQ;
        private string _Status;
        private Guid _CreaterID;
        private Guid? _UpdaterID;
        private DateTime? _Updatedate;
        private string _Note;
        private DateTime _CreateDate;
        private string _SWStatus;

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
        /// 员工ID,
        /// </summary>


        [DbProperty(MapingColumnName = "UserID", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? UserID
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
        /// 员工姓名,
        /// </summary>


        [DbProperty(MapingColumnName = "UserName", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 上班时间,
        /// </summary>


        [DbProperty(MapingColumnName = "StartTime", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string StartTime
        {
            get
            {
                return this._StartTime;
            }
            set
            {

                this.OnPropertyChanged("StartTime", this._StartTime, value);
                this._StartTime = value;
            }
        }
        /// <summary>
        /// 下班时间,
        /// </summary>


        [DbProperty(MapingColumnName = "EndTime", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string EndTime
        {
            get
            {
                return this._EndTime;
            }
            set
            {

                this.OnPropertyChanged("EndTime", this._EndTime, value);
                this._EndTime = value;
            }
        }
        /// <summary>
        /// 考勤日期,
        /// </summary>


        [DbProperty(MapingColumnName = "KQRQ", DbTypeString = "DateTime", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime KQRQ
        {
            get
            {
                return this._KQRQ;
            }
            set
            {

                this.OnPropertyChanged("KQRQ", this._KQRQ, value);
                this._KQRQ = value;
            }
        }
        /// <summary>
        /// 下午状态,正常、迟到、早退、旷工等，从系统编码里取值
        /// </summary>


        [DbProperty(MapingColumnName = "Status", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Status
        {
            get
            {
                return this._Status;
            }
            set
            {

                this.OnPropertyChanged("Status", this._Status, value);
                this._Status = value;
            }
        }
        /// <summary>
        /// 录入人员,
        /// </summary>


        [DbProperty(MapingColumnName = "CreaterID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid CreaterID
        {
            get
            {
                return this._CreaterID;
            }
            set
            {

                this.OnPropertyChanged("CreaterID", this._CreaterID, value);
                this._CreaterID = value;
            }
        }
        /// <summary>
        /// 最后更改人员,
        /// </summary>


        [DbProperty(MapingColumnName = "UpdaterID", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? UpdaterID
        {
            get
            {
                return this._UpdaterID;
            }
            set
            {

                this.OnPropertyChanged("UpdaterID", this._UpdaterID, value);
                this._UpdaterID = value;
            }
        }
        /// <summary>
        /// 最后更改日期,
        /// </summary>


        [DbProperty(MapingColumnName = "Updatedate", DbTypeString = "DateTime", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime? Updatedate
        {
            get
            {
                return this._Updatedate;
            }
            set
            {

                this.OnPropertyChanged("Updatedate", this._Updatedate, value);
                this._Updatedate = value;
            }
        }
        /// <summary>
        /// 备注,用于说明迟到、旷工等原因
        /// </summary>


        [DbProperty(MapingColumnName = "Note", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Note
        {
            get
            {
                return this._Note;
            }
            set
            {

                this.OnPropertyChanged("Note", this._Note, value);
                this._Note = value;
            }
        }
        /// <summary>
        /// 创建日期,
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
        /// 上午状态,
        /// </summary>


        [DbProperty(MapingColumnName = "SWStatus", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string SWStatus
        {
            get
            {
                return this._SWStatus;
            }
            set
            {

                this.OnPropertyChanged("SWStatus", this._SWStatus, value);
                this._SWStatus = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                UserID = new PropertyItem("UserID", tableName);
                UserName = new PropertyItem("UserName", tableName);
                StartTime = new PropertyItem("StartTime", tableName);
                EndTime = new PropertyItem("EndTime", tableName);
                KQRQ = new PropertyItem("KQRQ", tableName);
                Status = new PropertyItem("Status", tableName);
                CreaterID = new PropertyItem("CreaterID", tableName);
                UpdaterID = new PropertyItem("UpdaterID", tableName);
                Updatedate = new PropertyItem("Updatedate", tableName);
                Note = new PropertyItem("Note", tableName);
                CreateDate = new PropertyItem("CreateDate", tableName);
                SWStatus = new PropertyItem("SWStatus", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 员工ID,
            /// </summary> 
            public PropertyItem UserID = null;
            /// <summary>
            /// 员工姓名,
            /// </summary> 
            public PropertyItem UserName = null;
            /// <summary>
            /// 上班时间,
            /// </summary> 
            public PropertyItem StartTime = null;
            /// <summary>
            /// 下班时间,
            /// </summary> 
            public PropertyItem EndTime = null;
            /// <summary>
            /// 考勤日期,
            /// </summary> 
            public PropertyItem KQRQ = null;
            /// <summary>
            /// 下午状态,正常、迟到、早退、旷工等，从系统编码里取值
            /// </summary> 
            public PropertyItem Status = null;
            /// <summary>
            /// 录入人员,
            /// </summary> 
            public PropertyItem CreaterID = null;
            /// <summary>
            /// 最后更改人员,
            /// </summary> 
            public PropertyItem UpdaterID = null;
            /// <summary>
            /// 最后更改日期,
            /// </summary> 
            public PropertyItem Updatedate = null;
            /// <summary>
            /// 备注,用于说明迟到、旷工等原因
            /// </summary> 
            public PropertyItem Note = null;
            /// <summary>
            /// 创建日期,
            /// </summary> 
            public PropertyItem CreateDate = null;
            /// <summary>
            /// 上午状态,
            /// </summary> 
            public PropertyItem SWStatus = null;


        }
        #endregion
    }
}