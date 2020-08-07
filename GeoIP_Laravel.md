composer require geoip2/geoip2:~2.0

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GeoIp2\Database\Reader;

class geoip extends Controller
{

    public function Query()
    {
        $reader = new Reader(app_path('/GeoIP/GeoLite2-City.mmdb'));
        echo $this->getCountry('42.118.49.183');
    }
    public function getCountry($ip)
    {
        $reader = new Reader(app_path('/GeoIP/GeoLite2-City.mmdb'));
        $record = $reader->city($ip);
        return $record->country->names['zh-CN']."/".$record->city->names['zh-CN'];
    }
}
```
