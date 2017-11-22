<?php

/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/11/5
 * Time: 下午6:25
 */
namespace app\admin\Controller\auth;

use app\common\controller\Backend;

/**
 * Class Admin
 * @package app\admin\Controller\auth
 *
 *  后台管理员
 */
class Admin extends Backend
{

    /**
     * 默认初始构造函数
     */
    public function _initialize(){
        //继承父级初始构造函数
        parent::_initialize();
        $this->model;

    }
    
    /*
     * 后台管理员首页
     */
    public function index(){


    }
}