using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 设备信息表实体
    /// </summary>  

    public class ShebeiInfo : BaseEntity
    {
        public static Column _ = new Column("ShebeiInfo");

        public ShebeiInfo()
        {
            this.TableName = "ShebeiInfo";
        }

        #region 私有变量
        private Guid _ID;
        private string _Code;
        private string _Name;
        private string _GuiGe;
        private bool _IsEnable;
        private string _Note;

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
        /// 设备编号,
        /// </summary>


        [DbProperty(MapingColumnName = "Code", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 设备名称,
        /// </summary>


        [DbProperty(MapingColumnName = "Name", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 规格型号,
        /// </summary>


        [DbProperty(MapingColumnName = "GuiGe", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string GuiGe
        {
            get
            {
                return this._GuiGe;
            }
            set
            {

                this.OnPropertyChanged("GuiGe", this._GuiGe, value);
                this._GuiGe = value;
            }
        }
        /// <summary>
        /// 是否启用,
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
        /// 备注,
        /// </summary>


        [DbProperty(MapingColumnName = "Note", DbTypeString = "NVarChar", ColumnIsNull = false, IsUnique = false, ColumnLength = 300, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                Code = new PropertyItem("Code", tableName);
                Name = new PropertyItem("Name", tableName);
                GuiGe = new PropertyItem("GuiGe", tableName);
                IsEnable = new PropertyItem("IsEnable", tableName);
                Note = new PropertyItem("Note", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 设备编号,
            /// </summary> 
            public PropertyItem Code = null;
            /// <summary>
            /// 设备名称,
            /// </summary> 
            public PropertyItem Name = null;
            /// <summary>
            /// 规格型号,
            /// </summary> 
            public PropertyItem GuiGe = null;
            /// <summary>
            /// 是否启用,
            /// </summary> 
            public PropertyItem IsEnable = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Note = null;


        }
        #endregion
    }
}