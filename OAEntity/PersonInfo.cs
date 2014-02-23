using System;
using Sharp.Common;

namespace OAEntity
{
    /// <summary>
    /// 员工信息表实体
    /// </summary>  

    public class PersonInfo : BaseEntity
    {
        public static Column _ = new Column("PersonInfo");

        public PersonInfo()
        {
            this.TableName = "PersonInfo";
        }

        #region 私有变量
        private Guid _ID;
        private string _UserName;
        private string _Pwd;
        private string _Email;
        private string _RealName;
        private string _Location;
        private string _DetailedAddress;
        private int _Sex;
        private string _Telphone;
        private string _IDCardNumber;
        private DateTime? _Birthday;
        private int? _MarryStatus;
        private bool _IsSystemAdmin;
        private DateTime _CreateDate;
        private DateTime _UpdateDATE;
        private string _photo;
        private string _Note;

        #endregion

        #region 属性
        /// <summary>
        /// 主键,
        /// </summary>
        [PrimaryKey]

        [DbProperty(MapingColumnName = "ID", DbTypeString = "UniqueIdentifier", ColumnIsNull = false, IsUnique = false, ColumnLength = 36, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 用户名,
        /// </summary>


        [DbProperty(MapingColumnName = "UserName", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 密码,
        /// </summary>


        [DbProperty(MapingColumnName = "Pwd", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Pwd
        {
            get
            {
                return this._Pwd;
            }
            set
            {

                this.OnPropertyChanged("Pwd", this._Pwd, value);
                this._Pwd = value;
            }
        }
        /// <summary>
        /// 邮箱,
        /// </summary>


        [DbProperty(MapingColumnName = "Email", DbTypeString = "nvarchar", ColumnIsNull = false, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {

                this.OnPropertyChanged("Email", this._Email, value);
                this._Email = value;
            }
        }
        /// <summary>
        /// 真实姓名,
        /// </summary>


        [DbProperty(MapingColumnName = "RealName", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 50, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string RealName
        {
            get
            {
                return this._RealName;
            }
            set
            {

                this.OnPropertyChanged("RealName", this._RealName, value);
                this._RealName = value;
            }
        }
        /// <summary>
        /// 所在地,
        /// </summary>


        [DbProperty(MapingColumnName = "Location", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 100, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Location
        {
            get
            {
                return this._Location;
            }
            set
            {

                this.OnPropertyChanged("Location", this._Location, value);
                this._Location = value;
            }
        }
        /// <summary>
        /// 详细地址,
        /// </summary>


        [DbProperty(MapingColumnName = "DetailedAddress", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 150, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string DetailedAddress
        {
            get
            {
                return this._DetailedAddress;
            }
            set
            {

                this.OnPropertyChanged("DetailedAddress", this._DetailedAddress, value);
                this._DetailedAddress = value;
            }
        }
        /// <summary>
        /// 性别,
        /// </summary>


        [DbProperty(MapingColumnName = "Sex", DbTypeString = "int", ColumnIsNull = false, IsUnique = false, ColumnLength = 10, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public int Sex
        {
            get
            {
                return this._Sex;
            }
            set
            {

                this.OnPropertyChanged("Sex", this._Sex, value);
                this._Sex = value;
            }
        }
        /// <summary>
        /// 手机号码,
        /// </summary>


        [DbProperty(MapingColumnName = "Telphone", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 20, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string Telphone
        {
            get
            {
                return this._Telphone;
            }
            set
            {

                this.OnPropertyChanged("Telphone", this._Telphone, value);
                this._Telphone = value;
            }
        }
        /// <summary>
        /// 身份证号,
        /// </summary>


        [DbProperty(MapingColumnName = "IDCardNumber", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 20, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string IDCardNumber
        {
            get
            {
                return this._IDCardNumber;
            }
            set
            {

                this.OnPropertyChanged("IDCardNumber", this._IDCardNumber, value);
                this._IDCardNumber = value;
            }
        }
        /// <summary>
        /// 生日,
        /// </summary>


        [DbProperty(MapingColumnName = "Birthday", DbTypeString = "datetime", ColumnIsNull = true, IsUnique = false, ColumnLength = 23, ColumnJingDu = 3, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime? Birthday
        {
            get
            {
                return this._Birthday;
            }
            set
            {

                this.OnPropertyChanged("Birthday", this._Birthday, value);
                this._Birthday = value;
            }
        }
        /// <summary>
        /// 婚姻状况,
        /// </summary>


        [DbProperty(MapingColumnName = "MarryStatus", DbTypeString = "int", ColumnIsNull = true, IsUnique = false, ColumnLength = 10, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public int? MarryStatus
        {
            get
            {
                return this._MarryStatus;
            }
            set
            {

                this.OnPropertyChanged("MarryStatus", this._MarryStatus, value);
                this._MarryStatus = value;
            }
        }
        /// <summary>
        /// 是否是管理员,
        /// </summary>


        [DbProperty(MapingColumnName = "IsSystemAdmin", DbTypeString = "bit", ColumnIsNull = false, IsUnique = false, ColumnLength = 1, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public bool IsSystemAdmin
        {
            get
            {
                return this._IsSystemAdmin;
            }
            set
            {

                this.OnPropertyChanged("IsSystemAdmin", this._IsSystemAdmin, value);
                this._IsSystemAdmin = value;
            }
        }
        /// <summary>
        /// 创建日期,
        /// </summary>


        [DbProperty(MapingColumnName = "CreateDate", DbTypeString = "datetime", ColumnIsNull = false, IsUnique = false, ColumnLength = 23, ColumnJingDu = 3, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

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
        /// 最后修改日期,
        /// </summary>


        [DbProperty(MapingColumnName = "UpdateDATE", DbTypeString = "datetime", ColumnIsNull = false, IsUnique = false, ColumnLength = 23, ColumnJingDu = 3, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public DateTime UpdateDATE
        {
            get
            {
                return this._UpdateDATE;
            }
            set
            {

                this.OnPropertyChanged("UpdateDATE", this._UpdateDATE, value);
                this._UpdateDATE = value;
            }
        }
        /// <summary>
        /// 照片,
        /// </summary>


        [DbProperty(MapingColumnName = "photo", DbTypeString = "nvarchar", ColumnIsNull = true, IsUnique = false, ColumnLength = 200, ColumnJingDu = 0, IsGenarator = false, StepSize = 0, ColumnDefaultValue = "")]

        public string photo
        {
            get
            {
                return this._photo;
            }
            set
            {

                this.OnPropertyChanged("photo", this._photo, value);
                this._photo = value;
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


        #endregion

        #region 列定义

        public class Column
        {
            public Column(string tableName)
            {
                ID = new PropertyItem("ID", tableName);
                UserName = new PropertyItem("UserName", tableName);
                Pwd = new PropertyItem("Pwd", tableName);
                Email = new PropertyItem("Email", tableName);
                RealName = new PropertyItem("RealName", tableName);
                Location = new PropertyItem("Location", tableName);
                DetailedAddress = new PropertyItem("DetailedAddress", tableName);
                Sex = new PropertyItem("Sex", tableName);
                Telphone = new PropertyItem("Telphone", tableName);
                IDCardNumber = new PropertyItem("IDCardNumber", tableName);
                Birthday = new PropertyItem("Birthday", tableName);
                MarryStatus = new PropertyItem("MarryStatus", tableName);
                IsSystemAdmin = new PropertyItem("IsSystemAdmin", tableName);
                CreateDate = new PropertyItem("CreateDate", tableName);
                UpdateDATE = new PropertyItem("UpdateDATE", tableName);
                photo = new PropertyItem("photo", tableName);
                Note = new PropertyItem("Note", tableName);

            }
            /// <summary>
            /// 主键,
            /// </summary> 
            public PropertyItem ID = null;
            /// <summary>
            /// 用户名,
            /// </summary> 
            public PropertyItem UserName = null;
            /// <summary>
            /// 密码,
            /// </summary> 
            public PropertyItem Pwd = null;
            /// <summary>
            /// 邮箱,
            /// </summary> 
            public PropertyItem Email = null;
            /// <summary>
            /// 真实姓名,
            /// </summary> 
            public PropertyItem RealName = null;
            /// <summary>
            /// 所在地,
            /// </summary> 
            public PropertyItem Location = null;
            /// <summary>
            /// 详细地址,
            /// </summary> 
            public PropertyItem DetailedAddress = null;
            /// <summary>
            /// 性别,
            /// </summary> 
            public PropertyItem Sex = null;
            /// <summary>
            /// 手机号码,
            /// </summary> 
            public PropertyItem Telphone = null;
            /// <summary>
            /// 身份证号,
            /// </summary> 
            public PropertyItem IDCardNumber = null;
            /// <summary>
            /// 生日,
            /// </summary> 
            public PropertyItem Birthday = null;
            /// <summary>
            /// 婚姻状况,
            /// </summary> 
            public PropertyItem MarryStatus = null;
            /// <summary>
            /// 是否是管理员,
            /// </summary> 
            public PropertyItem IsSystemAdmin = null;
            /// <summary>
            /// 创建日期,
            /// </summary> 
            public PropertyItem CreateDate = null;
            /// <summary>
            /// 最后修改日期,
            /// </summary> 
            public PropertyItem UpdateDATE = null;
            /// <summary>
            /// 照片,
            /// </summary> 
            public PropertyItem photo = null;
            /// <summary>
            /// 备注,
            /// </summary> 
            public PropertyItem Note = null;


        }
        #endregion
    }
}