using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 功能表实体
    /// </summary>  

    public class FunctionInfo : BaseEntity
    {
        public static Column _ = new Column("FunctionInfo");

        public FunctionInfo()
        {
            this.TableName = "FunctionInfo";
        }

        #region 私有变量
        private Guid _ID;
        private string _Code;
        private string _Name;
        private Guid? _ParentID;
        private string _ParentName;
        private bool _IsEnable;
        private string _Url;
        private string _Note;
        private string _Image;
        private int _OrderNo;

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
        /// 功能编号,
        /// </summary>


        [DbProperty(MapingColumnName = "Code", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 功能名称,
        /// </summary>


        [DbProperty(MapingColumnName = "Name", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 父名称,
        /// </summary>


        [DbProperty(MapingColumnName = "ParentName", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// URL,
        /// </summary>


        [DbProperty(MapingColumnName = "Url", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Url
        {
            get
            {
                return this._Url;
            }
            set
            {

                this.OnPropertyChanged("Url", this._Url, value);
                this._Url = value;
            }
        }
        /// <summary>
        /// 备注,
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
        /// 图标,
        /// </summary>


        [DbProperty(MapingColumnName = "Image", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 500, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Image
        {
            get
            {
                return this._Image;
            }
            set
            {

                this.OnPropertyChanged("Image", this._Image, value);
                this._Image = value;
            }
        }
        /// <summary>
        /// 顺序,
        /// </summary>


        [DbProperty(MapingColumnName = "OrderNo", DbTypeString = "Int", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public int OrderNo
        {
            get
            {
                return this._OrderNo;
            }
            set
            {

                this.OnPropertyChanged("OrderNo", this._OrderNo, value);
                this._OrderNo = value;
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
                ParentName = new PropertyItem("ParentName", tableName);
                IsEnable = new PropertyItem("IsEnable", tableName);
                Url = new PropertyItem("Url", tableName);
                Note = new PropertyItem("Note", tableName);
                Image = new PropertyItem("Image", tableName);
                OrderNo = new PropertyItem("OrderNo", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 功能编号,
            /// </summary> 
            public PropertyItem Code = null;
            /// <summary>
            /// 功能名称,
            /// </summary> 
            public PropertyItem Name = null;
            /// <summary>
            /// 父ID,
            /// </summary> 
            public PropertyItem ParentID = null;
            /// <summary>
            /// 父名称,
            /// </summary> 
            public PropertyItem ParentName = null;
            /// <summary>
            /// 可用,
            /// </summary> 
            public PropertyItem IsEnable = null;
            /// <summary>
            /// URL,
            /// </summary> 
            public PropertyItem Url = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Note = null;
            /// <summary>
            /// 图标,
            /// </summary> 
            public PropertyItem Image = null;
            /// <summary>
            /// 顺序,
            /// </summary> 
            public PropertyItem OrderNo = null;


        }
        #endregion
    }
}