<?php

return array (

    'autoload' => false,
    'hooks' => array (),
    'route' => array (
            '/$' => 'cms/index/index',
            '/c/[:diyname]' => 'cms/channel/index',
            '/t/[:name]' => 'cms/tags/index',
            '/a/[:diyname]' => 'cms/archives/index',
            '/p/[:diyname]' => 'cms/page/index',
            '/s' => 'cms/search/index',
        ),
);