using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 地区表实体
    /// </summary>  

    public class AdministrativeRegions : BaseEntity
    {
        public static Column _ = new Column("AdministrativeRegions");

        public AdministrativeRegions()
        {
            this.TableName = "AdministrativeRegions";
        }

        #region 私有变量
        private Guid _ID;
        private string _Code;
        private string _Name;
        private Guid? _ParentID;
        private string _ZipCode;
        private string _Phone;
        private string _ClassCode;
        private string _Note;
        private string _ShortName;
        private string _ParentName;

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
        /// 编码,
        /// </summary>


        [DbProperty(MapingColumnName = "Code", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Code
        {
            get
            {
                return this._Code;
            }
            set
            {

                this.OnPropertyChanged("Code", this._Code, value);
                this._Code = value;
            }
        }
        /// <summary>
        /// 名称,
        /// </summary>


        [DbProperty(MapingColumnName = "Name", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Name
        {
            get
            {
                return this._Name;
            }
            set
            {

                this.OnPropertyChanged("Name", this._Name, value);
                this._Name = value;
            }
        }
        /// <summary>
        /// 父ID,
        /// </summary>


        [DbProperty(MapingColumnName = "ParentID", DbTypeString = "UniqueIdentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? ParentID
        {
            get
            {
                return this._ParentID;
            }
            set
            {

                this.OnPropertyChanged("ParentID", this._ParentID, value);
                this._ParentID = value;
            }
        }
        /// <summary>
        /// 邮政编码,
        /// </summary>


        [DbProperty(MapingColumnName = "ZipCode", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ZipCode
        {
            get
            {
                return this._ZipCode;
            }
            set
            {

                this.OnPropertyChanged("ZipCode", this._ZipCode, value);
                this._ZipCode = value;
            }
        }
        /// <summary>
        /// 所属电话号码段,
        /// </summary>


        [DbProperty(MapingColumnName = "Phone", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Phone
        {
            get
            {
                return this._Phone;
            }
            set
            {

                this.OnPropertyChanged("Phone", this._Phone, value);
                this._Phone = value;
            }
        }
        /// <summary>
        /// 分级码,
        /// </summary>


        [DbProperty(MapingColumnName = "ClassCode", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ClassCode
        {
            get
            {
                return this._ClassCode;
            }
            set
            {

                this.OnPropertyChanged("ClassCode", this._ClassCode, value);
                this._ClassCode = value;
            }
        }
        /// <summary>
        /// 备注,
        /// </summary>


        [DbProperty(MapingColumnName = "Note", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 简称,
        /// </summary>


        [DbProperty(MapingColumnName = "ShortName", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ShortName
        {
            get
            {
                return this._ShortName;
            }
            set
            {

                this.OnPropertyChanged("ShortName", this._ShortName, value);
                this._ShortName = value;
            }
        }
        /// <summary>
        /// 父名称,
        /// </summary>


        [DbProperty(MapingColumnName = "ParentName", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ParentName
        {
            get
            {
                return this._ParentName;
            }
            set
            {

                this.OnPropertyChanged("ParentName", this._ParentName, value);
                this._ParentName = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                Code = new PropertyItem("Code", tableName);
                Name = new PropertyItem("Name", tableName);
                ParentID = new PropertyItem("ParentID", tableName);
                ZipCode = new PropertyItem("ZipCode", tableName);
                Phone = new PropertyItem("Phone", tableName);
                ClassCode = new PropertyItem("ClassCode", tableName);
                Note = new PropertyItem("Note", tableName);
                ShortName = new PropertyItem("ShortName", tableName);
                ParentName = new PropertyItem("ParentName", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 编码,
            /// </summary> 
            public PropertyItem Code = null;
            /// <summary>
            /// 名称,
            /// </summary> 
            public PropertyItem Name = null;
            /// <summary>
            /// 父ID,
            /// </summary> 
            public PropertyItem ParentID = null;
            /// <summary>
            /// 邮政编码,
            /// </summary> 
            public PropertyItem ZipCode = null;
            /// <summary>
            /// 所属电话号码段,
            /// </summary> 
            public PropertyItem Phone = null;
            /// <summary>
            /// 分级码,
            /// </summary> 
            public PropertyItem ClassCode = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Note = null;
            /// <summary>
            /// 简称,
            /// </summary> 
            public PropertyItem ShortName = null;
            /// <summary>
            /// 父名称,
            /// </summary> 
            public PropertyItem ParentName = null;


        }
        #endregion
    }
}