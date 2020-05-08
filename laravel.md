__安装指令__  
composer create-project --prefer-dist laravel/laravel _专案名称_

__nginx设定檔参考__
```nginx
server {
    listen      7777;
    root /var/www/html/laravel/admin/public;
    index index.php index.html;
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_read_timeout 300;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}
```
