<?php

namespace app\admin\model;

class Fields extends \think\Model
{

    // 表名
    protected $name = 'fields';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    // 追加属性
    protected $append = [
        'status_text',
        'content_list',
    ];
    protected static $listField = ['select', 'selects', 'checkbox', 'radio', 'array'];

    protected static function init()
    {
        $beforeUpdateCallback = function ($row) {
            
        };

        $afterInsertCallback = function ($row) {
            //为了避免引起更新的事件回调，这里采用直接执行SQL的写法
            $row->query($row->fetchSql(true)->update(['id' => $row['id'], 'weigh' => $row['id']]));
            $model = Model::get($row['model_id']);
            if ($model)
            {
                $sql = \addons\cms\library\Alter::instance()
                        ->setTable($model['table'])
                        ->setName($row['name'])
                        ->setLength($row['length'])
                        ->setContent($row['content'])
                        ->setDecimals($row['decimals'])
                        ->setDefaultvalue($row['defaultvalue'])
                        ->setComment($row['title'])
                        ->setType($row['type'])
                        ->getAddSql();
                db()->query($sql);
            }
        };
        $afterUpdateCallback = function ($row) {
            $model = Model::get($row['model_id']);
            if ($model)
            {
                $alter = \addons\cms\library\Alter::instance();
                if (isset($row['oldname']) && $row['oldname'] != $row['name'])
                {
                    $alter->setOldname($row['oldname']);
                }
                $sql = $alter
                        ->setTable($model['table'])
                        ->setName($row['name'])
                        ->setLength($row['length'])
                        ->setContent($row['content'])
                        ->setDecimals($row['decimals'])
                        ->setDefaultvalue($row['defaultvalue'])
                        ->setComment($row['title'])
                        ->setType($row['type'])
                        ->getModifySql();
                db()->query($sql);
                $fields = Fields::where('model_id', $model['id'])->field('name')->column('name');
                $model->fields = implode(',', $fields);
                $model->save();
            }
        };

        self::beforeInsert($beforeUpdateCallback);
        self::beforeUpdate($beforeUpdateCallback);

        self::afterInsert($afterInsertCallback);
        self::afterUpdate($afterUpdateCallback);

        self::afterDelete(function($row) {
            $model = Model::get($row['model_id']);
            if ($model)
            {
                $sql = \addons\cms\library\Alter::instance()
                        ->setTable($model['table'])
                        ->setName($row['name'])
                        ->getDropSql();
                db()->query($sql);
            }
        });
    }

    public function getContentListAttr($value, $data)
    {
        return in_array($data['type'], self::$listField) ? \app\common\model\Config::decode($data['content']) : $data['content'];
    }

    public function getStatusList()
    {
        return ['normal' => __('Normal'), 'hidden' => __('Hidden')];
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function model()
    {
        return $this->belongsTo('Model', 'model_id')->setEagerlyType(0);
    }

}
