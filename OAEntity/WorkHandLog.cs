using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 报工处理明细实体
    /// </summary>  

    public class WorkHandLog : BaseEntity
    {
        public static Column _ = new Column("WorkHandLog");

        public WorkHandLog()
        {
            this.TableName = "WorkHandLog";
        }

        #region 私有变量
        private Guid _ID;
        private Guid _WorkID;
        private string _CurrentStaus;
        private string _ChuliYj;
        private Guid? _Uper;
        private Guid? _DownEr;
        private DateTime _HandDate;
        private string _HandResult;
        private int _HandSequence;
        private string _UpName;
        private string _DownName;

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
        /// 工作ID,
        /// </summary>


        [DbProperty(MapingColumnName = "WorkID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid WorkID
        {
            get
            {
                return this._WorkID;
            }
            set
            {

                this.OnPropertyChanged("WorkID", this._WorkID, value);
                this._WorkID = value;
            }
        }
        /// <summary>
        /// 当前状态,
        /// </summary>


        [DbProperty(MapingColumnName = "CurrentStaus", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string CurrentStaus
        {
            get
            {
                return this._CurrentStaus;
            }
            set
            {

                this.OnPropertyChanged("CurrentStaus", this._CurrentStaus, value);
                this._CurrentStaus = value;
            }
        }
        /// <summary>
        /// 处理信息,(指派时，就填工作指派)
        /// </summary>


        [DbProperty(MapingColumnName = "ChuliYj", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ChuliYj
        {
            get
            {
                return this._ChuliYj;
            }
            set
            {

                this.OnPropertyChanged("ChuliYj", this._ChuliYj, value);
                this._ChuliYj = value;
            }
        }
        /// <summary>
        /// 上步指派人,
        /// </summary>


        [DbProperty(MapingColumnName = "Uper", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? Uper
        {
            get
            {
                return this._Uper;
            }
            set
            {

                this.OnPropertyChanged("Uper", this._Uper, value);
                this._Uper = value;
            }
        }
        /// <summary>
        /// 下步指派人,
        /// </summary>


        [DbProperty(MapingColumnName = "DownEr", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? DownEr
        {
            get
            {
                return this._DownEr;
            }
            set
            {

                this.OnPropertyChanged("DownEr", this._DownEr, value);
                this._DownEr = value;
            }
        }
        /// <summary>
        /// 处理时间,
        /// </summary>


        [DbProperty(MapingColumnName = "HandDate", DbTypeString = "DateTime", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime HandDate
        {
            get
            {
                return this._HandDate;
            }
            set
            {

                this.OnPropertyChanged("HandDate", this._HandDate, value);
                this._HandDate = value;
            }
        }
        /// <summary>
        /// 处理结果,指派时（填已指派）
        /// </summary>


        [DbProperty(MapingColumnName = "HandResult", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string HandResult
        {
            get
            {
                return this._HandResult;
            }
            set
            {

                this.OnPropertyChanged("HandResult", this._HandResult, value);
                this._HandResult = value;
            }
        }
        /// <summary>
        /// 处理顺序,
        /// </summary>


        [DbProperty(MapingColumnName = "HandSequence", DbTypeString = "Int", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public int HandSequence
        {
            get
            {
                return this._HandSequence;
            }
            set
            {

                this.OnPropertyChanged("HandSequence", this._HandSequence, value);
                this._HandSequence = value;
            }
        }
        /// <summary>
        /// 上步指派人姓名,
        /// </summary>


        [DbProperty(MapingColumnName = "UpName", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 20, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string UpName
        {
            get
            {
                return this._UpName;
            }
            set
            {

                this.OnPropertyChanged("UpName", this._UpName, value);
                this._UpName = value;
            }
        }
        /// <summary>
        /// 下步指派人姓名,
        /// </summary>


        [DbProperty(MapingColumnName = "DownName", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 20, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string DownName
        {
            get
            {
                return this._DownName;
            }
            set
            {

                this.OnPropertyChanged("DownName", this._DownName, value);
                this._DownName = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                WorkID = new PropertyItem("WorkID", tableName);
                CurrentStaus = new PropertyItem("CurrentStaus", tableName);
                ChuliYj = new PropertyItem("ChuliYj", tableName);
                Uper = new PropertyItem("Uper", tableName);
                DownEr = new PropertyItem("DownEr", tableName);
                HandDate = new PropertyItem("HandDate", tableName);
                HandResult = new PropertyItem("HandResult", tableName);
                HandSequence = new PropertyItem("HandSequence", tableName);
                UpName = new PropertyItem("UpName", tableName);
                DownName = new PropertyItem("DownName", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 工作ID,
            /// </summary> 
            public PropertyItem WorkID = null;
            /// <summary>
            /// 当前状态,
            /// </summary> 
            public PropertyItem CurrentStaus = null;
            /// <summary>
            /// 处理信息,(指派时，就填工作指派)
            /// </summary> 
            public PropertyItem ChuliYj = null;
            /// <summary>
            /// 上步指派人,
            /// </summary> 
            public PropertyItem Uper = null;
            /// <summary>
            /// 下步指派人,
            /// </summary> 
            public PropertyItem DownEr = null;
            /// <summary>
            /// 处理时间,
            /// </summary> 
            public PropertyItem HandDate = null;
            /// <summary>
            /// 处理结果,指派时（填已指派）
            /// </summary> 
            public PropertyItem HandResult = null;
            /// <summary>
            /// 处理顺序,
            /// </summary> 
            public PropertyItem HandSequence = null;
            /// <summary>
            /// 上步指派人姓名,
            /// </summary> 
            public PropertyItem UpName = null;
            /// <summary>
            /// 下步指派人姓名,
            /// </summary> 
            public PropertyItem DownName = null;


        }
        #endregion
    }
}