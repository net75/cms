<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/10/31
 * Time: 上午12:04
 */

namespace app\admin\controller;

use app\common\controller\Backend;

class Index extends Backend
{

    /**
     * @return void;
     */
    public function _initialize(){

        parent::_initialize();

    }

    public function index()
    {
//        echo "This Admin Page";


        return $this->view->fetch();
    }
}