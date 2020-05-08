__建立帐号并设定权限__
```sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'ty777';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON `admin`.* TO 'admin'@'localhost'
DROP USER 'admin'@'localhost'
SHOW GRANTS for 'admin'@'localhost';
FLUSH PRIVILEGES;
```
