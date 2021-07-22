# Dormitory-Manage
JAVA-Web实现的学生宿舍管理系统

学生宿舍管理系统是一个基于http协议开发的一个web项目，旨在开发出一个方便管理员与学生使用的信息系统。

通过本系统可以实现管理员对学生信息的增删查改、对卫生信息的登记与查看、对综合宿舍信息的增删查改、对宿舍维修状况的整体把握与处理；同时学生也可使用本系统进行查看与修改个人信息、维修报修、查看卫生评比等操作。

本项目使用 Java 做为Servlet端语言，MySQL作为数据库，使用JSP技术实现动态网页的制作，以Tomcat 9.0作为服务器，页面之间通过重定向技术实现通信。HTTP协议是无连接的，我们使用Session来保持用户的登陆状态，在页面跳转时不丢失信息；对每一个页面分别建立一个Servlet进行表单处理；对所有数据库的实例对象建立一个Dao.Factory类，所有页面通过调用Dao.Factory来创建数据库的后台实例，通过实现Dao接口来进行数据库链接。

数据库使用Mysql，连接端口等可根据自己情况更改。建立数据库文件为 create.sql ，可自行更改数据类型。

E-R图如下
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927666/Dormitory/E-R_ulsrvb.png)

本系统实现功能较多，为方便查看，给出数据流图：
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927666/Dormitory/Data-Stream_bhyuap.png)

部分运行图如下：
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927665/Dormitory/login_sp4dku.png)
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927667/Dormitory/student_bn4nbb.png)
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927666/Dormitory/admin_eafa0l.png)
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927666/Dormitory/first_znn5i3.png)
![](https://res.cloudinary.com/xxxhlown/image/upload/v1626927667/Dormitory/second_tkoivm.png)
