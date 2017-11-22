<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use Think\Route;
//如果有定义绑定后台模块则禁用路由规则 
if (\think\Route::getBind('module') == 'admin')
    return [];

Route::rule('hello','index/Index');

Route::rule('cms','/addons/cms');

//
//return [
//    //别名配置,别名只能是映射到控制器且访问时必须加上请求的方法
////    '__alias__'   => [
////        'demo' => 'admin/Test',
////    ],
//    '__pattern__' => [
//        'name' => '\w+',
//    ],
//    '[hello]'     => [
//        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
//        ':name' => ['index/hello', ['method' => 'post']],
//    ],
//
////    ['cms' => '/addons/cms',['method'=>'get']],
//
//
//
//
////        域名绑定到模块
////        '__domain__'  => [
////            'admin' => 'admin',
////            'api'   => 'api',
////        ],
//];
