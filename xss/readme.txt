温馨提醒：
设置中间件，将网站目录设置为www/xss/，即可直接通过localhost访问到登陆页面，而不是localhost/xss/。当然如果非要加上/xss/目录，则之后所有的操作路径前面，请都加上/xss/，不然容易出错。


1、修改config.php里面的数据库连接字段，包括用户名，密码，数据库名，访问URL起始和伪静态的设置。 

2、在web根目录下有一个xss.sql，导入数据库。

3、进入数据库执行语句修改域名为自己的。 
UPDATE oc_module SET 
code=REPLACE(code,'http://xsser.me','http://localhost');
同时替换authtest.php中的网址代码

4、建立.htaccess文件写入以下代码：

<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^([0-9a-zA-Z]{6})$ /index.php?do=code&urlKey=$1 [L] 
RewriteRule ^do/auth/(\w+?)(/domain/([\w\.]+?))?$  /index.php?do=do&auth=$1&domain=$3 [L] 
RewriteRule ^register/(.*?)$ /index.php?do=register&key=$1 [L] 
RewriteRule ^register-validate/(.*?)$ /index.php?do=register&act=validate&key=$1 [L]
</IfModule>

备注：注册成功用户后，修改管理员表中的adminlevel为1时 可定义自身为最高管理员可发送邀请码
