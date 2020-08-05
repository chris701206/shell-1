有些VPS的交換空間比較小，可能2GB的內存只有1G的交換空間，對於個人網站，更適合調大交換空間。

目前紅帽官方推薦交換分區的大小適當與系統物理內存的大小保持線性比例關係，不過在小於2GB物理內存的系統中，交換分區大小應該設置為內存大小的一對。

如果，要添加一塊交換空間，可以這麼操作：
```
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
```
重開機就會還原，所以要寫在檔案內

```
vim /etc/fstab
```

加入一行
```
/var/swap.1 none swap sw 0 0
```

---
Nginx 開啟 Gzip壓縮

```
sudo vim /etc/nginx/nginx.conf
```
把 #注解拿掉
```
gzip on;
gzip_comp_level 6;
gzip_buffers 16 8k;
gzip_http_version 1.1;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript
```

記得重啟

測試指令
```
curl -H "Accept-Encoding: gzip" -I https://URL
```

安裝好 Laravel 需要設定 storage 的權限

```
chmod -R 0755 storage
```

這邊的擁有者要和 /etc/php-fpm.d/www.conf 的一致

```
user = nginx
group = nginx
```

這時需要用這指令
```
chown -R nginx:nginx storage
```
