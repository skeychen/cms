SET FOREIGN_KEY_CHECKS=0;

-- DROP TABLE IF EXISTS DS_CMS_PERMISSION;
-- DROP TABLE IF EXISTS DS_CMS_PAGE_EDIT;
-- DROP TABLE IF EXISTS DS_CMS_CATEGORY_EDIT;
-- DROP TABLE IF EXISTS DS_CMS_LOG;
-- DROP TABLE IF EXISTS DS_CMS_PAGE;
-- DROP TABLE IF EXISTS DS_CMS_CATEGORY;
-- DROP TABLE IF EXISTS DS_CMS_SITE;

CREATE TABLE IF NOT EXISTS DS_BASE_USER (
  ID                    BIGINT(16)    COMMENT '主键ID' NOT NULL,
  STATUS                INT(1)        COMMENT '状态(1启用,0禁用)' NOT NULL,
  OWN                   VARCHAR(256)  COMMENT '扩展用户身份标识',
  SSQY                  VARCHAR(64)   COMMENT '最长12位的区域编码-区域名称',
  NAME                  VARCHAR(30)   COMMENT '姓名',
  MOBILE                VARCHAR(30)   COMMENT '手机',
  ACCOUNT               VARCHAR(64)   COMMENT '自定义账号' NOT NULL,
  PASSWORD              VARCHAR(64)   COMMENT '密码',
  WORKCARD              VARCHAR(64)   COMMENT '工作证号',
  SEX                   INT(1)        COMMENT '性别(0未知,1男,2女)',
  AVATAR                VARCHAR(300)  COMMENT '头像',
  IDCARD                VARCHAR(18)   COMMENT '身份证号',
  EMAIL                 VARCHAR(300)  COMMENT '电子邮箱',
  PHONE                 VARCHAR(30)   COMMENT '电话',
  ORGPID                BIGINT(16)    COMMENT '单位ID',
  ORGID                 BIGINT(16)    COMMENT '部门ID',
  TYPE                  VARCHAR(300)  COMMENT '类型',
  TYPENAME              VARCHAR(300)  COMMENT '类型名称',
  EXALIAS               VARCHAR(300)  COMMENT '类型扩展标识',
  EXNAME                VARCHAR(300)  COMMENT '类型扩展名称',
  CREATETIME            VARCHAR(19)   COMMENT '创建时间',
  LASTTIME              BIGINT(16)    COMMENT '最后更新时间',
  EXDATA                VARCHAR(64)   COMMENT '扩展字段，如需要放大数据，自动修改为TEXT或CLOB字段',
  PRIMARY KEY (ID)
) COMMENT='系统用户';

CREATE VIEW IF NOT EXISTS DS_CMS_USER AS SELECT ID, ACCOUNT, NAME, OWN FROM DS_BASE_USER;

CREATE TABLE IF NOT EXISTS DS_CMS_SITE
(
   ID                   BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
   OWN                  VARCHAR(300) COMMENT '拥有者',
   NAME                 VARCHAR(300) COMMENT '站点名称',
   FOLDER               VARCHAR(300) COMMENT '目录名称',
   URL                  VARCHAR(300) COMMENT '链接',
   IMG                  VARCHAR(300) COMMENT '图片',
   ENABLELOG            INT(1) COMMENT '开启日志(0否,1是)',
   ENABLEMOBILE         INT(1) COMMENT '开启移动版(0否,1是)',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   PRIMARY KEY (ID)
) COMMENT '网站站点';
CREATE TABLE IF NOT EXISTS DS_CMS_CATEGORY
(
   ID                   BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
   PID                  BIGINT(18) COMMENT '父ID',
   SITEID               BIGINT(18) COMMENT '站点ID',
   SCOPE                INT COMMENT '类型(0列表,1单页,2外链)',
   STATUS               INT COMMENT '状态(-1删除,0新增,1修改,8已发)',
   NAME                 VARCHAR(300) COMMENT '栏目名称',
   SEQ                  INT COMMENT '排序',
   VIEWPAGESIZE         INT(5)       COMMENT '栏目页每页条数',
   VIEWSITE             VARCHAR(300) COMMENT '栏目模板',
   PAGEVIEWSITE         VARCHAR(300) COMMENT '内容模板',
   MVIEWSITE            VARCHAR(300) COMMENT '移动版栏目模板',
   MPAGEVIEWSITE        VARCHAR(300) COMMENT '移动版内容模板',
   URL                  VARCHAR(300) COMMENT '链接',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   RELEASETIME          VARCHAR(19)  COMMENT '发布时间',
   RELEASESOURCE        VARCHAR(300) COMMENT '来源',
   RELEASEUSER          VARCHAR(300) COMMENT '作者',
   IMG                  VARCHAR(300) COMMENT '图片',
   PTYPE                VARCHAR(30)  COMMENT '分类名称',
   PTYPEITEM            VARCHAR(999) COMMENT '分类选项',
   PNAME                VARCHAR(30)  COMMENT '时间名称',
   PFORMAT              VARCHAR(30)  COMMENT '时间格式',
   PMEMO                VARCHAR(300) COMMENT '特殊说明',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   JSONTABLE            TEXT COMMENT '数据结构',
   JSONDATA             TEXT COMMENT '数据集',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_CMS_CATEGORY_SITE FOREIGN KEY (SITEID)
      REFERENCES DS_CMS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_DS_CMS_CATEGORY FOREIGN KEY (PID)
      REFERENCES DS_CMS_CATEGORY (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '栏目';
CREATE TABLE IF NOT EXISTS DS_CMS_PAGE
(
   ID                   BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
   SITEID               BIGINT(18) COMMENT '站点ID',
   CATEGORYID           BIGINT(18) COMMENT '栏目ID',
   SCOPE                INT COMMENT '类型(1单页,2外链)',
   STATUS               INT COMMENT '状态(-1删除,0新增,1修改,8已发)',
   TITLE                VARCHAR(300) COMMENT '标题',
   URL                  VARCHAR(300) COMMENT '链接',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   RELEASETIME          VARCHAR(19) COMMENT '发布时间',
   RELEASESOURCE        VARCHAR(300) COMMENT '来源',
   RELEASEUSER          VARCHAR(300) COMMENT '作者',
   IMG                  VARCHAR(300) COMMENT '图片',
   IMGTOP               INT COMMENT '焦点图(0否,1是)',
   PAGETOP              INT COMMENT '首页推荐(0否,1是)',
   PTYPE                VARCHAR(30) COMMENT '分类',
   PBEGIN               BIGINT(14) COMMENT '开始时间',
   PEND                 BIGINT(14) COMMENT '结束时间',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   JSONDATA             TEXT COMMENT '数据集',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_CMS_PAGE_SITE FOREIGN KEY (SITEID)
      REFERENCES DS_CMS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '内容';
CREATE TABLE IF NOT EXISTS DS_CMS_LOG
(
   ID                   BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
   SITEID               BIGINT(18) COMMENT '站点ID',
   CATEGORYID           BIGINT(18) COMMENT '栏目ID',
   PAGEID               BIGINT(18) COMMENT '内容ID',
   EDITID               VARCHAR(64) COMMENT '采编员ID',
   EDITNAME             VARCHAR(300) COMMENT '采编员姓名',
   EDITTIME             VARCHAR(19) COMMENT '采编时间',
   AUDITID              VARCHAR(64) COMMENT '审核员ID',
   AUDITMSG             VARCHAR(300) COMMENT '审核意见',
   AUDITNAME            VARCHAR(300) COMMENT '审核员姓名',
   AUDITTIME            VARCHAR(19) COMMENT '审核时间',
   PUBLISHID            VARCHAR(64) COMMENT '发布员ID',
   PUBLISHNAME          VARCHAR(300) COMMENT '发布员姓名',
   PUBLISHTIME          VARCHAR(19) COMMENT '发布时间',
   STATUS               INT COMMENT '状态(-1删除,0新增,1修改,4撤销,8已发)',
   AUDITSTATUS          INT COMMENT '审核状态(0草稿,1未审核,2不通过,4通过)',
   TITLE                VARCHAR(300) COMMENT '标题(栏目:NAME,内容:TITLE)',
   SCOPE                INT COMMENT '类型(1单页,2外链)',
   URL                  VARCHAR(300) COMMENT '链接',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   RELEASETIME          VARCHAR(19) COMMENT '发布时间',
   RELEASESOURCE        VARCHAR(300) COMMENT '信息来源',
   RELEASEUSER          VARCHAR(300) COMMENT '作者',
   IMG                  VARCHAR(300) COMMENT '图片',
   IMGTOP               INT COMMENT '焦点图(0否,1是)',
   PAGETOP              INT COMMENT '首页推荐(0否,1是)',
   PTYPE                VARCHAR(30) COMMENT '分类',
   PBEGIN               BIGINT(14) COMMENT '开始时间',
   PEND                 BIGINT(14) COMMENT '结束时间',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   PRIMARY KEY (ID)
) COMMENT '网站日志';
CREATE TABLE IF NOT EXISTS DS_CMS_CATEGORY_EDIT
(
   ID                   BIGINT(18) NOT NULL COMMENT '主键',
   SITEID               BIGINT(18) COMMENT '站点ID',
   STATUS               INT COMMENT '状态(-1删除,0新增,1更新)',
   URL                  VARCHAR(300) COMMENT '外链URL',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   RELEASETIME          VARCHAR(19) COMMENT '发布时间',
   RELEASESOURCE        VARCHAR(300) COMMENT '来源',
   RELEASEUSER          VARCHAR(300) COMMENT '作者',
   IMG                  VARCHAR(300) COMMENT '图片',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   JSONDATA             TEXT COMMENT '数据集',
   EDITID               VARCHAR(64) COMMENT '编辑人员ID',
   EDITNAME             VARCHAR(30) COMMENT '编辑人员名称',
   EDITTIME             VARCHAR(19) COMMENT '编辑时间',
   AUDITSTATUS          INT COMMENT '状态(0草稿,1未审核,2不通过,4通过)',
   AUDITID              VARCHAR(64) COMMENT '审核人员ID',
   AUDITNAME            VARCHAR(30) COMMENT '审核人员名称',
   AUDITTIME            VARCHAR(19) COMMENT '审核时间',
   AUDITMSG             VARCHAR(300) COMMENT '审核意见',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_CMS_CATEGORY_EDIT_S FOREIGN KEY (SITEID)
      REFERENCES DS_CMS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_DS_CMS_CATEGORY_EDIT_C FOREIGN KEY (ID)
      REFERENCES DS_CMS_CATEGORY (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '审核栏目';
CREATE TABLE IF NOT EXISTS DS_CMS_PAGE_EDIT
(
   ID                   BIGINT(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
   SITEID               BIGINT(18) COMMENT '站点ID',
   CATEGORYID           BIGINT(18) COMMENT '栏目ID',
   SCOPE                INT COMMENT '类型(1单页,2外链)',
   STATUS               INT COMMENT '状态(-1删除,0新增,1更新)',
   TITLE                VARCHAR(300) COMMENT '标题',
   URL                  VARCHAR(300) COMMENT '链接',
   METAKEYWORDS         VARCHAR(300) COMMENT 'meta关键词',
   METADESCRIPTION      VARCHAR(300) COMMENT 'meta描述',
   SUMMARY              VARCHAR(300) COMMENT '摘要',
   RELEASETIME          VARCHAR(19) COMMENT '发布时间',
   RELEASESOURCE        VARCHAR(300) COMMENT '信息来源',
   RELEASEUSER          VARCHAR(300) COMMENT '作者',
   IMG                  VARCHAR(300) COMMENT '图片',
   IMGTOP               INT COMMENT '焦点图(0否,1是)',
   PAGETOP              INT COMMENT '首页推荐(0否,1是)',
   PTYPE                VARCHAR(30) COMMENT '分类',
   PBEGIN               BIGINT(14) COMMENT '开始时间',
   PEND                 BIGINT(14) COMMENT '结束时间',
   CONTENT              MEDIUMTEXT COMMENT '内容',
   JSONDATA             TEXT COMMENT '数据集',
   EDITID               VARCHAR(64) COMMENT '编辑人员ID',
   EDITNAME             VARCHAR(30) COMMENT '编辑人员名称',
   EDITTIME             VARCHAR(19) COMMENT '编辑时间',
   AUDITSTATUS          INT COMMENT '状态(0草稿,1未审核,2不通过,4通过)',
   AUDITID              VARCHAR(64) COMMENT '审核人员ID',
   AUDITNAME            VARCHAR(30) COMMENT '审核人员名称',
   AUDITTIME            VARCHAR(19) COMMENT '审核时间',
   AUDITMSG             VARCHAR(300) COMMENT '审核意见',
   PUSHKEY              VARCHAR(300) COMMENT '推送KEY',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_CMS_PAGE_EDIT_S FOREIGN KEY (SITEID)
      REFERENCES DS_CMS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_DS_CMS_PAGE_EDIT_C FOREIGN KEY (CATEGORYID)
      REFERENCES DS_CMS_CATEGORY (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '审核内容';
CREATE TABLE IF NOT EXISTS DS_CMS_PERMISSION
(
   ID                   BIGINT(18) NOT NULL COMMENT '主键',
   SITEID               BIGINT(18) COMMENT '站点ID',
   ACCOUNT              VARCHAR(300) COMMENT '用户账号',
   EDITOWN              VARCHAR(3000) COMMENT '可采编栏目（限个人）',
   EDITALL              VARCHAR(3000) COMMENT '可采编栏目',
   AUDIT                VARCHAR(3000) COMMENT '可审核栏目',
   PUBLISH              VARCHAR(3000) COMMENT '可发布栏目',
   PRIMARY KEY (ID),
   CONSTRAINT FK_DS_CMS_PERMISSION FOREIGN KEY (SITEID)
      REFERENCES DS_CMS_SITE (ID) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '网站权限';

CREATE TABLE IF NOT EXISTS DS_CMS_SPECIAL (
  ID bigint(18) NOT NULL COMMENT '主键',
  SITEID bigint(18) DEFAULT NULL COMMENT '站点ID',
  TITLE varchar(300) DEFAULT NULL COMMENT '标题',
  VIEWSITE varchar(300) DEFAULT NULL COMMENT '模板',
  MVIEWSITE varchar(300) DEFAULT NULL COMMENT '移动版模板',
  URL varchar(300) DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (ID)
) COMMENT='专题';
