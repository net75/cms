<?php
/**
 * Created by PhpStorm.
 * User: chunyudu
 * Date: 2017/10/31
 * Time: 上午10:03
 */

namespace app\admin\library\traits;

/*
 * Sustain trait 类  公用方法处理类
 */



trait Sustain{


    /**
     * 查看
     */
    public function index(){

        if($this->request->isPost()){

        }

    }

    /**
     * 添加
     */
    public function add(){


    }


    /**
     * 编辑
     */
    public function edit(){

    }

    /**
     * 删除
     */
    public function del(){
        $this->success();
    }

    /**
     * 批量更新
     */
    public function multi($ids=''){
        $ids = $ids ? $ids : $this->request->param("ids");
        if ($ids)
        {
            if ($this->request->has('params'))
            {
                parse_str($this->request->post("params"), $values);
                $values = array_intersect_key($values, array_flip(is_array($this->multiFields) ? $this->multiFields : explode(',', $this->multiFields)));
                if ($values)
                {
//                    $adminIds = $this->getDataLimitAdminIds();
//                    if (is_array($adminIds))
//                    {
////                        $this->model->where($this->dataLimitField, 'in', $adminIds);
//                    }
                    $count = $this->model->where($this->model->getPk(), 'in', $ids)->update($values);
                    if ($count)
                    {
                        $this->success();
                    }
                }
                else
                {
                    $this->error(__('You have no permission'));
                }
            }
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

}