1. `yum install mariadb-server -y`

2. `systemctl start mariadb`

3. `systemctl enable mariadb`

4. `mysql_secure_installation`

5. `mysqladmin -u root -p version`

6. `mysql -e "CREATE DATABASE kodekloud_db4"`

7. `mysql -e "GRANT ALL ON kodekloud_db4.* TO 'kodekloud_tim'@'%' IDENTIFIED BY 'B4zNgHA7Ya'"`