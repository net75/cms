<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/10/31
 * Time: 上午10:03
 */

namespace app\common\controller;

use app\admin\library\Auth;
use think\Controller;
use think\Session;
use think\Config;
use think\Request;
use think\View;

class Backend extends Controller
{
    /**
     * 权限控制类
     * @var Auth
     */
    protected $auth = null;

    /**
     *  模型对象
     *  @var model
     */
    protected $model = null;


    /**
     * Multi方法可批量修改的字段
     */

    protected $multiFields = 'status';

    /**
     * 引入后台控制器的traits
     */

    use \app\admin\library\traits\Sustain;
    /*
     * 需要从基类定义 当前 module controller action model 私有变量 方便公共使用
     *
     *
     */

    public function _initialize()
    {
        $this->auth = Auth::instance();

        //设置model

    }


}