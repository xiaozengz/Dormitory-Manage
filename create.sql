DROP TABLE administrator;
DROP TABLE dormChange;
DROP TABLE dormitory;
DROP TABLE health;
DROP TABLE repairs;
DROP TABLE repairsman;
DROP TABLE linkrepairs;
DROP TABLE student;
use StudentSystem;
SHOW tables;
#用户基本信息
#用户名,密码,用户类型,姓名,联系方式
create table IF NOT EXISTS administrator(
  ad_username VARCHAR(30) PRIMARY KEY,
  ad_password VARCHAR(30),
  ad_usertype VARCHAR(30),
  ad_name VARCHAR(30),
  ad_phone VARCHAR(30),
  CONSTRAINT chk_usertype CHECK (ad_usertype in ('管理员', '学生'))
);
#宿舍基本信息
ALTER table
  StudentSystem.administrator
ADD
  UNIQUE (ad_username);
create table IF NOT EXISTS dormitory(
    do_id INT auto_increment PRIMARY KEY not null,
    do_section VARCHAR (10) not null,
    do_number INT not null,
    do_bed INT not null,
    do_emptybeds INT not null,
    do_type VARCHAR (30) not null,
    do_water VARCHAR (30) not null,
    do_elec VARCHAR (30) not null,
    do_remark VARCHAR (30),
    CHECK(do_bed + do_emptybeds = 6),
    CHECK(do_section like '%区%栋'),
    CHECK(do_type in ('普宿', '公寓'))
  );
create table IF NOT EXISTS health(
    #卫生检查ID
    he_id INT auto_increment PRIMARY KEY not null,
    #宿舍区栋
    do_section VARCHAR(30) not null,
    #宿舍号
    do_number INT not null,
    #检查人
    he_person VARCHAR(30) not null,
    #检查结果
    he_result VARCHAR(30) not null,
    #检查日期
    he_date VARCHAR(30) not null,
    #备注
    he_remark VARCHAR(30),
    CHECK(do_section like '%区%栋'),
    CHECK(he_date like '20%%-%%-%%')
  );
create table IF NOT EXISTS repairs(
    #报修Id
    re_id INT auto_increment PRIMARY KEY not null,
    #宿舍区栋
    do_section VARCHAR(30) not null,
    #宿舍号
    do_number INT not null,
    #报修项目
    re_item VARCHAR(30) not null,
    #报修日期
    re_date VARCHAR(30) not null,
    #报修原因
    re_reason VARCHAR(30) not null,
    #报修人
    re_name VARCHAR(30) not null,
    #联系方式
    re_phone VARCHAR(30) not null,
    #备注
    re_remark VARCHAR(30),
    CHECK(do_section like '%区%栋'),
    CHECK(re_date like '20%%-%%-%%')
  );
create table IF NOT EXISTS repairsman(
    #维修员ID
    rm_id INT auto_increment PRIMARY KEY not null,
    #姓名
    rm_name VARCHAR(30) not null,
    #维修员电话
    rm_phone VARCHAR(30) not null,
    #主修
    rm_major VARCHAR(30) not null
  );
create table IF NOT EXISTS linkrepairs(
    re_id INT auto_increment PRIMARY KEY not null,
    do_section VARCHAR(30) not null,
    do_number INT not null,
    re_item VARCHAR(30) not null,
    re_date VARCHAR(30) not null,
    re_reason VARCHAR(30) not null,
    re_name VARCHAR(30) not null,
    re_phone VARCHAR(30) not null,
    rm_name VARCHAR(30) not null,
    rm_phone VARCHAR(30) not null,
    re_remark VARCHAR(30),
    FOREIGN KEY link(re_id) REFERENCES repairs(re_id),
    CHECK(do_section like '%区%栋'),
    CHECK(re_date like '20%%-%%-%%')
  );
create table IF NOT EXISTS student(
    st_id INT PRIMARY KEY not null,
    st_name VARCHAR(30) not null,
    st_gender VARCHAR(30) not null,
    st_nativeplace VARCHAR(30) not null,
    st_birthday VARCHAR(30) not null,
    st_school VARCHAR(30) not null,
    st_major VARCHAR(30) not null,
    st_enrolltime VARCHAR(30) not null,
    st_length VARCHAR(30) not null,
    st_education VARCHAR(30) not null,
    st_phone VARCHAR(30) not null,
    st_remark VARCHAR(30),
    do_section VARCHAR(30) not null,
    do_number INT not null,
    CHECK(st_gender in ('男', '女')),
    CHECK(st_birthday like '20%%-%%-%%'),
    CHECK(st_enrolltime like '20%%-%%-%%'),
    CHECK(st_length in ('两年', '三年', '四年')),
    CHECK(st_education in ('本科在读', '研究生在读')),
    CHECK(do_section like '%区%栋')
  );
create table IF NOT EXISTS dormChange(
    dc_id INT auto_increment PRIMARY KEY not null,
    st_id VARCHAR(30) not null,
    do_section VARCHAR(30) not null,
    do_number INT not null,
    new_do_section VARCHAR(30) not null,
    new_do_number INT not null,
    CHECK(do_section like '%区%栋'),
    CHECK(new_do_section like '%区%栋')
  );
INSERT INTO
  administrator(
    ad_username,
    ad_password,
    ad_usertype,
    ad_name,
    ad_phone
  )
VALUES("admin1", "123456", "管理员", "张大爷", "1111111000") ;

INSERT INTO
  administrator(
    ad_username,
    ad_password,
    ad_usertype,
    ad_name,
    ad_phone
  )
VALUES("2018003311", "123456", "学生", "李四", "1122222") ;

INSERT INTO
  dormitory (
    do_id,
    do_section,
    do_number,
    do_bed,
    do_emptybeds,
    do_type,
    do_water,
    do_elec,
    do_remark
  )
VALUES(2, '二区三栋', 111, 2, 4, '普宿', 10, 10, null);

INSERT INTO student(st_id,st_name,st_gender,st_nativeplace,st_birthday,st_school,st_major,st_enrolltime,st_length,st_education,st_phone,st_remark,do_section,do_number)
VALUES (2018003333,"张三","男","北京市","2000-01-03","数学学院","统计","2018-09-16","四年","本科在读","22222222","好人","一区一栋",2);
INSERT INTO student(st_id,st_name,st_gender,st_nativeplace,st_birthday,st_school,st_major,st_enrolltime,st_length,st_education,st_phone,st_remark,do_section,do_number)
VALUES (2018003311,"李四","女","上海市","2000-05-13","信计学院","计算机","2018-09-16","四年","本科在读","11111322","好人","二区三栋",111);