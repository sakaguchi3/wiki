# PHP - FuelPHP ORM


## select

```php
$shopmaster = M_Table01::find(array(
    'select' => array(
        'code',
        'name'
    ),
    'where' => array(
        array('type', 'in', array("open", "close")),
        array('delete_flg', '=', '0'),  
    ),
    'order_by' => array(
        'no' => 'ASC'
    )
));
```


## insert

```php
M_Table01::forge()
    ->set(array(
        "column" => hoge['column'],
        "delete_flg" => 0,
    ))
    ->save();

```

## update

```php        
record = M_Table01::find_one_by('id', 1);
record
    ->set(array("delete_flg" => 1))
    ->save();
```



## delete
```php        
record = M_Table01::find_one_by('id', 1);
record->delete();
```


## transaction
```php

try {
    DB::start_transaction();
    
    // insert/update/delete statement
    
    DB::commit_transaction();

} catch(Exception $e) {
    DB::rollback_transaction();
}
```