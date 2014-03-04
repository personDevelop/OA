
INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', '数据管理', NULL, '', 1, '', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('C9B92636-6C96-4BC3-8295-194C1DC033D7', '用户管理', '用户管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'PersonInfoList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('AE363AE5-93DA-4563-BC8E-19AD06E99358', '报工管理', '报工管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'WorkInfoEdit.aspx', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('39961153-CAFF-4611-858A-404D46F900CA', '行政地区', '行政地区', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'AdministrativeRegionsList.aspx', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('64DD070F-3ACC-4FB8-822A-4A63CE8EC418', '公告管理', '公告管理', '24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', 1, 'NoticeInfoList.aspx', '', '', 0)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('1887BAEC-6CB5-407F-AEA4-62D7996F5662', '填写日期', '填写日期', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'DayLogEdit.aspx', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', '日常工作', NULL, '', 1, '', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('11BEB6A7-E584-4C0B-84D1-7D6B83DFA780', '考勤统计', '考勤统计', 'E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', 1, 'queryKaoQin.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', '系统管理', NULL, '', 1, '', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('27A8016C-4646-49A7-9B7D-AC70974A796E', '考勤管理', '考勤管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'YuanGongKaoQinList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('AC11811A-7D73-4333-ABFF-C3A689D632A7', '派工统计', '派工统计', 'E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', 1, 'queryPaiGong.aspx', '', '', 0)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('578A6DFC-744F-4D34-B787-DCA6D9F8643F', '派工管理', '派工管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'WorkInfoList.aspx', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('1A2B3982-E983-4EC9-BF5F-E00E606D13F8', '设备管理', '设备管理', '24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', 1, 'ShebeiInfoList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', '查询统计', NULL, '', 1, '', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('4873A324-207F-4A6A-9379-ED52EB61FACC', '日志信息', '日志信息', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'DayLogList.aspx', '', '', 5)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('A6AC4001-691E-446C-94A1-EE7B2B70B55C', '权限管理', '权限管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'FuncAccessEdit.aspx', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('9BA4BD00-AB18-450F-A651-F71840976C01', '角色管理', '角色管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'RoleInfoList.aspx', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, [Image], OrderNo)
VALUES ('B0DBC608-296B-4E7A-8FED-FD5C336A20CC', '系统设置', '系统设置', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'SystemCodeList.aspx', '', '', 5)
GO

