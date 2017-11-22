<?php

namespace app\admin\controller\cms;

use app\common\controller\Backend;
use app\common\model\Config as ConfigModel;

/**
 * 模型字段表
 *
 * @icon fa fa-circle-o
 */
class Fields extends Backend
{

    /**
     * Fields模型对象
     */
    protected $model = null;
    protected $modelValidate = true;
    protected $modelSceneValidate = true;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Fields');
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign('typeList', ConfigModel::getTypeList());
        $this->view->assign('regexList', ConfigModel::getRegexList());
    }

    public function index()
    {
        $model_id = $this->request->param('model_id');
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                    ->where('model_id', $model_id)
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->where('model_id', $model_id)
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        $this->assignconfig('model_id', $model_id);
        return $this->view->fetch();
    }

    public function rulelist()
    {
        //主键
        $primarykey = $this->request->request("pkey_name");
        //主键值
        $primaryvalue = $this->request->request("pkey_value");

        $regexList = ConfigModel::getRegexList();
        $list = [];
        foreach ($regexList as $k => $v)
        {
            if ($primaryvalue !== null)
            {
                if ($primaryvalue == $k)
                {
                    $list[] = ['id' => $k, 'name' => $v];
                }
            }
            else
            {
                $list[] = ['id' => $k, 'name' => $v];
            }
        }
        return json(['list' => $list]);
    }

}
