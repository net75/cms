<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:73:"/usr/local/var/wwwroot/www/application/admin/view/cms/archives/index.html";i:1509098384;s:69:"/usr/local/var/wwwroot/www/application/admin/view/layout/default.html";i:1505521690;s:66:"/usr/local/var/wwwroot/www/application/admin/view/common/meta.html";i:1505521690;s:68:"/usr/local/var/wwwroot/www/application/admin/view/common/script.html";i:1505521690;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="__CDN__/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="__CDN__/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="__CDN__/assets/js/html5shiv.js"></script>
  <script src="__CDN__/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <div class="row">
    <div class="col-md-3 hidden-xs hidden-sm">
        <div class="panel panel-default panel-intro">
            <div class="panel-heading">
                <div class="panel-lead"><em>栏目列表</em></div>
            </div>
            <div class="panel-body">
                <span class="text-muted"><input type="checkbox" name="" id="checkall" /> <label for="checkall"><small><?php echo __('Check all'); ?></small></label></span>
                <span class="text-muted"><input type="checkbox" name="" id="expandall" checked="" /> <label for="expandall"><small><?php echo __('Expand all'); ?></small></label></span>
                <div id="channeltree">
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-9">
        <div class="panel panel-default panel-intro" style="background: #f1f4f6;padding-top: 0;padding-bottom: 0;box-shadow: none;">
            <?php echo build_heading(); ?>
            <div id="myTabContent" class="tab-content" style="background:#fff;padding:15px;">
                <div class="tab-pane fade active in" id="one">
                    <div class="widget-body no-padding">
                        <div id="toolbar" class="toolbar">
                            <?php echo build_toolbar('refresh,add,del',['add'=>[url('cms.archives/add'), 'btn btn-success btn-addtabs', 'fa fa-plus', __('Add'), __('Add')]]); ?>
                            <a class="btn btn-info btn-move dropdown-toggle btn-disabled disabled"><i class="fa fa-arrow-right"></i> <?php echo __('Move'); ?></a>

                            <div class="dropdown btn-group <?php echo $auth->check('cms/archives/multi')?'':'hide'; ?>">
                                <a class="btn btn-primary btn-more dropdown-toggle btn-disabled disabled" data-toggle="dropdown"><i class="fa fa-cog"></i> <?php echo __('More'); ?></a>
                                <ul class="dropdown-menu text-left" role="menu">
                                    <li><a class="btn btn-link btn-multi btn-disabled disabled" href="javascript:;" data-params="status=normal"><i class="fa fa-eye"></i> <?php echo __('Set to normal'); ?></a></li>
                                    <li><a class="btn btn-link btn-multi btn-disabled disabled" href="javascript:;" data-params="status=hidden"><i class="fa fa-eye-slash"></i> <?php echo __('Set to hidden'); ?></a></li>
                                </ul>
                            </div>
                            <a class="btn btn-success btn-recyclebin btn-dialog" href="cms/archives/recyclebin" title="<?php echo __('Recycle bin'); ?>"><i class="fa fa-recycle"></i> <?php echo __('Recycle bin'); ?></a>
                        </div>
                        <table id="table" class="table table-striped table-bordered table-hover" 
                               data-operate-edit="<?php echo $auth->check('cms/archives/edit'); ?>" 
                               data-operate-del="<?php echo $auth->check('cms/archives/del'); ?>" 
                               width="100%">
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script id="channeltpl" type="text/html">
    <div class="box box-solid bg-red-gradient">
        <div class="box-header ui-sortable-handle" style="cursor: move;">
            <?php echo __('Warning'); ?>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <?php echo __('Move tips'); ?>
        </div>
        <!-- /.box-body -->
        <div class="box-footer text-black">
            <div class="row">
                <div class="col-sm-6">
                    <select name="channel" class="selectpicker" id="">
                        <option value="0"><?php echo __('Please select channel'); ?></option>
                        <?php echo $channelOptions; ?>
                    </select>
                </div>
            </div>
            <!-- /.row -->
        </div>
    </div>
</script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="__CDN__/assets/js/require.js" data-main="__CDN__/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>