using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 公告信息实体
    /// </summary>  

    public class NoticeInfo : BaseEntity
    {
        public static Column _ = new Column("NoticeInfo");

        public NoticeInfo()
        {
            this.TableName = "NoticeInfo";
        }

        #region 私有变量
        private Guid _ID;
        private string _CODE;
        private string _TITLE;
        private string _SOURCE;
        private string _PUBDATE;
        private string _CONTENT;
        private string _PUBUSER;
        private string _NOTE;
        private bool? _ISTOP;
        private bool? _ISUSED;

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
        /// 编号,
        /// </summary>


        [DbProperty(MapingColumnName = "CODE", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string CODE
        {
            get
            {
                return this._CODE;
            }
            set
            {

                this.OnPropertyChanged("CODE", this._CODE, value);
                this._CODE = value;
            }
        }
        /// <summary>
        /// 标题,
        /// </summary>


        [DbProperty(MapingColumnName = "TITLE", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 500, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string TITLE
        {
            get
            {
                return this._TITLE;
            }
            set
            {

                this.OnPropertyChanged("TITLE", this._TITLE, value);
                this._TITLE = value;
            }
        }
        /// <summary>
        /// 来源,
        /// </summary>


        [DbProperty(MapingColumnName = "SOURCE", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string SOURCE
        {
            get
            {
                return this._SOURCE;
            }
            set
            {

                this.OnPropertyChanged("SOURCE", this._SOURCE, value);
                this._SOURCE = value;
            }
        }
        /// <summary>
        /// 发布日期,
        /// </summary>


        [DbProperty(MapingColumnName = "PUBDATE", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string PUBDATE
        {
            get
            {
                return this._PUBDATE;
            }
            set
            {

                this.OnPropertyChanged("PUBDATE", this._PUBDATE, value);
                this._PUBDATE = value;
            }
        }
        /// <summary>
        /// 内容,
        /// </summary>


        [DbProperty(MapingColumnName = "CONTENT", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 4000, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string CONTENT
        {
            get
            {
                return this._CONTENT;
            }
            set
            {

                this.OnPropertyChanged("CONTENT", this._CONTENT, value);
                this._CONTENT = value;
            }
        }
        /// <summary>
        /// 发布人,
        /// </summary>


        [DbProperty(MapingColumnName = "PUBUSER", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string PUBUSER
        {
            get
            {
                return this._PUBUSER;
            }
            set
            {

                this.OnPropertyChanged("PUBUSER", this._PUBUSER, value);
                this._PUBUSER = value;
            }
        }
        /// <summary>
        /// 备注,
        /// </summary>


        [DbProperty(MapingColumnName = "NOTE", DbTypeString = "NVarChar", ColumnIsNull = true, IsUnique = false, ColumnLength = 4000, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string NOTE
        {
            get
            {
                return this._NOTE;
            }
            set
            {

                this.OnPropertyChanged("NOTE", this._NOTE, value);
                this._NOTE = value;
            }
        }
        /// <summary>
        /// 是否置顶,
        /// </summary>


        [DbProperty(MapingColumnName = "ISTOP", DbTypeString = "Bit", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool? ISTOP
        {
            get
            {
                return this._ISTOP;
            }
            set
            {

                this.OnPropertyChanged("ISTOP", this._ISTOP, value);
                this._ISTOP = value;
            }
        }
        /// <summary>
        /// 是否启用,
        /// </summary>


        [DbProperty(MapingColumnName = "ISUSED", DbTypeString = "Bit", ColumnIsNull = true, IsUnique = false, ColumnLength = 0, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool? ISUSED
        {
            get
            {
                return this._ISUSED;
            }
            set
            {

                this.OnPropertyChanged("ISUSED", this._ISUSED, value);
                this._ISUSED = value;
            }
        }


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                CODE = new PropertyItem("CODE", tableName);
                TITLE = new PropertyItem("TITLE", tableName);
                SOURCE = new PropertyItem("SOURCE", tableName);
                PUBDATE = new PropertyItem("PUBDATE", tableName);
                CONTENT = new PropertyItem("CONTENT", tableName);
                PUBUSER = new PropertyItem("PUBUSER", tableName);
                NOTE = new PropertyItem("NOTE", tableName);
                ISTOP = new PropertyItem("ISTOP", tableName);
                ISUSED = new PropertyItem("ISUSED", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 编号,
            /// </summary> 
            public PropertyItem CODE = null;
            /// <summary>
            /// 标题,
            /// </summary> 
            public PropertyItem TITLE = null;
            /// <summary>
            /// 来源,
            /// </summary> 
            public PropertyItem SOURCE = null;
            /// <summary>
            /// 发布日期,
            /// </summary> 
            public PropertyItem PUBDATE = null;
            /// <summary>
            /// 内容,
            /// </summary> 
            public PropertyItem CONTENT = null;
            /// <summary>
            /// 发布人,
            /// </summary> 
            public PropertyItem PUBUSER = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem NOTE = null;
            /// <summary>
            /// 是否置顶,
            /// </summary> 
            public PropertyItem ISTOP = null;
            /// <summary>
            /// 是否启用,
            /// </summary> 
            public PropertyItem ISUSED = null;


        }
        #endregion
    }
}