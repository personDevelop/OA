using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 文件列表实体
    /// </summary>  

    public class FileInfo : BaseEntity
    {
        public static Column _ = new Column("FileInfo");

        public FileInfo()
        {
            this.TableName = "FileInfo";
        }

        #region 私有变量
        private Guid _ID;
        private string _SBID;
        private string _FILENAME;
        private string _FILEPATH;
        private string _FILEEXT;

        #endregion

        #region 属性
        /// <summary>
        /// 文件ID,
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


        [DbProperty(MapingColumnName = "SBID", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string SBID
        {
            get
            {
                return this._SBID;
            }
            set
            {

                this.OnPropertyChanged("SBID", this._SBID, value);
                this._SBID = value;
            }
        }
        /// <summary>
        /// 文件名称,
        /// </summary>


        [DbProperty(MapingColumnName = "FILENAME", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string FILENAME
        {
            get
            {
                return this._FILENAME;
            }
            set
            {

                this.OnPropertyChanged("FILENAME", this._FILENAME, value);
                this._FILENAME = value;
            }
        }
        /// <summary>
        /// 文件路径,
        /// </summary>


        [DbProperty(MapingColumnName = "FILEPATH", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string FILEPATH
        {
            get
            {
                return this._FILEPATH;
            }
            set
            {

                this.OnPropertyChanged("FILEPATH", this._FILEPATH, value);
                this._FILEPATH = value;
            }
        }
        /// <summary>
        /// 扩展名称,
        /// </summary>


        [DbProperty(MapingColumnName = "FILEEXT", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string FILEEXT
        {
            get
            {
                return this._FILEEXT;
            }
            set
            {

                this.OnPropertyChanged("FILEEXT", this._FILEEXT, value);
                this._FILEEXT = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                SBID = new PropertyItem("SBID", tableName);
                FILENAME = new PropertyItem("FILENAME", tableName);
                FILEPATH = new PropertyItem("FILEPATH", tableName);
                FILEEXT = new PropertyItem("FILEEXT", tableName);

            }
            /// <summary>
            /// 文件ID,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 设备ID,
            /// </summary> 
            public PropertyItem SBID = null;
            /// <summary>
            /// 文件名称,
            /// </summary> 
            public PropertyItem FILENAME = null;
            /// <summary>
            /// 文件路径,
            /// </summary> 
            public PropertyItem FILEPATH = null;
            /// <summary>
            /// 扩展名称,
            /// </summary> 
            public PropertyItem FILEEXT = null;


        }
        #endregion
    }
}