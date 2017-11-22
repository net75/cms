<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/11/2
 * Time: 下午11:44
 */

namespace app\admin\behavior;

use think\Config;

class AdminLog
{

    public function run(&$params)
    {
        //设置后台默认模板风格
        Config::set('template.view_path',Config::get('template.view_path').'default/');


    }

}