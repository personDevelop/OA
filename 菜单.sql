﻿
INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', '数据管理', NULL, '', 1, '', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('C9B92636-6C96-4BC3-8295-194C1DC033D7', '用户管理', '用户管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'PersonInfoList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('AE363AE5-93DA-4563-BC8E-19AD06E99358', '报工管理', '报工管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'WorkInfoEdit.aspx', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('39961153-CAFF-4611-858A-404D46F900CA', '行政地区', '行政地区', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'AdministrativeRegionsList.aspx', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('64DD070F-3ACC-4FB8-822A-4A63CE8EC418', '公告管理', '公告管理', '24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', 1, 'NoticeInfoList.aspx', '', '', 0)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('1887BAEC-6CB5-407F-AEA4-62D7996F5662', '填写日期', '填写日期', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'DayLogEdit.aspx', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', '日常工作', NULL, '', 1, '', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('8982566E-8B13-43DB-89F5-6741416CE290', '待办任务', '待办任务', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'WorkInfoList.aspx?DaiBan=1', '', '', 0)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('11BEB6A7-E584-4C0B-84D1-7D6B83DFA780', '考勤统计', '考勤统计', 'E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', 1, 'queryKaoQin.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', '系统管理', NULL, '', 1, '', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('27A8016C-4646-49A7-9B7D-AC70974A796E', '考勤管理', '考勤管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'YuanGongKaoQinList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('AC11811A-7D73-4333-ABFF-C3A689D632A7', '派工统计', '派工统计', 'E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', 1, 'queryPaiGong.aspx', '', '', 0)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('578A6DFC-744F-4D34-B787-DCA6D9F8643F', '派工管理', '派工管理', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'WorkInfoList.aspx', '', '', 4)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('1A2B3982-E983-4EC9-BF5F-E00E606D13F8', '设备管理', '设备管理', '24BBDC90-DEC5-484D-A30D-14002A5C5655', '数据管理', 1, 'ShebeiInfoList.aspx', '', '', 1)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('E41C7171-A11B-449E-97A8-E5D2A5D48054', '查询统计', '查询统计', NULL, '', 1, '', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('4873A324-207F-4A6A-9379-ED52EB61FACC', '日志信息', '日志信息', 'C552B14A-0502-4183-896B-64C1E86B7BFA', '日常工作', 1, 'DayLogList.aspx', '', '', 5)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('A6AC4001-691E-446C-94A1-EE7B2B70B55C', '权限管理', '权限管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'FuncAccessEdit.aspx', '', '', 3)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('9BA4BD00-AB18-450F-A651-F71840976C01', '角色管理', '角色管理', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'RoleInfoList.aspx', '', '', 2)
GO

INSERT INTO dbo.FunctionInfo (ID, Code, Name, ParentID, ParentName, IsEnable, Url, Note, Image, OrderNo)
VALUES ('B0DBC608-296B-4E7A-8FED-FD5C336A20CC', '系统设置', '系统设置', '22FE18FD-A378-4394-89C7-7E68A83927D0', '系统管理', 1, 'SystemCodeList.aspx', '', '', 5)
GO
 
INSERT INTO dbo.PersonInfo (ID, UserName, Pwd, Email, RealName, Location, DetailedAddress, Sex, Telphone, IDCardNumber, Birthday, MarryStatus, IsSystemAdmin, CreateDate, UpdateDATE, photo, Note)
VALUES ('5C0FCE6E-D98D-4F09-BD0E-6EF04111383A', 'admin', 'admin', 'admin@163.com', '管理员', '', '', 1, '1111', '111', '2014-03-07', 3, 0, '2014-03-07', '2014-03-07', NULL, '')
GO
INSERT INTO dbo.RolePerson (ID, RoleID, PersonID)
VALUES ('5C0FCE6E-D98D-4F09-BD0E-6EF04111383A', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '5C0FCE6E-D98D-4F09-BD0E-6EF04111382A')
GO
 
INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('ECBDB47E-E609-4081-9C93-012307DC3D74', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '22fe18fd-a378-4394-89c7-7e68a83927d0', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('4C4CC76E-7431-417E-B647-0DFF5C5CAF5F', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '4873a324-207f-4a6a-9379-ed52eb61facc', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('40986124-B765-42A0-9DE1-10DEBD139B6A', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '578a6dfc-744f-4d34-b787-dca6d9f8643f', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('6D7154D4-B179-43B8-B68E-160118C77049', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'a6ac4001-691e-446c-94a1-ee7b2b70b55c', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('63B05A7B-EDE8-47D1-B453-19D4A3FE1E9A', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '27a8016c-4646-49a7-9b7d-ac70974a796e', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('A601E94C-32BB-4798-8D78-1B65AF9EC53D', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'b0dbc608-296b-4e7a-8fed-fd5c336a20cc', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('A94C6695-9B58-49DA-BD4D-21A117B569CE', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'ac11811a-7d73-4333-abff-c3a689d632a7', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('74B487CA-6BFA-4825-AF17-23B705997245', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '8982566e-8b13-43db-89f5-6741416ce290', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('F9FB4EFA-A2F8-4999-8B15-29C3F34FF965', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '9ba4bd00-ab18-450f-a651-f71840976c01', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('5286349F-2D11-4CBC-AE92-2AF49C7EEDF3', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '1a2b3982-e983-4ec9-bf5f-e00e606d13f8', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('224F9B8F-D5AC-4DDF-BC0A-3556F3C45E2E', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '11beb6a7-e584-4c0b-84d1-7d6b83dfa780', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('9135D517-5730-4C14-8B7A-3F4544E14B40', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'c552b14a-0502-4183-896b-64c1e86b7bfa', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('E8484232-2EB9-4BF2-BA2C-44EEC1BB8B6C', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'ae363ae5-93da-4563-bc8e-19ad06e99358', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('AE5C0549-8EE3-43CE-993F-45CB27FEBE83', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '4873a324-207f-4a6a-9379-ed52eb61facc', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('FED28C64-AD4D-452B-B718-4601DF34F0C1', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '11beb6a7-e584-4c0b-84d1-7d6b83dfa780', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('9E726570-BED9-4B19-9748-4B2083F5C185', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '64dd070f-3acc-4fb8-822a-4a63ce8ec418', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('55151719-651E-41A4-BEE2-4BC1C024DAEB', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '39961153-caff-4611-858a-404d46f900ca', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('8420D644-D241-4B4A-A257-4F3941E2B7F0', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '8982566e-8b13-43db-89f5-6741416ce290', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('50AD3756-395F-44D3-B48A-51C602639300', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '8982566e-8b13-43db-89f5-6741416ce290', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('FFE0F981-9B59-4DD4-A825-5BCDB79044E5', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'ae363ae5-93da-4563-bc8e-19ad06e99358', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('35E65D2D-0591-4B5D-A3E5-5FF1297DD9DA', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '9ba4bd00-ab18-450f-a651-f71840976c01', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('A099A1C4-3BC6-495B-92CA-65A58F774231', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'ac11811a-7d73-4333-abff-c3a689d632a7', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('D51BFEAE-083B-4E7F-8D0A-72053CA41EA2', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'e41c7171-a11b-449e-97a8-e5d2a5d48054', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('25C049AD-E5B1-4D18-B3DC-7A30EE402645', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'ac11811a-7d73-4333-abff-c3a689d632a7', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('CC3793AD-D67F-4629-9CF5-7DB5AFD8BAF7', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'ae363ae5-93da-4563-bc8e-19ad06e99358', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('A55EF45E-AA39-4B27-9365-81085D113C45', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '64dd070f-3acc-4fb8-822a-4a63ce8ec418', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('6F561E12-9E3A-46CE-BEBF-819566FF5046', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '9ba4bd00-ab18-450f-a651-f71840976c01', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('15D6FD07-FC58-499F-A207-85789C6D1733', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'c552b14a-0502-4183-896b-64c1e86b7bfa', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('CDE301AD-39A2-4BCB-A4C9-8C0E4337DD9B', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '1887baec-6cb5-407f-aea4-62d7996f5662', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('7544CB16-6EA6-43F7-BC8C-8ECB4CE21C34', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '1a2b3982-e983-4ec9-bf5f-e00e606d13f8', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('C735F757-C4EA-4FA9-AC1D-8F9FA5A09D89', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '24bbdc90-dec5-484d-a30d-14002a5c5655', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('F2F3F734-C12D-4E92-9CEE-90DF8348E789', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'c552b14a-0502-4183-896b-64c1e86b7bfa', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('2624E6A1-FC3E-489C-9E98-980EF5039986', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '4873a324-207f-4a6a-9379-ed52eb61facc', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('E76865A1-72F3-4602-ABB9-9A4C9736D70E', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '22fe18fd-a378-4394-89c7-7e68a83927d0', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('555D0176-0608-47F1-A3FC-9B86E54E3B8D', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '1887baec-6cb5-407f-aea4-62d7996f5662', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('24D059CC-D5B2-46E9-8B77-A012B3536024', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '24bbdc90-dec5-484d-a30d-14002a5c5655', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('F3ABB932-E81B-46D6-95F5-A4A50C2587E3', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'a6ac4001-691e-446c-94a1-ee7b2b70b55c', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('C3CCB4B5-9818-44D6-89DE-A9D2E249D4A1', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '24bbdc90-dec5-484d-a30d-14002a5c5655', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('E7C65FF9-62DD-4686-9459-AAC3EB0BB947', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'c9b92636-6c96-4bc3-8295-194c1dc033d7', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('EC0AF89C-6CE0-4FF1-A2B8-B0D11FEB9F22', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '39961153-caff-4611-858a-404d46f900ca', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('08335FA9-CB47-4D49-98C3-B103A31C8F4E', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'e41c7171-a11b-449e-97a8-e5d2a5d48054', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('2DBFE790-0DEF-46FF-A096-B1A808037875', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '1887baec-6cb5-407f-aea4-62d7996f5662', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('8767E04E-3696-4C84-AC09-B26598377F2A', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'b0dbc608-296b-4e7a-8fed-fd5c336a20cc', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('C24095CF-C6DF-4876-A2E9-B967E2613278', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '39961153-caff-4611-858a-404d46f900ca', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('EEF1668D-F46F-4271-95BE-BAADF56C54DA', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'b0dbc608-296b-4e7a-8fed-fd5c336a20cc', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('A6842F51-D978-4EFA-AECC-BADD8BE22CD1', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'e41c7171-a11b-449e-97a8-e5d2a5d48054', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('64DEAF6D-58E8-4982-99F5-BCD146DE8F2C', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '11beb6a7-e584-4c0b-84d1-7d6b83dfa780', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('8670D531-7703-4F85-8DB6-BFA21B9AD2BD', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '27a8016c-4646-49a7-9b7d-ac70974a796e', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('B963D083-D71E-46B1-9655-C5135DF98326', 'EA631369-F99F-466F-8F10-8A520BF1A67E', 'c9b92636-6c96-4bc3-8295-194c1dc033d7', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('02C87933-3206-4EB1-934F-C7F865379469', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '578a6dfc-744f-4d34-b787-dca6d9f8643f', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('24FABF90-1DE4-4449-A205-CC06B069CA2B', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '22fe18fd-a378-4394-89c7-7e68a83927d0', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('3148F27B-1EA4-45F0-9794-CFB9D32AE3F9', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '1a2b3982-e983-4ec9-bf5f-e00e606d13f8', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('9193F5EF-E757-4C59-99D6-DCB6821F77AD', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', '64dd070f-3acc-4fb8-822a-4a63ce8ec418', 0, 0)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('49C7EEF7-C865-41EE-81A0-E13902A66EF3', 'C34697F5-944A-44FD-B5C8-67CB2410048A', 'a6ac4001-691e-446c-94a1-ee7b2b70b55c', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('EC19D5AC-F9FA-4699-A842-E3D91D5107BA', 'C34697F5-944A-44FD-B5C8-67CB2410048A', '27a8016c-4646-49a7-9b7d-ac70974a796e', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('928CE345-7E78-44FD-9DAD-EF18962AB31E', 'EA631369-F99F-466F-8F10-8A520BF1A67E', '578a6dfc-744f-4d34-b787-dca6d9f8643f', 1, 1)
GO

INSERT INTO dbo.FuncAccess (ID, RoleID, FunctID, IsEnable, IsView)
VALUES ('5FCDCE4D-2D7A-41B5-ABDB-F7C40431791C', '1EBADDBA-F543-480F-8AF1-87611CFBFADE', 'c9b92636-6c96-4bc3-8295-194c1dc033d7', 0, 0)
GO
