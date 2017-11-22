define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'cms/channel/index',
                    add_url: 'cms/channel/add',
                    edit_url: 'cms/channel/edit',
                    del_url: 'cms/channel/del',
                    multi_url: 'cms/channel/multi',
                    table: 'channel',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                pagination: false,
                escape: false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'type', title: __('Type'), custom: {channel: 'info', list: 'success', link: 'primary'}, formatter: Table.api.formatter.flag},
                        {field: 'model_name', title: __('Model_name'), operate: false},
                        {field: 'name', title: __('Name'), align: 'left'},
                        {field: 'diyname', title: __('Diyname')},
                        {field: 'items', title: __('Items')},
                        {field: 'weigh', title: __('Weigh'), visible: false},
                        {field: 'createtime', title: __('Createtime'), visible: false, formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), visible: false, formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ],
                search: false,
                commonSearch: false
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                //不可见的元素不验证
                $("form#add-form").data("validator-options", {ignore: ':hidden'});
                $(document).on("click", "input[name='row[type]']", function () {
                    $(".tf").addClass("hidden");
                    $(".tf.tf-" + $(this).val()).removeClass("hidden");
                    $("select[name='row[model_id]']").trigger("change");
                });
                Form.api.bindevent($("form[role=form]"));
                $(document).on("change", "select[name='row[model_id]']", function () {
                    var data = $("option:selected", this).data();
                    var type = $("input[name='row[type]']:checked").val();
                    if (type == 'channel') {
                        $("input[name='row[channeltpl]']").val(data.channeltpl);
                    } else if (type == 'list') {
                        $("input[name='row[listtpl]']").val(data.listtpl);
                        $("input[name='row[showtpl]']").val(data.showtpl);
                    }

                });
                $("select[name='row[model_id]']").trigger("change");
                $("input[name='row[type]']:first").trigger("click");
            }
        }
    };
    return Controller;
});