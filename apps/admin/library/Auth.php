<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/11/5
 * Time: 下午8:40
 */

namespace app\admin\library;



class Auth extends \net75\Auth
{
    //继承父级初始方法
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 检测是否登录
     *
     * @return boolean
     */
    public function isLogin()
    {
        return Session::get('admin') ? true : false;
    }


}