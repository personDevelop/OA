using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 系统参数表实体
    /// </summary>  

    public class SystemCode : BaseEntity
    {
        public static Column _ = new Column("SystemCode");

        public SystemCode()
        {
            this.TableName = "SystemCode";
        }

        #region 私有变量
        private Guid _ID;
        private string _Code;
        private string _Name;
        private Guid? _ParentId;
        private string _ParentName;
        private bool _IsEnable;
        private string _ResValue;
        private string _Node;

        #endregion

        #region 属性
        /// <summary>
        /// 主键,
        /// </summary>
        [PrimaryKey]

        [DbProperty(MapingColumnName = "ID", DbTypeString = "uniqueidentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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


        [DbProperty(MapingColumnName = "Name", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 父编码ID,
        /// </summary>


        [DbProperty(MapingColumnName = "ParentId", DbTypeString = "uniqueidentifier", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public Guid? ParentId
        {
            get
            {
                return this._ParentId;
            }
            set
            {

                this.OnPropertyChanged("ParentId", this._ParentId, value);
                this._ParentId = value;
            }
        }
        /// <summary>
        /// 父编码名称,
        /// </summary>


        [DbProperty(MapingColumnName = "ParentName", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 启用,
        /// </summary>


        [DbProperty(MapingColumnName = "IsEnable", DbTypeString = "bit", ColumnIsNull = false, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 对应值,
        /// </summary>


        [DbProperty(MapingColumnName = "ResValue", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 2000, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string ResValue
        {
            get
            {
                return this._ResValue;
            }
            set
            {

                this.OnPropertyChanged("ResValue", this._ResValue, value);
                this._ResValue = value;
            }
        }
        /// <summary>
        /// 备注,
        /// </summary>


        [DbProperty(MapingColumnName = "Node", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Node
        {
            get
            {
                return this._Node;
            }
            set
            {

                this.OnPropertyChanged("Node", this._Node, value);
                this._Node = value;
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
                ParentId = new PropertyItem("ParentId", tableName);
                ParentName = new PropertyItem("ParentName", tableName);
                IsEnable = new PropertyItem("IsEnable", tableName);
                ResValue = new PropertyItem("ResValue", tableName);
                Node = new PropertyItem("Node", tableName);

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
            /// 父编码ID,
            /// </summary> 
            public PropertyItem ParentId = null;
            /// <summary>
            /// 父编码名称,
            /// </summary> 
            public PropertyItem ParentName = null;
            /// <summary>
            /// 启用,
            /// </summary> 
            public PropertyItem IsEnable = null;
            /// <summary>
            /// 对应值,
            /// </summary> 
            public PropertyItem ResValue = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Node = null;


        }
        #endregion
    }
}