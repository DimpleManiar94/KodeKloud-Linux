Run DB server commands before App Server commands

1. `yum update -y && yum install httpd -y && yum install -y php php-mysqlnd`

2. `vi /etc/httpd/conf/httpd.conf` -> Change Port

3. `systemctl start httpd`

4. `curl localhost:3001`