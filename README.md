# xss-me
为了方便快速搭建，把网上流传的改进版的xss.me用docker进行部署，再build dockerfile之前，请完成下列操作

1. 修改mysql.sh中的`UPDATE oc_module SET code=REPLACE(code,'http://xsser.me','http://localhost')`后面的域名替换为自己xss平台所使用的域名
2. 修改config.php中的 urlroot 为自己的域名
3. 修改authtest.php中的域名为自己的域名
4. 如果你看到了xss目录下的readme.txt，请忽略


做完上述准备工作后，就可以build镜像了(在存在dockerfile的目录下)

`docker build -t xss_me .`

然后运行一下

`docker run -d -p 8888:80 -p 3333:3306 --name xss xss_me`

但是现在我们还没有创建数据库等等，所以我写了个脚本，/app/mysq.sh，只要手动运行一下这个脚本，数据库就创建好了，一切都ok了
然后我们就可以直接注册用户使用了



备注：注册成功用户后，修改管理员表中的adminlevel为1时 可定义自身为最高管理员可发送邀请码（个人使用的话可以忽略）
