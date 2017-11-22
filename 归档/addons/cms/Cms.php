<?php

namespace addons\cms;

use app\common\library\Menu;
use think\Addons;

/**
 * CMS插件
 */
class Cms extends Addons
{

    /**
     * 插件安装方法
     * @return bool
     */
    public function install()
    {
        $menu = [
            [
                'name'    => 'cms',
                'title'   => 'CMS管理',
                'sublist' => [
                    [
                        'name'    => 'cms/archives',
                        'title'   => '内容管理',
                        'sublist' => [
                            ['name' => 'cms/archives/index', 'title' => '查看'],
                            ['name' => 'cms/archives/add', 'title' => '添加'],
                            ['name' => 'cms/archives/edit', 'title' => '修改'],
                            ['name' => 'cms/archives/del', 'title' => '删除'],
                            ['name' => 'cms/archives/multi', 'title' => '批量更新'],
                        ]
                    ],
                    [
                        'name'    => 'cms/channel',
                        'title'   => '栏目管理',
                        'sublist' => [
                            ['name' => 'cms/channel/index', 'title' => '查看'],
                            ['name' => 'cms/channel/add', 'title' => '添加'],
                            ['name' => 'cms/channel/edit', 'title' => '修改'],
                            ['name' => 'cms/channel/del', 'title' => '删除'],
                            ['name' => 'cms/channel/multi', 'title' => '批量更新'],
                        ]
                    ],
                    [
                        'name'    => 'cms/model',
                        'title'   => '模型管理',
                        'icon'    => 'fa fa-model',
                        'sublist' => [
                            ['name' => 'cms/model/index', 'title' => '查看'],
                            ['name' => 'cms/model/add', 'title' => '添加'],
                            ['name' => 'cms/model/edit', 'title' => '修改'],
                            ['name' => 'cms/model/del', 'title' => '删除'],
                            ['name' => 'cms/model/multi', 'title' => '批量更新'],
                            [
                                'name'    => 'cms/fields',
                                'title'   => '字段管理',
                                'icon'    => 'fa fa-fields',
                                'ismenu'  => 0,
                                'sublist' => [
                                    ['name' => 'cms/fields/index', 'title' => '查看'],
                                    ['name' => 'cms/fields/add', 'title' => '添加'],
                                    ['name' => 'cms/fields/edit', 'title' => '修改'],
                                    ['name' => 'cms/fields/del', 'title' => '删除'],
                                    ['name' => 'cms/fields/multi', 'title' => '批量更新'],
                                ]
                            ]
                        ]
                    ],
                    [
                        'name'    => 'cms/tags',
                        'title'   => '标签管理',
                        'icon'    => 'fa fa-tags',
                        'sublist' => [
                            ['name' => 'cms/tags/index', 'title' => '查看'],
                            ['name' => 'cms/tags/add', 'title' => '添加'],
                            ['name' => 'cms/tags/edit', 'title' => '修改'],
                            ['name' => 'cms/tags/del', 'title' => '删除'],
                            ['name' => 'cms/tags/multi', 'title' => '批量更新'],
                        ]
                    ],
                    [
                        'name'    => 'cms/block',
                        'title'   => '区域管理',
                        'icon'    => 'fa fa-block',
                        'sublist' => [
                            ['name' => 'cms/block/index', 'title' => '查看'],
                            ['name' => 'cms/block/add', 'title' => '添加'],
                            ['name' => 'cms/block/edit', 'title' => '修改'],
                            ['name' => 'cms/block/del', 'title' => '删除'],
                            ['name' => 'cms/block/multi', 'title' => '批量更新'],
                        ]
                    ],
                    [
                        'name'    => 'cms/page',
                        'title'   => '单页管理',
                        'icon'    => 'fa fa-page',
                        'sublist' => [
                            ['name' => 'cms/page/index', 'title' => '查看'],
                            ['name' => 'cms/page/add', 'title' => '添加'],
                            ['name' => 'cms/page/edit', 'title' => '修改'],
                            ['name' => 'cms/page/del', 'title' => '删除'],
                            ['name' => 'cms/page/multi', 'title' => '批量更新'],
                        ]
                    ]
                ]
            ]
        ];
        Menu::create($menu);
        return true;
    }

    /**
     * 插件卸载方法
     * @return bool
     */
    public function uninstall()
    {
        Menu::delete('cms');
        return true;
    }

}
