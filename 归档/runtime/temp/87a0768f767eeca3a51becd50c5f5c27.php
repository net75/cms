<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:62:"/usr/local/var/wwwroot/www/addons/cms/view/default/search.html";i:1509098378;s:69:"/usr/local/var/wwwroot/www/addons/cms/view/default/common/layout.html";i:1509098378;s:67:"/usr/local/var/wwwroot/www/addons/cms/view/default/common/item.html";i:1509098378;s:70:"/usr/local/var/wwwroot/www/addons/cms/view/default/common/sidebar.html";i:1509098378;}*/ ?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class=""> <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta name="renderer" content="webkit">
        <title><?php echo \think\Config::get("cms.title"); ?> - <?php echo \think\Config::get("cms.sitename"); ?></title>
        <meta name="keywords" content="<?php echo \think\Config::get("cms.keywords"); ?>" />
        <meta name="description" content="<?php echo \think\Config::get("cms.description"); ?>" />

        <link rel="stylesheet" media="screen" href="__ADDON__/css/common.css?v=<?php echo \think\Config::get("site.version"); ?>" />
        <link rel="stylesheet" media="screen" href="__ADDON__/css/font-awesome.min.css?v=<?php echo \think\Config::get("site.version"); ?>" />

        <link rel="stylesheet" media="screen" href="__ADDON__/css/jquery.colorbox.css?v=<?php echo \think\Config::get("site.version"); ?>" />
        <link rel="stylesheet" href="//at.alicdn.com/t/font_1461494259_6884313.css">

        <!--[if lt IE 9]>
          <script src="__ADDON__/libs/html5shiv.js?v=<?php echo \think\Config::get("site.version"); ?>"></script>
          <script src="__ADDON__/libs/respond.min.js?v=<?php echo \think\Config::get("site.version"); ?>"></script>
        <![endif]-->    

        <script type="text/javascript">
            var CMS = {
                uyan_id: '<?php echo \think\Config::get("cms.uyan_id"); ?>'
            };
        </script>
        <script type="text/javascript" src="__CDN__/assets/libs/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="__CDN__/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="__ADDON__/js/bootstrap-typeahead.min.js"></script>
        <script type="text/javascript" src="__ADDON__/js/common.js"></script>
    </head>
    <body class="group-page"  >

        <header class="header">
            <!-- S 导航 -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<?php echo \think\Config::get("cms.indexurl"); ?>"><img src="__ADDON__/img/logo.png" width="180" alt=""></a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <!--以下是两种实现导航菜单的方法-->

                            <!--如果你需要自定义NAV,可使用channellist标签来完成,这里只设置了2级-->
                            <!--
                            <?php $__LIST__ = \addons\cms\model\Channel::getChannelList(["id"=>"nav","type"=>"top"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?>
                            <li<?php if($nav['has_child']): ?> class="dropdown"<?php endif; ?>>
                                <a href="<?php echo $nav['url']; ?>"<?php if($nav['has_child']): ?> data-toggle="dropdown"<?php endif; ?>><?php echo $nav['name']; if($nav['has_child']): ?>  <b class="caret"></b><?php endif; ?></a>
                                <ul class="dropdown-menu" role="menu">
                                    <?php $__LIST__ = \addons\cms\model\Channel::getChannelList(["id"=>"sub","type"=>"son","typeid"=>$nav['id']]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?>
                                    <li><a href="<?php echo $sub['url']; ?>"><?php echo $sub['name']; ?></a></li>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </ul>
                            </li>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                            -->
                            
                            <!--实现无限级下拉菜单,maxlevel来控制最大层级-->
                            <?php $__LIST__ = \addons\cms\model\Channel::getNav(isset($__CHANNEL__)?$__CHANNEL__:[], ["maxlevel"=>"3","cache"=>"0"]); ?><?php echo $__LIST__; ?>
                        </ul>
                        <ul class="nav navbar-right hidden">
                            <ul class="nav navbar-nav">
                                <li><a href="javascript:;" class="addbookbark"><i class="fa fa-star"></i> 加入收藏</a></li>
                                <li><a href="javascript:;" class=""><i class="fa fa-phone"></i> 联系我们</a></li>
                            </ul>
                        </ul>
                        <ul class="nav navbar-nav navbar-right hidden-sm">
                            <li>
                                <form class="form-inline navbar-form" action="<?php echo addon_url('cms/search/index'); ?>" method="get">
                                    <div class="form-search hidden-sm">
                                        <input class="form-control typeahead" name="search" data-typeahead-url="<?php echo addon_url('cms/search/typeahead'); ?>" type="text" id="searchinput" placeholder="搜索">
                                    </div>
                                    <div class="form-search visible-sm">
                                        <a href="javascript:;" class="btn btn-default" id="searchbtn"><i class="fa fa-search"></i></a>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>

                </div>
            </nav>
            <!-- E 导航 -->

        </header>     

        

<div class="container"  id="content-container"> 
    <h1>
        <?php echo \think\Config::get("cms.title"); ?>
        <ol class="breadcrumb pull-right">
            <!-- S 面包屑导航 -->
            <?php $__LIST__ = \addons\cms\model\Channel::getBreadcrumb(isset($__CHANNEL__)?$__CHANNEL__:[], isset($__ARCHIVES__)?$__ARCHIVES__:[], isset($__TAGS__)?$__TAGS__:[]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
            <li><a href="<?php echo $item['url']; ?>"><?php echo $item['name']; ?></a></li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <!-- E 面包屑导航 -->
        </ol>
    </h1>

    <div class="article-filter">
        <ul class="nav nav-sort clearfix">
            <!-- S 排序 -->
            <?php $__LIST__ = \addons\cms\model\Archives::getPageOrder($__ORDERLIST__, ["id"=>"order"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$order): $mod = ($i % 2 );++$i;?>
            <li>
                <a href="<?php echo $order['url']; ?>" class="<?php echo !empty($order['active'])?'active':''; ?>">
                    <?php echo $order['title']; ?>
                </a>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <!-- E 排序 -->
        </ul>
    </div>

    <div class="article-list-body row">

        <div class="col-md-8 article-list-mian">
            
            <!-- S 列表 -->
            <?php $__LIST__ = \addons\cms\model\Archives::getPageList($__PAGELIST__, ["id"=>"item","empty"=>":fsd"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo ":fsd" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
            <section class="article-section">
    <article class="article-item">
        <div class="article-metas clearfix">
            <div class="pull-left">
                <div class="date">
                    <div class="day"><?php echo date('d',$item['createtime']); ?></div>
                    <div class="month"><?php echo date('m',$item['createtime']); ?><?php echo __('Month'); ?></div>
                </div>
            </div>
            <div class="metas-body">
                <h3 class="title"><a href="<?php echo $item['url']; ?>"><?php echo $item['title']; ?></a></h3>
                <p><a href="<?php echo $item['channel']['url']; ?>"><?php echo $item['channel']['name']; ?></a></p>
            </div>
        </div>
        <div class="media">
            <?php if($item['hasimage']): ?>
            <div class="media-left">
                <a href="<?php echo $item['url']; ?>">
                    <?php echo $item['imglink']; ?>
                </a>
            </div>
            <?php endif; ?>
            <div class="media-body">
                <?php echo $item['description']; ?>
            </div>
        </div>
        <div class="article-tag">
            <div class="pull-left">
                <?php echo __('Tags'); ?>：<span itemprop="keywords">
                    <?php if(is_array($item['tagslist']) || $item['tagslist'] instanceof \think\Collection || $item['tagslist'] instanceof \think\Paginator): $i = 0; $__LIST__ = $item['tagslist'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?>
                    <a href="<?php echo $tag['url']; ?>" rel="tag"><?php echo $tag['name']; ?></a><?php if(isset($__LIST__[$i])): ?>,<?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </span>
            </div>
            <div class="pull-right">
                <a href="<?php echo $item['url']; ?>" class="btn btn-success"><i class="fa fa-angle-right"></i> <?php echo __('View more'); ?></a>
            </div>
            <div class="clearfix"></div>
        </div>
    </article>
</section>
            <?php endforeach; endif; else: echo ":fsd" ;endif; ?>
            <!-- E 列表 -->
            
            <!-- S 分页栏 -->
            <div class="text-center">
                <?php echo $__PAGELIST__->render(["type"=>"full"]); ?> 
            </div>
            <!-- E 分页栏 -->
            
        </div>

        <aside class="col-md-4 article-sidebar">
            <div class="panel panel-adimg">
                <a href="/http://www.fastadmin.net.html"><img src="/public/assets/addons/cms/img/sidebar/1.jpg" class="img-responsive"/></a>
            </div>
            
            <!-- S 热门资讯 -->
<div class="panel panel-default hot-article">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo __('Hot news'); ?></h3>
    </div>
    <div class="panel-body">
        <?php $__LIST__ = \addons\cms\model\Archives::getArchivesList(["id"=>"hot","row"=>"10","orderby"=>"id","orderway"=>"asc"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$hot): $mod = ($i % 2 );++$i;?>
        <div class="media media-number">
            <div class="media-left">
                <span class="num"><?php echo $i; ?></span>
            </div>
            <div class="media-body">
                <a class="link-dark" href="<?php echo $hot['url']; ?>" title="<?php echo $hot['title']; ?>"><?php echo $hot['title']; ?></a>
            </div>
        </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<!-- E 热门资讯 -->

<!-- S 热门标签 -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo __('Hot tags'); ?></h3>
    </div>
    <div class="panel-body">
        <?php $__LIST__ = \addons\cms\model\Tags::getTagsList(["id"=>"tag","orderby"=>"rand"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?>
        <a href="<?php echo $tag['url']; ?>"> <span class="badge"><i class="fa fa-tags"></i> <?php echo $tag['name']; ?></span></a>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<!-- E 热门标签 -->

<!-- S 推荐资讯 -->
<div class="panel panel-default recommend-article">
    <div class="panel-heading">
        <h3 class="panel-title"><?php echo __('Recommend news'); ?></h3>
    </div>
    <div class="panel-body">
        <?php $__LIST__ = \addons\cms\model\Archives::getArchivesList(["id"=>"hot","row"=>"10","flag"=>"recommend|new","orderby"=>"id","orderway"=>"asc"]); if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$hot): $mod = ($i % 2 );++$i;?>
        <div class="media media-number">
            <div class="media-left">
                <span class="num"><?php echo $i; ?></span>
            </div>
            <div class="media-body">
                <a class="link-dark" href="<?php echo $hot['url']; ?>" title="<?php echo $hot['title']; ?>"><?php echo $hot['title']; ?></a>
            </div>
        </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
</div>
<!-- E 推荐资讯 -->
        </aside>
    </div>
</div>


        <footer>
            <div class="container-fluid" id="footer">
                <div class="container">
                    <div class="row footer-inner">
                        <div class="col-md-3 col-sm-3">
                            <div class="footer-logo">
                                <a href=“#”><i class="fa fa-bookmark"></i></a>
                            </div>
                            <p class="copyright"><small>© 2017. All Rights Reserved. <br>
                                    FastAdmin
                                </small>
                            </p>
                        </div>
                        <div class="col-md-5 col-md-push-1 col-sm-5 col-sm-push-1">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <ul class="links">
                                        <li><a href="#">关于我们</a></li>
                                        <li><a href="#">发展历程</a></li>
                                        <li><a href="#">服务项目</a></li>
                                        <li><a href="#">团队成员</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <ul class="links">
                                        <li><a href="#">新闻</a></li>
                                        <li><a href="#">资讯</a></li>
                                        <li><a href="#">推荐</a></li>
                                        <li><a href="#">博客</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <ul class="links">
                                        <li><a href="#">服务</a></li>
                                        <li><a href="#">圈子</a></li>
                                        <li><a href="#">论坛</a></li>
                                        <li><a href="#">广告</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-md-push-1 col-sm-push-1">
                            <div class="footer-social">
                                <a href="#"><i class="fa fa-weibo"></i></a>
                                <a href="#"><i class="fa fa-qq"></i></a>
                                <a href="#"><i class="fa fa-wechat"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 

        <div id="floatbtn">
            <!-- S 浮动按钮 -->
            <!--            
                <a id="fb-tipoff" class="hover" href="javascript:;" target="_blank">
                <i class="iconfont icon-pencil"></i>
            </a>-->
            <?php if($config['qrcode']): ?>
            <a id="fb-qrcode" href="javascript:;">
                <i class="iconfont icon-qrcode"></i>
                <div id="fb-qrcode-wrapper">
                    <div class="qrcode"><img src="__CDN__<?php echo $config['qrcode']; ?>"></div>
                    <p>微信公众账号</p>
                    <p>微信扫一扫加关注</p>
                </div>
            </a>
            <?php endif; if(isset($__ARCHIVES__)): ?>
            <a id="feedback" class="hover" href="#comments">
                <i class="iconfont icon-feedback"></i>
            </a>
            <?php endif; ?>
            <a id="back-to-top" class="hover" href="javascript:;">
                <i class="iconfont icon-backtotop"></i>
            </a>
            <!-- E 浮动按钮 -->
        </div>

    </body>
</html>