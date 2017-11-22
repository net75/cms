<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/10/31
 * Time: 下午4:25
 */

return [

    'template'               => [
        //开启模板布局
        'layout_on'     =>  true,
//        'layout_name'   =>  'layout',
//        'layout_item'   =>  '[__REPLACE__]'
        // 模板路径
        'view_path'    => ROOT_PATH.'theme/admin/',
    ],

    // 视图输出字符串内容替换
    'view_replace_str'       => [
        '__STATIC__'    => '/public/static/admin/default/',
    ],

];