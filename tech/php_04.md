# FuelPHP - bootstrap配下の環境設定ファイル 


### bootstrap.php

/fuelphp/fuel/app/bootstrap.php

```php
$fuel_env = Fuel::DEVELOPMENT;
if(isset($_SERVER['FUEL_ENV'])){
    $fuel_env = $_SERVER['FUEL_ENV'];

}else{
    $fuel_env_domain_map =
        array(
            "prouction.example.jp"=>Fuel::PRODUCTION,
            "test.example.jp"=>Fuel::TEST
        );
    if(array_key_exists($_SERVER['SERVER_NAME'], $fuel_env_domain_map)){
        $fuel_env = $fuel_env_domain_map[$_SERVER['SERVER_NAME']];
    }

}
Fuel::$env = $fuel_env;
```