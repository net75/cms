<?php

namespace app\admin\controller\cms;

use app\admin\model\Channel;
use app\common\controller\Backend;
use fast\Tree;

/**
 * 内容表
 *
 * @icon fa fa-circle-o
 */
class Archives extends Backend
{

    /**
     * Archives模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Archives');

        $channelList = [];
        $disabledIds = [];
        $all = collection(Channel::order("weigh desc,id desc")->select())->toArray();
        foreach ($all as $k => $v)
        {
            $state = ['opened' => true];
            if ($v['type'] != 'list')
            {
                $disabledIds[] = $v['id'];
            }
            if ($v['type'] == 'link')
            {
                $state['checkbox_disabled'] = true;
            }
            $channelList[] = [
                'id'     => $v['id'],
                'parent' => $v['parent_id'] ? $v['parent_id'] : '#',
                'text'   => __($v['name']),
                'type'   => $v['type'],
                'state'  => $state
            ];
        }
        $tree = Tree::instance()->init($all, 'parent_id');
        $channelOptions = $tree->getTree(0, "<option value=@id @selected @disabled>@spacer@name</option>", '', $disabledIds);
        $this->view->assign('channelOptions', $channelOptions);
        $this->assignconfig('channelList', $channelList);

        $this->view->assign("flagList", $this->model->getFlagList());
        $this->view->assign("statusList", $this->model->getStatusList());
    }

    /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            $this->relationSearch = TRUE;
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('pkey_name'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                    ->with('Channel')
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with('Channel')
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    public function add()
    {
        return parent::add();
    }

    public function edit($ids = NULL)
    {
        $row = $this->model->get($ids);
        if (!$row)
            $this->error(__('No Results were found'));
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds))
        {
            if (!in_array($row[$this->dataLimitField], $adminIds))
            {
                $this->error(__('You have no permission'));
            }
        }
        if ($this->request->isPost())
        {
            return parent::edit($ids);
        }
        $channel = Channel::get($row['channel_id']);
        if (!$channel)
        {
            $this->error(__('No specified channel found'));
        }
        $model = \app\admin\model\Model::get($channel['model_id']);
        if (!$model)
        {
            $this->error(__('No specified model found'));
        }
        $addon = db($model['table'])->where('id', $row['id'])->find();
        if ($addon)
        {
            $row = array_merge($row->toArray(), $addon);
        }

        $all = collection(Channel::order("weigh desc,id desc")->select())->toArray();
        foreach ($all as $k => $v)
        {
            if ($v['type'] != 'list' || $v['model_id'] != $channel['model_id'])
            {
                $disabledIds[] = $v['id'];
            }
        }
        $tree = Tree::instance()->init($all, 'parent_id');
        $channelOptions = $tree->getTree(0, "<option value=@id @selected @disabled>@spacer@name</option>", $row['id'], $disabledIds);
        $this->view->assign('channelOptions', $channelOptions);
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 移动
     */
    public function move($ids = "")
    {
        if ($ids)
        {
            $channel_id = $this->request->post('channel_id');
            $pk = $this->model->getPk();
            $adminIds = $this->getDataLimitAdminIds();
            if (is_array($adminIds))
            {
                $count = $this->model->where($this->dataLimitField, 'in', $adminIds);
            }
            $this->model->where($pk, 'in', $ids);
            $channel = Channel::get($channel_id);
            if ($channel && $channel['type'] === 'list')
            {
                $count = $this->model
                        ->where('model_id', $channel['model_id'])
                        ->update(['channel_id' => $channel_id]);
                if ($count)
                {
                    $this->success();
                }
                else
                {
                    $this->error(__('No rows were updated'));
                }
            }
            else
            {
                $this->error(__('No rows were updated'));
            }
            $this->error(__('Parameter %s can not be empty', 'ids'));
        }
    }

    public function get_channel_fields()
    {
        $this->view->engine->layout(false);
        $channel_id = $this->request->post('channel_id');
        $archives_id = $this->request->post('archives_id');
        $channel = Channel::get($channel_id, 'model');
        if ($channel && $channel['type'] === 'list')
        {

            $values = [];
            if ($archives_id)
            {
                $values = db($channel['model']['table'])->where('id', $archives_id)->find();
            }

            $fields = \app\admin\model\Fields::where('model_id', $channel['model_id'])
                    ->order('weigh desc,id desc')
                    ->select();
            foreach ($fields as $k => $v)
            {
                $v->value = isset($values[$v['name']]) ? $values[$v['name']] : '';
                $v->rule = str_replace(',', '; ', $v->rule);
                if (in_array($v->type, ['checkbox', 'lists', 'images']))
                {
                    $checked = '';
                    if ($v['minimum'] && $v['maximum'])
                        $checked = "{$v['minimum']}~{$v['maximum']}";
                    else if ($v['minimum'])
                        $checked = "{$v['minimum']}~";
                    else if ($v['maximum'])
                        $checked = "~{$v['maximum']}";
                    if ($checked)
                        $v->rule .= (';checked(' . $checked . ')');
                }
                if (in_array($v->type, ['checkbox', 'radio']) && stripos($v->rule, 'required') !== false)
                {
                    $v->rule = str_replace('required', 'checked', $v->rule);
                }
                if (in_array($v->type, ['selects']))
                {
                    $v->extend .= (' ' . 'data-max-options="' . $v['maximum'] . '"');
                }
            }

            $this->view->assign('fields', $fields);
            $this->view->assign('values', $values);
            $this->success('', null, ['html' => $this->view->fetch('fields')]);
        }
        else
        {
            $this->error(__('No rows were updated'));
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

}
