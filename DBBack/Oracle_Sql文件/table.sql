prompt PL/SQL Developer import file
prompt Created on 2011��7��2�� by Administrator
set feedback off
set define off
prompt Creating AADMIN...
create table AADMIN
(
  ADMINID     VARCHAR2(50) not null,
  ADMINNAME   VARCHAR2(50),
  AUTHENABLED NUMBER(1) not null,
  REMARK      VARCHAR2(200),
  CREATOR     VARCHAR2(50),
  CREATETIME  DATE,
  MODIFIER    VARCHAR2(50),
  MODIFYTIME  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AADMIN
  add primary key (ADMINID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AADMINGROUP...
create table AADMINGROUP
(
  ADMINID VARCHAR2(50) not null,
  GROUPID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AADMINGROUP
  add primary key (ADMINID, GROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AADMINORG...
create table AADMINORG
(
  ADMINID VARCHAR2(50) not null,
  ORGID   VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AADMINORG
  add primary key (ADMINID, ORGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AADMINROLE...
create table AADMINROLE
(
  ADMINID VARCHAR2(50) not null,
  ROLEID  VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AADMINROLE
  add primary key (ADMINID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating ACCESSLOG...
create table ACCESSLOG
(
  ID          NUMBER(20) not null,
  TYPE        NUMBER(1),
  USERID      VARCHAR2(50),
  USERNAME    VARCHAR2(50),
  ORG         VARCHAR2(50),
  DOMAIN      VARCHAR2(50),
  GROUPID     VARCHAR2(50),
  GROUPNAME   VARCHAR2(50),
  UNITID      VARCHAR2(50),
  UNITNAME    VARCHAR2(50),
  ELEMENTID   VARCHAR2(50),
  ELEMENTNAME VARCHAR2(50),
  COST        NUMBER(10),
  OK          NUMBER(1),
  CURTIME     DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table ACCESSLOG
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
create index AL_CT_IDX on ACCESSLOG (CURTIME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating ADEGREE...
create table ADEGREE
(
  DEGREE     NUMBER(2) not null,
  DEGREENAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table ADEGREE
  add primary key (DEGREE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AGROUP...
create table AGROUP
(
  GROUPID    VARCHAR2(50) not null,
  PARENTID   VARCHAR2(50),
  GROUPNAME  VARCHAR2(50),
  GROUPLEVEL NUMBER(2),
  ENABLED    NUMBER(1) not null,
  REMARK     VARCHAR2(200),
  CREATOR    VARCHAR2(50),
  CREATETIME DATE,
  MODIFIER   VARCHAR2(50),
  MODIFYTIME DATE,
  O          NUMBER(5),
  GTYPE      VARCHAR2(50),
  STIME      DATE,
  ETIME      DATE,
  TOTALUSERS NUMBER(5),
  TOTALDEVS  NUMBER(5),
  GROUPUSERS VARCHAR2(1000),
  GROUPDEVS  VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column AGROUP.GTYPE
  is '�������ͣ�ԭ���û���Ĭ��Ϊ�գ������û�����Ϊ1�������豸����Ϊ2��';
comment on column AGROUP.STIME
  is '���տ�ʼ';
comment on column AGROUP.ETIME
  is '���ս���';
comment on column AGROUP.TOTALUSERS
  is '�û�����';
comment on column AGROUP.TOTALDEVS
  is '�豸����';
comment on column AGROUP.GROUPUSERS
  is '�����û��б�';
comment on column AGROUP.GROUPDEVS
  is '�����豸�б�';
alter table AGROUP
  add primary key (GROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGROUP
  add unique (PARENTID)
  disable;

prompt Creating AGROUPLEVEL...
create table AGROUPLEVEL
(
  UPPERID VARCHAR2(50) not null,
  LOWERID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGROUPLEVEL
  add primary key (UPPERID, LOWERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AGROUPROLE...
create table AGROUPROLE
(
  GROUPID VARCHAR2(50) not null,
  ROLEID  VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGROUPROLE
  add primary key (GROUPID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AORG...
create table AORG
(
  ORGID      VARCHAR2(50) not null,
  PARENTID   VARCHAR2(50),
  ORGNAME    VARCHAR2(50),
  ORGTYPE    VARCHAR2(50),
  ORGLEVEL   NUMBER(2),
  O          NUMBER(5),
  REMARK     VARCHAR2(200),
  CREATOR    VARCHAR2(50),
  CREATETIME DATE,
  MODIFIER   VARCHAR2(50),
  MODIFYTIME DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AORG
  add primary key (ORGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AORGLEADER...
create table AORGLEADER
(
  ORGID      VARCHAR2(50) not null,
  USERID     VARCHAR2(50) not null,
  LEADERTYPE NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AORGLEADER
  add primary key (ORGID, USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AORGLEVEL...
create table AORGLEVEL
(
  UPPERID VARCHAR2(50) not null,
  LOWERID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AORGLEVEL
  add primary key (UPPERID, LOWERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AORGROLE...
create table AORGROLE
(
  ORGID  VARCHAR2(50) not null,
  ROLEID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AORGROLE
  add primary key (ORGID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AORGTYPE...
create table AORGTYPE
(
  ORGTYPE     VARCHAR2(50) not null,
  ORGTYPENAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AORGTYPE
  add primary key (ORGTYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating APOST...
create table APOST
(
  POSTID   NUMBER(5) not null,
  POSTNAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table APOST
  add primary key (POSTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AREPELLENTROLE...
create table AREPELLENTROLE
(
  ROLEID          VARCHAR2(50) not null,
  REPELLENTROLEID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AREPELLENTROLE
  add primary key (ROLEID, REPELLENTROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AROLE...
create table AROLE
(
  ROLEID     VARCHAR2(50) not null,
  PARENTID   VARCHAR2(50),
  ROLENAME   VARCHAR2(50),
  ROLELEVEL  NUMBER(2),
  ENABLED    NUMBER(1) not null,
  REMARK     VARCHAR2(200),
  CREATOR    VARCHAR2(50),
  CREATETIME DATE,
  MODIFIER   VARCHAR2(50),
  MODIFYTIME DATE,
  O          NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AROLE
  add primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AROLEPRIVILEGE...
create table AROLEPRIVILEGE
(
  ROLEID VARCHAR2(50) not null,
  DOMAIN VARCHAR2(50) not null,
  TYPE   NUMBER(1) not null,
  RID    VARCHAR2(50) not null,
  PID    VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AROLEPRIVILEGE
  add primary key (ROLEID, DOMAIN, RID, TYPE, PID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AUSER...
create table AUSER
(
  USERID      VARCHAR2(50) not null,
  USERNAME    VARCHAR2(50),
  ADMINID     VARCHAR2(50),
  ORGID       VARCHAR2(50),
  PASSWORD    VARCHAR2(32) not null,
  USERLEVEL   NUMBER(1) not null,
  ISLEADER    NUMBER(1),
  EXPIREDDATE DATE,
  LOGINTIME   DATE,
  LOGINIP     VARCHAR2(15),
  LASTTIME    DATE,
  LASTIP      VARCHAR2(15),
  SKIN        VARCHAR2(20),
  LANGCODE    VARCHAR2(10),
  USERTYPE    VARCHAR2(50),
  POSTID      NUMBER(5),
  SEX         NUMBER(1),
  BIRTHDAY    DATE,
  IDCARD      VARCHAR2(50),
  SCHOOL      VARCHAR2(100),
  GRADUATION  NUMBER(4),
  DEGREE      NUMBER(2),
  MAJOR       VARCHAR2(50),
  COUNTRY     VARCHAR2(10),
  PROVINCE    VARCHAR2(20),
  CITY        VARCHAR2(30),
  ADDRESS     VARCHAR2(200),
  POSTCODE    VARCHAR2(20),
  PHONE       VARCHAR2(50),
  FAX         VARCHAR2(50),
  MOBILE      VARCHAR2(50),
  EMAIL       VARCHAR2(100),
  REMARK      VARCHAR2(200),
  CREATOR     VARCHAR2(50),
  CREATETIME  DATE,
  MODIFIER    VARCHAR2(50),
  MODIFYTIME  DATE,
  EXPIRED     NUMBER(1),
  IPCONFIG    VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUSER
  add primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUSER
  add foreign key (ORGID)
  references AORG (ORGID);
create index AU_P_IDX on AUSER (PASSWORD)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AUSERGROUP...
create table AUSERGROUP
(
  USERID  VARCHAR2(50) not null,
  GROUPID VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUSERGROUP
  add primary key (USERID, GROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AUSERROLE...
create table AUSERROLE
(
  USERID VARCHAR2(50) not null,
  ROLEID VARCHAR2(50) not null,
  HOLD   NUMBER(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUSERROLE
  add primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AUSERTYPE...
create table AUSERTYPE
(
  USERTYPE     VARCHAR2(50) not null,
  USERTYPENAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table AUSERTYPE
  add primary key (USERTYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating AVAR...
create table AVAR
(
  VID        VARCHAR2(50) not null,
  PARENTID   VARCHAR2(50),
  VNAME      VARCHAR2(50),
  VVALUE     VARCHAR2(2000),
  REMARK     VARCHAR2(500),
  CREATOR    VARCHAR2(50),
  CREATETIME DATE,
  MODIFIER   VARCHAR2(50),
  MODIFYTIME DATE,
  O          NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVAR
  add primary key (VID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_ADMINIDISTRICTS...
create table BTOC_ADMINIDISTRICTS
(
  XZQHBH VARCHAR2(20),
  XZQHMC VARCHAR2(100),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_ALARMLEVEL...
create table BTOC_ALARMLEVEL
(
  BJDJDM VARCHAR2(3) not null,
  BJDJ   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_ALARMLEVEL
  add primary key (BJDJDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_ALARMTYPE...
create table BTOC_ALARMTYPE
(
  BJLXDM VARCHAR2(3) not null,
  BJLX   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_ALARMTYPE
  add primary key (BJLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_COLLAUTHORITY...
create table BTOC_COLLAUTHORITY
(
  CJJGBH VARCHAR2(20),
  CJJGMC VARCHAR2(100),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_DEALTYPE...
create table BTOC_DEALTYPE
(
  BJCLLXDM VARCHAR2(3) not null,
  BJCLLX   VARCHAR2(50),
  PX       NUMBER(5),
  ZTBJ     CHAR(1),
  BZ       VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_DEALTYPE
  add primary key (BJCLLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_DEVICESUPPLIER...
create table BTOC_DEVICESUPPLIER
(
  SBCSDM VARCHAR2(20) not null,
  SBCS   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_DEVICESUPPLIER
  add primary key (SBCSDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_DEVICETYPE...
create table BTOC_DEVICETYPE
(
  SBLX   VARCHAR2(20) not null,
  SBLXMC VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_DEVICETYPE
  add primary key (SBLX)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_DISPCHARACTER...
create table BTOC_DISPCHARACTER
(
  BKXZDM VARCHAR2(3) not null,
  BKXZ   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_DISPCHARACTER
  add primary key (BKXZDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_INFOTYPE...
create table BTOC_INFOTYPE
(
  FBXXLXDM VARCHAR2(3) not null,
  FBXXLX   VARCHAR2(50),
  PX       NUMBER(5),
  ZTBJ     CHAR(1),
  BZ       VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_INFOTYPE
  add primary key (FBXXLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_RECPROGRAMTYPE...
create table BTOC_RECPROGRAMTYPE
(
  JSCXLXDM VARCHAR2(3) not null,
  JSCXLX   VARCHAR2(50),
  PX       NUMBER(5),
  ZTBJ     CHAR(1),
  BZ       VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_RECPROGRAMTYPE
  add primary key (JSCXLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_TOGATETYPE...
create table BTOC_TOGATETYPE
(
  KKLXDM VARCHAR2(3) not null,
  KKLX   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_TOGATETYPE
  add primary key (KKLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_UNIDENTIFYTYPE...
create table BTOC_UNIDENTIFYTYPE
(
  WSBLXDM VARCHAR2(3) not null,
  WSBLX   VARCHAR2(50),
  PX      NUMBER(5),
  ZTBJ    CHAR(1),
  BZ      VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BTOC_UNIDENTIFYTYPE
  add primary key (WSBLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BTOC_WZWPYY...
create table BTOC_WZWPYY
(
  WZWPBH VARCHAR2(10) not null,
  WZWPYY VARCHAR2(100),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating BTOC_WZYY...
create table BTOC_WZYY
(
  WZYYBH VARCHAR2(10) not null,
  WZYY   VARCHAR2(100),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CARMONITORS...
create table CARMONITORS
(
  ORGID      VARCHAR2(50) not null,
  PARENTID   VARCHAR2(50),
  ORGNAME    VARCHAR2(50),
  ORGLEVEL   NUMBER(5),
  ORGTYPE    VARCHAR2(50),
  REMARK     VARCHAR2(200),
  O          NUMBER(5),
  CREATOR    VARCHAR2(50),
  CREATETIME DATE,
  MODIFIER   VARCHAR2(50),
  MODIFYTIME DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARMONITORS
  add primary key (ORGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CARNO_COLOR...
create table CARNO_COLOR
(
  ID   VARCHAR2(50) not null,
  NAME VARCHAR2(100) not null,
  SORT VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARNO_COLOR
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CARNO_MONITORPOINTS...
create table CARNO_MONITORPOINTS
(
  ID         VARCHAR2(200) not null,
  PARENTID   VARCHAR2(200),
  PARENTNAME VARCHAR2(50),
  NAME       VARCHAR2(50),
  SORT       VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARNO_MONITORPOINTS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CARNO_NUM...
create table CARNO_NUM
(
  ID         VARCHAR2(200) not null,
  PARENTID   VARCHAR2(200),
  PARENTNAME VARCHAR2(50),
  NAME       VARCHAR2(50),
  SORT       VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARNO_NUM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CARNO_TYPE...
create table CARNO_TYPE
(
  ID   VARCHAR2(50) not null,
  NAME VARCHAR2(100) not null,
  SORT VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CARNO_TYPE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CAR_INFO_MONITOR...
create table CAR_INFO_MONITOR
(
  MONITORINFOID    VARCHAR2(200) not null,
  CARINFOID        VARCHAR2(50) not null,
  CARNO            VARCHAR2(50) not null,
  CARNO_TYPE       VARCHAR2(50) not null,
  CARNO_COLOR      VARCHAR2(50) not null,
  CAR_TYPE         VARCHAR2(50) not null,
  CAR_MONITOR_TYPE VARCHAR2(50) not null,
  CAR_ROAD         VARCHAR2(50) not null,
  DIRECTION        VARCHAR2(50) not null,
  PASSTIME         DATE not null,
  SPEED            VARCHAR2(50) not null,
  UNIDENTIFY_TYPE  VARCHAR2(50),
  IDENTIFY_STATUS  VARCHAR2(50),
  IDENTIFY_REMARK  VARCHAR2(50),
  MANAGE_DEP       VARCHAR2(50),
  SHEF_STATUS      VARCHAR2(50),
  CAR_STATUS       VARCHAR2(50),
  REMARK           VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CAR_INFO_MONITOR
  add primary key (MONITORINFOID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CAR_INFO_OWNER...
create table CAR_INFO_OWNER
(
  OWNERINFOID      VARCHAR2(200) not null,
  CARINFOID        VARCHAR2(200) not null,
  CARNO            VARCHAR2(50) not null,
  OWNER_NAME       VARCHAR2(50) not null,
  OWNER_IDCARD     VARCHAR2(50) not null,
  SEX              VARCHAR2(50),
  BIRTHDAY         VARCHAR2(50),
  DRIVERCARDSTART  DATE,
  DRIVERCARDSTATUS VARCHAR2(50),
  MANAGETYPE       VARCHAR2(50),
  ARCHIVEID        VARCHAR2(50),
  TOTALPOINTS      VARCHAR2(50),
  ADDREGION        VARCHAR2(50),
  ADDRESS          VARCHAR2(50),
  PHONE            VARCHAR2(50),
  POST             VARCHAR2(50),
  REMARK           VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CAR_INFO_OWNER
  add primary key (OWNERINFOID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CAR_INFO_TITLE...
create table CAR_INFO_TITLE
(
  CARINFOID        VARCHAR2(200) not null,
  CARNO            VARCHAR2(200) not null,
  CARNO_TYPE       VARCHAR2(50) not null,
  CAR_CATEGORY     VARCHAR2(50) not null,
  ZH_DANDY         VARCHAR2(50),
  EN_DANDY         VARCHAR2(50),
  ENGINE_NUM       VARCHAR2(50) not null,
  CAR_IDENTIFY_NUM VARCHAR2(50),
  CAR_TYPE         VARCHAR2(50),
  CAR_COLOR        VARCHAR2(50),
  OWNER            VARCHAR2(50),
  OWNER_ID         VARCHAR2(50),
  CHECK_TIME       VARCHAR2(50),
  ENABLE_TIME      VARCHAR2(50),
  APPLYDIS_TIME    VARCHAR2(50),
  SENDID_DEP       VARCHAR2(50),
  REMARK           VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CAR_INFO_TITLE
  add primary key (CARINFOID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CAR_TYPE...
create table CAR_TYPE
(
  ID   VARCHAR2(50) not null,
  NAME VARCHAR2(100) not null,
  SORT VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CAR_TYPE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DEMO_LEAVE...
create table DEMO_LEAVE
(
  LEAVEID    NUMBER(20) not null,
  FLOWSTATUS NUMBER(5),
  CALLER     VARCHAR2(50),
  CALLTIME   DATE,
  BEGINDATE  DATE,
  BEGINTIME  NUMBER(5),
  ENDDATE    DATE,
  ENDTIME    NUMBER(5),
  REASON     VARCHAR2(500),
  DAYS       NUMBER(5,1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table DEMO_LEAVE
  add primary key (LEAVEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating ELP_CWZ...
create table ELP_CWZ
(
  CWZID  VARCHAR2(100) not null,
  MVID   VARCHAR2(100),
  CLXXBH VARCHAR2(15),
  KKBH   VARCHAR2(12),
  KKMC   VARCHAR2(100),
  FXBH   VARCHAR2(50),
  FXMC   VARCHAR2(100),
  CDBH   VARCHAR2(50),
  CDMC   VARCHAR2(50),
  JGSK   DATE,
  HPHM   VARCHAR2(15),
  HPYSBH VARCHAR2(1),
  HPYS   VARCHAR2(50),
  TXSL   NUMBER(5),
  TXMC1  VARCHAR2(100),
  TXMC2  VARCHAR2(100),
  TXMC3  VARCHAR2(100),
  TXMC4  VARCHAR2(100),
  SPMC   VARCHAR2(100),
  CLSD   NUMBER(5),
  XSZT   VARCHAR2(4),
  CLPP   VARCHAR2(3),
  CLWX   VARCHAR2(3),
  CSYS   VARCHAR2(5),
  CLWKC  NUMBER(10,2),
  CLLX   VARCHAR2(4),
  CLLXMC VARCHAR2(100),
  HPZL   VARCHAR2(2),
  HPZLMC VARCHAR2(100),
  DWBH   VARCHAR2(4),
  DWMC   VARCHAR2(200),
  WZYY   VARCHAR2(2000),
  JSZH   VARCHAR2(50),
  JSYXM  VARCHAR2(50),
  GGBJ   CHAR(1),
  GGCZY  VARCHAR2(50),
  GGLX   CHAR(1),
  GGSJ   DATE,
  QRCZY  VARCHAR2(50),
  QRSJ   DATE,
  CLCZY  VARCHAR2(50),
  CLSJ   DATE,
  CLBJ   VARCHAR2(1),
  FHBJ   CHAR(1),
  FHCZY  VARCHAR2(50),
  FHSJ   DATE,
  HDHMSJ NUMBER(5),
  BZ     VARCHAR2(2000),
  SHBJ   CHAR(1),
  SHSJ   DATE,
  SHRY   VARCHAR2(50),
  ZXBJ   CHAR(1),
  ZXSJ   DATE,
  ZXCZY  VARCHAR2(50),
  XS     VARCHAR2(10),
  TJRQ   NUMBER(8)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ELP_CWZ
  add primary key (CWZID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ELP_PUN...
create table ELP_PUN
(
  PUID    VARCHAR2(100) not null,
  CFJDSBH VARCHAR2(100),
  JSZH    VARCHAR2(50),
  JSYXM   VARCHAR2(50),
  JSYXB   CHAR(1),
  JSYDZ   VARCHAR2(1000),
  JSYNL   NUMBER(5),
  JSYMZ   VARCHAR2(10),
  JSYJG   VARCHAR2(100),
  SFZH    VARCHAR2(18),
  GSJC    VARCHAR2(100),
  GSMC    VARCHAR2(1000),
  GSDZ    VARCHAR2(1000),
  GSFR    VARCHAR2(100),
  GSFRZW  VARCHAR2(100),
  CFLX    VARCHAR2(10),
  GZR     VARCHAR2(100),
  JLR     VARCHAR2(100),
  JSYQK   VARCHAR2(1000),
  AY      VARCHAR2(1000),
  SDSJ    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table ELP_PUN
  add primary key (PUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating FI_FLOW...
create table FI_FLOW
(
  FIID           NUMBER(20) not null,
  DOMAIN         VARCHAR2(50),
  FLOWID         VARCHAR2(50),
  FLOWCONTENT    VARCHAR2(500),
  CALLER         VARCHAR2(50),
  FLOWSTARTTIME  DATE,
  FLOWFINISHTIME DATE,
  STATE          VARCHAR2(200),
  FLOWSTATUS     NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_FLOW
  add primary key (FIID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_FLOW
  add foreign key (CALLER)
  references AUSER (USERID);

prompt Creating FI_OWNER...
create table FI_OWNER
(
  TIID  NUMBER(20) not null,
  OWNER VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_OWNER
  add primary key (TIID, OWNER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_OWNER
  add foreign key (OWNER)
  references AUSER (USERID);

prompt Creating FI_TASK...
create table FI_TASK
(
  TIID         NUMBER(20) not null,
  FIID         NUMBER(20),
  TASKID       NUMBER(10),
  STARTTIME    DATE,
  FINISHTIME   DATE,
  EDITOR       VARCHAR2(50),
  ACTIONID     VARCHAR2(50),
  OPINION      VARCHAR2(1000),
  DIRECTION    NUMBER(5),
  SKIPTOTASKID NUMBER(10),
  ISLAST       NUMBER(5),
  TASKSTATUS   NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_TASK
  add primary key (TIID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating FI_TASK_PREV...
create table FI_TASK_PREV
(
  ID            NUMBER(20) not null,
  FIID          NUMBER(20),
  PREVTIID      NUMBER(20),
  PREVDIRECTION NUMBER(5),
  PREVTASKID    NUMBER(10),
  TASKID        NUMBER(10),
  TIID          NUMBER(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_TASK_PREV
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating FI_VAR...
create table FI_VAR
(
  FIID   NUMBER(20) not null,
  VID    VARCHAR2(50) not null,
  VVALUE VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table FI_VAR
  add primary key (FIID, VID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating IVS_ALARMCAMERAPAIR...
create table IVS_ALARMCAMERAPAIR
(
  ID          NUMBER(10) not null,
  IVS_ALARMID NUMBER(10) default (0) not null,
  CAMERAID    NUMBER(10) default (0) not null,
  BUILDTIME   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_ALARMCAMERAPAIR
  add constraint AAAAAALARMCAMERAPAIR_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
create index CAMERAID_4 on IVS_ALARMCAMERAPAIR (CAMERAID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
create index IVS_ALARMID on IVS_ALARMCAMERAPAIR (IVS_ALARMID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
grant select, insert, update, delete, references on IVS_ALARMCAMERAPAIR to PUBLIC;

prompt Creating IVS_ALARMICONINFO...
create table IVS_ALARMICONINFO
(
  IVS_ALARMID   NUMBER(10) default (0) not null,
  ICONINDEX     NUMBER(10) default (0),
  TOOLTIP       NVARCHAR2(50),
  X             FLOAT default (0),
  Y             FLOAT default (0),
  MATCHCAMERAID NUMBER(10) default (0),
  MAP           NUMBER(5) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_ALARMICONINFO
  add constraint AAAAAALARMICONINFO_PK primary key (IVS_ALARMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_ALARMICONINFO to PUBLIC;

prompt Creating IVS_ALARMINFO...
create table IVS_ALARMINFO
(
  IVS_ALARMID NUMBER(10) not null,
  NAME        NVARCHAR2(50),
  DESCRIPTION NVARCHAR2(50),
  DEVICEID    NUMBER(10) default (0),
  ISVALID     NUMBER(1) default (0) not null,
  CHANNELNO   NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_ALARMINFO
  add constraint AAAAAALARMINFO_PK primary key (IVS_ALARMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DEVICEID_2 on IVS_ALARMINFO (DEVICEID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_ALARMINFO to PUBLIC;

prompt Creating IVS_AUTHORITYGROUP...
create table IVS_AUTHORITYGROUP
(
  AUTHORITYID   NUMBER(10) default (0) not null,
  AUTHORITYNAME NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_AUTHORITYGROUP
  add constraint AAAAAAUTHORITYGROUP_PK primary key (AUTHORITYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_AUTHORITYGROUP to PUBLIC;

prompt Creating IVS_CAMERAAUTHORITY...
create table IVS_CAMERAAUTHORITY
(
  CAMERAID    NUMBER(10) default (0) not null,
  AUTHORITYID NUMBER(10) default (0) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_CAMERAAUTHORITY
  add constraint AAAAACAMERAAUTHORITY_PK primary key (CAMERAID, AUTHORITYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index AUTHORITYID on IVS_CAMERAAUTHORITY (AUTHORITYID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index USERID on IVS_CAMERAAUTHORITY (CAMERAID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_CAMERAAUTHORITY to PUBLIC;

prompt Creating IVS_CAMERAGROUP...
create table IVS_CAMERAGROUP
(
  ID             INTEGER not null,
  VIRTUALGROUPID INTEGER,
  CAMERAID       INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_CAMERAGROUP
  add constraint CAMERAGROUP_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating IVS_CAMERAICONINFO...
create table IVS_CAMERAICONINFO
(
  CAMERAID     NUMBER(10) default (0) not null,
  ICONINDEX    NUMBER(10) default (0),
  TOOLTIP      NVARCHAR2(50),
  X            FLOAT default (0),
  Y            FLOAT default (0),
  MATCHALARMID NUMBER(10) default (0),
  MAP          NUMBER(5) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_CAMERAICONINFO
  add constraint AAAAACAMERAICONINFO_PK primary key (CAMERAID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DEVICEID_1 on IVS_CAMERAICONINFO (X)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_CAMERAICONINFO to PUBLIC;

prompt Creating IVS_CAMERAINFO...
create table IVS_CAMERAINFO
(
  DEVICEID       NUMBER(10) default (0),
  NAME           NVARCHAR2(100),
  DESCRIPTION    NVARCHAR2(150),
  CONNURL        NVARCHAR2(100),
  ADDRESSID      NUMBER(10) default (0),
  ISVALID        NUMBER(1) default (0) not null,
  CHANNELNO      NUMBER(10) default (0),
  ISDETECTMOTION NUMBER(1) default (0) not null,
  REMARK         NVARCHAR2(150),
  ADDBY          NVARCHAR2(50),
  ADDTIME        NVARCHAR2(50),
  MODIFYBY       NVARCHAR2(50),
  MODIFYTIME     NVARCHAR2(50),
  CAMERAID       NUMBER(10) not null,
  OUPPUTPATH     NVARCHAR2(150),
  FRAMEINTERVAL  NUMBER(10) default (0),
  WIDTH          NUMBER(10) default (0),
  HEIGHT         NUMBER(10) default (0),
  RESOLUTION     NVARCHAR2(50),
  QUALITY        NVARCHAR2(50),
  STREAMTYPE     NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_CAMERAINFO
  add constraint AAAAACAMERAINFO_PK primary key (CAMERAID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CAMID on IVS_CAMERAINFO (DEVICEID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_CAMERAINFO to PUBLIC;

prompt Creating IVS_CAPTUREPICTURE...
create table IVS_CAPTUREPICTURE
(
  PICTUREID NUMBER(10) not null,
  CAMERAID  NUMBER(10) not null,
  DATETIME  TIMESTAMP(6) not null,
  FILEPATH  NVARCHAR2(200) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_CAPTUREPICTURE
  add constraint PK_CAPTUREPICTURE primary key (PICTUREID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_CAPTUREPICTURE to PUBLIC;

prompt Creating IVS_DECODERINFO...
create table IVS_DECODERINFO
(
  ID                 NUMBER(10) not null,
  NAME               NVARCHAR2(50) not null,
  IP                 NVARCHAR2(50) not null,
  PORT               NUMBER(10) default (25001) not null,
  MAXDECODECHANNELNO NUMBER(10) default (8)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column IVS_DECODERINFO.ID
  is '���������';
comment on column IVS_DECODERINFO.NAME
  is '����������';
comment on column IVS_DECODERINFO.IP
  is '������IP';
comment on column IVS_DECODERINFO.PORT
  is '�������˿�';
comment on column IVS_DECODERINFO.MAXDECODECHANNELNO
  is '�������ܽ�������ͨ����';
alter table IVS_DECODERINFO
  add constraint PK_DECODER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_DECODERINFO to PUBLIC;

prompt Creating IVS_DECODERCAMERA...
create table IVS_DECODERCAMERA
(
  ID      NUMBER(10) not null,
  DECODER NUMBER(10) not null,
  CAMERA  NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_DECODERCAMERA
  add constraint PK_DECODERCAMERA primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_DECODERCAMERA
  add constraint FK_DECODERCAMERA_CAMERAINFO foreign key (CAMERA)
  references IVS_CAMERAINFO (CAMERAID);
alter table IVS_DECODERCAMERA
  add constraint FK_DECODERCAMERA_DECODERINFO foreign key (DECODER)
  references IVS_DECODERINFO (ID);
grant select, insert, update, delete, references on IVS_DECODERCAMERA to PUBLIC;

prompt Creating IVS_DEFAULTCARDOUT...
create table IVS_DEFAULTCARDOUT
(
  ID                   NUMBER(10) not null,
  CAMERAID             NUMBER(10) default (0),
  DISPLAYCHANNELID     NUMBER(10) default (0),
  DISPLAYSPLITSCREENNO NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_DEFAULTCARDOUT
  add constraint AAAAADEFAULTCARDOUT_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CAMERAID_2 on IVS_DEFAULTCARDOUT (CAMERAID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DISPLAYCHANNELID on IVS_DEFAULTCARDOUT (DISPLAYCHANNELID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_DEFAULTCARDOUT to PUBLIC;

prompt Creating IVS_DEVICEINFO...
create table IVS_DEVICEINFO
(
  NAME               NVARCHAR2(100),
  SOURCE             NVARCHAR2(150),
  LOGIN              NVARCHAR2(100),
  PWD                NVARCHAR2(50),
  FRAMEINTERVAL      NUMBER(10) default (0),
  PORT               NUMBER(10) default (0),
  CHANNELNO          NUMBER(10) default (0),
  VIDEOCOUNT         NUMBER(10) default (0),
  VIDDEOSTARTNO      NUMBER(10) default (0),
  WARNINGOUTPUTCOUNT NUMBER(10) default (0),
  WARNINGINPUTNO     NUMBER(10) default (0),
  WARNINGCOUNT       NUMBER(10) default (0),
  REMARK             NVARCHAR2(150),
  ADDBY              NVARCHAR2(50),
  ADDTIME            NVARCHAR2(50),
  MODIFYBY           NVARCHAR2(50),
  MODIFYTIME         NVARCHAR2(50),
  DEVICEID           NUMBER(10) not null,
  FILEEXTNAME        NVARCHAR2(50),
  ISCAMERA           NUMBER(10) default (0),
  PROVIDERNAME       NVARCHAR2(100),
  GROUPID            NUMBER(10) default (0),
  DESCRIPTION        NVARCHAR2(150)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_DEVICEINFO
  add constraint AAAAADEVICEINFO_PK primary key (DEVICEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADDRESSID_2 on IVS_DEVICEINFO (FRAMEINTERVAL)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index GROUPID on IVS_DEVICEINFO (GROUPID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ISVALID on IVS_DEVICEINFO (PORT)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_DEVICEINFO to PUBLIC;

prompt Creating IVS_DISPLAYCHANNELINFO...
create table IVS_DISPLAYCHANNELINFO
(
  DISPLAYCHANNELID              NUMBER(10) default (0) not null,
  DISPLAYCHANNELNAME            NVARCHAR2(50),
  DECODECARDNO                  NUMBER(10) default (0),
  DISPALYCHANNELNOINCURRENTCARD NUMBER(10) default (2),
  SPLITSCREENNO                 NUMBER(10) default (1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_DISPLAYCHANNELINFO
  add constraint AAAAADISPLAYCHANNELINFO_PK primary key (DISPLAYCHANNELID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_DISPLAYCHANNELINFO to PUBLIC;

prompt Creating IVS_EVENTINFO...
create table IVS_EVENTINFO
(
  EVENTID    NUMBER(10) not null,
  CARNUM     NUMBER(10) not null,
  CONGESTION NUMBER(10) not null,
  PICTUREID  NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_EVENTINFO
  add constraint PK_EVENTINFO primary key (EVENTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
grant select, insert, update, delete, references on IVS_EVENTINFO to PUBLIC;

prompt Creating IVS_OBJECTINFO...
create table IVS_OBJECTINFO
(
  OBJECTID      NUMBER(10) not null,
  STOP          NUMBER(1) not null,
  ILLEGALDIR    NUMBER(1) not null,
  CROSSLINE     NUMBER(10) not null,
  CHANGECHANNEL NUMBER(1) not null,
  EVENTID       NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_OBJECTINFO
  add constraint PK_OBJECTINFO primary key (OBJECTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_OBJECTINFO
  add constraint FK_OBJECTINFO_OBJECTINFO foreign key (EVENTID)
  references IVS_EVENTINFO (EVENTID);
grant select, insert, update, delete, references on IVS_OBJECTINFO to PUBLIC;

prompt Creating IVS_EVENTRECTINFO...
create table IVS_EVENTRECTINFO
(
  EVENTRECTID NUMBER(10) not null,
  X           NUMBER(10) not null,
  Y           NUMBER(10) not null,
  W           NUMBER(10) not null,
  H           NUMBER(10) not null,
  OBJECTID    NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_EVENTRECTINFO
  add constraint PK_EVENTRECTINFO primary key (EVENTRECTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_EVENTRECTINFO
  add constraint FK_EVENTRECTINFO_OBJECTINFO foreign key (OBJECTID)
  references IVS_OBJECTINFO (OBJECTID);
grant select, insert, update, delete, references on IVS_EVENTRECTINFO to PUBLIC;

prompt Creating IVS_RECT...
create table IVS_RECT
(
  RECTID NUMBER(10) not null,
  X      NUMBER(10) not null,
  Y      NUMBER(10) not null,
  W      NUMBER(10) not null,
  H      NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_RECT
  add constraint PK_RECT primary key (RECTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_RECT to PUBLIC;

prompt Creating IVS_FACE...
create table IVS_FACE
(
  FACEID    NUMBER(10) not null,
  SCORE     FLOAT not null,
  RECTID    NUMBER(10) not null,
  PICTUREID NUMBER(10) not null,
  FACEPATH  NVARCHAR2(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 960K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_FACE
  add constraint PK_FACE primary key (FACEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_FACE
  add constraint FK_FACE_PICTURE foreign key (PICTUREID)
  references IVS_CAPTUREPICTURE (PICTUREID);
alter table IVS_FACE
  add constraint FK_FACE_RECT foreign key (RECTID)
  references IVS_RECT (RECTID);
grant select, insert, update, delete, references on IVS_FACE to PUBLIC;

prompt Creating IVS_GROUPINFO...
create table IVS_GROUPINFO
(
  NAME        NVARCHAR2(150),
  DESCRIPTION NVARCHAR2(100),
  PARENTID    NUMBER(10) default (0),
  ADDBY       NVARCHAR2(50),
  ADDTIME     NVARCHAR2(50),
  MODIFYBY    NVARCHAR2(50),
  MODIFYTIME  NVARCHAR2(50),
  GROUPID     NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_GROUPINFO
  add constraint AAAAAGROUPINFO_PK primary key (GROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADDRESSID_1 on IVS_GROUPINFO (PARENTID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_GROUPINFO to PUBLIC;

prompt Creating IVS_GROUPSWITCHDETAIL...
create table IVS_GROUPSWITCHDETAIL
(
  GROUPSWITCHGROUPID NUMBER(10) default (0),
  SYNGROUPID         NUMBER(10) default (0),
  TICKTIME           NUMBER(10) default (0),
  ID                 NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CHANGESYNGROUPID on IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ID on IVS_GROUPSWITCHDETAIL (ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_GROUPSWITCHDETAIL to PUBLIC;

prompt Creating IVS_GROUPSWITCHGROUP...
create table IVS_GROUPSWITCHGROUP
(
  ID          NUMBER(10) not null,
  NAME        NVARCHAR2(50),
  DESCRIPTION NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_GROUPSWITCHGROUP
  add constraint AAAAAGROUPSWITCHGROUP_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_GROUPSWITCHGROUP to PUBLIC;

prompt Creating IVS_MAPINFO...
create table IVS_MAPINFO
(
  ID       NUMBER(10) not null,
  NAME     NVARCHAR2(50),
  WIDTH    NUMBER(5) default (0),
  HEIGHT   NUMBER(5) default (0),
  FILENAME NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_MAPINFO
  add constraint AAAAAMAPINFO_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_MAPINFO to PUBLIC;

prompt Creating IVS_OPERATELOG...
create table IVS_OPERATELOG
(
  ID              NUMBER(10) not null,
  GROUPID         NUMBER(10),
  DEVICEID        NUMBER(10),
  CAMERAID        NUMBER(10),
  HAPPENTIME      DATE not null,
  OPERATETYPEID   NUMBER(10) not null,
  OPERATETYPENAME NCHAR(20) not null,
  CONTENT         NVARCHAR2(50) not null,
  OPERATEUSERNAME NCHAR(20) not null,
  CLIENTUSERID    NUMBER(10),
  CLIENTUSERNAME  NCHAR(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_OPERATELOG
  add constraint PK_OPERATELOG primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_OPERATELOG to PUBLIC;

prompt Creating IVS_PROGSWITCH...
create table IVS_PROGSWITCH
(
  ID                   NUMBER(10) not null,
  NAME                 NVARCHAR2(50),
  DESCRIPTION          NVARCHAR2(50),
  DISPLAYCHANNELID     NUMBER(10) default (0),
  DISPLAYSPLITSCREENNO NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_PROGSWITCH
  add constraint AAAAAPROGSWITCH_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index MONITORID on IVS_PROGSWITCH (DISPLAYCHANNELID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_PROGSWITCH to PUBLIC;

prompt Creating IVS_PROGSWITCHDETAIL...
create table IVS_PROGSWITCHDETAIL
(
  ID           NUMBER(10) not null,
  PROGSWITCHID NUMBER(10) default (0),
  CAMERAID     NUMBER(10) default (0),
  TICKTIME     NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_PROGSWITCHDETAIL
  add constraint AAAAAPROGSWITCHDETAIL_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CAMERAID_1 on IVS_PROGSWITCHDETAIL (CAMERAID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index PROGSWITCHID on IVS_PROGSWITCHDETAIL (PROGSWITCHID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_PROGSWITCHDETAIL to PUBLIC;

prompt Creating IVS_RECOGNIZERINFO...
create table IVS_RECOGNIZERINFO
(
  ID             NUMBER(10) not null,
  NAME           NVARCHAR2(50) not null,
  IP             NVARCHAR2(50) not null,
  PORT           NUMBER(10) not null,
  MAXRECOGNUMBER NUMBER(10),
  RECOGTYPE      NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_RECOGNIZERINFO
  add constraint PK_RECOGNIZERINFO primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_RECOGNIZERINFO to PUBLIC;

prompt Creating IVS_RECOGNIZERCAMERA...
create table IVS_RECOGNIZERCAMERA
(
  ID         NUMBER(10) not null,
  RECOGNIZER NUMBER(10) not null,
  CAMERA     NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_RECOGNIZERCAMERA
  add constraint PK_RECOGNIZERCAMERA primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_RECOGNIZERCAMERA
  add constraint FK_RECOGNIZERCAMERA_CAMERAINFO foreign key (CAMERA)
  references IVS_CAMERAINFO (CAMERAID);
alter table IVS_RECOGNIZERCAMERA
  add constraint FK_RECOGNIZERCAMERA_RECOGNIZER foreign key (RECOGNIZER)
  references IVS_RECOGNIZERINFO (ID);
grant select, insert, update, delete, references on IVS_RECOGNIZERCAMERA to PUBLIC;

prompt Creating IVS_SYNCAMERA...
create table IVS_SYNCAMERA
(
  SYNGROUPID           NUMBER(10) default (0),
  CAMERAID             NUMBER(10) default (0),
  DISPLAYCHANNELID     NUMBER(10) default (0),
  ID                   NUMBER(10) not null,
  DISPLAYSPLITSCREENNO NUMBER(10) default (0)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_SYNCAMERA
  add constraint AAAAASYNCAMERA_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index CAMERAID_3 on IVS_SYNCAMERA (CAMERAID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_SYNCAMERA to PUBLIC;

prompt Creating IVS_SYNGROUP...
create table IVS_SYNGROUP
(
  SYNGROUPID  NUMBER(10) not null,
  NAME        NVARCHAR2(50),
  DESCRIPTION NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_SYNGROUP
  add constraint AAAAASYNGROUP_PK primary key (SYNGROUPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_SYNGROUP to PUBLIC;

prompt Creating IVS_SYSTEMLOG...
create table IVS_SYSTEMLOG
(
  ID             NUMBER(10) not null,
  HAPPENTIME     DATE not null,
  SYSTEMTYPEID   NUMBER(10) not null,
  SYSTEMTYPENAME NVARCHAR2(50) not null,
  CONTENT        NVARCHAR2(255) not null,
  SYSUSERNAME    NVARCHAR2(50) not null,
  CLIENTUSERNAME NVARCHAR2(50),
  CLIENTUSERID   NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_SYSTEMLOG
  add constraint PK_SYSTEMLOG primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_SYSTEMLOG to PUBLIC;

prompt Creating IVS_SYSTEMPARAMETER...
create table IVS_SYSTEMPARAMETER
(
  NAME  NCHAR(64) not null,
  TYPE  NCHAR(16) not null,
  VALUE NCHAR(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_SYSTEMPARAMETER to PUBLIC;

prompt Creating IVS_TASKINFO...
create table IVS_TASKINFO
(
  TASKID         NUMBER(10) not null,
  CAMERAID       NUMBER(10) not null,
  DECODERID      NUMBER(10),
  STATUS         NUMBER(10) not null,
  HAPPENDATETIME DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
grant select, insert, update, delete, references on IVS_TASKINFO to PUBLIC;

prompt Creating IVS_TEMPPICTURE...
create table IVS_TEMPPICTURE
(
  PICTUREID NUMBER(10) not null,
  CAMERAID  NUMBER(10) not null,
  DATETIME  TIMESTAMP(6) not null,
  ISHISTROY NUMBER(1) not null,
  FILEPATH  NVARCHAR2(200) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table IVS_TEMPPICTURE
  add constraint PK_TEMPPICTURE primary key (PICTUREID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );
grant select, insert, update, delete, references on IVS_TEMPPICTURE to PUBLIC;

prompt Creating IVS_TRACK...
create table IVS_TRACK
(
  ID   NUMBER(10) not null,
  RECT NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_TRACK
  add constraint PK_TRACK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_TRACK
  add constraint FK_TRACK_TRACK foreign key (ID)
  references IVS_TRACK (ID);
grant select, insert, update, delete, references on IVS_TRACK to PUBLIC;

prompt Creating IVS_USERAUTHORITY...
create table IVS_USERAUTHORITY
(
  USERID      NUMBER(10) default (0) not null,
  AUTHORITYID NUMBER(10) default (0) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_USERAUTHORITY
  add constraint AAAAAUSERAUTHORITY_PK primary key (USERID, AUTHORITYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index AUTHORITYID_1 on IVS_USERAUTHORITY (AUTHORITYID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index USERID_1 on IVS_USERAUTHORITY (USERID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_USERAUTHORITY to PUBLIC;

prompt Creating IVS_USERGROUP...
create table IVS_USERGROUP
(
  ID             INTEGER not null,
  VIRTUALGROUPID INTEGER,
  USERID         INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_USERGROUP
  add constraint USERGROUP_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating IVS_USERINFO...
create table IVS_USERINFO
(
  USERID         NUMBER(10) not null,
  USERNAME       NVARCHAR2(50),
  PASSWORD       NVARCHAR2(50),
  CREATEDATETIME DATE,
  USERTYPEID     NUMBER(10) default (0),
  USERTYPENAME   NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_USERINFO
  add constraint AAAAAUSERINFO_PK primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_USERINFO to PUBLIC;

prompt Creating IVS_USERVEHMON...
create table IVS_USERVEHMON
(
  USERVEHMONID VARCHAR2(50) not null,
  VEHMONID     VARCHAR2(50),
  USERID       NVARCHAR2(50),
  TIME         TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
compress;
alter table IVS_USERVEHMON
  add constraint KEYID primary key (USERVEHMONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating IVS_VEHICLE...
create table IVS_VEHICLE
(
  VEHICLEID    NUMBER(10) not null,
  PLATENUMBER  NVARCHAR2(50) not null,
  SPEED        FLOAT not null,
  STEMAGAINST  NUMBER(1) not null,
  STOP         NUMBER(1) not null,
  ACCIDENT     NUMBER(1) not null,
  LINECHANGE   NUMBER(1) not null,
  PLATECOLOR   NVARCHAR2(50) not null,
  VEHICLECOLOR NVARCHAR2(50) not null,
  PICTUREID    NUMBER(10) not null,
  RECTID       NUMBER(10) not null,
  CONFIDENCE   FLOAT default (1.0) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_VEHICLE
  add constraint PK_VEHICLE primary key (VEHICLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_VEHICLE
  add constraint FK_VEHICLE_VEHICLE foreign key (VEHICLEID)
  references IVS_VEHICLE (VEHICLEID);
grant select, insert, update, delete, references on IVS_VEHICLE to PUBLIC;

prompt Creating IVS_VIDEOINFO...
create table IVS_VIDEOINFO
(
  ID               NUMBER(10) not null,
  CAMERAID         NUMBER(10) not null,
  CAPTURETIMEBEGIN DATE not null,
  CAPTURETIMEEND   DATE not null,
  FILEPATH         NVARCHAR2(255) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_VIDEOINFO to PUBLIC;

prompt Creating IVS_VIRTUALGROUP...
create table IVS_VIRTUALGROUP
(
  ID   NUMBER not null,
  NAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_VIRTUALGROUP
  add constraint VIRTUALGROUP_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating IVS_WINDOWCAMERAINFO...
create table IVS_WINDOWCAMERAINFO
(
  ID     NUMBER(10) not null,
  ROW_   NUMBER(10) not null,
  COL    NUMBER(10) not null,
  CAMERA NUMBER(10) default (-1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_WINDOWCAMERAINFO
  add constraint PK_WINDOWCAMERA primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table IVS_WINDOWCAMERAINFO
  add constraint IX_WINDOWCAMERA unique (ROW_, COL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references on IVS_WINDOWCAMERAINFO to PUBLIC;

prompt Creating TEST...
create table TEST
(
  ID   CHAR(10) not null,
  NAME VARCHAR2(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
create unique index TEST_IDX on TEST (ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOC_DAY...
create table TOC_DAY
(
  DAY NUMBER(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_HOUR...
create table TOC_HOUR
(
  HOUR CHAR(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_LPTCITY...
create table TOC_LPTCITY
(
  HPCSDM  VARCHAR2(10) not null,
  HPCS    VARCHAR2(50),
  PX      NUMBER(5),
  ZTBJ    CHAR(1),
  BZ      VARCHAR2(2000),
  FHPCSDM VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_LPTCITY
  add primary key (HPCSDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_LPTCITY2...
create table TOC_LPTCITY2
(
  ZM VARCHAR2(2) not null,
  PX NUMBER(2) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_LPTCOLOR...
create table TOC_LPTCOLOR
(
  HPYSDM CHAR(1) not null,
  HPYS   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_LPTCOLOR
  add primary key (HPYSDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_LPTTYPE...
create table TOC_LPTTYPE
(
  HPZLDM CHAR(2) not null,
  HPMC   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_LPTTYPE
  add primary key (HPZLDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_REGION...
create table TOC_REGION
(
  XZQHDM VARCHAR2(10) not null,
  XZQH   VARCHAR2(100),
  PX     NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_REGION
  add primary key (XZQHDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_VEHCOLOR...
create table TOC_VEHCOLOR
(
  CLYSDM CHAR(2) not null,
  CLYS   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_VEHCOLOR
  add primary key (CLYSDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_VEHSTATE...
create table TOC_VEHSTATE
(
  CLZTDM CHAR(1) not null,
  CLZTMC VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_VEHSTATE
  add primary key (CLZTDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOC_VEHTYPE...
create table TOC_VEHTYPE
(
  CLLXDM CHAR(3) not null,
  CLLX   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOC_VEHTYPE
  add primary key (CLLXDM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_CLPP...
create table TOG_CLPP
(
  CLPPDM VARCHAR2(3),
  CLPP   VARCHAR2(50),
  PX     NUMBER(5),
  ZTBJ   CHAR(1),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_DEVBUG...
create table TOG_DEVBUG
(
  DBID   VARCHAR2(50) not null,
  TDID   VARCHAR2(50),
  SBMC   VARCHAR2(50),
  SBBH   VARCHAR2(50),
  SBIP   VARCHAR2(50),
  WLZT   VARCHAR2(50),
  JQSJ   DATE,
  XTWD   NUMBER(5,2),
  CPUWD  NUMBER(5,2),
  FSZS1  NUMBER(5),
  FSZS2  NUMBER(5),
  CPUSYL NUMBER(5,2),
  NCSYL  NUMBER(5,2),
  XCS    NUMBER(5),
  YPZT   VARCHAR2(10),
  SXJZT  VARCHAR2(10),
  YXSJ   DATE,
  YCZD   VARCHAR2(100),
  ZTSJ   DATE,
  BJSJ   DATE,
  CLZT   CHAR(1),
  GZCLR  VARCHAR2(50),
  GZCLSJ DATE,
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_DEVBUG
  add primary key (DBID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_DEVICE...
create table TOG_DEVICE
(
  TDID    VARCHAR2(50) not null,
  SBBH    VARCHAR2(50),
  SBMC    VARCHAR2(100),
  KKMC    VARCHAR2(50),
  KKBH    VARCHAR2(50),
  FSBBH   VARCHAR2(50),
  SBLX    VARCHAR2(20),
  SBXH    VARCHAR2(50),
  GYS     VARCHAR2(20),
  QYSJ    DATE,
  AZWZ    VARCHAR2(200),
  SBIP    VARCHAR2(20),
  TXFWQBH VARCHAR2(50),
  TXFWQIP VARCHAR2(20),
  BZ      VARCHAR2(2000),
  DKH     VARCHAR2(10),
  SPTDH   VARCHAR2(10),
  DLYH    VARCHAR2(20),
  DLMM    VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_DEVICE
  add primary key (TDID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_FLOWTHD...
create table TOG_FLOWTHD
(
  FTID VARCHAR2(50) not null,
  KKBH VARCHAR2(12),
  KKMC VARCHAR2(50),
  FX   VARCHAR2(50),
  ZDCT NUMBER(5),
  ZDBH NUMBER(5),
  ZDYD NUMBER(5),
  BZ   VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_FLOWTHD
  add primary key (FTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_OWNERVEH...
create table TOG_OWNERVEH
(
  OVID   VARCHAR2(50) not null,
  SFZH   VARCHAR2(20),
  DABH   VARCHAR2(20),
  XZQH   VARCHAR2(10),
  ZSXXDZ VARCHAR2(100),
  ZJCX   VARCHAR2(100),
  LJJF   VARCHAR2(50),
  JSZZT  VARCHAR2(2),
  CCLZRQ DATE,
  LXDH   VARCHAR2(50),
  XB     CHAR(1),
  CSRQ   DATE,
  GLBM   VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_OWNERVEH
  add primary key (OVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_PUBINFO...
create table TOG_PUBINFO
(
  XXID VARCHAR2(50) not null,
  XXBH VARCHAR2(50),
  XXZT VARCHAR2(500),
  FBR  VARCHAR2(50),
  FBDW VARCHAR2(50),
  FBSJ DATE,
  XXLX VARCHAR2(50),
  XXLY VARCHAR2(50),
  XXNR VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_PUBINFO
  add primary key (XXID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_RECDEVGROUP...
create table TOG_RECDEVGROUP
(
  GROUPID VARCHAR2(50),
  TDID    VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_RECIP...
create table TOG_RECIP
(
  RIID    VARCHAR2(50) not null,
  JSCXBM  VARCHAR2(10),
  JSCXMC  VARCHAR2(100),
  LX      CHAR(1),
  JSFWQIP VARCHAR2(20),
  JSGKJIP VARCHAR2(20),
  BZ      VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_RECIP
  add primary key (RIID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_RECUSERGROUP...
create table TOG_RECUSERGROUP
(
  GROUPID VARCHAR2(50),
  USERID  VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table TOG_RECUSERGROUP
  is '�����û������ϵ��';

prompt Creating TOG_TOGDISTANCE...
create table TOG_TOGDISTANCE
(
  TDID   VARCHAR2(50) not null,
  QSD    VARCHAR2(50),
  ZZD    VARCHAR2(50),
  QSLD   VARCHAR2(50),
  ZZLD   VARCHAR2(50),
  XLJL   NUMBER(5),
  TXSJ   NUMBER(5,2),
  ZDJL   NUMBER(5),
  ZDTXSJ NUMBER(5,2),
  ZXJL   NUMBER(5),
  ZXTXSJ NUMBER(5,2),
  ZJLDBM VARCHAR2(2000),
  ZJLDSM VARCHAR2(2000),
  ORG    VARCHAR2(50),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_TOGDISTANCE
  add primary key (TDID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_TOLLGATE...
create table TOG_TOLLGATE
(
  TGID  VARCHAR2(50) not null,
  KKFBH VARCHAR2(12),
  KKBH  VARCHAR2(12),
  KKMC  VARCHAR2(40),
  KKJC  VARCHAR2(40),
  KKWZ  VARCHAR2(40),
  DWBH  VARCHAR2(4),
  KKLX  VARCHAR2(2),
  XDSD  NUMBER(5),
  CDS   NUMBER(5),
  SXJS  NUMBER(5),
  FX    VARCHAR2(50),
  DLBH  VARCHAR2(10),
  DLMC  VARCHAR2(50),
  DTBH  VARCHAR2(10),
  DTXZB FLOAT,
  DTYZB FLOAT,
  DTJD  VARCHAR2(50),
  DTWD  FLOAT,
  BZ    VARCHAR2(2000),
  SXJBH VARCHAR2(50),
  XZQH  VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_TOLLGATE
  add primary key (TGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHACCOM...
create table TOG_VEHACCOM
(
  AVID   VARCHAR2(50) not null,
  CLXXBH VARCHAR2(15),
  KKBH   VARCHAR2(12),
  KKMC   VARCHAR2(100),
  FXBH   VARCHAR2(50),
  FXMC   VARCHAR2(100),
  CDBH   VARCHAR2(2),
  CDMC   VARCHAR2(50),
  JGSK   DATE,
  HPHM   VARCHAR2(15),
  HPYSBH VARCHAR2(1),
  HPYS   VARCHAR2(50),
  TXSL   NUMBER(5),
  TXMC1  VARCHAR2(100),
  TXMC2  VARCHAR2(100),
  TXMC3  VARCHAR2(100),
  TXMC4  VARCHAR2(100),
  SPMC   VARCHAR2(100),
  CLSD   NUMBER(5),
  XSZT   VARCHAR2(4),
  CLPP   VARCHAR2(3),
  CLWX   VARCHAR2(3),
  CSYS   VARCHAR2(5),
  CLWKC  NUMBER(10,2),
  CLLX   VARCHAR2(4),
  CLLXMC VARCHAR2(100),
  HPZL   VARCHAR2(2),
  HPZLMC VARCHAR2(100),
  YLXXLX VARCHAR2(1),
  YLXX   VARCHAR2(30),
  CLBJ   VARCHAR2(1),
  SBZT   VARCHAR2(1),
  DWBH   VARCHAR2(4),
  DWMC   VARCHAR2(200),
  BZ     VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_VEHACCOM
  add primary key (AVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_VEHBLACK...
create table TOG_VEHBLACK
(
  VBID     VARCHAR2(50) not null,
  HMDXXBH  VARCHAR2(15),
  HPHM     VARCHAR2(15),
  HPYSBH   VARCHAR2(1),
  HPYS     VARCHAR2(50),
  CLPP     VARCHAR2(3),
  CLWX     VARCHAR2(3),
  CSYS     VARCHAR2(5),
  CLLX     VARCHAR2(4),
  CLLXMC   VARCHAR2(100),
  HPZL     VARCHAR2(2),
  HPZLMC   VARCHAR2(100),
  CLMS     VARCHAR2(2000),
  JDCSYR   VARCHAR2(100),
  WZSJ     VARCHAR2(50),
  BJFKSK   DATE,
  BJJZQ    DATE,
  BJLX     VARCHAR2(5),
  BJJB     VARCHAR2(50),
  AJMS     VARCHAR2(2000),
  SFJSXX   VARCHAR2(1),
  SFZDBJ   VARCHAR2(1),
  LRSJ     DATE,
  LXDH     VARCHAR2(50),
  LRDW     VARCHAR2(50),
  LRR      VARCHAR2(50),
  JRYY     VARCHAR2(50),
  SHZT     VARCHAR2(1),
  SHR      VARCHAR2(16),
  SHSK     DATE,
  SHSM     VARCHAR2(2000),
  CKDWBH   VARCHAR2(8),
  CKR      VARCHAR2(16),
  CKSK     DATE,
  CKSM     VARCHAR2(2000),
  CKDWDH   VARCHAR2(50),
  CKSHZT   VARCHAR2(1),
  CKSHDWBH VARCHAR2(8),
  CKSHR    VARCHAR2(16),
  CKSHSK   DATE,
  CKSHSM   VARCHAR2(2000),
  BZ       VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );
alter table TOG_VEHBLACK
  add primary key (VBID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TOG_VEHDECK...
create table TOG_VEHDECK
(
  MVID   VARCHAR2(50) not null,
  CLXXBH VARCHAR2(15),
  KKBH   VARCHAR2(12),
  KKMC   VARCHAR2(100),
  FXBH   VARCHAR2(50),
  FXMC   VARCHAR2(100),
  CDBH   VARCHAR2(50),
  CDMC   VARCHAR2(50),
  JGSK   DATE,
  HPHM   VARCHAR2(15),
  HPYSBH VARCHAR2(1),
  HPYS   VARCHAR2(50),
  TXSL   NUMBER(5),
  TXMC1  VARCHAR2(100),
  TXMC2  VARCHAR2(100),
  TXMC3  VARCHAR2(100),
  TXMC4  VARCHAR2(100),
  SPMC   VARCHAR2(100),
  CLSD   NUMBER(5),
  XSZT   VARCHAR2(4),
  CLPP   VARCHAR2(3),
  CLWX   VARCHAR2(3),
  CSYS   VARCHAR2(5),
  CLWKC  NUMBER(10,2),
  CLLX   VARCHAR2(4),
  CLLXMC VARCHAR2(100),
  HPZL   VARCHAR2(2),
  HPZLMC VARCHAR2(100),
  YLXXLX VARCHAR2(1),
  YLXX   VARCHAR2(30),
  CLBJ   VARCHAR2(1),
  SBZT   VARCHAR2(1),
  DWBH   VARCHAR2(4),
  DWMC   VARCHAR2(200),
  BZ     VARCHAR2(2000),
  SFTPC  CHAR(1),
  QRZH   VARCHAR2(50),
  QRJH   VARCHAR2(50),
  QRSJ   DATE,
  QRMS   VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHDECK
  add primary key (MVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHDISP...
create table TOG_VEHDISP
(
  VDID     VARCHAR2(50) not null,
  BKXXBH   VARCHAR2(15),
  HPHM     VARCHAR2(15),
  HPYSBH   VARCHAR2(1),
  HPYS     VARCHAR2(50),
  CLPP     VARCHAR2(3),
  CLWX     VARCHAR2(3),
  CSYS     VARCHAR2(5),
  CLLX     VARCHAR2(4),
  CLLXMC   VARCHAR2(100),
  HPZL     VARCHAR2(2),
  HPZLMC   VARCHAR2(100),
  BKDWBH   VARCHAR2(8),
  BKR      VARCHAR2(16),
  BKDWDH   VARCHAR2(50),
  BKXZ     VARCHAR2(1),
  BLXB     VARCHAR2(1),
  BKSK     DATE,
  BKFKSK   DATE,
  BKJZQ    DATE,
  AJMS     VARCHAR2(2000),
  YADM     VARCHAR2(4),
  BJHZH    VARCHAR2(50),
  SFJSXX   VARCHAR2(1),
  SFZDBJ   VARCHAR2(1),
  SHZT     VARCHAR2(1) default 0,
  SHR      VARCHAR2(16),
  SHSK     DATE,
  SHSM     VARCHAR2(2000),
  CKDWBH   VARCHAR2(8),
  CKR      VARCHAR2(16),
  CKSK     DATE,
  CKSM     VARCHAR2(2000),
  CKDWDH   VARCHAR2(50),
  CKSHZT   VARCHAR2(1) default 0,
  CKSHDWBH VARCHAR2(8),
  CKSHR    VARCHAR2(16),
  CKSHSK   DATE,
  CKSHSM   VARCHAR2(2000),
  BZ       VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHDISP
  add primary key (VDID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHDISPALARM...
create table TOG_VEHDISPALARM
(
  MVID    VARCHAR2(50) not null,
  CLXXBH  VARCHAR2(15),
  KKBH    VARCHAR2(12),
  KKMC    VARCHAR2(100),
  FXBH    VARCHAR2(50),
  FXMC    VARCHAR2(100),
  CDBH    VARCHAR2(50),
  CDMC    VARCHAR2(50),
  JGSK    DATE,
  HPHM    VARCHAR2(15),
  HPYSBH  VARCHAR2(1),
  HPYS    VARCHAR2(50),
  TXSL    NUMBER(5),
  TXMC1   VARCHAR2(100),
  TXMC2   VARCHAR2(100),
  TXMC3   VARCHAR2(100),
  TXMC4   VARCHAR2(100),
  SPMC    VARCHAR2(100),
  CLSD    NUMBER(5),
  XSZT    VARCHAR2(4),
  CLPP    VARCHAR2(3),
  CLWX    VARCHAR2(3),
  CSYS    VARCHAR2(5),
  CLWKC   NUMBER(10,2),
  CLLX    VARCHAR2(4),
  CLLXMC  VARCHAR2(100),
  HPZL    VARCHAR2(2),
  HPZLMC  VARCHAR2(100),
  YLXXLX  VARCHAR2(1),
  YLXX    VARCHAR2(30),
  SBZT    VARCHAR2(1),
  DWBH    VARCHAR2(4),
  DWMC    VARCHAR2(200),
  BZ      VARCHAR2(2000),
  BJXXBH  VARCHAR2(50),
  BKXXBH  VARCHAR2(50),
  BJSJ    DATE,
  BJLX    VARCHAR2(50),
  BJJB    VARCHAR2(50),
  QRBS    CHAR(1),
  QRZT    CHAR(1) default 0,
  QRXXLR  VARCHAR2(2000),
  JSR     VARCHAR2(50),
  JSFZ    VARCHAR2(50),
  CHULILX VARCHAR2(50),
  CLBS    VARCHAR2(1),
  CLR     VARCHAR2(50),
  CLJG    VARCHAR2(2000),
  SFSGBJ  VARCHAR2(1),
  TJRQ    NUMBER(8)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHDISPALARM
  add primary key (MVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TOG_VEHDISPALARM_IDX1 on TOG_VEHDISPALARM (TJRQ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHICLE...
create table TOG_VEHICLE
(
  VEHID  VARCHAR2(50) not null,
  HPZL   VARCHAR2(4),
  HPHM   VARCHAR2(20),
  ZWPP   VARCHAR2(50),
  YWPP   VARCHAR2(50),
  CLXH   VARCHAR2(50),
  CSSBH  VARCHAR2(50),
  FDJH   VARCHAR2(50),
  CLLX   VARCHAR2(4),
  CSYS   VARCHAR2(4),
  SFZMHM VARCHAR2(50),
  SFZMMC VARCHAR2(50),
  JDCSYR VARCHAR2(50),
  ZSXZQH VARCHAR2(10),
  ZSXZDZ VARCHAR2(100),
  YZBM   VARCHAR2(6),
  LXDH   VARCHAR2(50),
  DJRQ   DATE,
  YXQZ   DATE,
  SQBFRQ DATE,
  FZJG   VARCHAR2(50),
  CLZT   CHAR(1),
  BZQZT  VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHICLE
  add primary key (VEHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHMANUAL...
create table TOG_VEHMANUAL
(
  MVID   VARCHAR2(50) not null,
  CLXXBH VARCHAR2(15),
  KKBH   VARCHAR2(12),
  KKMC   VARCHAR2(100),
  FXBH   VARCHAR2(50),
  FXMC   VARCHAR2(100),
  CDBH   VARCHAR2(2),
  CDMC   VARCHAR2(50),
  JGSK   DATE,
  HPHM   VARCHAR2(15),
  HPYSBH VARCHAR2(1),
  HPYS   VARCHAR2(50),
  TXSL   NUMBER(5),
  TXMC1  VARCHAR2(100),
  TXMC2  VARCHAR2(100),
  TXMC3  VARCHAR2(100),
  TXMC4  VARCHAR2(100),
  SPMC   VARCHAR2(100),
  CLSD   NUMBER(5),
  XSZT   VARCHAR2(4),
  CLPP   VARCHAR2(3),
  CLWX   VARCHAR2(3),
  CSYS   VARCHAR2(5),
  CLWKC  NUMBER(10,2),
  CLLX   VARCHAR2(4),
  CLLXMC VARCHAR2(100),
  HPZL   VARCHAR2(2),
  HPZLMC VARCHAR2(100),
  YLXXLX VARCHAR2(1),
  YLXX   VARCHAR2(30),
  CLBJ   VARCHAR2(1),
  SBZT   VARCHAR2(1),
  DWBH   VARCHAR2(4),
  DWMC   VARCHAR2(200),
  BZ     VARCHAR2(2000),
  SBHPZL VARCHAR2(2),
  SBHPHM VARCHAR2(15),
  SBHPYS VARCHAR2(1),
  SBCLLX VARCHAR2(4),
  SBR    VARCHAR2(50),
  SBSJ   DATE,
  SBSM   VARCHAR2(2000),
  WSBLX  VARCHAR2(4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHMANUAL
  add primary key (MVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHMON...
create table TOG_VEHMON
(
  MVID   VARCHAR2(50) not null,
  CLXXBH NUMBER(15),
  KKBH   VARCHAR2(12),
  KKMC   VARCHAR2(100),
  FXBH   VARCHAR2(50),
  FXMC   VARCHAR2(100),
  CDBH   VARCHAR2(50),
  CDMC   VARCHAR2(50),
  JGSK   DATE,
  HPHM   VARCHAR2(15),
  HPYSBH VARCHAR2(1),
  HPYS   VARCHAR2(50),
  TXSL   NUMBER(5),
  TXMC1  VARCHAR2(100),
  TXMC2  VARCHAR2(100),
  TXMC3  VARCHAR2(100),
  TXMC4  VARCHAR2(100),
  SPMC   VARCHAR2(100),
  CLSD   NUMBER(5),
  XSZT   VARCHAR2(4),
  CLPP   VARCHAR2(3),
  CLWX   VARCHAR2(3),
  CSYS   VARCHAR2(5),
  CLWKC  NUMBER(10,2),
  CLLX   VARCHAR2(4),
  CLLXMC VARCHAR2(100),
  HPZL   VARCHAR2(2),
  HPZLMC VARCHAR2(100),
  YLXXLX VARCHAR2(1),
  YLXX   VARCHAR2(30),
  CLBJ   VARCHAR2(1),
  SBZT   VARCHAR2(1),
  DWBH   VARCHAR2(4),
  DWMC   VARCHAR2(200),
  BZ     VARCHAR2(2000),
  XS     NUMBER(5),
  CSB    NUMBER(5,2),
  SFCS   VARCHAR2(10),
  SFNX   VARCHAR2(10),
  WZBJ   CHAR(1),
  WZQRBJ CHAR(1) default 0,
  WZYY   VARCHAR2(10),
  HDSJ   DATE,
  TJRQ   NUMBER(8),
  WZWPYY VARCHAR2(10),
  TPBZ   CHAR(1),
  CZXM   VARCHAR2(10),
  CLCZY  CHAR(50),
  CLSJ   DATE,
  SPMC1  NVARCHAR2(100),
  SPMC2  NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TOG_VEHMON
  add primary key (MVID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TOG_VEHMON_IDX1 on TOG_VEHMON (TJRQ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TOG_VEHWHITE...
create table TOG_VEHWHITE
(
  HPHM VARCHAR2(15),
  CZXM VARCHAR2(50),
  CZDW VARCHAR2(100),
  CZRY VARCHAR2(10),
  CZSJ DATE,
  BZ   VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
  );

prompt Creating TTEST...
create table TTEST
(
  ID NUMBER(5),
  TS TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for AADMIN...
alter table AADMIN disable all triggers;
prompt Disabling triggers for AADMINGROUP...
alter table AADMINGROUP disable all triggers;
prompt Disabling triggers for AADMINORG...
alter table AADMINORG disable all triggers;
prompt Disabling triggers for AADMINROLE...
alter table AADMINROLE disable all triggers;
prompt Disabling triggers for ACCESSLOG...
alter table ACCESSLOG disable all triggers;
prompt Disabling triggers for ADEGREE...
alter table ADEGREE disable all triggers;
prompt Disabling triggers for AGROUP...
alter table AGROUP disable all triggers;
prompt Disabling triggers for AGROUPLEVEL...
alter table AGROUPLEVEL disable all triggers;
prompt Disabling triggers for AGROUPROLE...
alter table AGROUPROLE disable all triggers;
prompt Disabling triggers for AORG...
alter table AORG disable all triggers;
prompt Disabling triggers for AORGLEADER...
alter table AORGLEADER disable all triggers;
prompt Disabling triggers for AORGLEVEL...
alter table AORGLEVEL disable all triggers;
prompt Disabling triggers for AORGROLE...
alter table AORGROLE disable all triggers;
prompt Disabling triggers for AORGTYPE...
alter table AORGTYPE disable all triggers;
prompt Disabling triggers for APOST...
alter table APOST disable all triggers;
prompt Disabling triggers for AREPELLENTROLE...
alter table AREPELLENTROLE disable all triggers;
prompt Disabling triggers for AROLE...
alter table AROLE disable all triggers;
prompt Disabling triggers for AROLEPRIVILEGE...
alter table AROLEPRIVILEGE disable all triggers;
prompt Disabling triggers for AUSER...
alter table AUSER disable all triggers;
prompt Disabling triggers for AUSERGROUP...
alter table AUSERGROUP disable all triggers;
prompt Disabling triggers for AUSERROLE...
alter table AUSERROLE disable all triggers;
prompt Disabling triggers for AUSERTYPE...
alter table AUSERTYPE disable all triggers;
prompt Disabling triggers for AVAR...
alter table AVAR disable all triggers;
prompt Disabling triggers for BTOC_ADMINIDISTRICTS...
alter table BTOC_ADMINIDISTRICTS disable all triggers;
prompt Disabling triggers for BTOC_ALARMLEVEL...
alter table BTOC_ALARMLEVEL disable all triggers;
prompt Disabling triggers for BTOC_ALARMTYPE...
alter table BTOC_ALARMTYPE disable all triggers;
prompt Disabling triggers for BTOC_COLLAUTHORITY...
alter table BTOC_COLLAUTHORITY disable all triggers;
prompt Disabling triggers for BTOC_DEALTYPE...
alter table BTOC_DEALTYPE disable all triggers;
prompt Disabling triggers for BTOC_DEVICESUPPLIER...
alter table BTOC_DEVICESUPPLIER disable all triggers;
prompt Disabling triggers for BTOC_DEVICETYPE...
alter table BTOC_DEVICETYPE disable all triggers;
prompt Disabling triggers for BTOC_DISPCHARACTER...
alter table BTOC_DISPCHARACTER disable all triggers;
prompt Disabling triggers for BTOC_INFOTYPE...
alter table BTOC_INFOTYPE disable all triggers;
prompt Disabling triggers for BTOC_RECPROGRAMTYPE...
alter table BTOC_RECPROGRAMTYPE disable all triggers;
prompt Disabling triggers for BTOC_TOGATETYPE...
alter table BTOC_TOGATETYPE disable all triggers;
prompt Disabling triggers for BTOC_UNIDENTIFYTYPE...
alter table BTOC_UNIDENTIFYTYPE disable all triggers;
prompt Disabling triggers for BTOC_WZWPYY...
alter table BTOC_WZWPYY disable all triggers;
prompt Disabling triggers for BTOC_WZYY...
alter table BTOC_WZYY disable all triggers;
prompt Disabling triggers for CARMONITORS...
alter table CARMONITORS disable all triggers;
prompt Disabling triggers for CARNO_COLOR...
alter table CARNO_COLOR disable all triggers;
prompt Disabling triggers for CARNO_MONITORPOINTS...
alter table CARNO_MONITORPOINTS disable all triggers;
prompt Disabling triggers for CARNO_NUM...
alter table CARNO_NUM disable all triggers;
prompt Disabling triggers for CARNO_TYPE...
alter table CARNO_TYPE disable all triggers;
prompt Disabling triggers for CAR_INFO_MONITOR...
alter table CAR_INFO_MONITOR disable all triggers;
prompt Disabling triggers for CAR_INFO_OWNER...
alter table CAR_INFO_OWNER disable all triggers;
prompt Disabling triggers for CAR_INFO_TITLE...
alter table CAR_INFO_TITLE disable all triggers;
prompt Disabling triggers for CAR_TYPE...
alter table CAR_TYPE disable all triggers;
prompt Disabling triggers for DEMO_LEAVE...
alter table DEMO_LEAVE disable all triggers;
prompt Disabling triggers for ELP_CWZ...
alter table ELP_CWZ disable all triggers;
prompt Disabling triggers for ELP_PUN...
alter table ELP_PUN disable all triggers;
prompt Disabling triggers for FI_FLOW...
alter table FI_FLOW disable all triggers;
prompt Disabling triggers for FI_OWNER...
alter table FI_OWNER disable all triggers;
prompt Disabling triggers for FI_TASK...
alter table FI_TASK disable all triggers;
prompt Disabling triggers for FI_TASK_PREV...
alter table FI_TASK_PREV disable all triggers;
prompt Disabling triggers for FI_VAR...
alter table FI_VAR disable all triggers;
prompt Disabling triggers for IVS_ALARMCAMERAPAIR...
alter table IVS_ALARMCAMERAPAIR disable all triggers;
prompt Disabling triggers for IVS_ALARMICONINFO...
alter table IVS_ALARMICONINFO disable all triggers;
prompt Disabling triggers for IVS_ALARMINFO...
alter table IVS_ALARMINFO disable all triggers;
prompt Disabling triggers for IVS_AUTHORITYGROUP...
alter table IVS_AUTHORITYGROUP disable all triggers;
prompt Disabling triggers for IVS_CAMERAAUTHORITY...
alter table IVS_CAMERAAUTHORITY disable all triggers;
prompt Disabling triggers for IVS_CAMERAGROUP...
alter table IVS_CAMERAGROUP disable all triggers;
prompt Disabling triggers for IVS_CAMERAICONINFO...
alter table IVS_CAMERAICONINFO disable all triggers;
prompt Disabling triggers for IVS_CAMERAINFO...
alter table IVS_CAMERAINFO disable all triggers;
prompt Disabling triggers for IVS_CAPTUREPICTURE...
alter table IVS_CAPTUREPICTURE disable all triggers;
prompt Disabling triggers for IVS_DECODERINFO...
alter table IVS_DECODERINFO disable all triggers;
prompt Disabling triggers for IVS_DECODERCAMERA...
alter table IVS_DECODERCAMERA disable all triggers;
prompt Disabling triggers for IVS_DEFAULTCARDOUT...
alter table IVS_DEFAULTCARDOUT disable all triggers;
prompt Disabling triggers for IVS_DEVICEINFO...
alter table IVS_DEVICEINFO disable all triggers;
prompt Disabling triggers for IVS_DISPLAYCHANNELINFO...
alter table IVS_DISPLAYCHANNELINFO disable all triggers;
prompt Disabling triggers for IVS_EVENTINFO...
alter table IVS_EVENTINFO disable all triggers;
prompt Disabling triggers for IVS_OBJECTINFO...
alter table IVS_OBJECTINFO disable all triggers;
prompt Disabling triggers for IVS_EVENTRECTINFO...
alter table IVS_EVENTRECTINFO disable all triggers;
prompt Disabling triggers for IVS_RECT...
alter table IVS_RECT disable all triggers;
prompt Disabling triggers for IVS_FACE...
alter table IVS_FACE disable all triggers;
prompt Disabling triggers for IVS_GROUPINFO...
alter table IVS_GROUPINFO disable all triggers;
prompt Disabling triggers for IVS_GROUPSWITCHDETAIL...
alter table IVS_GROUPSWITCHDETAIL disable all triggers;
prompt Disabling triggers for IVS_GROUPSWITCHGROUP...
alter table IVS_GROUPSWITCHGROUP disable all triggers;
prompt Disabling triggers for IVS_MAPINFO...
alter table IVS_MAPINFO disable all triggers;
prompt Disabling triggers for IVS_OPERATELOG...
alter table IVS_OPERATELOG disable all triggers;
prompt Disabling triggers for IVS_PROGSWITCH...
alter table IVS_PROGSWITCH disable all triggers;
prompt Disabling triggers for IVS_PROGSWITCHDETAIL...
alter table IVS_PROGSWITCHDETAIL disable all triggers;
prompt Disabling triggers for IVS_RECOGNIZERINFO...
alter table IVS_RECOGNIZERINFO disable all triggers;
prompt Disabling triggers for IVS_RECOGNIZERCAMERA...
alter table IVS_RECOGNIZERCAMERA disable all triggers;
prompt Disabling triggers for IVS_SYNCAMERA...
alter table IVS_SYNCAMERA disable all triggers;
prompt Disabling triggers for IVS_SYNGROUP...
alter table IVS_SYNGROUP disable all triggers;
prompt Disabling triggers for IVS_SYSTEMLOG...
alter table IVS_SYSTEMLOG disable all triggers;
prompt Disabling triggers for IVS_SYSTEMPARAMETER...
alter table IVS_SYSTEMPARAMETER disable all triggers;
prompt Disabling triggers for IVS_TASKINFO...
alter table IVS_TASKINFO disable all triggers;
prompt Disabling triggers for IVS_TEMPPICTURE...
alter table IVS_TEMPPICTURE disable all triggers;
prompt Disabling triggers for IVS_TRACK...
alter table IVS_TRACK disable all triggers;
prompt Disabling triggers for IVS_USERAUTHORITY...
alter table IVS_USERAUTHORITY disable all triggers;
prompt Disabling triggers for IVS_USERGROUP...
alter table IVS_USERGROUP disable all triggers;
prompt Disabling triggers for IVS_USERINFO...
alter table IVS_USERINFO disable all triggers;
prompt Disabling triggers for IVS_USERVEHMON...
alter table IVS_USERVEHMON disable all triggers;
prompt Disabling triggers for IVS_VEHICLE...
alter table IVS_VEHICLE disable all triggers;
prompt Disabling triggers for IVS_VIDEOINFO...
alter table IVS_VIDEOINFO disable all triggers;
prompt Disabling triggers for IVS_VIRTUALGROUP...
alter table IVS_VIRTUALGROUP disable all triggers;
prompt Disabling triggers for IVS_WINDOWCAMERAINFO...
alter table IVS_WINDOWCAMERAINFO disable all triggers;
prompt Disabling triggers for TEST...
alter table TEST disable all triggers;
prompt Disabling triggers for TOC_DAY...
alter table TOC_DAY disable all triggers;
prompt Disabling triggers for TOC_HOUR...
alter table TOC_HOUR disable all triggers;
prompt Disabling triggers for TOC_LPTCITY...
alter table TOC_LPTCITY disable all triggers;
prompt Disabling triggers for TOC_LPTCITY2...
alter table TOC_LPTCITY2 disable all triggers;
prompt Disabling triggers for TOC_LPTCOLOR...
alter table TOC_LPTCOLOR disable all triggers;
prompt Disabling triggers for TOC_LPTTYPE...
alter table TOC_LPTTYPE disable all triggers;
prompt Disabling triggers for TOC_REGION...
alter table TOC_REGION disable all triggers;
prompt Disabling triggers for TOC_VEHCOLOR...
alter table TOC_VEHCOLOR disable all triggers;
prompt Disabling triggers for TOC_VEHSTATE...
alter table TOC_VEHSTATE disable all triggers;
prompt Disabling triggers for TOC_VEHTYPE...
alter table TOC_VEHTYPE disable all triggers;
prompt Disabling triggers for TOG_CLPP...
alter table TOG_CLPP disable all triggers;
prompt Disabling triggers for TOG_DEVBUG...
alter table TOG_DEVBUG disable all triggers;
prompt Disabling triggers for TOG_DEVICE...
alter table TOG_DEVICE disable all triggers;
prompt Disabling triggers for TOG_FLOWTHD...
alter table TOG_FLOWTHD disable all triggers;
prompt Disabling triggers for TOG_OWNERVEH...
alter table TOG_OWNERVEH disable all triggers;
prompt Disabling triggers for TOG_PUBINFO...
alter table TOG_PUBINFO disable all triggers;
prompt Disabling triggers for TOG_RECDEVGROUP...
alter table TOG_RECDEVGROUP disable all triggers;
prompt Disabling triggers for TOG_RECIP...
alter table TOG_RECIP disable all triggers;
prompt Disabling triggers for TOG_RECUSERGROUP...
alter table TOG_RECUSERGROUP disable all triggers;
prompt Disabling triggers for TOG_TOGDISTANCE...
alter table TOG_TOGDISTANCE disable all triggers;
prompt Disabling triggers for TOG_TOLLGATE...
alter table TOG_TOLLGATE disable all triggers;
prompt Disabling triggers for TOG_VEHACCOM...
alter table TOG_VEHACCOM disable all triggers;
prompt Disabling triggers for TOG_VEHBLACK...
alter table TOG_VEHBLACK disable all triggers;
prompt Disabling triggers for TOG_VEHDECK...
alter table TOG_VEHDECK disable all triggers;
prompt Disabling triggers for TOG_VEHDISP...
alter table TOG_VEHDISP disable all triggers;
prompt Disabling triggers for TOG_VEHDISPALARM...
alter table TOG_VEHDISPALARM disable all triggers;
prompt Disabling triggers for TOG_VEHICLE...
alter table TOG_VEHICLE disable all triggers;
prompt Disabling triggers for TOG_VEHMANUAL...
alter table TOG_VEHMANUAL disable all triggers;
prompt Disabling triggers for TOG_VEHMON...
alter table TOG_VEHMON disable all triggers;
prompt Disabling triggers for TOG_VEHWHITE...
alter table TOG_VEHWHITE disable all triggers;
prompt Disabling triggers for TTEST...
alter table TTEST disable all triggers;
prompt Loading AADMIN...
insert into AADMIN (ADMINID, ADMINNAME, AUTHENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('001', '��Ϣ��������Ա', 1, '������Ϣ����', 'admin', to_date('18-10-2010 22:14:23', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 22:14:23', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading AADMINGROUP...
prompt Table is empty
prompt Loading AADMINORG...
prompt Table is empty
prompt Loading AADMINROLE...
prompt Table is empty
prompt Loading ACCESSLOG...
prompt Table is empty
prompt Loading ADEGREE...
prompt Table is empty
prompt Loading AGROUP...
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('114', 'recgroup', '���ն���', 1, 1, '���ԡ�������������������', null, null, null, null, null, '1', null, null, null, null, 'admin,�����˺�', null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('115', 'devgroup', '�����豸����', 1, 1, '���', null, null, null, null, null, '2', null, null, null, null, null, '��̨,222');
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('112', 'recgroup', '����һ��', 1, 1, 'ssssssssssssssssssss', null, null, null, null, null, '1', null, null, null, null, '�����˺�', null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('test', 'group', '�����û���', 1, 1, '11111', null, null, null, null, null, null, null, null, null, null, null, null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('101', 'group', 'ϵͳ������', 1, 1, 'ggggg', 'admin', to_date('18-10-2010 22:00:53', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 22:00:53', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('102', 'group', '���������', 1, 1, null, 'admin', to_date('18-10-2010 22:01:08', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 22:01:08', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('113', 'recgroup', '��������', 1, 1, '1111111222222222222ddddd�Ǻ�2222222222222222', null, null, null, null, null, '1', null, null, null, null, 'admin,�����˺�', null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('group', null, '�û���', 0, 1, null, null, null, null, null, 0, null, null, null, null, null, null, null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('111', 'devgroup', '�����豸һ��', 1, 1, '���ԡ�������', null, null, null, null, null, '2', null, null, null, null, null, '��̨,��Ȧ222,���ػ�111');
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('recgroup', null, '�����û�����', 0, 1, null, 'admin', null, null, null, 0, '1', null, null, null, null, null, null);
insert into AGROUP (GROUPID, PARENTID, GROUPNAME, GROUPLEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O, GTYPE, STIME, ETIME, TOTALUSERS, TOTALDEVS, GROUPUSERS, GROUPDEVS)
values ('devgroup', null, '�����豸����', 0, 1, null, 'admin', null, null, null, 0, '2', null, null, null, null, null, null);
commit;
prompt 11 records loaded
prompt Loading AGROUPLEVEL...
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('devgroup', '111');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('devgroup', '115');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('group', '101');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('group', '102');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('group', 'test');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('recgroup', '112');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('recgroup', '113');
insert into AGROUPLEVEL (UPPERID, LOWERID)
values ('recgroup', '114');
commit;
prompt 8 records loaded
prompt Loading AGROUPROLE...
insert into AGROUPROLE (GROUPID, ROLEID)
values ('101', '001');
insert into AGROUPROLE (GROUPID, ROLEID)
values ('101', '003');
commit;
prompt 2 records loaded
prompt Loading AORG...
insert into AORG (ORGID, PARENTID, ORGNAME, ORGTYPE, ORGLEVEL, O, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('001', 'org', '�����־�һ', null, 1, null, null, 'admin', to_date('18-10-2010 19:30:47', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-12-2010 14:43:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into AORG (ORGID, PARENTID, ORGNAME, ORGTYPE, ORGLEVEL, O, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('002', 'org', '�����־ֶ�', null, 1, null, null, 'admin', to_date('18-10-2010 19:31:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-12-2010 14:46:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into AORG (ORGID, PARENTID, ORGNAME, ORGTYPE, ORGLEVEL, O, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('org', null, '�����й�����', null, 0, 0, null, null, null, 'admin', to_date('18-12-2010 14:42:57', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 3 records loaded
prompt Loading AORGLEADER...
prompt Table is empty
prompt Loading AORGLEVEL...
insert into AORGLEVEL (UPPERID, LOWERID)
values ('org', '001');
insert into AORGLEVEL (UPPERID, LOWERID)
values ('org', '002');
commit;
prompt 2 records loaded
prompt Loading AORGROLE...
prompt Table is empty
prompt Loading AORGTYPE...
prompt Table is empty
prompt Loading APOST...
insert into APOST (POSTID, POSTNAME)
values (1001, '�ֳ�');
insert into APOST (POSTID, POSTNAME)
values (1002, '��ͨ��Ա');
insert into APOST (POSTID, POSTNAME)
values (1003, '��˾');
insert into APOST (POSTID, POSTNAME)
values (1004, '��ӳ�');
commit;
prompt 4 records loaded
prompt Loading AREPELLENTROLE...
prompt Table is empty
prompt Loading AROLE...
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('test', 'role', '����', 1, 1, null, 'admin', to_date('02-05-2011 17:39:35', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('02-05-2011 17:39:35', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('002', 'role', '��˾', 1, 1, null, 'admin', to_date('18-10-2010 19:26:28', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 22:00:26', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('003', 'role', '��ͨ��Ա', 1, 1, null, 'admin', to_date('18-10-2010 19:27:41', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 22:00:02', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('004', 'role', 'һ������', 1, 1, null, 'admin', to_date('18-10-2010 19:28:33', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 21:59:43', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('888', 'role', '�ֳ�', 1, 1, null, 'admin', to_date('18-10-2010 19:29:00', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 19:29:00', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('005', 'role', '��ӳ�', 1, 1, null, 'admin', to_date('18-10-2010 19:29:23', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('18-10-2010 19:29:23', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('001', 'role', 'ϵͳ����Ա', 1, 1, null, 'admin', to_date('30-09-2010 14:28:10', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('30-09-2010 14:28:10', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AROLE (ROLEID, PARENTID, ROLENAME, ROLELEVEL, ENABLED, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('role', null, '��ɫ', 0, 1, '�����û�ӵ�д˽�ɫ', null, null, null, null, 0);
commit;
prompt 8 records loaded
prompt Loading AROLEPRIVILEGE...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'app', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'appmenu', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 2, 'bar', 'adm');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 2, 'bar', 'dev');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 2, 'bar', 'flow');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'changepassword', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'index', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'selectorg', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'selectorgs', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'selectuser', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'selectusers', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'title', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 1, 'user.personal', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'app', 2, 'user.personal', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'car_info_identify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'car_info_identify1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'changepassword', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'index', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'rep_flowchange', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'rep_tradayflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'rep_trainsvehicle', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'title', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'toc_lpttype', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'toc_lpttype.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'toc_lpttype.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'toc_lpttype.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'toc_lpttype.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'toc_lpttype.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicealarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicealarm.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicealarm.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicealarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicealarm.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicealarm.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicealarm.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicealarm.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicegonginfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicegonginfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicegonginfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicegonginfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicegonginfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicegonginfo.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicegonginfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicegonginfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_deviceinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_deviceinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_deviceinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_deviceinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_deviceinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_deviceinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_deviceinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_devicequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_devicequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatedistance', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatedistance.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatedistance.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatedistance.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatedistance.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatedistance.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatedistance.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateflow.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateflow.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateflow.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateflow.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateflow.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateflow.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gateinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gateinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_gatequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_gatequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_reccontrolip', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_reccontrolip.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_reccontrolip.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_reccontrolip.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_reccontrolip.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_reccontrolip.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_reccontrolip.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_reccontrolip.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdeal', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdeal.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmdeal.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmdeal.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdealinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdealinfo.form', 'e');
commit;
prompt 100 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdealinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmdealinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdone', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmdone.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmdone.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmdone.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarminfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarminfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarminfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarminfo.form', 'notice');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarminfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehalarmquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehalarmquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehban', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehban.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehban.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundoaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundoaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundoaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehblackundoaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundoaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundoaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehblackundoaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehcurmon.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdisalarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdisalarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdisalarm.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd1.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd1.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispadd1.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispadd1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispauditundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispauditundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispauditundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispauditundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispauditundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispauditundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispauditundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispundoaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispundoaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispundoaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehdispundoaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispundoaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispundoaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehdispundoaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehfootquery', 's');
commit;
prompt 200 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehfootquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehfootquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehfootquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehfootquery.query', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehinfoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehinfoquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonquery.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonqueryidentify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonqueryspecial', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonqueryspecial', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonqueryspecial.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehmonqueryspecial.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime4', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime4', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehmonrealtime4', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehtao', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtao.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtao.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtao.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehtaoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtaoquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtaoquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehtaoquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehunidentify.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'tog_vehunidentify.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'tog_vehunidentify.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'user', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'user.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 3, 'user.list', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 1, 'user.personal', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('001', 'togate', 2, 'user.personal', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'car_info_identify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'car_info_identify1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'changepassword', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'index', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'menu_palarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'menu_pdevice', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'menu_pmonitor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'menu_psystem', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'menu_ptransflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'sub_alarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'sub_device', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'sub_monitor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'sub_system', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'sub_transflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'title', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicealarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicealarm.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicealarm.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicealarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicealarm.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicealarm.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicealarm.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicealarm.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicegonginfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicegonginfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicegonginfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicegonginfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicegonginfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicegonginfo.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicegonginfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicegonginfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_deviceinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_deviceinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_deviceinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_deviceinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_deviceinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_deviceinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_deviceinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_devicequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_devicequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatedistance', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatedistance.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatedistance.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatedistance.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatedistance.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatedistance.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatedistance.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateflow', 's');
commit;
prompt 300 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateflow.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateflow.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateflow.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateflow.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateflow.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateflow.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gateinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gateinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_gatequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_gatequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_reccontrolip', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_reccontrolip.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_reccontrolip.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_reccontrolip.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_reccontrolip.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_reccontrolip.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_reccontrolip.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_reccontrolip.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdeal', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdeal.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmdeal.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmdeal.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdealinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdealinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdealinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmdealinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdone', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmdone.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmdone.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmdone.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarminfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarminfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarminfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarminfo.form', 'notice');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarminfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehalarmquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehalarmquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehban', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehban.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehban.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehban.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehblackundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehblackundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehcurmon.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdisalarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdisalarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdisalarm.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd1.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd1.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispadd1.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispadd1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispauditundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispauditundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispauditundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispauditundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispauditundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispauditundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispauditundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispquery', 's');
commit;
prompt 400 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehdispquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehdispquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehfootquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehfootquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehfootquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehfootquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehfootquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehfootquery.query', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehinfoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehmonquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehmonquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehmonquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehmonquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehmonqueryidentify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehmonrealtime.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehmonrealtime4.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehtao', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtao.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtao.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtao.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehtao.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehtaoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtaoquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtaoquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehtaoquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehtaoquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehunidentify.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'tog_vehunidentify.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 3, 'tog_vehunidentify.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'tog_vehunidentify.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 1, 'user.personal', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('003', 'togate', 2, 'user.personal', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'admin.authorization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'admin.authorization', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'administrator', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'administrator', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'administrator.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'administrator.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'administrator.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'administrator.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'adminman', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'car_info_identify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'car_info_identify1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'car_type', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'car_type.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'car_type.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'car_type.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'car_type.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'car_type.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_color', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_color.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_color.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_color.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'carno_color.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'carno_color.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_type', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_type.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_type.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'carno_type.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'carno_type.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'carno_type.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'changepassword', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'changepassword', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'group.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'group.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.roles', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'group.roles', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'group.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'index', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'log', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'log.form', 's');
commit;
prompt 500 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'log.list', 'date');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'log.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'menu_palarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'menu_pdevice', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'menu_pmonitor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'menu_psystem', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'menu_ptransflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'monitor.memory', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'org.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'org.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.roles', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'org.roles', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'org.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'organization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'rep_flowchange', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'rep_tradayflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'rep_trainsvehicle', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.allusers', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'role.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'role.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'role.privileges', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'role.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'sub_alarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'sub_device', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'sub_monitor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'sub_system', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'sub_transflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'title', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lptcolor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lptcolor.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lptcolor.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lptcolor.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_lptcolor.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_lptcolor.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lpttype', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lpttype.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lpttype.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_lpttype.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_lpttype.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_lpttype.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehcolor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehcolor.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehcolor.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehcolor.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehcolor.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehcolor.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehstate', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehstate.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehstate.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehstate.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehstate.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehstate.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehtype', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehtype.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehtype.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'toc_vehtype.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehtype.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'toc_vehtype.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicealarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicealarm.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicealarm.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicealarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicealarm.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicealarm.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicealarm.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicealarm.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicegonginfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicegonginfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicegonginfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicegonginfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicegonginfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicegonginfo.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicegonginfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicegonginfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_deviceinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_deviceinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_deviceinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_deviceinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_deviceinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_deviceinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_deviceinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_devicequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_devicequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatedistance', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatedistance.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatedistance.form', 'e');
commit;
prompt 600 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatedistance.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatedistance.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatedistance.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatedistance.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateflow.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateflow.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateflow.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateflow.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateflow.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateflow.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gateinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gateinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_gatequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_gatequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_reccontrolip', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_reccontrolip.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_reccontrolip.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_reccontrolip.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_reccontrolip.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_reccontrolip.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_reccontrolip.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_reccontrolip.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdeal', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdeal.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmdeal.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmdeal.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdealinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdealinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdealinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmdealinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdone', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmdone.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmdone.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmdone.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarminfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarminfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarminfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarminfo.form', 'notice');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarminfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehalarmquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehalarmquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehban', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehban.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehban.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehban.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundoaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundoaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundoaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehblackundoaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundoaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundoaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehblackundoaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehcurmon.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdisalarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdisalarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdisalarm.query', 'e');
commit;
prompt 700 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispadd.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispadd.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispadd.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd1.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd1.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispadd1.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispadd1.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispauditundo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispauditundo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispauditundo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispauditundo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispauditundo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispauditundo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispauditundo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispundoaudit', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispundoaudit.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispundoaudit.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehdispundoaudit.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispundoaudit.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispundoaudit.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehdispundoaudit.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehfootquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehfootquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehfootquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehfootquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehfootquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehfootquery.query', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehinfoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonquery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonquery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonquery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehmonquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonquery.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehmonquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehmonquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehmonquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehmonqueryidentify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehmonrealtime.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehmonrealtime4.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehtao', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtao.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtao.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtao.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehtao.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehtaoquery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtaoquery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtaoquery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehtaoquery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehtaoquery.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehunidentify.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'tog_vehunidentify.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'tog_vehunidentify.list', '1_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'tog_vehunidentify.query', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user.authorization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.authorization', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.form', 'adminid');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.form', 'userlevel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'user.form', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'user.list', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'user.personal', 'e');
commit;
prompt 800 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'user.personal', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'userpriv', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'userpriv.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'userpriv.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 1, 'userpriv.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'userpriv.form', 'adminid');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'userpriv.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 2, 'userpriv.form', 'userlevel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'userpriv.form', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('888', 'togate', 3, 'userpriv.list', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('role', 'adm', 1, 'myflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('role', 'adm', 1, 'myflow.done', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('role', 'adm', 1, 'myflow.todo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'admin.authorization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'admin.authorization', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'administrator', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'administrator', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'administrator.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'administrator.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'administrator.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'administrator.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'adminman', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'alarmdetail.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'alarmdetail.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'alarmdetail.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_alarmlevel', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_alarmlevel', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_alarmlevel', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_alarmtype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_alarmtype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_dealtype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_dealtype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_devicesupplier', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_devicesupplier', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_devicetype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_devicetype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_dispcharacter', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_dispcharacter', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_infotype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_infotype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_recprogramtype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_recprogramtype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'btoc_togatetype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'btoc_togatetype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'changepassword', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'changepassword', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'group.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'group.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.roles', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'group.roles', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'group.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'index', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'log', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'log.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'log.list', 'date');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'log.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'log.stat', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'm06', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'm08', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_palarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_pdevice', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_pface', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_phome', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_pmonitor', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_psystem', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'menu_ptransflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'monitor.memory', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'org.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'org.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.roles', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'org.roles', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'org.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'organization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldata.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata.list', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldata.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldata.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldata.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataac.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldataac.list', 's');
commit;
prompt 900 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataac.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataac.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataacidfy.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatadual.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatadual.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatadual.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatadual.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatadualidfy.fom', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataidentify.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatasl.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'originaldatasl.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatasl.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldatasl.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'originaldataslidfy.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devbug', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devbug', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devbug', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devper2', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devper2', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devper2', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devperformance', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devperformance', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devperformance', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devstate', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devstate', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_devstate', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane2', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane2', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_idelane2', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_iderate', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_iderate', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'rep_iderate', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.allusers', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'role.form', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'role.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.privileges', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'role.privileges', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.relation', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'role.tree', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'sub_menu', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'title', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lptcity', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_lptcity', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lptcolor', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_lptcolor', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lpttype', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lpttype.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lpttype.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_lpttype.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_lpttype.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_lpttype.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_unidentifytype', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_unidentifytype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_unidentifytype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_vehclolor', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_vehclolor', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_vehstate', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_vehstate', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'toc_vehtype', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'toc_vehtype', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicealarm', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicealarm.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicealarm.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicealarm.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicealarm.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicealarm.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicealarm.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicealarm.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicegonginfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicegonginfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicegonginfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicegonginfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicegonginfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicegonginfo.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicegonginfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicegonginfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_deviceinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_deviceinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_deviceinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_deviceinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_deviceinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_deviceinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_deviceinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicequery', 's');
commit;
prompt 1000 records committed...
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_devicequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_devicequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatedistance', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatedistance.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatedistance.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatedistance.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatedistance.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatedistance.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatedistance.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateflow', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateflow.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateflow.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateflow.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateflow.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateflow.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateflow.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateinfo', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateinfo.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateinfo.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gateinfo.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateinfo.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateinfo.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gateinfo.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatequery', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatequery.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatequery.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_gatequery.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatequery.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatequery.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_gatequery.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_reccontrolip', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_reccontrolip.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_reccontrolip.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_reccontrolip.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_reccontrolip.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'tog_reccontrolip.list', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_reccontrolip.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'tog_reccontrolip.list', 'excel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user.authorization', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.authorization', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.form', 'adminid');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.form', 'userlevel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 3, 'user.form', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.list', 'delete');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 3, 'user.list', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'user.personal', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'user.personal', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'userpriv', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'userpriv.form', 'a');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'userpriv.form', 'e');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 1, 'userpriv.form', 's');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'userpriv.form', 'adminid');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'userpriv.form', 'save');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 2, 'userpriv.form', 'userlevel');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 3, 'userpriv.form', '5_1');
insert into AROLEPRIVILEGE (ROLEID, DOMAIN, TYPE, RID, PID)
values ('test', 'togate', 3, 'userpriv.list', '5_1');
commit;
prompt 1065 records loaded
prompt Loading AUSER...
insert into AUSER (USERID, USERNAME, ADMINID, ORGID, PASSWORD, USERLEVEL, ISLEADER, EXPIREDDATE, LOGINTIME, LOGINIP, LASTTIME, LASTIP, SKIN, LANGCODE, USERTYPE, POSTID, SEX, BIRTHDAY, IDCARD, SCHOOL, GRADUATION, DEGREE, MAJOR, COUNTRY, PROVINCE, CITY, ADDRESS, POSTCODE, PHONE, FAX, MOBILE, EMAIL, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, EXPIRED, IPCONFIG)
values ('admin', 'admin', null, 'org', '21232f297a57a5a743894a0e4a801fc3', 5, 1, null, to_date('09-06-2011 09:52:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('09-06-2011 00:35:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', null, null, null, 1001, 0, to_date('09-10-2010', 'dd-mm-yyyy'), '511224198110067232', '�����Ƽ���ѧ', 2008, 3, '�����1111222', null, null, null, '������ѧ111222', '610031', '028-88888888', null, '13888888888', null, null, null, null, 'admin', to_date('31-12-2010 16:03:42', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into AUSER (USERID, USERNAME, ADMINID, ORGID, PASSWORD, USERLEVEL, ISLEADER, EXPIREDDATE, LOGINTIME, LOGINIP, LASTTIME, LASTIP, SKIN, LANGCODE, USERTYPE, POSTID, SEX, BIRTHDAY, IDCARD, SCHOOL, GRADUATION, DEGREE, MAJOR, COUNTRY, PROVINCE, CITY, ADDRESS, POSTCODE, PHONE, FAX, MOBILE, EMAIL, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, EXPIRED, IPCONFIG)
values ('test', '�����˺�', null, '001', '698d51a19d8a121ce581499d7b701668', 1, 0, to_date('22-11-2012', 'dd-mm-yyyy'), to_date('02-05-2011 17:45:43', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', to_date('02-05-2011 17:41:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', null, null, null, 1002, 0, to_date('30-09-2005', 'dd-mm-yyyy'), '5112241976107232', null, null, 3, null, null, null, null, '������111', '610031', '13845886788', null, null, null, '�ܺú�ǿ��', 'admin', to_date('18-10-2010 22:10:52', 'dd-mm-yyyy hh24:mi:ss'), 'test', to_date('24-10-2010 09:25:59', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into AUSER (USERID, USERNAME, ADMINID, ORGID, PASSWORD, USERLEVEL, ISLEADER, EXPIREDDATE, LOGINTIME, LOGINIP, LASTTIME, LASTIP, SKIN, LANGCODE, USERTYPE, POSTID, SEX, BIRTHDAY, IDCARD, SCHOOL, GRADUATION, DEGREE, MAJOR, COUNTRY, PROVINCE, CITY, ADDRESS, POSTCODE, PHONE, FAX, MOBILE, EMAIL, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, EXPIRED, IPCONFIG)
values ('aaaa', 'aaa', null, 'org', 'f379eaf3c831b04de153469d1bec345e', 1, 0, null, null, null, null, null, null, null, null, 1001, 0, null, null, null, null, 1, null, null, null, null, null, null, null, null, null, null, null, 'admin', to_date('07-11-2010 22:52:05', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('07-11-2010 22:52:05', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 3 records loaded
prompt Loading AUSERGROUP...
insert into AUSERGROUP (USERID, GROUPID)
values ('aaaa', 'test');
insert into AUSERGROUP (USERID, GROUPID)
values ('admin', '101');
insert into AUSERGROUP (USERID, GROUPID)
values ('admin', 'group');
insert into AUSERGROUP (USERID, GROUPID)
values ('test', 'test');
commit;
prompt 4 records loaded
prompt Loading AUSERROLE...
insert into AUSERROLE (USERID, ROLEID, HOLD)
values ('test', '003', 1);
insert into AUSERROLE (USERID, ROLEID, HOLD)
values ('test', 'test', 1);
insert into AUSERROLE (USERID, ROLEID, HOLD)
values ('admin', '001', 1);
commit;
prompt 3 records loaded
prompt Loading AUSERTYPE...
prompt Table is empty
prompt Loading AVAR...
insert into AVAR (VID, PARENTID, VNAME, VVALUE, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('carpicurl', 'root', '����ͼƬ���·��', '/domain/togate/upload', null, 'admin', to_date('15-11-2010 10:03:33', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('15-11-2010 10:03:33', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into AVAR (VID, PARENTID, VNAME, VVALUE, REMARK, CREATOR, CREATETIME, MODIFIER, MODIFYTIME, O)
values ('root', null, 'root', null, null, null, null, null, null, 0);
commit;
prompt 2 records loaded
prompt Loading BTOC_ADMINIDISTRICTS...
insert into BTOC_ADMINIDISTRICTS (XZQHBH, XZQHMC, PX, ZTBJ, BZ)
values ('1001', '�ɶ���', 0, 'Y', null);
insert into BTOC_ADMINIDISTRICTS (XZQHBH, XZQHMC, PX, ZTBJ, BZ)
values ('1001', '�ɶ���', 0, 'Y', null);
commit;
prompt 2 records loaded
prompt Loading BTOC_ALARMLEVEL...
insert into BTOC_ALARMLEVEL (BJDJDM, BJDJ, PX, ZTBJ, BZ)
values ('1', '�����澯', null, null, null);
insert into BTOC_ALARMLEVEL (BJDJDM, BJDJ, PX, ZTBJ, BZ)
values ('2', '��Ҫ�澯', null, null, null);
insert into BTOC_ALARMLEVEL (BJDJDM, BJDJ, PX, ZTBJ, BZ)
values ('3', 'һ��澯', null, null, null);
insert into BTOC_ALARMLEVEL (BJDJDM, BJDJ, PX, ZTBJ, BZ)
values ('4', '�ؼ��澯', null, null, null);
commit;
prompt 4 records loaded
prompt Loading BTOC_ALARMTYPE...
insert into BTOC_ALARMTYPE (BJLXDM, BJLX, PX, ZTBJ, BZ)
values ('1', '����������', null, null, null);
insert into BTOC_ALARMTYPE (BJLXDM, BJLX, PX, ZTBJ, BZ)
values ('2', '���ر���', null, null, null);
insert into BTOC_ALARMTYPE (BJLXDM, BJLX, PX, ZTBJ, BZ)
values ('3', '�����������ⱨ��', null, null, null);
insert into BTOC_ALARMTYPE (BJLXDM, BJLX, PX, ZTBJ, BZ)
values ('4', '���ӳ�������', null, null, null);
commit;
prompt 4 records loaded
prompt Loading BTOC_COLLAUTHORITY...
insert into BTOC_COLLAUTHORITY (CJJGBH, CJJGMC, PX, ZTBJ, BZ)
values ('1001', '�ɶ�����֧��', 0, 'Y', null);
insert into BTOC_COLLAUTHORITY (CJJGBH, CJJGMC, PX, ZTBJ, BZ)
values ('1002', '�ɶ�����֧��2', 0, 'Y', null);
insert into BTOC_COLLAUTHORITY (CJJGBH, CJJGMC, PX, ZTBJ, BZ)
values ('1001', '�ɶ�����֧��', 0, 'Y', null);
insert into BTOC_COLLAUTHORITY (CJJGBH, CJJGMC, PX, ZTBJ, BZ)
values ('1002', '�ɶ�����֧��2', 0, 'Y', null);
commit;
prompt 4 records loaded
prompt Loading BTOC_DEALTYPE...
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('1', '����δ����', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('2', 'δ�ػ�', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('3', '�ѽػ�', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('4', '��ѯ��������', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('5', '������Ƴ�', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('6', '���ͨΥ����', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('7', '����������ݲ���', null, null, null);
insert into BTOC_DEALTYPE (BJCLLXDM, BJCLLX, PX, ZTBJ, BZ)
values ('8', '�󱨾�', null, null, null);
commit;
prompt 8 records loaded
prompt Loading BTOC_DEVICESUPPLIER...
insert into BTOC_DEVICESUPPLIER (SBCSDM, SBCS, PX, ZTBJ, BZ)
values ('1', '������', null, null, null);
insert into BTOC_DEVICESUPPLIER (SBCSDM, SBCS, PX, ZTBJ, BZ)
values ('2', 'ͨ�õ���', null, null, null);
insert into BTOC_DEVICESUPPLIER (SBCSDM, SBCS, PX, ZTBJ, BZ)
values ('3', '������', null, null, null);
insert into BTOC_DEVICESUPPLIER (SBCSDM, SBCS, PX, ZTBJ, BZ)
values ('4', '����', null, null, null);
commit;
prompt 4 records loaded
prompt Loading BTOC_DEVICETYPE...
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('1', '���������', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('2', 'ģ�������', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('3', '�����', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('4', '��Ȧ', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('5', '������', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('6', '��˻�', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('7', '������', null, null, null);
insert into BTOC_DEVICETYPE (SBLX, SBLXMC, PX, ZTBJ, BZ)
values ('8', '��̨', null, null, null);
commit;
prompt 8 records loaded
prompt Loading BTOC_DISPCHARACTER...
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('1', '��ͨ�źŵ�Υ����', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('2', '���ر���', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('3', '����Υ��', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('4', '�ص�Ŀ�공��', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('5', '����������', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('6', '�����Ƴ���', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('7', '�������ɳ���', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('8', '���Υ��Υ��', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('9', '��������', null, null, null);
insert into BTOC_DISPCHARACTER (BKXZDM, BKXZ, PX, ZTBJ, BZ)
values ('10', '�������ɳ���', null, null, null);
commit;
prompt 10 records loaded
prompt Loading BTOC_INFOTYPE...
insert into BTOC_INFOTYPE (FBXXLXDM, FBXXLX, PX, ZTBJ, BZ)
values ('1', '������������Ϣ', null, null, null);
insert into BTOC_INFOTYPE (FBXXLXDM, FBXXLX, PX, ZTBJ, BZ)
values ('2', '���ر�����Ϣ', null, null, null);
insert into BTOC_INFOTYPE (FBXXLXDM, FBXXLX, PX, ZTBJ, BZ)
values ('3', '������������Ϣ', null, null, null);
commit;
prompt 3 records loaded
prompt Loading BTOC_RECPROGRAMTYPE...
insert into BTOC_RECPROGRAMTYPE (JSCXLXDM, JSCXLX, PX, ZTBJ, BZ)
values ('1', '�����ڽ��ճ���', null, null, null);
insert into BTOC_RECPROGRAMTYPE (JSCXLXDM, JSCXLX, PX, ZTBJ, BZ)
values ('2', '��Ͽ��ڽ��ճ���', null, null, null);
insert into BTOC_RECPROGRAMTYPE (JSCXLXDM, JSCXLX, PX, ZTBJ, BZ)
values ('3', '���Ӿ�����ճ���', null, null, null);
commit;
prompt 3 records loaded
prompt Loading BTOC_TOGATETYPE...
insert into BTOC_TOGATETYPE (KKLXDM, KKLX, PX, ZTBJ, BZ)
values ('1', '��·�ΰ�����', null, null, null);
insert into BTOC_TOGATETYPE (KKLXDM, KKLX, PX, ZTBJ, BZ)
values ('2', '���ڴ����ץ�ĵ�', null, null, null);
insert into BTOC_TOGATETYPE (KKLXDM, KKLX, PX, ZTBJ, BZ)
values ('3', '�����ץ�ĵ�', null, null, null);
insert into BTOC_TOGATETYPE (KKLXDM, KKLX, PX, ZTBJ, BZ)
values ('4', '���̵�����', null, null, null);
commit;
prompt 4 records loaded
prompt Loading BTOC_UNIDENTIFYTYPE...
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('1', '�ڵ�', null, null, null);
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('2', 'ģ������', null, null, null);
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('3', '���߰�', null, null, null);
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('4', '����', null, null, null);
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('5', 'ͼƬ��ȫ', null, null, null);
insert into BTOC_UNIDENTIFYTYPE (WSBLXDM, WSBLX, PX, ZTBJ, BZ)
values ('6', 'ͼƬ�޳�', null, null, null);
commit;
prompt 6 records loaded
prompt Loading BTOC_WZWPYY...
prompt Table is empty
prompt Loading BTOC_WZYY...
insert into BTOC_WZYY (WZYYBH, WZYY, PX, ZTBJ, BZ)
values ('a', '23wfsd', 12, 'A', 'fdsfs');
insert into BTOC_WZYY (WZYYBH, WZYY, PX, ZTBJ, BZ)
values ('A', 'F', 2, 'F', 'F');
insert into BTOC_WZYY (WZYYBH, WZYY, PX, ZTBJ, BZ)
values ('zcc', 'f', 4, 'A', 'f');
commit;
prompt 3 records loaded
prompt Loading CARMONITORS...
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('0001', '003', '���', null, '4', null, null, 'admin', to_date('28-08-2010 16:41:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:41:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('0002', '003', '����', null, '4', null, null, 'admin', to_date('28-08-2010 16:41:30', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:41:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('0003', '0001', '1����', null, '4', null, null, 'admin', to_date('28-08-2010 16:41:42', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:50:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('0004', '0001', '2����', null, '4', null, null, 'admin', to_date('28-08-2010 16:41:53', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:50:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('0005', '0002', '1����', null, '4', null, null, 'admin', to_date('28-08-2010 16:42:17', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:42:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('001', 'monitor', '�ɶ��ж���·', null, '1', null, null, 'admin', to_date('28-08-2010 16:39:26', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:39:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('002', '001', '����·��', null, '2', null, null, 'admin', to_date('28-08-2010 16:39:55', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:39:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('003', '002', 'ʮ��·��', null, '3', null, null, 'admin', to_date('28-08-2010 16:40:23', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('28-08-2010 16:40:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into CARMONITORS (ORGID, PARENTID, ORGNAME, ORGLEVEL, ORGTYPE, REMARK, O, CREATOR, CREATETIME, MODIFIER, MODIFYTIME)
values ('monitor', null, '��ص��복��', null, '0', '0', null, null, null, 'admin', to_date('28-08-2010 16:38:35', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 9 records loaded
prompt Loading CARNO_COLOR...
insert into CARNO_COLOR (ID, NAME, SORT)
values ('1', '����', '1');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('2', '����', '2');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('3', '����', '3');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('4', '����', '4');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('5', '����', '5');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('6', '��ɫ����', '6');
insert into CARNO_COLOR (ID, NAME, SORT)
values ('7', '�侯', '7');
commit;
prompt 7 records loaded
prompt Loading CARNO_MONITORPOINTS...
insert into CARNO_MONITORPOINTS (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('1', null, null, 'ʮ��·��', '1');
insert into CARNO_MONITORPOINTS (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('2', null, null, '��Ȫ·��', '2');
insert into CARNO_MONITORPOINTS (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('3', null, null, '�ƻ�·����', '3');
commit;
prompt 3 records loaded
prompt Loading CARNO_NUM...
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('1', '0', '0', '��', '1');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('2', '1', '��', '��A', '2');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('3', '1', '��', '��B', '3');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('4', '1', '��', '��C', '4');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('5', '0', '0', '��', '5');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('6', '5', '��', '��A', '6');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('7', '5', '��', '��B', '7');
insert into CARNO_NUM (ID, PARENTID, PARENTNAME, NAME, SORT)
values ('8', '8', '��', '��D', '8');
commit;
prompt 8 records loaded
prompt Loading CARNO_TYPE...
insert into CARNO_TYPE (ID, NAME, SORT)
values ('1', '������������', '1');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('2', 'С����������', '2');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('3', 'ʹ����������', '3');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('4', '�⼮��������', '4');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('5', '���ħͷ����', '5');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('6', '����������', '6');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('7', '�ҳ�����', '7');
insert into CARNO_TYPE (ID, NAME, SORT)
values ('8', '����������', '8');
commit;
prompt 8 records loaded
prompt Loading CAR_INFO_MONITOR...
insert into CAR_INFO_MONITOR (MONITORINFOID, CARINFOID, CARNO, CARNO_TYPE, CARNO_COLOR, CAR_TYPE, CAR_MONITOR_TYPE, CAR_ROAD, DIRECTION, PASSTIME, SPEED, UNIDENTIFY_TYPE, IDENTIFY_STATUS, IDENTIFY_REMARK, MANAGE_DEP, SHEF_STATUS, CAR_STATUS, REMARK)
values ('001', '001', '��AS4208', 'С�ͺ���', '��ɫ', '001', '�ƻ���··��1', '3����', '����', to_date('02-05-2010', 'dd-mm-yyyy'), '75', null, '��ʶ��', '������', '�ɶ��н��ܾ�', null, null, '11111');
insert into CAR_INFO_MONITOR (MONITORINFOID, CARINFOID, CARNO, CARNO_TYPE, CARNO_COLOR, CAR_TYPE, CAR_MONITOR_TYPE, CAR_ROAD, DIRECTION, PASSTIME, SPEED, UNIDENTIFY_TYPE, IDENTIFY_STATUS, IDENTIFY_REMARK, MANAGE_DEP, SHEF_STATUS, CAR_STATUS, REMARK)
values ('002', '002', '��BE3255', '���ͺ���', '��ɫ', '001', 'ʮ��·��', '2����', '����', to_date('11-07-2010 09:20:25', 'dd-mm-yyyy hh24:mi:ss'), '88', 'ģ������', 'δʶ��', '�ܲ�����', '������ͨ��XXX', null, null, null);
insert into CAR_INFO_MONITOR (MONITORINFOID, CARINFOID, CARNO, CARNO_TYPE, CARNO_COLOR, CAR_TYPE, CAR_MONITOR_TYPE, CAR_ROAD, DIRECTION, PASSTIME, SPEED, UNIDENTIFY_TYPE, IDENTIFY_STATUS, IDENTIFY_REMARK, MANAGE_DEP, SHEF_STATUS, CAR_STATUS, REMARK)
values ('003', '001', '��AS4208', 'С�ͺ���', '��ɫ', 'С�ͳ�', '��Ȫ·��', '4����', '����', to_date('11-04-2010 08:42:30', 'dd-mm-yyyy hh24:mi:ss'), '99', null, null, null, '�ɶ��н��ܾ�', null, null, null);
commit;
prompt 3 records loaded
prompt Loading CAR_INFO_OWNER...
insert into CAR_INFO_OWNER (OWNERINFOID, CARINFOID, CARNO, OWNER_NAME, OWNER_IDCARD, SEX, BIRTHDAY, DRIVERCARDSTART, DRIVERCARDSTATUS, MANAGETYPE, ARCHIVEID, TOTALPOINTS, ADDREGION, ADDRESS, PHONE, POST, REMARK)
values ('1001', '001', '��AS4208', '����', '511224198110087231', '��', '1981-11-04', to_date('02-11-2005', 'dd-mm-yyyy'), '����', 'С�ͳ�', 'BS005', '98', '�ɶ��н�ţ��111', '���Ͻ�ͨ��ѧ11��', '13551806718', '610031', '�⳵�ܲ���222');
insert into CAR_INFO_OWNER (OWNERINFOID, CARINFOID, CARNO, OWNER_NAME, OWNER_IDCARD, SEX, BIRTHDAY, DRIVERCARDSTART, DRIVERCARDSTATUS, MANAGETYPE, ARCHIVEID, TOTALPOINTS, ADDREGION, ADDRESS, PHONE, POST, REMARK)
values ('1002', '002', '��BE3255', '����', '522114197810087255', 'Ů', '1976-11-02', null, null, '���ͳ�', 'EE008', '10', '����', null, '13805884588', null, null);
commit;
prompt 2 records loaded
prompt Loading CAR_INFO_TITLE...
insert into CAR_INFO_TITLE (CARINFOID, CARNO, CARNO_TYPE, CAR_CATEGORY, ZH_DANDY, EN_DANDY, ENGINE_NUM, CAR_IDENTIFY_NUM, CAR_TYPE, CAR_COLOR, OWNER, OWNER_ID, CHECK_TIME, ENABLE_TIME, APPLYDIS_TIME, SENDID_DEP, REMARK)
values ('001', '��AS4208', 'С�ͺ���', 'С�ͳ�', '�µ�Ŷ111', 'Audy', 'PEA452886858', null, 'С�ͳ�', '��ɫ', '����', '511224198110087231', '2005-10-05 10:32:42', '2005-11-04', '2015-08-01', '�ɶ��н��ܾ�', '���ºܲ���222');
insert into CAR_INFO_TITLE (CARINFOID, CARNO, CARNO_TYPE, CAR_CATEGORY, ZH_DANDY, EN_DANDY, ENGINE_NUM, CAR_IDENTIFY_NUM, CAR_TYPE, CAR_COLOR, OWNER, OWNER_ID, CHECK_TIME, ENABLE_TIME, APPLYDIS_TIME, SENDID_DEP, REMARK)
values ('002', '��BE3255', '���ͺ���', '���ͻ���', '�칤', 'xuegong', 'BES835233345', null, '���ͳ�', '��ɫ', '����', '522114197810087255', '2001-10-01', '2001-11-02', '2016-04-25', '�����н�ͨ��', '���ͳ�������');
commit;
prompt 2 records loaded
prompt Loading CAR_TYPE...
insert into CAR_TYPE (ID, NAME, SORT)
values ('001', 'С�ͳ�', '1');
insert into CAR_TYPE (ID, NAME, SORT)
values ('002', '��ҳ�', '2');
insert into CAR_TYPE (ID, NAME, SORT)
values ('003', 'С����', '3');
insert into CAR_TYPE (ID, NAME, SORT)
values ('004', '���ͳ�', '4');
commit;
prompt 4 records loaded
prompt Loading DEMO_LEAVE...
prompt Table is empty
prompt Loading ELP_CWZ...
insert into ELP_CWZ (CWZID, MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, DWBH, DWMC, WZYY, JSZH, JSYXM, GGBJ, GGCZY, GGLX, GGSJ, QRCZY, QRSJ, CLCZY, CLSJ, CLBJ, FHBJ, FHCZY, FHSJ, HDHMSJ, BZ, SHBJ, SHSJ, SHRY, ZXBJ, ZXSJ, ZXCZY, XS, TJRQ)
values ('08321107-3530-48ba-9f2c-4b84d9271b0333', '08321107-3530-48ba-9f2c-4b84d9271b0333', '110', '100001', '����·��', '100000', '����', '10000001', '1����', to_date('19-04-2011 22:46:09', 'dd-mm-yyyy hh24:mi:ss'), '��EV545211', null, null, null, 'test.jpg', null, null, null, null, 15, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, to_date('28-04-2011 19:47:06', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('28-04-2011 19:47:06', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('28-04-2011 19:47:06', 'dd-mm-yyyy hh24:mi:ss'), '0', '0', null, to_date('28-04-2011 19:47:06', 'dd-mm-yyyy hh24:mi:ss'), 0, '123123', null, null, null, null, null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading ELP_PUN...
prompt Table is empty
prompt Loading FI_FLOW...
prompt Table is empty
prompt Loading FI_OWNER...
prompt Table is empty
prompt Loading FI_TASK...
prompt Table is empty
prompt Loading FI_TASK_PREV...
prompt Table is empty
prompt Loading FI_VAR...
prompt Table is empty
prompt Loading IVS_ALARMCAMERAPAIR...
prompt Table is empty
prompt Loading IVS_ALARMICONINFO...
prompt Table is empty
prompt Loading IVS_ALARMINFO...
prompt Table is empty
prompt Loading IVS_AUTHORITYGROUP...
insert into IVS_AUTHORITYGROUP (AUTHORITYID, AUTHORITYNAME)
values (1, '���Ե�Ȩ����1');
insert into IVS_AUTHORITYGROUP (AUTHORITYID, AUTHORITYNAME)
values (2, '���Ե�Ȩ����2');
insert into IVS_AUTHORITYGROUP (AUTHORITYID, AUTHORITYNAME)
values (3, '���Ե�Ȩ����3');
commit;
prompt 3 records loaded
prompt Loading IVS_CAMERAAUTHORITY...
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (5, 1);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (5, 2);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (36, 1);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (36, 2);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (43, 3);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (44, 1);
insert into IVS_CAMERAAUTHORITY (CAMERAID, AUTHORITYID)
values (44, 3);
commit;
prompt 7 records loaded
prompt Loading IVS_CAMERAGROUP...
insert into IVS_CAMERAGROUP (ID, VIRTUALGROUPID, CAMERAID)
values (2, 1, 222);
insert into IVS_CAMERAGROUP (ID, VIRTUALGROUPID, CAMERAID)
values (42, 1, 111);
insert into IVS_CAMERAGROUP (ID, VIRTUALGROUPID, CAMERAID)
values (41, 1, 1111);
commit;
prompt 3 records loaded
prompt Loading IVS_CAMERAICONINFO...
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (5, 0, '������Ƶ������_�����1', .0665509259259259, .369592088998764, 2, 2);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (36, 0, '������Ƶ������_�����2', .260416666666667, .526576019777503, -1, 1);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (37, 0, '������Ƶ������_�����3', .0798611111111111, .359703337453646, 3, 1);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (43, 0, 'haikang234_�����2', .162037037037037, .243510506798517, -1, 1);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (44, 0, 'haikang234_�����3', .208912037037037, .444993819530284, -1, 7);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (45, 0, 'haikang234_�����4', .209490740740741, .257107540173053, -1, 1);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (64, 0, '��������_�����1', .163194444444444, .299134734239802, -1, 1);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (65, 0, '��������_�����2', .381365740740741, .401730531520396, -1, 3);
insert into IVS_CAMERAICONINFO (CAMERAID, ICONINDEX, TOOLTIP, X, Y, MATCHALARMID, MAP)
values (66, 0, '��������_�����3', .125, .26946847960445, 1, 2);
commit;
prompt 9 records loaded
prompt Loading IVS_CAMERAINFO...
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (7, '�����1', ' ', 'Com1', 1, 1, 1, 0, ' ', ' ', ' ', null, null, 5, 'd:\videoutput', 0, 0, 0, null, null, 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (7, '�����2', null, 'Com2', 1, 1, 2, 0, null, null, null, null, null, 36, 'd:\videoutput', 0, 0, 0, null, null, 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (7, '�����3', null, 'Com3', 1, 1, 3, 0, null, null, null, null, null, 37, 'd:\videoutput', 0, 0, 0, null, null, 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (20, '�����1', ' ', 'Com1', 1, 1, 1, 0, ' ', ' ', ' ', null, null, 42, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (20, '�����2', ' ', 'Com1', 2, 1, 2, 0, ' ', ' ', ' ', null, null, 43, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (20, '�����3', ' ', 'Com1', 3, 1, 3, 0, ' ', ' ', ' ', null, null, 44, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (20, '�����4', ' ', 'Com1', 4, 1, 4, 0, ' ', ' ', ' ', null, null, 45, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (22, '�����1', ' ', 'Com1', 1, 1, 1, 0, ' ', ' ', ' ', null, null, 53, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (22, '�����2', ' ', 'Com1', 2, 1, 2, 0, ' ', ' ', ' ', null, null, 54, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (22, '�����3', ' ', 'Com1', 3, 1, 3, 0, ' ', ' ', ' ', null, null, 55, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (28, '�����1', ' ', 'Com1', 1, 1, 0, 0, ' ', ' ', ' ', null, null, 72, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (28, '�����2', ' ', 'Com1', 2, 1, 1, 0, ' ', ' ', ' ', null, null, 73, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (28, '�����3', ' ', 'Com1', 3, 1, 2, 0, ' ', ' ', ' ', null, null, 74, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
insert into IVS_CAMERAINFO (DEVICEID, NAME, DESCRIPTION, CONNURL, ADDRESSID, ISVALID, CHANNELNO, ISDETECTMOTION, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, CAMERAID, OUPPUTPATH, FRAMEINTERVAL, WIDTH, HEIGHT, RESOLUTION, QUALITY, STREAMTYPE)
values (28, '�����4', ' ', 'Com1', 4, 1, 3, 0, ' ', ' ', ' ', null, null, 75, 'd:\videoutput', 0, 0, 0, ' ', ' ', 0);
commit;
prompt 14 records loaded
prompt Loading IVS_CAPTUREPICTURE...
insert into IVS_CAPTUREPICTURE (PICTUREID, CAMERAID, DATETIME, FILEPATH)
values (1, 42, to_timestamp('17-04-2011 21:57:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'c:\faceabc.jpg');
commit;
prompt 1 records loaded
prompt Loading IVS_DECODERINFO...
insert into IVS_DECODERINFO (ID, NAME, IP, PORT, MAXDECODECHANNELNO)
values (1, '������1', '192.168.1.225', 8099, 14);
insert into IVS_DECODERINFO (ID, NAME, IP, PORT, MAXDECODECHANNELNO)
values (4, '������2', '192.168.1.55', 8789, 8);
commit;
prompt 2 records loaded
prompt Loading IVS_DECODERCAMERA...
insert into IVS_DECODERCAMERA (ID, DECODER, CAMERA)
values (14, 1, 45);
insert into IVS_DECODERCAMERA (ID, DECODER, CAMERA)
values (17, 4, 55);
commit;
prompt 2 records loaded
prompt Loading IVS_DEFAULTCARDOUT...
insert into IVS_DEFAULTCARDOUT (ID, CAMERAID, DISPLAYCHANNELID, DISPLAYSPLITSCREENNO)
values (1, 5, 0, 0);
insert into IVS_DEFAULTCARDOUT (ID, CAMERAID, DISPLAYCHANNELID, DISPLAYSPLITSCREENNO)
values (2, 5, 0, 2);
commit;
prompt 2 records loaded
prompt Loading IVS_DEVICEINFO...
insert into IVS_DEVICEINFO (NAME, SOURCE, LOGIN, PWD, FRAMEINTERVAL, PORT, CHANNELNO, VIDEOCOUNT, VIDDEOSTARTNO, WARNINGOUTPUTCOUNT, WARNINGINPUTNO, WARNINGCOUNT, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, DEVICEID, FILEEXTNAME, ISCAMERA, PROVIDERNAME, GROUPID, DESCRIPTION)
values ('������Ƶ������', '192.168.1.234', 'admin', '12345', 0, 8000, 1, 4, 0, 1, 1, 0, ' ', ' ', ' ', null, null, 7, 'mp4', 0, '������Ƶ������', 19, ' ');
insert into IVS_DEVICEINFO (NAME, SOURCE, LOGIN, PWD, FRAMEINTERVAL, PORT, CHANNELNO, VIDEOCOUNT, VIDDEOSTARTNO, WARNINGOUTPUTCOUNT, WARNINGINPUTNO, WARNINGCOUNT, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, DEVICEID, FILEEXTNAME, ISCAMERA, PROVIDERNAME, GROUPID, DESCRIPTION)
values ('haikang234', '192.168.1.233', 'admin', '12345', 0, 8000, 1, 4, 0, 2, 2, 0, ' ', ' ', ' ', null, null, 20, 'mp4', 0, '������Ƶ������', 19, ' ');
insert into IVS_DEVICEINFO (NAME, SOURCE, LOGIN, PWD, FRAMEINTERVAL, PORT, CHANNELNO, VIDEOCOUNT, VIDDEOSTARTNO, WARNINGOUTPUTCOUNT, WARNINGINPUTNO, WARNINGCOUNT, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, DEVICEID, FILEEXTNAME, ISCAMERA, PROVIDERNAME, GROUPID, DESCRIPTION)
values ('dev23', '192.168.1.111', '1', '1', 0, 8000, 1, 3, 0, 1, 1, 0, ' ', ' ', ' ', null, null, 22, 'mp4', 0, '������Ƶ������', 19, ' ');
insert into IVS_DEVICEINFO (NAME, SOURCE, LOGIN, PWD, FRAMEINTERVAL, PORT, CHANNELNO, VIDEOCOUNT, VIDDEOSTARTNO, WARNINGOUTPUTCOUNT, WARNINGINPUTNO, WARNINGCOUNT, REMARK, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, DEVICEID, FILEEXTNAME, ISCAMERA, PROVIDERNAME, GROUPID, DESCRIPTION)
values ('teter', '192.168.1.118', 'admin', '12345', 0, 8000, 0, 4, 0, 2, 0, 0, ' ', ' ', ' ', null, null, 28, 'mp4', 0, '������Ƶ������', 27, ' ');
commit;
prompt 4 records loaded
prompt Loading IVS_DISPLAYCHANNELINFO...
insert into IVS_DISPLAYCHANNELINFO (DISPLAYCHANNELID, DISPLAYCHANNELNAME, DECODECARDNO, DISPALYCHANNELNOINCURRENTCARD, SPLITSCREENNO)
values (0, 'Card1_VOut1', 0, 0, 4);
insert into IVS_DISPLAYCHANNELINFO (DISPLAYCHANNELID, DISPLAYCHANNELNAME, DECODECARDNO, DISPALYCHANNELNOINCURRENTCARD, SPLITSCREENNO)
values (1, 'Card1_VOut2', 0, 1, 16);
insert into IVS_DISPLAYCHANNELINFO (DISPLAYCHANNELID, DISPLAYCHANNELNAME, DECODECARDNO, DISPALYCHANNELNOINCURRENTCARD, SPLITSCREENNO)
values (2, 'Card1_VOut3', 0, 2, 4);
insert into IVS_DISPLAYCHANNELINFO (DISPLAYCHANNELID, DISPLAYCHANNELNAME, DECODECARDNO, DISPALYCHANNELNOINCURRENTCARD, SPLITSCREENNO)
values (3, 'Card1_VOut4', 0, 3, 1);
commit;
prompt 4 records loaded
prompt Loading IVS_EVENTINFO...
prompt Table is empty
prompt Loading IVS_OBJECTINFO...
prompt Table is empty
prompt Loading IVS_EVENTRECTINFO...
prompt Table is empty
prompt Loading IVS_RECT...
insert into IVS_RECT (RECTID, X, Y, W, H)
values (1, 10, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (2, 10, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (3, 20, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (4, 10, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (5, 10, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (6, 20, 20, 40, 50);
insert into IVS_RECT (RECTID, X, Y, W, H)
values (7, 100, 110, 200, 210);
commit;
prompt 7 records loaded
prompt Loading IVS_FACE...
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (1, 78.3, 7, 1, 'c:\\facea.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (2, 80.3, 7, 1, 'c:\\faceb.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (3, 12.4, 7, 1, 'c:\\facec.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (4, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (5, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (6, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (7, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (8, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (9, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (10, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (11, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (12, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (13, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (14, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (15, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (16, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (17, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (18, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (19, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (20, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (21, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (22, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (23, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (24, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (25, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (26, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (27, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (28, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (29, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (30, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (31, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (32, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (33, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (34, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (35, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (36, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (37, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (38, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (39, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (40, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (41, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (42, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (43, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (44, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (45, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (46, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (47, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (48, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (49, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (50, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (51, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (52, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (53, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (54, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (55, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (56, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (57, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (58, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (59, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (60, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (61, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (62, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (63, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (64, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (65, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (66, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (67, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (68, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (69, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (70, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (71, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (72, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (73, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (74, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (75, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (76, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (77, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (78, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (79, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (80, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (81, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (82, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (83, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (84, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (85, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (86, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (87, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (88, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (89, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (90, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (91, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (92, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (93, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (94, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (95, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (96, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (97, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (98, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (99, 12.4, 7, 1, 'c:\\a.jpg');
insert into IVS_FACE (FACEID, SCORE, RECTID, PICTUREID, FACEPATH)
values (100, 12.4, 7, 1, 'c:\\a.jpg');
commit;
prompt 100 records loaded
prompt Loading IVS_GROUPINFO...
insert into IVS_GROUPINFO (NAME, DESCRIPTION, PARENTID, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, GROUPID)
values ('�豸����', '�豸����', 0, null, null, null, null, 28);
insert into IVS_GROUPINFO (NAME, DESCRIPTION, PARENTID, ADDBY, ADDTIME, MODIFYBY, MODIFYTIME, GROUPID)
values ('���Ų���', ' ', 28, ' ', ' ', ' ', ' ', 19);
commit;
prompt 2 records loaded
prompt Loading IVS_GROUPSWITCHDETAIL...
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (1, 1, 10, 1);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (6, 1, 20, 21);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (1, 8, 10, 24);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (3, 8, 20, 25);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (3, 1, 13, 26);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (1, 1, 10, 1);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (6, 1, 20, 21);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (1, 8, 10, 24);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (3, 8, 20, 25);
insert into IVS_GROUPSWITCHDETAIL (GROUPSWITCHGROUPID, SYNGROUPID, TICKTIME, ID)
values (3, 1, 13, 26);
commit;
prompt 10 records loaded
prompt Loading IVS_GROUPSWITCHGROUP...
insert into IVS_GROUPSWITCHGROUP (ID, NAME, DESCRIPTION)
values (1, 'Ⱥ���л�1', 'Ⱥ���л�1');
insert into IVS_GROUPSWITCHGROUP (ID, NAME, DESCRIPTION)
values (3, 'Ⱥ���л�2', 'Ⱥ���л�2');
insert into IVS_GROUPSWITCHGROUP (ID, NAME, DESCRIPTION)
values (6, 'Ⱥ���л�3', 'Ⱥ���л�3');
insert into IVS_GROUPSWITCHGROUP (ID, NAME, DESCRIPTION)
values (7, 'Ⱥ���л�4', 'Ⱥ���л�4');
commit;
prompt 4 records loaded
prompt Loading IVS_MAPINFO...
insert into IVS_MAPINFO (ID, NAME, WIDTH, HEIGHT, FILENAME)
values (1, '��ͼ1', 804, 569, 'img\\Maps\\Map1.jpg');
insert into IVS_MAPINFO (ID, NAME, WIDTH, HEIGHT, FILENAME)
values (2, '��ͼ2', 809, 598, 'img\\Maps\\Map2.jpg');
insert into IVS_MAPINFO (ID, NAME, WIDTH, HEIGHT, FILENAME)
values (3, '��ͼ3', 829, 620, 'img\\Maps\\Map3.jpg');
insert into IVS_MAPINFO (ID, NAME, WIDTH, HEIGHT, FILENAME)
values (5, '��ͼ31212', 1024, 768, 'img\maps\Chrysanthemum.jpg');
insert into IVS_MAPINFO (ID, NAME, WIDTH, HEIGHT, FILENAME)
values (7, 'abc', 1024, 768, 'img\maps\Koala.jpg');
commit;
prompt 5 records loaded
prompt Loading IVS_OPERATELOG...
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (1, 27, 0, 0, to_date('21-03-2011 22:46:35', 'dd-mm-yyyy hh24:mi:ss'), 1601, '���Ⱥ��               ', 'ID:27  ����:testttttttt  ����:t', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (2, 0, 28, 0, to_date('21-03-2011 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 1701, '����豸               ', '�豸ID:28  �豸����:teter  �豸����:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (3, 0, 28, 68, to_date('21-03-2011 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����1  ����:  �豸ID:28  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (4, 0, 28, 69, to_date('21-03-2011 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����2  ����:  �豸ID:28  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (5, 0, 28, 70, to_date('21-03-2011 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����3  ����:  �豸ID:28  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (6, 0, 28, 71, to_date('21-03-2011 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����4  ����:  �豸ID:28  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (7, 27, 0, 0, to_date('21-03-2011 22:50:21', 'dd-mm-yyyy hh24:mi:ss'), 1603, 'ɾ��Ⱥ��               ', 'ID:27  ����:testttttttt  ����:t', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (8, 0, 0, 0, to_date('21-03-2011 22:51:57', 'dd-mm-yyyy hh24:mi:ss'), 1902, '���½�����              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (9, 0, 0, 0, to_date('21-03-2011 22:52:46', 'dd-mm-yyyy hh24:mi:ss'), 1902, '���½�����              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (10, 0, 0, 0, to_date('21-03-2011 23:46:09', 'dd-mm-yyyy hh24:mi:ss'), 1901, '��ӽ�����              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (11, 0, 5, 0, to_date('21-03-2011 23:49:02', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (12, 0, 0, 0, to_date('22-03-2011 00:05:30', 'dd-mm-yyyy hh24:mi:ss'), 1902, '���½�����              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (13, 0, 0, 0, to_date('28-03-2011 09:18:33', 'dd-mm-yyyy hh24:mi:ss'), 2101, '���ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (14, 0, 0, 0, to_date('28-03-2011 09:18:58', 'dd-mm-yyyy hh24:mi:ss'), 2101, '���ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (15, 0, 0, 0, to_date('28-03-2011 22:00:47', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (16, 0, 0, 0, to_date('28-03-2011 22:00:57', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (17, 0, 0, 0, to_date('28-03-2011 22:01:14', 'dd-mm-yyyy hh24:mi:ss'), 2102, '����ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (18, 0, 0, 0, to_date('28-03-2011 22:01:24', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (19, 0, 0, 0, to_date('28-03-2011 22:01:28', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (20, 0, 0, 0, to_date('28-03-2011 22:01:39', 'dd-mm-yyyy hh24:mi:ss'), 2102, '����ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (21, 0, 43, 0, to_date('28-03-2011 22:01:57', 'dd-mm-yyyy hh24:mi:ss'), 2203, 'ɾ������ͷ              ', 'ID:43  ����:�����2  ����:  �豸ID:20  �豸��:haikang234', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (22, 0, 0, 0, to_date('28-03-2011 22:02:09', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (23, 0, 45, 0, to_date('28-03-2011 22:02:12', 'dd-mm-yyyy hh24:mi:ss'), 2203, 'ɾ������ͷ              ', 'ID:45  ����:�����4  ����:  �豸ID:20  �豸��:haikang234', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (24, 0, 0, 0, to_date('28-03-2011 22:02:50', 'dd-mm-yyyy hh24:mi:ss'), 2102, '����ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (25, 0, 0, 0, to_date('28-03-2011 22:05:42', 'dd-mm-yyyy hh24:mi:ss'), 2102, '����ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (26, 0, 0, 0, to_date('28-03-2011 22:08:15', 'dd-mm-yyyy hh24:mi:ss'), 2102, '����ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (27, 0, 0, 0, to_date('28-03-2011 22:12:35', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (28, 0, 0, 0, to_date('28-03-2011 22:12:44', 'dd-mm-yyyy hh24:mi:ss'), 2201, '�������ͷ              ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (29, 0, 11, 0, to_date('16-04-2011 16:37:11', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (30, 0, 10, 0, to_date('16-04-2011 16:37:14', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (31, 0, 9, 0, to_date('16-04-2011 16:37:16', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (32, 0, 8, 0, to_date('16-04-2011 16:37:19', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (33, 0, 7, 0, to_date('16-04-2011 16:37:21', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (34, 0, 6, 0, to_date('16-04-2011 16:37:23', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (35, 0, 13, 0, to_date('16-04-2011 16:44:32', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (36, 0, 12, 0, to_date('16-04-2011 16:44:34', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (37, 0, 14, 0, to_date('25-04-2011 14:48:12', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (38, 0, 15, 0, to_date('25-04-2011 14:48:16', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (39, 0, 16, 0, to_date('25-04-2011 14:48:18', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (40, 0, 17, 0, to_date('25-04-2011 14:48:20', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (41, 0, 18, 0, to_date('25-04-2011 14:48:23', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (42, 0, 19, 0, to_date('25-04-2011 14:48:26', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (43, 0, 20, 0, to_date('25-04-2011 14:48:28', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (44, 0, 21, 0, to_date('25-04-2011 14:48:30', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (45, 0, 23, 0, to_date('25-04-2011 14:48:33', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (46, 0, 22, 0, to_date('25-04-2011 14:48:35', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (47, 0, 25, 0, to_date('25-04-2011 14:48:37', 'dd-mm-yyyy hh24:mi:ss'), 1903, 'ɾ��������              ', 'IntVideoSurv.Entity.DecoderInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (48, 0, 29, 0, to_date('05-06-2011 14:29:29', 'dd-mm-yyyy hh24:mi:ss'), 1703, 'ɾ���豸               ', '�豸ID:29  �豸����:testst  �豸����:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (49, 0, 30, 0, to_date('05-06-2011 14:29:59', 'dd-mm-yyyy hh24:mi:ss'), 1701, '����豸               ', '�豸ID:30  �豸����:rrrrrrrrrrrrrrrrr  �豸����:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (50, 0, 30, 80, to_date('05-06-2011 14:29:59', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����1  ����:  �豸ID:30  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (51, 0, 30, 81, to_date('05-06-2011 14:29:59', 'dd-mm-yyyy hh24:mi:ss'), 1801, '�������ͷ              ', 'ID:0  ����:�����2  ����:  �豸ID:30  �豸��:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (52, 0, 30, 0, to_date('05-06-2011 14:30:03', 'dd-mm-yyyy hh24:mi:ss'), 1703, 'ɾ���豸               ', '�豸ID:30  �豸����:rrrrrrrrrrrrrrrrr  �豸����:', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (53, 0, 0, 0, to_date('05-06-2011 14:31:49', 'dd-mm-yyyy hh24:mi:ss'), 2101, '���ʶ����              ', 'IntVideoSurv.Entity.RecognizerInfo', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (61, 0, 0, 0, to_date('17-06-2011 20:26:04', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (62, 0, 0, 0, to_date('17-06-2011 20:28:43', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '2', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (63, 0, 0, 0, to_date('17-06-2011 20:29:59', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (83, 0, 0, 0, to_date('20-06-2011 21:21:41', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (84, 0, 0, 0, to_date('20-06-2011 21:25:26', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '41', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (81, 0, 0, 0, to_date('20-06-2011 18:01:35', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '1', 'admin              ', 1, 'admin              ');
insert into IVS_OPERATELOG (ID, GROUPID, DEVICEID, CAMERAID, HAPPENTIME, OPERATETYPEID, OPERATETYPENAME, CONTENT, OPERATEUSERNAME, CLIENTUSERID, CLIENTUSERNAME)
values (82, 0, 0, 0, to_date('20-06-2011 18:01:48', 'dd-mm-yyyy hh24:mi:ss'), 2301, '�������ͷ��VirtualGroup ', '41', 'admin              ', 1, 'admin              ');
commit;
prompt 60 records loaded
prompt Loading IVS_PROGSWITCH...
insert into IVS_PROGSWITCH (ID, NAME, DESCRIPTION, DISPLAYCHANNELID, DISPLAYSPLITSCREENNO)
values (1, '�����л�1', '�����л�1������', 3, 0);
insert into IVS_PROGSWITCH (ID, NAME, DESCRIPTION, DISPLAYCHANNELID, DISPLAYSPLITSCREENNO)
values (2, '�����л�2', '�����л�2������', 0, 0);
insert into IVS_PROGSWITCH (ID, NAME, DESCRIPTION, DISPLAYCHANNELID, DISPLAYSPLITSCREENNO)
values (7, 'test', 'test', 1, 10);
commit;
prompt 3 records loaded
prompt Loading IVS_PROGSWITCHDETAIL...
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (1, 1, 5, 5);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (14, 1, 36, 5);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (15, 1, 37, 5);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (16, 2, 42, 30);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (17, 7, 42, 30);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (18, 7, 44, 30);
insert into IVS_PROGSWITCHDETAIL (ID, PROGSWITCHID, CAMERAID, TICKTIME)
values (19, 7, 36, 78);
commit;
prompt 7 records loaded
prompt Loading IVS_RECOGNIZERINFO...
insert into IVS_RECOGNIZERINFO (ID, NAME, IP, PORT, MAXRECOGNUMBER, RECOGTYPE)
values (1, 'ʶ����1', '192.178.1.1', 1234, 5, 1);
insert into IVS_RECOGNIZERINFO (ID, NAME, IP, PORT, MAXRECOGNUMBER, RECOGTYPE)
values (2, 'ʶ����20', '192.168.1.5', 31232, 12, 2);
insert into IVS_RECOGNIZERINFO (ID, NAME, IP, PORT, MAXRECOGNUMBER, RECOGTYPE)
values (3, 'yunqi', '192.168.1.89', 8889, 8, 4);
commit;
prompt 3 records loaded
prompt Loading IVS_RECOGNIZERCAMERA...
insert into IVS_RECOGNIZERCAMERA (ID, RECOGNIZER, CAMERA)
values (1, 1, 36);
insert into IVS_RECOGNIZERCAMERA (ID, RECOGNIZER, CAMERA)
values (2, 1, 54);
insert into IVS_RECOGNIZERCAMERA (ID, RECOGNIZER, CAMERA)
values (3, 2, 5);
insert into IVS_RECOGNIZERCAMERA (ID, RECOGNIZER, CAMERA)
values (9, 1, 55);
insert into IVS_RECOGNIZERCAMERA (ID, RECOGNIZER, CAMERA)
values (10, 2, 44);
commit;
prompt 5 records loaded
prompt Loading IVS_SYNCAMERA...
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (1, 5, 3, 61, 0);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (8, 36, 0, 104, 0);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (1, 5, 1, 105, 8);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (1, 5, 1, 106, 0);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (8, 5, 1, 107, 4);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (8, 5, 1, 108, 3);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (1, 5, 0, 109, 0);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (8, 55, 1, 118, 2);
insert into IVS_SYNCAMERA (SYNGROUPID, CAMERAID, DISPLAYCHANNELID, ID, DISPLAYSPLITSCREENNO)
values (8, 42, 1, 119, 9);
commit;
prompt 9 records loaded
prompt Loading IVS_SYNGROUP...
insert into IVS_SYNGROUP (SYNGROUPID, NAME, DESCRIPTION)
values (1, 'ͬ���л�1', 'ͬ���л�1');
insert into IVS_SYNGROUP (SYNGROUPID, NAME, DESCRIPTION)
values (8, 'ͬ���л�2', 'ͬ���л�2');
commit;
prompt 2 records loaded
prompt Loading IVS_SYSTEMLOG...
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (104, to_date('01-04-2011 22:09:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (105, to_date('01-04-2011 22:20:23', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (106, to_date('01-04-2011 22:25:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (107, to_date('01-04-2011 22:26:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (108, to_date('01-04-2011 22:29:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (109, to_date('01-04-2011 22:36:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (110, to_date('01-04-2011 22:41:03', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (111, to_date('02-04-2011 08:49:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (112, to_date('02-04-2011 10:04:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (113, to_date('02-04-2011 10:23:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (114, to_date('02-04-2011 10:58:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (115, to_date('02-04-2011 22:13:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (116, to_date('02-04-2011 22:19:20', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (117, to_date('02-04-2011 22:20:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (118, to_date('02-04-2011 22:34:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (119, to_date('02-04-2011 22:36:03', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (120, to_date('02-04-2011 22:43:40', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (121, to_date('02-04-2011 22:49:21', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (122, to_date('03-04-2011 00:28:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (123, to_date('03-04-2011 00:31:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (124, to_date('03-04-2011 00:33:03', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (125, to_date('03-04-2011 00:34:45', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (126, to_date('03-04-2011 00:37:46', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (127, to_date('03-04-2011 00:40:16', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (128, to_date('03-04-2011 00:45:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (129, to_date('03-04-2011 01:05:45', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (130, to_date('03-04-2011 01:06:45', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (131, to_date('03-04-2011 01:08:37', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (132, to_date('03-04-2011 01:09:47', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (133, to_date('03-04-2011 09:53:15', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (134, to_date('03-04-2011 09:58:02', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (135, to_date('03-04-2011 10:01:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (136, to_date('03-04-2011 10:05:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (137, to_date('03-04-2011 10:12:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (138, to_date('03-04-2011 10:27:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (139, to_date('03-04-2011 10:31:02', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (140, to_date('03-04-2011 10:34:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (141, to_date('03-04-2011 10:38:47', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (142, to_date('03-04-2011 10:40:38', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (143, to_date('03-04-2011 10:41:39', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (144, to_date('03-04-2011 10:52:00', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (145, to_date('03-04-2011 10:55:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (146, to_date('03-04-2011 10:56:49', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (147, to_date('03-04-2011 11:04:08', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (148, to_date('03-04-2011 11:08:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (149, to_date('03-04-2011 11:09:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (150, to_date('03-04-2011 11:11:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (151, to_date('03-04-2011 11:12:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (152, to_date('03-04-2011 11:14:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (153, to_date('03-04-2011 11:19:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (154, to_date('03-04-2011 11:21:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (155, to_date('03-04-2011 11:23:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (156, to_date('03-04-2011 11:34:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (157, to_date('03-04-2011 11:44:47', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (158, to_date('03-04-2011 12:31:31', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (159, to_date('05-04-2011 19:15:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (160, to_date('05-04-2011 19:17:04', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (161, to_date('05-04-2011 19:29:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (162, to_date('05-04-2011 19:35:50', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (163, to_date('05-04-2011 19:37:20', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (164, to_date('05-04-2011 19:38:38', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (165, to_date('06-04-2011 23:49:08', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (166, to_date('07-04-2011 22:29:55', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (167, to_date('07-04-2011 22:52:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (168, to_date('07-04-2011 22:56:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (169, to_date('10-04-2011 20:38:24', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (170, to_date('10-04-2011 20:41:39', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (171, to_date('10-04-2011 20:49:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (172, to_date('10-04-2011 20:51:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (173, to_date('10-04-2011 21:08:03', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (174, to_date('10-04-2011 21:21:02', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (175, to_date('17-04-2011 21:27:31', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (176, to_date('25-04-2011 14:59:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (177, to_date('25-04-2011 15:27:48', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (178, to_date('25-04-2011 15:51:58', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (179, to_date('25-04-2011 15:52:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (180, to_date('25-04-2011 15:52:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (181, to_date('25-04-2011 16:33:43', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (182, to_date('25-04-2011 16:34:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (183, to_date('25-04-2011 16:42:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (184, to_date('25-04-2011 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (185, to_date('25-04-2011 17:11:40', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (186, to_date('25-04-2011 17:14:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (187, to_date('25-04-2011 20:38:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (188, to_date('29-04-2011 20:24:49', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (189, to_date('29-04-2011 20:30:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (190, to_date('01-05-2011 14:31:53', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (191, to_date('01-05-2011 14:35:29', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (192, to_date('01-05-2011 14:37:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (193, to_date('01-05-2011 16:02:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (194, to_date('01-05-2011 16:06:29', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (195, to_date('01-05-2011 16:15:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (196, to_date('01-05-2011 16:21:27', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (197, to_date('01-05-2011 16:37:34', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (198, to_date('01-05-2011 16:53:00', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (199, to_date('02-05-2011 17:36:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (200, to_date('02-05-2011 17:38:15', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (201, to_date('02-05-2011 17:45:04', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (202, to_date('02-05-2011 17:46:39', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (203, to_date('02-05-2011 17:48:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
commit;
prompt 100 records committed...
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (204, to_date('02-05-2011 17:54:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (205, to_date('02-05-2011 17:58:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (206, to_date('02-05-2011 18:04:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (207, to_date('02-05-2011 18:22:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (208, to_date('02-05-2011 18:28:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (209, to_date('02-05-2011 20:40:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (210, to_date('03-05-2011 11:06:40', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (211, to_date('06-05-2011 14:48:24', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (212, to_date('06-05-2011 15:05:38', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (213, to_date('06-05-2011 15:13:03', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (214, to_date('06-05-2011 15:15:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (215, to_date('06-05-2011 15:16:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (216, to_date('06-05-2011 18:11:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (217, to_date('06-05-2011 18:23:51', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (218, to_date('06-05-2011 18:39:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (219, to_date('06-05-2011 22:56:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (220, to_date('06-05-2011 22:57:29', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (221, to_date('06-05-2011 23:01:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (222, to_date('06-05-2011 23:29:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (223, to_date('06-05-2011 23:34:45', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (224, to_date('07-05-2011 00:07:27', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (225, to_date('07-05-2011 00:08:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (226, to_date('07-05-2011 08:17:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (227, to_date('07-05-2011 08:30:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (228, to_date('07-05-2011 09:00:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (229, to_date('07-05-2011 09:01:37', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (230, to_date('07-05-2011 09:05:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (231, to_date('07-05-2011 09:27:50', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (232, to_date('07-05-2011 09:30:22', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (233, to_date('07-05-2011 10:19:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (234, to_date('07-05-2011 10:20:53', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (235, to_date('07-05-2011 10:29:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (236, to_date('07-05-2011 10:34:02', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (237, to_date('07-05-2011 10:37:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (238, to_date('07-05-2011 10:39:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (239, to_date('07-05-2011 10:47:40', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (240, to_date('07-05-2011 10:59:29', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (241, to_date('07-05-2011 11:09:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (242, to_date('07-05-2011 11:12:08', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (243, to_date('07-05-2011 12:05:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (244, to_date('07-05-2011 13:40:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (245, to_date('07-05-2011 13:49:22', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (246, to_date('07-05-2011 13:52:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (247, to_date('07-05-2011 13:58:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (248, to_date('07-05-2011 17:49:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (249, to_date('07-05-2011 17:56:49', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (250, to_date('07-05-2011 18:06:04', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (251, to_date('07-05-2011 18:10:39', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (252, to_date('07-05-2011 19:10:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (253, to_date('07-05-2011 19:15:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (254, to_date('08-05-2011 20:15:24', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (255, to_date('08-05-2011 20:22:06', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (256, to_date('08-05-2011 20:26:08', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (257, to_date('08-05-2011 20:27:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (258, to_date('09-05-2011 09:18:46', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (259, to_date('09-05-2011 09:42:15', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (260, to_date('09-05-2011 12:22:39', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (261, to_date('09-05-2011 12:50:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (262, to_date('09-05-2011 15:03:06', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (263, to_date('09-05-2011 16:18:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (264, to_date('09-05-2011 17:38:41', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (265, to_date('09-05-2011 17:41:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (266, to_date('09-05-2011 17:45:42', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (267, to_date('09-05-2011 17:53:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (268, to_date('09-05-2011 17:56:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (269, to_date('09-05-2011 19:55:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (270, to_date('09-05-2011 20:05:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (271, to_date('09-05-2011 20:17:24', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (272, to_date('09-05-2011 20:24:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (273, to_date('09-05-2011 20:30:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (274, to_date('09-05-2011 20:37:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (275, to_date('09-05-2011 20:41:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (276, to_date('09-05-2011 21:31:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (277, to_date('09-05-2011 21:36:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (278, to_date('09-05-2011 22:01:43', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (279, to_date('19-05-2011 09:18:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (1, to_date('20-02-2011 15:16:13', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (2, to_date('20-02-2011 17:03:21', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (3, to_date('20-02-2011 17:13:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (4, to_date('20-02-2011 17:16:37', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (5, to_date('20-02-2011 17:57:31', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (6, to_date('20-02-2011 18:00:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (7, to_date('20-02-2011 18:22:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (8, to_date('20-02-2011 18:29:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (9, to_date('20-02-2011 20:43:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (10, to_date('26-02-2011 11:46:23', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (11, to_date('26-02-2011 13:20:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (12, to_date('26-02-2011 15:49:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (13, to_date('26-02-2011 16:11:21', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (14, to_date('26-02-2011 16:13:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (15, to_date('26-02-2011 16:28:45', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (16, to_date('26-02-2011 16:36:12', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (17, to_date('26-02-2011 16:39:50', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (18, to_date('26-02-2011 16:41:51', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (19, to_date('26-02-2011 16:43:13', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (20, to_date('26-02-2011 16:44:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (21, to_date('26-02-2011 17:20:21', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (22, to_date('28-02-2011 22:00:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (23, to_date('06-03-2011 11:59:58', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (24, to_date('06-03-2011 13:02:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
commit;
prompt 200 records committed...
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (25, to_date('06-03-2011 14:25:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (26, to_date('06-03-2011 14:56:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (27, to_date('06-03-2011 15:12:15', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (28, to_date('06-03-2011 23:33:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (29, to_date('07-03-2011 15:00:13', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (30, to_date('08-03-2011 20:53:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (31, to_date('08-03-2011 21:06:37', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (32, to_date('08-03-2011 21:10:58', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (33, to_date('08-03-2011 21:14:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (34, to_date('08-03-2011 21:24:19', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (35, to_date('08-03-2011 21:48:06', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (36, to_date('08-03-2011 22:43:36', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (37, to_date('08-03-2011 22:45:25', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (38, to_date('10-03-2011 10:36:23', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (39, to_date('11-03-2011 15:57:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (40, to_date('11-03-2011 16:31:05', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (41, to_date('11-03-2011 17:10:00', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (42, to_date('14-03-2011 22:54:14', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (43, to_date('15-03-2011 22:45:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (44, to_date('18-03-2011 10:54:31', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (45, to_date('18-03-2011 10:59:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (46, to_date('18-03-2011 11:03:08', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (47, to_date('18-03-2011 11:31:10', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (48, to_date('18-03-2011 11:43:58', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (49, to_date('18-03-2011 13:41:48', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (50, to_date('18-03-2011 14:41:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (51, to_date('20-03-2011 19:56:33', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (52, to_date('20-03-2011 21:40:50', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (53, to_date('20-03-2011 21:48:37', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (54, to_date('20-03-2011 22:49:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (55, to_date('20-03-2011 23:21:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (56, to_date('20-03-2011 23:57:53', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (57, to_date('21-03-2011 00:01:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (58, to_date('21-03-2011 00:04:28', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (59, to_date('21-03-2011 00:05:18', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (60, to_date('21-03-2011 00:07:02', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (61, to_date('21-03-2011 22:53:54', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (62, to_date('21-03-2011 23:05:56', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (63, to_date('21-03-2011 23:15:17', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (64, to_date('21-03-2011 23:16:55', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (65, to_date('21-03-2011 23:49:48', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (66, to_date('22-03-2011 00:05:55', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (67, to_date('22-03-2011 12:58:48', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (68, to_date('22-03-2011 13:09:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (69, to_date('22-03-2011 13:11:24', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (70, to_date('22-03-2011 13:15:27', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (71, to_date('22-03-2011 22:53:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (72, to_date('22-03-2011 23:11:12', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (73, to_date('22-03-2011 23:14:21', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (74, to_date('27-03-2011 14:54:23', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (75, to_date('27-03-2011 15:00:13', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (76, to_date('27-03-2011 16:15:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (77, to_date('27-03-2011 20:48:55', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (78, to_date('27-03-2011 20:55:23', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (79, to_date('27-03-2011 21:11:09', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (80, to_date('27-03-2011 22:39:15', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (81, to_date('27-03-2011 22:42:34', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (82, to_date('28-03-2011 00:03:13', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (83, to_date('28-03-2011 08:58:31', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (84, to_date('28-03-2011 09:20:34', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (85, to_date('28-03-2011 21:57:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (86, to_date('28-03-2011 21:59:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (87, to_date('28-03-2011 22:02:57', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (88, to_date('28-03-2011 22:08:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (89, to_date('28-03-2011 22:10:06', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (90, to_date('28-03-2011 22:12:50', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (91, to_date('31-03-2011 22:54:26', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (92, to_date('31-03-2011 23:00:17', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (93, to_date('31-03-2011 23:12:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (94, to_date('31-03-2011 23:14:01', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (95, to_date('31-03-2011 23:19:32', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (96, to_date('31-03-2011 23:20:27', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (97, to_date('31-03-2011 23:43:44', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (98, to_date('31-03-2011 23:44:52', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (99, to_date('01-04-2011 21:38:27', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (100, to_date('01-04-2011 21:40:35', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (101, to_date('01-04-2011 21:46:11', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (102, to_date('01-04-2011 21:54:30', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
insert into IVS_SYSTEMLOG (ID, HAPPENTIME, SYSTEMTYPEID, SYSTEMTYPENAME, CONTENT, SYSUSERNAME, CLIENTUSERNAME, CLIENTUSERID)
values (103, to_date('01-04-2011 21:56:59', 'dd-mm-yyyy hh24:mi:ss'), 3, '�û��˳��ɹ�', '�û��˳��ɹ�', 'admin', 'admin', 1);
commit;
prompt 279 records loaded
prompt Loading IVS_SYSTEMPARAMETER...
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('TempPicPath                                                    ', 'string         ', 'd:\\TempPicPath                                                                                                                                                                                                                                               ');
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('CapPicPath                                                     ', 'string         ', 'd:\\CapturePicturePath                                                                                                                                                                                                                                        ');
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('FacePicPath                                                    ', 'string         ', 'd:\\FacePicPath                                                                                                                                                                                                                                               ');
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('TempPicPath                                                    ', 'string         ', 'd:\\TempPicPath                                                                                                                                                                                                                                               ');
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('CapPicPath                                                     ', 'string         ', 'd:\\CapturePicturePath                                                                                                                                                                                                                                        ');
insert into IVS_SYSTEMPARAMETER (NAME, TYPE, VALUE)
values ('FacePicPath                                                    ', 'string         ', 'd:\\FacePicPath                                                                                                                                                                                                                                               ');
commit;
prompt 6 records loaded
prompt Loading IVS_TASKINFO...
prompt Table is empty
prompt Loading IVS_TEMPPICTURE...
prompt Table is empty
prompt Loading IVS_TRACK...
insert into IVS_TRACK (ID, RECT)
values (1, 3);
insert into IVS_TRACK (ID, RECT)
values (2, 6);
commit;
prompt 2 records loaded
prompt Loading IVS_USERAUTHORITY...
insert into IVS_USERAUTHORITY (USERID, AUTHORITYID)
values (3, 1);
insert into IVS_USERAUTHORITY (USERID, AUTHORITYID)
values (25, 2);
insert into IVS_USERAUTHORITY (USERID, AUTHORITYID)
values (27, 3);
commit;
prompt 3 records loaded
prompt Loading IVS_USERGROUP...
insert into IVS_USERGROUP (ID, VIRTUALGROUPID, USERID)
values (1, 1, 1);
insert into IVS_USERGROUP (ID, VIRTUALGROUPID, USERID)
values (22, 1, 26);
insert into IVS_USERGROUP (ID, VIRTUALGROUPID, USERID)
values (21, 1, 25);
commit;
prompt 3 records loaded
prompt Loading IVS_USERINFO...
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (1, 'admin', '123456', to_date('21-07-2010 12:23:34', 'dd-mm-yyyy hh24:mi:ss'), 1, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (3, 'wanggx', '111111', to_date('26-07-2010 12:31:54', 'dd-mm-yyyy hh24:mi:ss'), 1, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (25, 'litaiyong', '123456', to_date('16-08-2010 20:23:42', 'dd-mm-yyyy hh24:mi:ss'), 2, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (26, 'zhangxue', '5555555', to_date('26-08-2010 11:09:44', 'dd-mm-yyyy hh24:mi:ss'), 2, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (27, 'lixxxxx', '1111111', to_date('26-08-2010 18:15:15', 'dd-mm-yyyy hh24:mi:ss'), 1, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (28, 'zhaoxxxx', '123456', to_date('26-08-2010 18:19:34', 'dd-mm-yyyy hh24:mi:ss'), 1, '����Ա');
insert into IVS_USERINFO (USERID, USERNAME, PASSWORD, CREATEDATETIME, USERTYPEID, USERTYPENAME)
values (30, 'wqaassss', 'wqaassss', to_date('05-06-2011 12:55:47', 'dd-mm-yyyy hh24:mi:ss'), 1, '����Ա');
commit;
prompt 7 records loaded
prompt Loading IVS_USERVEHMON...
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('3f4be57cd0594400bc8c729748554d0c', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '1', to_timestamp('01-07-2011 15:04:05.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('70f87c5de20d48118011ec548afc2e51', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '4', to_timestamp('29-06-2011 22:38:43.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('8349083c4f6d409680ab070d79975339', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '1', to_timestamp('01-07-2011 10:58:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('c14b9153df844cf89c7a21ac880c5677', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '1', to_timestamp('01-07-2011 11:00:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('181f289724834fc4bdcf11b3e85b69cd', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '1', to_timestamp('02-07-2011 09:59:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('14592ea471704a9b81c5b7f520091be6', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', 'ffff', to_timestamp('29-06-2011 22:19:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into IVS_USERVEHMON (USERVEHMONID, VEHMONID, USERID, TIME)
values ('c2c85805c76441b18052eee5131558d3', 'f0b5deea-3696-45be-9c8f-7970ca4cc1a6', '1', to_timestamp('01-07-2011 11:30:07.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 7 records loaded
prompt Loading IVS_VEHICLE...
insert into IVS_VEHICLE (VEHICLEID, PLATENUMBER, SPEED, STEMAGAINST, STOP, ACCIDENT, LINECHANGE, PLATECOLOR, VEHICLECOLOR, PICTUREID, RECTID, CONFIDENCE)
values (12, '��A111', 100, 0, 0, 0, 0, 'RRRGGGBBB', 'RRRGGGBBB', 1, 1, 1);
insert into IVS_VEHICLE (VEHICLEID, PLATENUMBER, SPEED, STEMAGAINST, STOP, ACCIDENT, LINECHANGE, PLATECOLOR, VEHICLECOLOR, PICTUREID, RECTID, CONFIDENCE)
values (13, '��A112', 100, 0, 0, 0, 0, 'RRRGGGBBB', 'RRRGGGBBB', 1, 4, 1);
commit;
prompt 2 records loaded
prompt Loading IVS_VIDEOINFO...
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (1, 42, to_date('01-05-2011 17:02:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:04:51', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\02.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (2, 42, to_date('01-05-2011 17:09:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\09.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (3, 42, to_date('01-05-2011 17:11:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:12:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\11.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (4, 42, to_date('01-05-2011 17:12:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:13:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\12.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (7, 42, to_date('01-05-2011 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:16:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\15.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (8, 42, to_date('01-05-2011 17:16:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:17:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\16.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (9, 42, to_date('01-05-2011 17:17:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:18:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\17.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (10, 42, to_date('01-05-2011 17:18:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:19:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\18.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (11, 42, to_date('01-05-2011 17:19:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:20:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\19.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (12, 42, to_date('01-05-2011 17:20:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\20.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (13, 42, to_date('01-05-2011 17:21:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:22:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\21.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (14, 42, to_date('01-05-2011 17:22:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:23:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\22.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (15, 42, to_date('01-05-2011 17:23:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:24:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\23.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (16, 42, to_date('01-05-2011 17:24:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:25:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\24.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (17, 42, to_date('16-04-2011 17:25:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:26:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\25.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (18, 42, to_date('01-05-2011 17:26:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:27:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\26.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (5, 42, to_date('01-05-2011 17:13:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:14:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\13.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (6, 42, to_date('01-05-2011 17:14:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\14.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (1, 42, to_date('01-05-2011 17:02:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:04:51', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\02.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (2, 42, to_date('01-05-2011 17:09:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:10:57', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\09.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (3, 42, to_date('01-05-2011 17:11:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:12:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\11.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (4, 42, to_date('01-05-2011 17:12:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:13:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\12.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (7, 42, to_date('01-05-2011 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:16:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\15.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (8, 42, to_date('01-05-2011 17:16:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:17:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\16.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (9, 42, to_date('01-05-2011 17:17:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:18:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\17.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (10, 42, to_date('01-05-2011 17:18:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:19:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\18.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (11, 42, to_date('01-05-2011 17:19:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:20:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\19.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (12, 42, to_date('01-05-2011 17:20:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\20.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (13, 42, to_date('01-05-2011 17:21:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:22:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\21.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (14, 42, to_date('01-05-2011 17:22:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:23:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\22.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (15, 42, to_date('01-05-2011 17:23:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:24:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\23.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (16, 42, to_date('01-05-2011 17:24:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:25:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\24.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (17, 42, to_date('16-04-2011 17:25:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:26:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\25.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (18, 42, to_date('01-05-2011 17:26:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:27:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\26.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (5, 42, to_date('01-05-2011 17:13:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:14:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\13.264');
insert into IVS_VIDEOINFO (ID, CAMERAID, CAPTURETIMEBEGIN, CAPTURETIMEEND, FILEPATH)
values (6, 42, to_date('01-05-2011 17:14:07', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-05-2011 17:15:07', 'dd-mm-yyyy hh24:mi:ss'), 'd:\VideoOutput\42\2011\05\01\17\14.264');
commit;
prompt 36 records loaded
prompt Loading IVS_VIRTUALGROUP...
insert into IVS_VIRTUALGROUP (ID, NAME)
values (1, 'Group One');
commit;
prompt 1 records loaded
prompt Loading IVS_WINDOWCAMERAINFO...
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (1, 0, 0, 36);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (2, 0, 1, 54);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (4, 0, 2, 42);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (5, 0, 3, 4);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (6, 0, 4, 5);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (7, 1, 0, 36);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (8, 1, 1, 5);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (9, 1, 2, 36);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (10, 1, 3, 9);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (11, 1, 4, 10);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (12, 2, 0, 36);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (13, 2, 1, 54);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (14, 2, 2, 43);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (15, 2, 3, 55);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (16, 2, 4, 15);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (17, 3, 0, 45);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (18, 3, 1, 43);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (19, 3, 2, 18);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (20, 3, 3, 19);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (22, 3, 4, 20);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (23, 4, 0, 21);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (24, 4, 1, 22);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (25, 4, 2, 23);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (26, 4, 3, 24);
insert into IVS_WINDOWCAMERAINFO (ID, ROW_, COL, CAMERA)
values (27, 4, 4, 25);
commit;
prompt 25 records loaded
prompt Loading TEST...
prompt Table is empty
prompt Loading TOC_DAY...
insert into TOC_DAY (DAY)
values (1);
insert into TOC_DAY (DAY)
values (2);
insert into TOC_DAY (DAY)
values (3);
insert into TOC_DAY (DAY)
values (4);
insert into TOC_DAY (DAY)
values (5);
insert into TOC_DAY (DAY)
values (6);
insert into TOC_DAY (DAY)
values (7);
insert into TOC_DAY (DAY)
values (8);
insert into TOC_DAY (DAY)
values (9);
insert into TOC_DAY (DAY)
values (10);
insert into TOC_DAY (DAY)
values (11);
insert into TOC_DAY (DAY)
values (12);
insert into TOC_DAY (DAY)
values (13);
insert into TOC_DAY (DAY)
values (14);
insert into TOC_DAY (DAY)
values (15);
insert into TOC_DAY (DAY)
values (16);
insert into TOC_DAY (DAY)
values (7);
insert into TOC_DAY (DAY)
values (18);
insert into TOC_DAY (DAY)
values (19);
insert into TOC_DAY (DAY)
values (20);
insert into TOC_DAY (DAY)
values (21);
insert into TOC_DAY (DAY)
values (22);
insert into TOC_DAY (DAY)
values (23);
insert into TOC_DAY (DAY)
values (24);
insert into TOC_DAY (DAY)
values (25);
insert into TOC_DAY (DAY)
values (26);
insert into TOC_DAY (DAY)
values (27);
insert into TOC_DAY (DAY)
values (28);
insert into TOC_DAY (DAY)
values (29);
insert into TOC_DAY (DAY)
values (30);
insert into TOC_DAY (DAY)
values (31);
insert into TOC_DAY (DAY)
values (1);
insert into TOC_DAY (DAY)
values (2);
insert into TOC_DAY (DAY)
values (3);
insert into TOC_DAY (DAY)
values (4);
insert into TOC_DAY (DAY)
values (5);
insert into TOC_DAY (DAY)
values (6);
insert into TOC_DAY (DAY)
values (7);
insert into TOC_DAY (DAY)
values (8);
insert into TOC_DAY (DAY)
values (9);
insert into TOC_DAY (DAY)
values (10);
insert into TOC_DAY (DAY)
values (11);
insert into TOC_DAY (DAY)
values (12);
insert into TOC_DAY (DAY)
values (13);
insert into TOC_DAY (DAY)
values (14);
insert into TOC_DAY (DAY)
values (15);
insert into TOC_DAY (DAY)
values (16);
insert into TOC_DAY (DAY)
values (7);
insert into TOC_DAY (DAY)
values (18);
insert into TOC_DAY (DAY)
values (19);
insert into TOC_DAY (DAY)
values (20);
insert into TOC_DAY (DAY)
values (21);
insert into TOC_DAY (DAY)
values (22);
insert into TOC_DAY (DAY)
values (23);
insert into TOC_DAY (DAY)
values (24);
insert into TOC_DAY (DAY)
values (25);
insert into TOC_DAY (DAY)
values (26);
insert into TOC_DAY (DAY)
values (27);
insert into TOC_DAY (DAY)
values (28);
insert into TOC_DAY (DAY)
values (29);
insert into TOC_DAY (DAY)
values (30);
insert into TOC_DAY (DAY)
values (31);
commit;
prompt 62 records loaded
prompt Loading TOC_HOUR...
insert into TOC_HOUR (HOUR)
values ('00');
insert into TOC_HOUR (HOUR)
values ('01');
insert into TOC_HOUR (HOUR)
values ('02');
insert into TOC_HOUR (HOUR)
values ('03');
insert into TOC_HOUR (HOUR)
values ('04');
insert into TOC_HOUR (HOUR)
values ('05');
insert into TOC_HOUR (HOUR)
values ('06');
insert into TOC_HOUR (HOUR)
values ('07');
insert into TOC_HOUR (HOUR)
values ('08');
insert into TOC_HOUR (HOUR)
values ('09');
insert into TOC_HOUR (HOUR)
values ('10');
insert into TOC_HOUR (HOUR)
values ('11');
insert into TOC_HOUR (HOUR)
values ('12');
insert into TOC_HOUR (HOUR)
values ('13');
insert into TOC_HOUR (HOUR)
values ('14');
insert into TOC_HOUR (HOUR)
values ('15');
insert into TOC_HOUR (HOUR)
values ('16');
insert into TOC_HOUR (HOUR)
values ('17');
insert into TOC_HOUR (HOUR)
values ('18');
insert into TOC_HOUR (HOUR)
values ('19');
insert into TOC_HOUR (HOUR)
values ('20');
insert into TOC_HOUR (HOUR)
values ('21');
insert into TOC_HOUR (HOUR)
values ('22');
insert into TOC_HOUR (HOUR)
values ('23');
insert into TOC_HOUR (HOUR)
values ('24');
insert into TOC_HOUR (HOUR)
values ('00');
insert into TOC_HOUR (HOUR)
values ('01');
insert into TOC_HOUR (HOUR)
values ('02');
insert into TOC_HOUR (HOUR)
values ('03');
insert into TOC_HOUR (HOUR)
values ('04');
insert into TOC_HOUR (HOUR)
values ('05');
insert into TOC_HOUR (HOUR)
values ('06');
insert into TOC_HOUR (HOUR)
values ('07');
insert into TOC_HOUR (HOUR)
values ('08');
insert into TOC_HOUR (HOUR)
values ('09');
insert into TOC_HOUR (HOUR)
values ('10');
insert into TOC_HOUR (HOUR)
values ('11');
insert into TOC_HOUR (HOUR)
values ('12');
insert into TOC_HOUR (HOUR)
values ('13');
insert into TOC_HOUR (HOUR)
values ('14');
insert into TOC_HOUR (HOUR)
values ('15');
insert into TOC_HOUR (HOUR)
values ('16');
insert into TOC_HOUR (HOUR)
values ('17');
insert into TOC_HOUR (HOUR)
values ('18');
insert into TOC_HOUR (HOUR)
values ('19');
insert into TOC_HOUR (HOUR)
values ('20');
insert into TOC_HOUR (HOUR)
values ('21');
insert into TOC_HOUR (HOUR)
values ('22');
insert into TOC_HOUR (HOUR)
values ('23');
insert into TOC_HOUR (HOUR)
values ('24');
commit;
prompt 50 records loaded
prompt Loading TOC_LPTCITY...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥO', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³O', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�Ĵ�', 26, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥP', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³P', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��P', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�Ĵ�', 27, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥQ', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³Q', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Q', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�Ĵ�', 28, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥR', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '������ʡ', 99, null, null, '��');
commit;
prompt 100 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³R', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��R', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�Ĵ�', 10, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥS', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³S', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��S', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�Ĵ�', 29, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥT', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³T', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��T', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�Ĵ�', 30, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥU', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³U', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
commit;
prompt 200 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��U', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�Ĵ�', 31, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥV', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�Ĵ�', 11, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥA', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³A', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��A', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�Ĵ�', 12, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥB', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³B', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��B', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�Ĵ�', 13, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥC', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
commit;
prompt 300 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³C', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��C', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�Ĵ�', 14, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥD', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³D', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��D', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�Ĵ�', 15, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥE', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³E', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��E', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�Ĵ�', 16, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥF', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³F', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����', 99, null, null, '��');
commit;
prompt 400 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��F', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�Ĵ�', 17, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥG', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³G', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��G', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�Ĵ�', 18, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥH', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³H', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��H', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�Ĵ�', 19, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥI', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³I', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
commit;
prompt 500 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��I', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�Ĵ�', 20, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥJ', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³J', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��J', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�Ĵ�', 21, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥK', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³K', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³V', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��V', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�Ĵ�', 32, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥW', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³W', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
commit;
prompt 600 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��W', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�Ĵ�', 33, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥX', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³X', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��X', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�Ĵ�', 34, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥY', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³Y', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Y', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�Ĵ�', 35, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥZ', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³Z', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��Z', '����ʡ', 99, null, null, '��');
commit;
prompt 700 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�Ĵ�', 1, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�����', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�Ϻ���', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '������', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�ӱ�ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥ', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '������ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³', 'ɽ��ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�½�ά���', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�㽭ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', 'ɽ��ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '���ɹ�', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�㶫ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '�ຣʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��', '����ʡ', 99, null, null, '0');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��K', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�Ĵ�', 22, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥL', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³L', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��L', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�Ĵ�', 23, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥM', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³M', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '�ຣʡ', 99, null, null, '��');
commit;
prompt 800 records committed...
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��M', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�Ĵ�', 24, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�Ϻ���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '������', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�ӱ�ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('ԥN', '����ʡ', 99, null, null, 'ԥ');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '������ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('³N', 'ɽ��ʡ', 99, null, null, '³');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�½�ά���', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�㽭ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', 'ɽ��ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '���ɹ�', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�㶫ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '�ຣʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��N', '����ʡ', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�Ĵ�', 25, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '����', 99, null, null, '��');
insert into TOC_LPTCITY (HPCSDM, HPCS, PX, ZTBJ, BZ, FHPCSDM)
values ('��O', '�����', 99, null, null, '��');
commit;
prompt 837 records loaded
prompt Loading TOC_LPTCITY2...
insert into TOC_LPTCITY2 (ZM, PX)
values ('A', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('B', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('C', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('D', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('E', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('F', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('G', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('H', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('I', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('J', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('K', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('L', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('M', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('N', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('O', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('P', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Q', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('R', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('S', 1);
insert into TOC_LPTCITY2 (ZM, PX)
values ('T', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('U', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('V', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('W', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('X', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Y', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Z', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('A', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('B', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('C', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('D', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('E', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('F', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('G', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('H', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('I', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('J', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('K', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('L', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('M', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('N', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('O', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('P', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Q', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('R', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('S', 1);
insert into TOC_LPTCITY2 (ZM, PX)
values ('T', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('U', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('V', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('W', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('X', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Y', 99);
insert into TOC_LPTCITY2 (ZM, PX)
values ('Z', 99);
commit;
prompt 52 records loaded
prompt Loading TOC_LPTCOLOR...
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('0', '��ɫ', null, null, null);
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('1', '��ɫ', null, null, null);
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('2', '��ɫ', null, null, null);
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('3', '��ɫ', null, null, null);
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('4', '����', null, null, null);
insert into TOC_LPTCOLOR (HPYSDM, HPYS, PX, ZTBJ, BZ)
values ('Y', 'Yello', 2, 'd', 'xxxxx');
commit;
prompt 6 records loaded
prompt Loading TOC_LPTTYPE...
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('01', '������������', null, null, '�Ƶ׺���(��02ʽ���Ʋ���)');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('02', 'С����������', null, null, '���װ���(��02ʽ���Ʋ���)');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('03', 'ʹ����������', null, null, '�ڵװ��֡��조ʹ����');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('04', '�����������', null, null, '�ڵװ��֡��조�족��');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('05', '������������', null, null, '�ڵװ�/����');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('06', '�⼮��������', null, null, '�ڵװ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('07', '��������Ħ�г�����', null, null, '�Ƶ׺���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('08', '���Ħ�г�����', null, null, '���װ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('09', 'ʹ��Ħ�г�����', null, null, '�ڵװ��֡��조ʹ����');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('10', '���Ħ�г�����', null, null, '�ڵװ��֡��조�족��');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('11', '����Ħ�г�����', null, null, '�ڵװ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('12', '�⼮Ħ�г�����', null, null, '�ڵװ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('13', 'ũ�����䳵����', null, null, '�Ƶ׺��ֺڿ��ߣ��Ѱ�����·��ͨ��ȫ����ȡ��ũ�����䳵�����ٷ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('14', '����������', null, null, '�Ƶ׺���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('15', '�ҳ�����', null, null, '�Ƶ׺��ֺڿ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('16', '������������', null, null, '�Ƶ׺��ֺڿ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('17', '����Ħ�г�����', null, null, '�Ƶ׺��ֺڿ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('18', '������������', null, null, null);
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('19', '����Ħ�г�����', null, null, null);
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('20', '��ʱ�˾���������', null, null, '�׵׺��ֺڡ���ʱ�˾���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('21', '��ʱ�˾�Ħ�г�����', null, null, '�׵׺��ֺڡ���ʱ�˾���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('22', '��ʱ��ʻ������', null, null, '�׵׺��ֺڿ���');
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('23', '������������', null, null, null);
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('24', '����Ħ�к���', null, null, null);
insert into TOC_LPTTYPE (HPZLDM, HPMC, PX, ZTBJ, BZ)
values ('99', '��������', null, null, null);
commit;
prompt 25 records loaded
prompt Loading TOC_REGION...
insert into TOC_REGION (XZQHDM, XZQH, PX)
values ('1001', '1001', null);
insert into TOC_REGION (XZQHDM, XZQH, PX)
values ('1002', '1002', null);
commit;
prompt 2 records loaded
prompt Loading TOC_VEHCOLOR...
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('A ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('B ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('C ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('D ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('E ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('F ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('G ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('H ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('I ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('J ', '��', null, null, null);
insert into TOC_VEHCOLOR (CLYSDM, CLYS, PX, ZTBJ, BZ)
values ('Z ', '����', null, null, null);
commit;
prompt 11 records loaded
prompt Loading TOC_VEHSTATE...
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('A', '����', null, null, '�����¼��������');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('B', 'ת��', null, null, '�Ѳ��ڱ�Ͻ���ڵ�');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('C', '������', null, null, '��ע��ǼǵĻ�������������������ƭ��');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('D', 'ͣʻ', null, null, '�Ѱ���ͣʻ�Ǽǵ�');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('E', 'ע��', null, null, '���������ѱ�ע��������');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('G', 'Υ��δ����', null, null, '��Υ����Ϊ��δ���ܴ����');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('H', '���ؼ��', null, null, '���ں��ؼ�ܵĻ�������');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('I', '�¹�δ����', null, null, '���¹���δ���ܴ����');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('J', '���ɳ�', null, null, null);
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('K', '���', null, null, '����Ժ�����Ժ������ִ������������⣬��Ѻ��');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('L', '�ݿ�', null, null, '��������Υ�����¹ʱ���ʱ������ͨ�����ſ�����');
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('M', 'ǿ��ע��', null, null, null);
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('N', '�¹�����', null, null, null);
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('O', '����', null, null, null);
insert into TOC_VEHSTATE (CLZTDM, CLZTMC, PX, ZTBJ, BZ)
values ('Z', '����', null, null, null);
commit;
prompt 15 records loaded
prompt Loading TOC_VEHTYPE...
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('101', 'С�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('102', '���ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('103', '����', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K11', '������ͨ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K12', '����˫��ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K13', '�������̿ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K14', '���ͽ½ӿͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K15', '����ԽҰ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K21', '������ͨ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K22', '����˫��ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K23', '�������̿ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K24', '���ͽ½ӿͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K25', '����ԽҰ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K31', 'С����ͨ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K32', 'С��ԽҰ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K33', '�γ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K41', '΢����ͨ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K42', '΢��ԽҰ�ͳ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('K43', '΢�ͽγ�', null, null, null);
insert into TOC_VEHTYPE (CLLXDM, CLLX, PX, ZTBJ, BZ)
values ('H11', '������ͨ����', null, null, null);
commit;
prompt 20 records loaded
prompt Loading TOG_CLPP...
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('001', 'һ������', 0, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('002', '����', 1, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('003', '����', 2, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('004', '����', 3, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('001', 'һ������', 0, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('002', '����', 1, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('003', '����', 2, null, null);
insert into TOG_CLPP (CLPPDM, CLPP, PX, ZTBJ, BZ)
values ('004', '����', 3, null, null);
commit;
prompt 8 records loaded
prompt Loading TOG_DEVBUG...
prompt Table is empty
prompt Loading TOG_DEVICE...
insert into TOG_DEVICE (TDID, SBBH, SBMC, KKMC, KKBH, FSBBH, SBLX, SBXH, GYS, QYSJ, AZWZ, SBIP, TXFWQBH, TXFWQIP, BZ, DKH, SPTDH, DLYH, DLMM)
values ('c81f0c05-db2c-4c8b-a1f5-024512a62362', '1111', '1111', '1000', '1000', '111', '1', null, '1', null, null, '192.168.1.6', null, null, null, '6002', '2', 'system', 'system');
insert into TOG_DEVICE (TDID, SBBH, SBMC, KKMC, KKBH, FSBBH, SBLX, SBXH, GYS, QYSJ, AZWZ, SBIP, TXFWQBH, TXFWQIP, BZ, DKH, SPTDH, DLYH, DLMM)
values ('0fa96493-71bd-4e95-a236-eaa5452cd130', '222', '2121', '1000', null, null, '0', '1221', '1', null, null, '192.168.1.16', null, null, null, '6002', null, 'system', 'system');
insert into TOG_DEVICE (TDID, SBBH, SBMC, KKMC, KKBH, FSBBH, SBLX, SBXH, GYS, QYSJ, AZWZ, SBIP, TXFWQBH, TXFWQIP, BZ, DKH, SPTDH, DLYH, DLMM)
values ('686d013c-97a6-40bb-88b4-43d14ceaef4c', '111', 'AAA', null, '1000', null, '2', '121', '1', null, null, '192.168.1.4', null, null, '111', '6002', null, 'aironix', 'aironix');
commit;
prompt 3 records loaded
prompt Loading TOG_FLOWTHD...
prompt Table is empty
prompt Loading TOG_OWNERVEH...
insert into TOG_OWNERVEH (OVID, SFZH, DABH, XZQH, ZSXXDZ, ZJCX, LJJF, JSZZT, CCLZRQ, LXDH, XB, CSRQ, GLBM)
values ('ccdef70e-cc68-a6c6-f0c4-a15795cc0a2f', '511224198111024568', '222', '������', '555511', 'd', '66', null, null, '1333333', '0', null, '����');
insert into TOG_OWNERVEH (OVID, SFZH, DABH, XZQH, ZSXXDZ, ZJCX, LJJF, JSZZT, CCLZRQ, LXDH, XB, CSRQ, GLBM)
values ('f9def70e-ff68-46b6-a0a4-d157951e0f2f', '511224198111047233', 'AAAA1', 'ͨ����', 'FFFF', null, '12', '22', null, null, '1', null, '������');
insert into TOG_OWNERVEH (OVID, SFZH, DABH, XZQH, ZSXXDZ, ZJCX, LJJF, JSZZT, CCLZRQ, LXDH, XB, CSRQ, GLBM)
values ('a9def70e-ff68-a6b6-f0a4-a157951e0a2f', '511224198111007255', '1111', '��ţ��', null, null, null, null, null, null, '1', null, '�ɶ���');
commit;
prompt 3 records loaded
prompt Loading TOG_PUBINFO...
prompt Table is empty
prompt Loading TOG_RECDEVGROUP...
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('115', '1111');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '222');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '2222');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '1111');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('115', '222');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('115', '1111');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '222');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '2222');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('111', '1111');
insert into TOG_RECDEVGROUP (GROUPID, TDID)
values ('115', '222');
commit;
prompt 10 records loaded
prompt Loading TOG_RECIP...
prompt Table is empty
prompt Loading TOG_RECUSERGROUP...
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('112', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', 'admin');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', 'admin');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('112', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', 'admin');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('114', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', 'test');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', 'admin');
insert into TOG_RECUSERGROUP (GROUPID, USERID)
values ('113', null);
commit;
prompt 20 records loaded
prompt Loading TOG_TOGDISTANCE...
prompt Table is empty
prompt Loading TOG_TOLLGATE...
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('20edb09f-e4da-412a-981c-f12c076edcc0', '1000', '100001', '���', null, '200', 'org', '1', 40, 2, null, 'ddd', null, '����·', null, null, null, null, null, null, null, null);
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('4717e21e-fbc9-4365-a855-ad9e4dbf5e71', 'moniroot', '1000', '����·��', null, '200', 'org', '1', 40, 4, null, null, null, '���·', null, null, null, '107.229', 31.307, '���ԡ�����', null, '1001');
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('4dd31fd8-6ba4-4d97-ad5d-795783c9f85e', '100000', '10000001', '1����', null, '200', 'org', '1', 40, null, null, '����', null, '�Ƽ�·', null, null, null, null, null, null, '1111', '1001');
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('5364d586-cefd-4dc9-8353-351d0e5a9e31', '100001', '10000102', '2����', null, '200', 'org', '1', 40, null, null, '���', null, '�Ͼ�·', null, null, null, null, null, null, '111', null);
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('81a5a6b8-1fc0-4b40-b9b8-1778d5061801', '100000', '10000002', '2����', null, '200', 'org', '1', 40, null, null, '����', null, '�ɶ�·', null, null, null, null, null, null, null, null);
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('8be4774b-6039-440b-b544-b8f240561015', '100001', '10000101', '1����', null, '200', 'org', '1', 40, null, null, '���', null, '����·', null, null, null, null, null, null, null, null);
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('b8773e16-fb3b-4e82-a619-65f3bcff2be4', null, 'moniroot', '��ص��복��', null, '200', null, '1', 40, null, null, null, null, '��ҵ��', null, null, null, null, null, null, null, null);
insert into TOG_TOLLGATE (TGID, KKFBH, KKBH, KKMC, KKJC, KKWZ, DWBH, KKLX, XDSD, CDS, SXJS, FX, DLBH, DLMC, DTBH, DTXZB, DTYZB, DTJD, DTWD, BZ, SXJBH, XZQH)
values ('c1050e0a-8b6e-4217-8a0d-1c37a4063635', '1000', '100000', '����', null, '200', 'org', '1', 40, 2, null, null, null, '����·', null, null, null, null, null, null, null, null);
commit;
prompt 8 records loaded
prompt Loading TOG_VEHACCOM...
prompt Table is empty
prompt Loading TOG_VEHBLACK...
prompt Table is empty
prompt Loading TOG_VEHDECK...
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b7', '5', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('05-10-2010 10:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��B54882', '0', '��ɫ', 2, null, null, null, null, null, 30, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', '002', null, null, '2', 'admin', null, null, 'ȷ�������Ƴ�������');
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b6', '3', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('04-10-2010 09:32:44', 'dd-mm-yyyy hh24:mi:ss'), '��B54886', '3', '��ɫ', 2, '20101004100301.jpg', '20101004100302.jpg', null, null, null, 30, null, null, null, null, 22, 'K31', 'K31', '02', 'С����������', null, null, null, '0', null, null, null, '2', 'admin', 'CA4453', null, '111111111');
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('422f65d5-b1e7-4b9c-8470-d396e06d9234', '2', '103', '��Ȫ��·��', null, '����', '3', '3����', to_date('03-10-2010 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), '��SB4588', '0', '��ɫ', 3, '20101003100101.jpg', '20101003100102.jpg', '20101003100103.jpg', null, null, 78, null, null, null, '01', null, 'K31', 'H11', '02', 'С����������', null, null, null, '0', null, null, null, '3', 'admin', '222', null, '�����Ƴ�11112222');
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b3', '4', '103', '��Ȫ��·��', null, '���', '2', '2����', to_date('05-10-2010 11:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��B54881', '3', '��ɫ', 2, '20101005100301.jpg', '20101005100302.jpg', null, null, null, 85, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', '001', null, null, '2', '�����˺�', null, null, 'ȷ�������Ƴ�������');
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b8', '6', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('05-10-2010 11:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��A3693A', '3', '��ɫ', 2, '20101005100303.jpg', '20101005100303.jpg', null, null, null, 85, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', '002', null, null, '2', 'admin', null, null, 'ȷ�����Ƴ���');
insert into TOG_VEHDECK (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SFTPC, QRZH, QRJH, QRSJ, QRMS)
values ('f22f65d5-e1e7-4b9c-c470-d396e06d9234', '6', '101', '����·��·��', null, '����', '2', '2����', to_date('03-10-2010 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), '��SB4588', '0', '��ɫ', 3, '20101003100101.jpg', '20101003100102.jpg', '20101003100103.jpg', null, null, 78, null, null, null, '01', null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', 'org', null, null, '2', 'admin', null, null, '�����Ƴ���������������������');
commit;
prompt 6 records loaded
prompt Loading TOG_VEHDISP...
insert into TOG_VEHDISP (VDID, BKXXBH, HPHM, HPYSBH, HPYS, CLPP, CLWX, CSYS, CLLX, CLLXMC, HPZL, HPZLMC, BKDWBH, BKR, BKDWDH, BKXZ, BLXB, BKSK, BKFKSK, BKJZQ, AJMS, YADM, BJHZH, SFJSXX, SFZDBJ, SHZT, SHR, SHSK, SHSM, CKDWBH, CKR, CKSK, CKSM, CKDWDH, CKSHZT, CKSHDWBH, CKSHR, CKSHSK, CKSHSM, BZ)
values ('56ca7c25-3c6a-465b-845b-3b563319c5e6', null, '��A88888', null, null, null, null, null, null, null, null, '02', 'org', 'admin', null, null, null, to_date('16-03-2011 23:16:57', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, null, '1', 'admin', to_date('16-03-2011 23:17:30', 'dd-mm-yyyy hh24:mi:ss'), null, null, null, null, null, null, '0', null, null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading TOG_VEHDISPALARM...
insert into TOG_VEHDISPALARM (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, SBZT, DWBH, DWMC, BZ, BJXXBH, BKXXBH, BJSJ, BJLX, BJJB, QRBS, QRZT, QRXXLR, JSR, JSFZ, CHULILX, CLBS, CLR, CLJG, SFSGBJ, TJRQ)
values ('08321107-3530-48ba-9f2c-4b84d9271b05', '110', '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-11-2010 10:44:06', 'dd-mm-yyyy hh24:mi:ss'), '��A88888', null, null, null, '010000011-20101106104406-142-EV5452-1.jpg', null, null, null, null, 15, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', null, to_date('16-03-2011 23:25:12', 'dd-mm-yyyy hh24:mi:ss'), '0', null, '0', '1', null, null, null, null, null, null, null, null, 20101106);
insert into TOG_VEHDISPALARM (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, SBZT, DWBH, DWMC, BZ, BJXXBH, BKXXBH, BJSJ, BJLX, BJJB, QRBS, QRZT, QRXXLR, JSR, JSFZ, CHULILX, CLBS, CLR, CLJG, SFSGBJ, TJRQ)
values ('08321107-3530-48ba-9f2c-4b84d9271b04', '110', '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-11-2010 10:44:06', 'dd-mm-yyyy hh24:mi:ss'), '��A88888', null, null, null, '010000011-20101106104406-142-EV5452-1.jpg', null, null, null, null, 15, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', null, to_date('16-03-2011 23:25:12', 'dd-mm-yyyy hh24:mi:ss'), '0', null, '0', '2', null, null, null, null, null, null, null, null, 20101106);
commit;
prompt 2 records loaded
prompt Loading TOG_VEHICLE...
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('c92ef70e-7f68-46b6-a0a4-d157951e0f2a', '02', '��A3693A', '����', '3333', 'A800', 'CCC458811', 'BB4523-DD45-4323', 'K31', '1', '511224198111047233', '���֤', '����', '������', '�廪��ѧ', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�����н�ͨ��', null, null);
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('a92e370e-7f68-46b6-a0a4-d157951e0f2a', '02', '��AS2408', '�ִ�', null, '��Ծ1', 'ABS4588', 'AK4523-2345-4323', 'K31', '1', '511224198111007255', '���֤', '����', '�ɶ���', '���Ͻ���', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�ɶ��н�ͨ��', null, null);
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('a92e370f-7f68-d6c6-a0a4-d157951e0f2a', '02', '��B54882', '����QQ', null, 'A580', 'ABS4588', 'AK4523-2345-4323', 'K31', '1', '511224198111007255', '���֤', '����', '�ɶ���', '���Ͻ���', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�ɶ��н�ͨ��', null, null);
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('a9fef70e-ff6e-46b6-a0a4-e157951e0f2a', '02', '��A5V816', '����', '66611', 'A80011', 'CCC4588', 'HH4523-DD45-4323', 'K31', '1', '511224198111024568', '���֤', '����222', '������', '�廪��ѧ', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�����н�ͨ��', null, null);
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('d9fef70e-ff6e-46b6-dda4-e157951e0f2a', '01', '��B54779', '����', null, 'A800', 'CCC4588', 'DD4523-DD45-4323', 'K11', '1', '511224198111047233', '���֤', '����', '������', '�廪��ѧ', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�����н�ͨ��', null, null);
insert into TOG_VEHICLE (VEHID, HPZL, HPHM, ZWPP, YWPP, CLXH, CSSBH, FDJH, CLLX, CSYS, SFZMHM, SFZMMC, JDCSYR, ZSXZQH, ZSXZDZ, YZBM, LXDH, DJRQ, YXQZ, SQBFRQ, FZJG, CLZT, BZQZT)
values ('c92e370f-7f68-d6c6-a0a4-d157951c0f2c', '02', '��B54886', '����QQ', null, 'A580', 'ABS4588', 'AK4523-2345-4323', 'K31', '1', '511224198111007255', '���֤', '����', '�ɶ���', '���Ͻ���', '610031', '13888888888', to_date('08-05-2010', 'dd-mm-yyyy'), to_date('08-06-2010', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), '�ɶ��н�ͨ��', null, null);
commit;
prompt 6 records loaded
prompt Loading TOG_VEHMANUAL...
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b3', '7', '103', '��Ȫ��·��', null, '���', '2', '2����', to_date('05-10-2010 11:35:33', 'dd-mm-yyyy hh24:mi:ss'), '��AS2408', '3', '��ɫ', 2, '20101005100302.jpg', '20101005100302.jpg', null, null, null, 85, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', '001', null, null, '02', '��AS2408', '0', 'K31', 'admin', to_date('28-10-2010 12:05:56', 'dd-mm-yyyy hh24:mi:ss'), '�Ѿ�ʶ���ˡ�����1111', null);
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b8', '6', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('05-10-2010 11:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��A3693A', '3', '��ɫ', 2, '20101005100303.jpg', '20101005100303.jpg', null, null, null, 85, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '0', '002', null, null, '02', null, '0', 'K31', 'admin', null, null, null);
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('422f65d5-b1e7-4b9c-8470-d396e06d9234', '2', '103', '��Ȫ��·��', null, '����', '3', '3����', to_date('03-10-2010 10:02:35', 'dd-mm-yyyy hh24:mi:ss'), '��A5V816', '0', '��ɫ', 3, '20101003100101.jpg', '20101003100101.jpg', '20101003100101.jpg', null, null, 78, null, null, null, '01', null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '1', '001', null, null, '02', '��A5V816', '0', 'K31', 'admin', to_date('11-11-2010 11:53:56', 'dd-mm-yyyy hh24:mi:ss'), '1111111111111111111', null);
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('f22f65d5-e1e7-4b9c-c470-d396e06d9234', '3', '101', '����·��·��', null, '����', '2', '2����', to_date('03-10-2010 10:04:35', 'dd-mm-yyyy hh24:mi:ss'), '��A5V816', '0', '��ɫ', 3, '20101003100101.jpg', '20101003100101.jpg', '20101003100101.jpg', null, null, 78, null, null, null, '01', null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '0', 'org', null, null, '02', null, '0', 'K31', null, null, null, '2');
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b7', '5', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('05-10-2010 10:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��B54882', '0', '��ɫ', 2, null, null, null, null, null, 30, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '0', '002', null, null, '02', '��B54882', '0', 'K31', 'admin', to_date('01-11-2010 11:42:13', 'dd-mm-yyyy hh24:mi:ss'), '�¸¸�', '1');
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b6', '4', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('04-10-2010 09:32:44', 'dd-mm-yyyy hh24:mi:ss'), '��A3693A', '3', '��ɫ', 2, '20101004100303.jpg', '20101004100303.jpg', null, null, null, 30, null, null, null, null, null, 'K31', 'С�ͳ���ͨ�ͳ�', '02', 'С����������', null, null, null, '0', '002', null, null, '02', null, '0', 'K31', 'admin', null, null, '2');
insert into TOG_VEHMANUAL (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, SBHPZL, SBHPHM, SBHPYS, SBCLLX, SBR, SBSJ, SBSM, WSBLX)
values ('fe7790be-89d7-4f41-a146-5ce32d37d2b5', '1', '102', 'ʮ��·��', null, '���', '2', '2����', to_date('02-10-2010 09:32:33', 'dd-mm-yyyy hh24:mi:ss'), '��B54779', '3', '��ɫ', 2, null, null, null, null, null, 66, null, null, null, null, null, 'K11', '���ͳ���ͨ�ͳ�', '01', '������������', null, null, null, '1', '002', null, null, null, null, null, null, null, null, '�Ѿ�ʶ��', '2');
commit;
prompt 7 records loaded
prompt Loading TOG_VEHMON...
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('5055F647A8C64F878BBE72530F556817', 641, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:23', 'dd-mm-yyyy hh24:mi:ss'), '��JC1235', '2', '��ɫ', null, '010000111-20110506164523-260-��JC1235-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('1213055629B14774957CE5FA403B48C3', 642, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:23', 'dd-mm-yyyy hh24:mi:ss'), '��OQ0288', '2', '��ɫ', null, '010000111-20110506164523-971-��OQ0288-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('999B7472F6844D85916541284C368C59', 643, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:24', 'dd-mm-yyyy hh24:mi:ss'), '��KHC295', '2', '��ɫ', null, '010000111-20110506164524-694-��KHC295-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('46A481E24D2D440D80A84342836E4D18', 644, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:25', 'dd-mm-yyyy hh24:mi:ss'), '��BSR886', '2', '��ɫ', null, '010000111-20110506164525-435-��BSR886-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('445FB79C38944CF89B12841FEA703233', 645, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:26', 'dd-mm-yyyy hh24:mi:ss'), '��FG2455', '2', '��ɫ', null, '010000111-20110506164526-147-��FG2455-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('CDA02277C283466D953BE94025B9D1C8', 646, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:26', 'dd-mm-yyyy hh24:mi:ss'), '��HC3819', '2', '��ɫ', null, '010000111-20110506164526-868-��HC3819-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('B8594EE5E78249D0BFC65D60016E363F', 647, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:27', 'dd-mm-yyyy hh24:mi:ss'), '��F19395', '2', '��ɫ', null, '010000111-20110506164527-643-��F19395-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('53F160AA8CEE4602A895E521C96C6581', 648, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:28', 'dd-mm-yyyy hh24:mi:ss'), '��K5H648', '2', '��ɫ', null, '010000111-20110506164528-384-��K5H648-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('5DDBE70742A841139A2D1C5D47B73344', 649, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:29', 'dd-mm-yyyy hh24:mi:ss'), '��EV6617', '2', '��ɫ', null, '010000111-20110506164529-095-��EV6617-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('0DD5628D9B084D44A55FE96FAE7A4335', 650, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:29', 'dd-mm-yyyy hh24:mi:ss'), '00000', '2', '��ɫ', null, '010000111-20110506164529-855-XXXXXXX-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '1', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('E519B3D04ADE4250AFFCA3E6D5DB6989', 651, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:30', 'dd-mm-yyyy hh24:mi:ss'), '��EP3901', '2', '��ɫ', null, '010000111-20110506164530-808-��EP3901-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('31DD9C8C1CC64A9C8292D25C2D41D08A', 652, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:31', 'dd-mm-yyyy hh24:mi:ss'), '��EW9540', '2', '��ɫ', null, '010000111-20110506164531-556-��EW9540-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('A501FBA17E4D4B6E94D523E3A2D40269', 653, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:32', 'dd-mm-yyyy hh24:mi:ss'), '��E81572', '2', '��ɫ', null, '010000111-20110506164532-268-��E81572-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('D11A732E140F428F946B8C566B4EDCCA', 654, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:32', 'dd-mm-yyyy hh24:mi:ss'), '��EN6616', '2', '��ɫ', null, '010000111-20110506164532-996-��EN6616-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('FB06695D9AFE4910A3C215F1CAD47B1A', 655, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:33', 'dd-mm-yyyy hh24:mi:ss'), '��G81721', '2', '��ɫ', null, '010000111-20110506164533-660-��G81721-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('540A78DCE51C4108A84400BE03693E8C', 656, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:34', 'dd-mm-yyyy hh24:mi:ss'), '��F50532', '2', '��ɫ', null, '010000111-20110506164534-324-��F50532-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('854B70499E174A9EA799E740B6A04AB8', 657, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:34', 'dd-mm-yyyy hh24:mi:ss'), '��EV1692', '2', '��ɫ', null, '010000111-20110506164534-997-��EV1692-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('59C8A2E8E3E44C789DDD3421B344E4F9', 658, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:35', 'dd-mm-yyyy hh24:mi:ss'), '��G99Z80', '2', '��ɫ', null, '010000111-20110506164535-665-��G99Z80-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('9CDD3B39D94D459EA65EC2917C987247', 659, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:36', 'dd-mm-yyyy hh24:mi:ss'), '��G50166', '2', '��ɫ', null, '010000111-20110506164536-324-��G50166-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('1DD85FD3720E40478C403E950486BCF4', 660, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:36', 'dd-mm-yyyy hh24:mi:ss'), '��FU0132', '2', '��ɫ', null, '010000111-20110506164536-988-��FU0132-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('B20164AB5C574040AA423D981B9CAAF1', 661, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:37', 'dd-mm-yyyy hh24:mi:ss'), '00000', '2', '��ɫ', null, '010000111-20110506164537-665-XXXXXXX-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '1', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('EFFC6BFE6C704C24A42C0ACDD1D593E3', 662, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:38', 'dd-mm-yyyy hh24:mi:ss'), '��EV0636', '2', '��ɫ', null, '010000111-20110506164538-648-��EV0636-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('C54324C695EE4698A78BF0A1599B6E94', 663, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:39', 'dd-mm-yyyy hh24:mi:ss'), '��HC3880', '2', '��ɫ', null, '010000111-20110506164539-317-��HC3880-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('60D0C55FB81941B5B94CF307A5BF5E20', 664, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:40', 'dd-mm-yyyy hh24:mi:ss'), '��ES9645', '2', '��ɫ', null, '010000111-20110506164540-025-��ES9645-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('DD05D67D63204202AFF73A52438F077C', 665, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:40', 'dd-mm-yyyy hh24:mi:ss'), '00000', '2', '��ɫ', null, '010000111-20110506164540-685-XXXXXXX-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '1', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('85806C69924B445EA849DDEC8361D8F4', 666, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:41', 'dd-mm-yyyy hh24:mi:ss'), '��EM3303', '2', '��ɫ', null, '010000111-20110506164541-553-��EM3303-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('1F4BBF39A2AF4B4B8A37167134DEA9D5', 667, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:42', 'dd-mm-yyyy hh24:mi:ss'), '��BX9967', '2', '��ɫ', null, '010000111-20110506164542-277-��BX9967-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('C48558626A9640B48EFEF1F4AE39299F', 668, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:42', 'dd-mm-yyyy hh24:mi:ss'), '��A883F9', '2', '��ɫ', null, '010000111-20110506164542-957-��A883F9-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('F6B9FC14256A4C5C82B24F05EE9DED6A', 669, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:43', 'dd-mm-yyyy hh24:mi:ss'), '��A239C3', '2', '��ɫ', null, '010000111-20110506164543-621-��A239C3-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('F512826631C848CC9A22C3AD678A620B', 670, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:44', 'dd-mm-yyyy hh24:mi:ss'), '��EP3646', '2', '��ɫ', null, '010000111-20110506164544-434-��EP3646-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('7E709F41D39D49C581DF72A8C8B44456', 671, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:45', 'dd-mm-yyyy hh24:mi:ss'), '��EV3607', '2', '��ɫ', null, '010000111-20110506164545-170-��EV3607-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('DF310A0D92B74D6D9A5DC5BA1851418B', 672, '1000', '����·��', '100000', '����', '10000001', '1����', to_date('06-05-2011 16:45:45', 'dd-mm-yyyy hh24:mi:ss'), '��E19033', '2', '��ɫ', null, '010000111-20110506164545-866-��E19033-1.jpg', null, null, null, null, 0, null, null, null, 'Z', null, '103', '����', null, null, null, null, null, '2', null, null, null, null, null, '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('88ccf4c4001e402591c3b4f8e62703fc', 0, '0', null, null, null, '0', '�Ͼ�·', null, '��K', '0', null, 0, 'd:\CapturePicture\2011-07-01\15-03\��K_1.jpg', 'd:\CapturePicture\2011-07-01\15-03\��K_2.jpg', 'd:\CapturePicture\2011-07-01\15-03\��K_3.jpg', null, null, null, null, null, null, null, null, '0', null, 'A', '������ͨ�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', '23wfsd', to_date('01-07-2011 15:04:19', 'dd-mm-yyyy hh24:mi:ss'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('f0b5deea-3696-45be-9c8f-7970ca4cc1a6', 0, '0', null, null, null, '100000', 'dd', null, '��K', '0', null, 0, null, null, null, null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'dddd', to_date('04-06-2011', 'dd-mm-yyyy'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('910520074024457a90fd6a077515e17d', 0, '0', null, null, null, '0', '�Ƽ�·', null, '��K', '0', null, 0, null, null, null, null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('04-06-2011', 'dd-mm-yyyy'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('4d491063ca844bfda2d97dff58ccfa84', 0, '0', null, null, null, '0', '�Ͼ�·', null, '��K', '0', null, 0, 'd:\CapturePicture\2011-07-01\10-54\��K_1.jpg', 'd:\CapturePicture\2011-07-01\10-54\��K_2.jpg', 'd:\CapturePicture\2011-07-01\10-54\��K_3.jpg', null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('01-07-2011 10:54:55', 'dd-mm-yyyy hh24:mi:ss'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('79b79e5eefb64f7180af82043363f1e4', 0, '0', null, null, null, '0', '�Ͼ�·', null, '��K', '0', null, 0, 'd:\CapturePicture\2011-07-01\10-54\��K_1.jpg', 'd:\CapturePicture\2011-07-01\10-54\��K_2.jpg', 'd:\CapturePicture\2011-07-01\10-54\��K_3.jpg', null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('01-07-2011 10:10:55', 'dd-mm-yyyy hh24:mi:ss'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('610b5312f9974f8192000fce136d403d', 0, '0', null, null, null, '0', '�Ƽ�·', null, '��K2d332213', '0', null, 0, 'd:\CapturePicture\2011-07-02\09-58\��K2d332213_1.jpg', 'd:\CapturePicture\2011-07-02\09-58\��K2d332213_2.jpg', 'd:\CapturePicture\2011-07-02\09-58\��K2d332213_3.jpg', null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('02-07-2011 09:58:21', 'dd-mm-yyyy hh24:mi:ss'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('006ccd369ec64546b687ce3c32ab9468', 0, '0', null, null, null, '0', '�Ƽ�·', null, '��K', '0', null, 0, null, null, null, null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('04-06-2011', 'dd-mm-yyyy'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('ac5927a6c9634559890a9530ad47e849', 0, '0', null, null, null, '0', '�Ƽ�·', null, '��K', '0', null, 0, null, null, null, null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('04-06-2011', 'dd-mm-yyyy'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('88773000d450407096b0d01d8b4620b5', 0, '0', null, null, null, '0', '�Ͼ�·', null, '��K', '0', null, 0, 'd:\CapturePicture\2011-07-01\11-27\��K_1.jpg', 'd:\CapturePicture\2011-07-01\11-27\��K_2.jpg', 'd:\CapturePicture\2011-07-01\11-27\��K_3.jpg', null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'F', to_date('01-07-2011 11:27:53', 'dd-mm-yyyy hh24:mi:ss'), 0, null, null, null, null, null, null, null);
insert into TOG_VEHMON (MVID, CLXXBH, KKBH, KKMC, FXBH, FXMC, CDBH, CDMC, JGSK, HPHM, HPYSBH, HPYS, TXSL, TXMC1, TXMC2, TXMC3, TXMC4, SPMC, CLSD, XSZT, CLPP, CLWX, CSYS, CLWKC, CLLX, CLLXMC, HPZL, HPZLMC, YLXXLX, YLXX, CLBJ, SBZT, DWBH, DWMC, BZ, XS, CSB, SFCS, SFNX, WZBJ, WZQRBJ, WZYY, HDSJ, TJRQ, WZWPYY, TPBZ, CZXM, CLCZY, CLSJ, SPMC1, SPMC2)
values ('03d4b98e-69f9-41e1-8723-8b6c2bb95dd4', 0, '0', null, null, null, '11111', 'hhhh', null, '��K', '0', null, 0, null, null, null, null, null, null, null, null, null, null, null, '0', null, 'A', 'С�ͳ�', null, null, null, null, '1001', '�����־�һ', null, null, null, null, null, null, '0', 'dddd', to_date('04-06-2011', 'dd-mm-yyyy'), 0, null, null, null, null, null, null, null);
commit;
prompt 42 records loaded
prompt Loading TOG_VEHWHITE...
prompt Table is empty
prompt Loading TTEST...
insert into TTEST (ID, TS)
values (1, to_timestamp('24-10-2003 10:48:45.656000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('24-10-2011 10:48:45.123000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (6, to_timestamp('05-06-2011 13:49:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('05-06-2011 13:49:48.381000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('05-06-2011 13:57:18.120000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('24-10-2003 10:48:45.656000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('24-10-2011 10:48:45.123000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (6, to_timestamp('05-06-2011 13:49:48.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('05-06-2011 13:49:48.381000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('05-06-2011 13:57:18.120000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TTEST (ID, TS)
values (1, to_timestamp('22-06-2011 22:52:59.409000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 11 records loaded
prompt Enabling triggers for AADMIN...
alter table AADMIN enable all triggers;
prompt Enabling triggers for AADMINGROUP...
alter table AADMINGROUP enable all triggers;
prompt Enabling triggers for AADMINORG...
alter table AADMINORG enable all triggers;
prompt Enabling triggers for AADMINROLE...
alter table AADMINROLE enable all triggers;
prompt Enabling triggers for ACCESSLOG...
alter table ACCESSLOG enable all triggers;
prompt Enabling triggers for ADEGREE...
alter table ADEGREE enable all triggers;
prompt Enabling triggers for AGROUP...
alter table AGROUP enable all triggers;
prompt Enabling triggers for AGROUPLEVEL...
alter table AGROUPLEVEL enable all triggers;
prompt Enabling triggers for AGROUPROLE...
alter table AGROUPROLE enable all triggers;
prompt Enabling triggers for AORG...
alter table AORG enable all triggers;
prompt Enabling triggers for AORGLEADER...
alter table AORGLEADER enable all triggers;
prompt Enabling triggers for AORGLEVEL...
alter table AORGLEVEL enable all triggers;
prompt Enabling triggers for AORGROLE...
alter table AORGROLE enable all triggers;
prompt Enabling triggers for AORGTYPE...
alter table AORGTYPE enable all triggers;
prompt Enabling triggers for APOST...
alter table APOST enable all triggers;
prompt Enabling triggers for AREPELLENTROLE...
alter table AREPELLENTROLE enable all triggers;
prompt Enabling triggers for AROLE...
alter table AROLE enable all triggers;
prompt Enabling triggers for AROLEPRIVILEGE...
alter table AROLEPRIVILEGE enable all triggers;
prompt Enabling triggers for AUSER...
alter table AUSER enable all triggers;
prompt Enabling triggers for AUSERGROUP...
alter table AUSERGROUP enable all triggers;
prompt Enabling triggers for AUSERROLE...
alter table AUSERROLE enable all triggers;
prompt Enabling triggers for AUSERTYPE...
alter table AUSERTYPE enable all triggers;
prompt Enabling triggers for AVAR...
alter table AVAR enable all triggers;
prompt Enabling triggers for BTOC_ADMINIDISTRICTS...
alter table BTOC_ADMINIDISTRICTS enable all triggers;
prompt Enabling triggers for BTOC_ALARMLEVEL...
alter table BTOC_ALARMLEVEL enable all triggers;
prompt Enabling triggers for BTOC_ALARMTYPE...
alter table BTOC_ALARMTYPE enable all triggers;
prompt Enabling triggers for BTOC_COLLAUTHORITY...
alter table BTOC_COLLAUTHORITY enable all triggers;
prompt Enabling triggers for BTOC_DEALTYPE...
alter table BTOC_DEALTYPE enable all triggers;
prompt Enabling triggers for BTOC_DEVICESUPPLIER...
alter table BTOC_DEVICESUPPLIER enable all triggers;
prompt Enabling triggers for BTOC_DEVICETYPE...
alter table BTOC_DEVICETYPE enable all triggers;
prompt Enabling triggers for BTOC_DISPCHARACTER...
alter table BTOC_DISPCHARACTER enable all triggers;
prompt Enabling triggers for BTOC_INFOTYPE...
alter table BTOC_INFOTYPE enable all triggers;
prompt Enabling triggers for BTOC_RECPROGRAMTYPE...
alter table BTOC_RECPROGRAMTYPE enable all triggers;
prompt Enabling triggers for BTOC_TOGATETYPE...
alter table BTOC_TOGATETYPE enable all triggers;
prompt Enabling triggers for BTOC_UNIDENTIFYTYPE...
alter table BTOC_UNIDENTIFYTYPE enable all triggers;
prompt Enabling triggers for BTOC_WZWPYY...
alter table BTOC_WZWPYY enable all triggers;
prompt Enabling triggers for BTOC_WZYY...
alter table BTOC_WZYY enable all triggers;
prompt Enabling triggers for CARMONITORS...
alter table CARMONITORS enable all triggers;
prompt Enabling triggers for CARNO_COLOR...
alter table CARNO_COLOR enable all triggers;
prompt Enabling triggers for CARNO_MONITORPOINTS...
alter table CARNO_MONITORPOINTS enable all triggers;
prompt Enabling triggers for CARNO_NUM...
alter table CARNO_NUM enable all triggers;
prompt Enabling triggers for CARNO_TYPE...
alter table CARNO_TYPE enable all triggers;
prompt Enabling triggers for CAR_INFO_MONITOR...
alter table CAR_INFO_MONITOR enable all triggers;
prompt Enabling triggers for CAR_INFO_OWNER...
alter table CAR_INFO_OWNER enable all triggers;
prompt Enabling triggers for CAR_INFO_TITLE...
alter table CAR_INFO_TITLE enable all triggers;
prompt Enabling triggers for CAR_TYPE...
alter table CAR_TYPE enable all triggers;
prompt Enabling triggers for DEMO_LEAVE...
alter table DEMO_LEAVE enable all triggers;
prompt Enabling triggers for ELP_CWZ...
alter table ELP_CWZ enable all triggers;
prompt Enabling triggers for ELP_PUN...
alter table ELP_PUN enable all triggers;
prompt Enabling triggers for FI_FLOW...
alter table FI_FLOW enable all triggers;
prompt Enabling triggers for FI_OWNER...
alter table FI_OWNER enable all triggers;
prompt Enabling triggers for FI_TASK...
alter table FI_TASK enable all triggers;
prompt Enabling triggers for FI_TASK_PREV...
alter table FI_TASK_PREV enable all triggers;
prompt Enabling triggers for FI_VAR...
alter table FI_VAR enable all triggers;
prompt Enabling triggers for IVS_ALARMCAMERAPAIR...
alter table IVS_ALARMCAMERAPAIR enable all triggers;
prompt Enabling triggers for IVS_ALARMICONINFO...
alter table IVS_ALARMICONINFO enable all triggers;
prompt Enabling triggers for IVS_ALARMINFO...
alter table IVS_ALARMINFO enable all triggers;
prompt Enabling triggers for IVS_AUTHORITYGROUP...
alter table IVS_AUTHORITYGROUP enable all triggers;
prompt Enabling triggers for IVS_CAMERAAUTHORITY...
alter table IVS_CAMERAAUTHORITY enable all triggers;
prompt Enabling triggers for IVS_CAMERAGROUP...
alter table IVS_CAMERAGROUP enable all triggers;
prompt Enabling triggers for IVS_CAMERAICONINFO...
alter table IVS_CAMERAICONINFO enable all triggers;
prompt Enabling triggers for IVS_CAMERAINFO...
alter table IVS_CAMERAINFO enable all triggers;
prompt Enabling triggers for IVS_CAPTUREPICTURE...
alter table IVS_CAPTUREPICTURE enable all triggers;
prompt Enabling triggers for IVS_DECODERINFO...
alter table IVS_DECODERINFO enable all triggers;
prompt Enabling triggers for IVS_DECODERCAMERA...
alter table IVS_DECODERCAMERA enable all triggers;
prompt Enabling triggers for IVS_DEFAULTCARDOUT...
alter table IVS_DEFAULTCARDOUT enable all triggers;
prompt Enabling triggers for IVS_DEVICEINFO...
alter table IVS_DEVICEINFO enable all triggers;
prompt Enabling triggers for IVS_DISPLAYCHANNELINFO...
alter table IVS_DISPLAYCHANNELINFO enable all triggers;
prompt Enabling triggers for IVS_EVENTINFO...
alter table IVS_EVENTINFO enable all triggers;
prompt Enabling triggers for IVS_OBJECTINFO...
alter table IVS_OBJECTINFO enable all triggers;
prompt Enabling triggers for IVS_EVENTRECTINFO...
alter table IVS_EVENTRECTINFO enable all triggers;
prompt Enabling triggers for IVS_RECT...
alter table IVS_RECT enable all triggers;
prompt Enabling triggers for IVS_FACE...
alter table IVS_FACE enable all triggers;
prompt Enabling triggers for IVS_GROUPINFO...
alter table IVS_GROUPINFO enable all triggers;
prompt Enabling triggers for IVS_GROUPSWITCHDETAIL...
alter table IVS_GROUPSWITCHDETAIL enable all triggers;
prompt Enabling triggers for IVS_GROUPSWITCHGROUP...
alter table IVS_GROUPSWITCHGROUP enable all triggers;
prompt Enabling triggers for IVS_MAPINFO...
alter table IVS_MAPINFO enable all triggers;
prompt Enabling triggers for IVS_OPERATELOG...
alter table IVS_OPERATELOG enable all triggers;
prompt Enabling triggers for IVS_PROGSWITCH...
alter table IVS_PROGSWITCH enable all triggers;
prompt Enabling triggers for IVS_PROGSWITCHDETAIL...
alter table IVS_PROGSWITCHDETAIL enable all triggers;
prompt Enabling triggers for IVS_RECOGNIZERINFO...
alter table IVS_RECOGNIZERINFO enable all triggers;
prompt Enabling triggers for IVS_RECOGNIZERCAMERA...
alter table IVS_RECOGNIZERCAMERA enable all triggers;
prompt Enabling triggers for IVS_SYNCAMERA...
alter table IVS_SYNCAMERA enable all triggers;
prompt Enabling triggers for IVS_SYNGROUP...
alter table IVS_SYNGROUP enable all triggers;
prompt Enabling triggers for IVS_SYSTEMLOG...
alter table IVS_SYSTEMLOG enable all triggers;
prompt Enabling triggers for IVS_SYSTEMPARAMETER...
alter table IVS_SYSTEMPARAMETER enable all triggers;
prompt Enabling triggers for IVS_TASKINFO...
alter table IVS_TASKINFO enable all triggers;
prompt Enabling triggers for IVS_TEMPPICTURE...
alter table IVS_TEMPPICTURE enable all triggers;
prompt Enabling triggers for IVS_TRACK...
alter table IVS_TRACK enable all triggers;
prompt Enabling triggers for IVS_USERAUTHORITY...
alter table IVS_USERAUTHORITY enable all triggers;
prompt Enabling triggers for IVS_USERGROUP...
alter table IVS_USERGROUP enable all triggers;
prompt Enabling triggers for IVS_USERINFO...
alter table IVS_USERINFO enable all triggers;
prompt Enabling triggers for IVS_USERVEHMON...
alter table IVS_USERVEHMON enable all triggers;
prompt Enabling triggers for IVS_VEHICLE...
alter table IVS_VEHICLE enable all triggers;
prompt Enabling triggers for IVS_VIDEOINFO...
alter table IVS_VIDEOINFO enable all triggers;
prompt Enabling triggers for IVS_VIRTUALGROUP...
alter table IVS_VIRTUALGROUP enable all triggers;
prompt Enabling triggers for IVS_WINDOWCAMERAINFO...
alter table IVS_WINDOWCAMERAINFO enable all triggers;
prompt Enabling triggers for TEST...
alter table TEST enable all triggers;
prompt Enabling triggers for TOC_DAY...
alter table TOC_DAY enable all triggers;
prompt Enabling triggers for TOC_HOUR...
alter table TOC_HOUR enable all triggers;
prompt Enabling triggers for TOC_LPTCITY...
alter table TOC_LPTCITY enable all triggers;
prompt Enabling triggers for TOC_LPTCITY2...
alter table TOC_LPTCITY2 enable all triggers;
prompt Enabling triggers for TOC_LPTCOLOR...
alter table TOC_LPTCOLOR enable all triggers;
prompt Enabling triggers for TOC_LPTTYPE...
alter table TOC_LPTTYPE enable all triggers;
prompt Enabling triggers for TOC_REGION...
alter table TOC_REGION enable all triggers;
prompt Enabling triggers for TOC_VEHCOLOR...
alter table TOC_VEHCOLOR enable all triggers;
prompt Enabling triggers for TOC_VEHSTATE...
alter table TOC_VEHSTATE enable all triggers;
prompt Enabling triggers for TOC_VEHTYPE...
alter table TOC_VEHTYPE enable all triggers;
prompt Enabling triggers for TOG_CLPP...
alter table TOG_CLPP enable all triggers;
prompt Enabling triggers for TOG_DEVBUG...
alter table TOG_DEVBUG enable all triggers;
prompt Enabling triggers for TOG_DEVICE...
alter table TOG_DEVICE enable all triggers;
prompt Enabling triggers for TOG_FLOWTHD...
alter table TOG_FLOWTHD enable all triggers;
prompt Enabling triggers for TOG_OWNERVEH...
alter table TOG_OWNERVEH enable all triggers;
prompt Enabling triggers for TOG_PUBINFO...
alter table TOG_PUBINFO enable all triggers;
prompt Enabling triggers for TOG_RECDEVGROUP...
alter table TOG_RECDEVGROUP enable all triggers;
prompt Enabling triggers for TOG_RECIP...
alter table TOG_RECIP enable all triggers;
prompt Enabling triggers for TOG_RECUSERGROUP...
alter table TOG_RECUSERGROUP enable all triggers;
prompt Enabling triggers for TOG_TOGDISTANCE...
alter table TOG_TOGDISTANCE enable all triggers;
prompt Enabling triggers for TOG_TOLLGATE...
alter table TOG_TOLLGATE enable all triggers;
prompt Enabling triggers for TOG_VEHACCOM...
alter table TOG_VEHACCOM enable all triggers;
prompt Enabling triggers for TOG_VEHBLACK...
alter table TOG_VEHBLACK enable all triggers;
prompt Enabling triggers for TOG_VEHDECK...
alter table TOG_VEHDECK enable all triggers;
prompt Enabling triggers for TOG_VEHDISP...
alter table TOG_VEHDISP enable all triggers;
prompt Enabling triggers for TOG_VEHDISPALARM...
alter table TOG_VEHDISPALARM enable all triggers;
prompt Enabling triggers for TOG_VEHICLE...
alter table TOG_VEHICLE enable all triggers;
prompt Enabling triggers for TOG_VEHMANUAL...
alter table TOG_VEHMANUAL enable all triggers;
prompt Enabling triggers for TOG_VEHMON...
alter table TOG_VEHMON enable all triggers;
prompt Enabling triggers for TOG_VEHWHITE...
alter table TOG_VEHWHITE enable all triggers;
prompt Enabling triggers for TTEST...
alter table TTEST enable all triggers;
set feedback on
set define on
prompt Done.
