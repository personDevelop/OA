using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 工作信息表实体
    /// </summary>  

    public class WorkInfo : BaseEntity
    {
        public static Column _ = new Column("WorkInfo");

        public WorkInfo()
        {
            this.TableName = "WorkInfo";
        }

        #region 私有变量
        private Guid _ID;
        private Guid _SbID;
        private string _GuZhangXx;
        private string _ChuLiYiJian;
        private DateTime? _PlanTime;
        private string _Status;
        private string _CurrentUser;
        private DateTime? _RealTime;
        private string _Note;
        private Guid? _City;
        private Guid? _Xian;
        private Guid? _Zhen;
        private string _Address;
        private string _Tel;
        private Guid _CreaterID;
        private string _CreaterName;
        private DateTime _CreateDate;
        private string _Guzhang;
        
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
        /// 设备ID,
        /// </summary>


        [DbProperty(MapingColumnName = "SbID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid SbID
        {
            get
            {
                return this._SbID;
            }
            set
            {

                this.OnPropertyChanged("SbID", this._SbID, value);
                this._SbID = value;
            }
        }
        /// <summary>
        /// 故障信息,
        /// </summary>


        [DbProperty(MapingColumnName = "GuZhangXx", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string GuZhangXx
        {
            get
            {
                return this._GuZhangXx;
            }
            set
            {

                this.OnPropertyChanged("GuZhangXx", this._GuZhangXx, value);
                this._GuZhangXx = value;
            }
        }
        /// <summary>
        /// 处理意见,
        /// </summary>


        [DbProperty(MapingColumnName = "ChuLiYiJian", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ChuLiYiJian
        {
            get
            {
                return this._ChuLiYiJian;
            }
            set
            {

                this.OnPropertyChanged("ChuLiYiJian", this._ChuLiYiJian, value);
                this._ChuLiYiJian = value;
            }
        }
        /// <summary>
        /// 计划解决时间,
        /// </summary>


        [DbProperty(MapingColumnName = "PlanTime", DbTypeString = "DateTime", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime? PlanTime
        {
            get
            {
                return this._PlanTime;
            }
            set
            {

                this.OnPropertyChanged("PlanTime", this._PlanTime, value);
                this._PlanTime = value;
            }
        }
        /// <summary>
        /// 状态,
        /// </summary>


        [DbProperty(MapingColumnName = "Status", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 当前指派人名称,
        /// </summary>


        [DbProperty(MapingColumnName = "CurrentUser", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string CurrentUser
        {
            get
            {
                return this._CurrentUser;
            }
            set
            {

                this.OnPropertyChanged("CurrentUser", this._CurrentUser, value);
                this._CurrentUser = value;
            }
        }
        /// <summary>
        /// 实际完成时间,
        /// </summary>


        [DbProperty(MapingColumnName = "RealTime", DbTypeString = "DateTime", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime? RealTime
        {
            get
            {
                return this._RealTime;
            }
            set
            {

                this.OnPropertyChanged("RealTime", this._RealTime, value);
                this._RealTime = value;
            }
        }
        /// <summary>
        /// 备注,
        /// </summary>


        [DbProperty(MapingColumnName = "Note", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 市,
        /// </summary>


        [DbProperty(MapingColumnName = "City", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? City
        {
            get
            {
                return this._City;
            }
            set
            {

                this.OnPropertyChanged("City", this._City, value);
                this._City = value;
            }
        }
        /// <summary>
        /// 县、区,
        /// </summary>


        [DbProperty(MapingColumnName = "Xian", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? Xian
        {
            get
            {
                return this._Xian;
            }
            set
            {

                this.OnPropertyChanged("Xian", this._Xian, value);
                this._Xian = value;
            }
        }
        /// <summary>
        /// 镇,
        /// </summary>


        [DbProperty(MapingColumnName = "Zhen", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? Zhen
        {
            get
            {
                return this._Zhen;
            }
            set
            {

                this.OnPropertyChanged("Zhen", this._Zhen, value);
                this._Zhen = value;
            }
        }
        /// <summary>
        /// 详细地址,
        /// </summary>


        [DbProperty(MapingColumnName = "Address", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 300, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Address
        {
            get
            {
                return this._Address;
            }
            set
            {

                this.OnPropertyChanged("Address", this._Address, value);
                this._Address = value;
            }
        }
        /// <summary>
        /// 填报人联系电话,
        /// </summary>


        [DbProperty(MapingColumnName = "Tel", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Tel
        {
            get
            {
                return this._Tel;
            }
            set
            {

                this.OnPropertyChanged("Tel", this._Tel, value);
                this._Tel = value;
            }
        }
        /// <summary>
        /// 填报人ID,
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
        /// 填报人名称,
        /// </summary>


        [DbProperty(MapingColumnName = "CreaterName", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string CreaterName
        {
            get
            {
                return this._CreaterName;
            }
            set
            {

                this.OnPropertyChanged("CreaterName", this._CreaterName, value);
                this._CreaterName = value;
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

        [DbProperty(MapingColumnName = "Guzhang", DbTypeString = "Char", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Guzhang
        {
            get
            {
                return this._Guzhang;
            }
            set
            {

                this.OnPropertyChanged("Guzhang", this._Guzhang, value);
                this._Guzhang = value;
            }
        }
        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                SbID = new PropertyItem("SbID", tableName);
                GuZhangXx = new PropertyItem("GuZhangXx", tableName);
                ChuLiYiJian = new PropertyItem("ChuLiYiJian", tableName);
                PlanTime = new PropertyItem("PlanTime", tableName);
                Status = new PropertyItem("Status", tableName);
                CurrentUser = new PropertyItem("CurrentUser", tableName);
                RealTime = new PropertyItem("RealTime", tableName);
                Note = new PropertyItem("Note", tableName);
                City = new PropertyItem("City", tableName);
                Xian = new PropertyItem("Xian", tableName);
                Zhen = new PropertyItem("Zhen", tableName);
                Address = new PropertyItem("Address", tableName);
                Tel = new PropertyItem("Tel", tableName);
                CreaterID = new PropertyItem("CreaterID", tableName);
                CreaterName = new PropertyItem("CreaterName", tableName);
                CreateDate = new PropertyItem("CreateDate", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 设备ID,
            /// </summary> 
            public PropertyItem SbID = null;
            /// <summary>
            /// 故障信息,
            /// </summary> 
            public PropertyItem GuZhangXx = null;
            /// <summary>
            /// 处理意见,
            /// </summary> 
            public PropertyItem ChuLiYiJian = null;
            /// <summary>
            /// 计划解决时间,
            /// </summary> 
            public PropertyItem PlanTime = null;
            /// <summary>
            /// 状态,
            /// </summary> 
            public PropertyItem Status = null;
            /// <summary>
            /// 当前指派人名称,
            /// </summary> 
            public PropertyItem CurrentUser = null;
            /// <summary>
            /// 实际完成时间,
            /// </summary> 
            public PropertyItem RealTime = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Note = null;
            /// <summary>
            /// 市,
            /// </summary> 
            public PropertyItem City = null;
            /// <summary>
            /// 县、区,
            /// </summary> 
            public PropertyItem Xian = null;
            /// <summary>
            /// 镇,
            /// </summary> 
            public PropertyItem Zhen = null;
            /// <summary>
            /// 详细地址,
            /// </summary> 
            public PropertyItem Address = null;
            /// <summary>
            /// 填报人联系电话,
            /// </summary> 
            public PropertyItem Tel = null;
            /// <summary>
            /// 填报人ID,
            /// </summary> 
            public PropertyItem CreaterID = null;
            /// <summary>
            /// 填报人名称,
            /// </summary> 
            public PropertyItem CreaterName = null;
            /// <summary>
            /// 填报时间,
            /// </summary> 
            public PropertyItem CreateDate = null;
            /// <summary>
            /// 故障分类,
            /// </summary> 
            public PropertyItem Guzhang = null;

        }
        #endregion
    }
}