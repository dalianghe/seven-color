<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>字典管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${re.contextPath}/plugin/lenos/main.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${re.contextPath}/plugin/layui/layui.all.js" charset="utf-8"></script>
</head>

<body>
<div class="lenos-search">
    <div class="select">
        类型名称：
        <div class="layui-inline">
            <input class="layui-input" height="20px" id="typeName" autocomplete="off">
        </div>
        类型代码：
        <div class="layui-inline">
            <input class="layui-input" height="20px" id="typeCode" autocomplete="off">
        </div>
        <button class="select-on layui-btn layui-btn-sm" data-type="select">
            <i class="layui-icon"></i>
        </button>
        <button class="layui-btn layui-btn-sm icon-position-button" id="refresh" style="float: right;" data-type="reload">
            <i class="layui-icon">ဂ</i>
        </button>
    </div>

</div>
<div class="layui-col-md12" style="height:40px;margin-top:3px;">
    <div class="layui-btn-group">
      <@shiro.hasPermission name="dict:add">
      <button class="layui-btn layui-btn-normal" data-type="add">
          <i class="layui-icon">&#xe608;</i>新增
      </button>
      </@shiro.hasPermission>
      <@shiro.hasPermission name="dict:update">
      <button class="layui-btn layui-btn-normal" data-type="update">
          <i class="layui-icon">&#xe642;</i>编辑
      </button>
      </@shiro.hasPermission>
    </div>
</div>
<table id="dictList" class="layui-hide" lay-filter="dict"></table>
<script type="text/html" id="barDemo">
    <@shiro.hasPermission name="dict:select">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </@shiro.hasPermission>
<@shiro.hasPermission name="dict:update">
  <a class="layui-btn layui-btn-xs  layui-btn-normal" lay-event="edit">编辑</a>
</@shiro.hasPermission>
<#--<@shiro.hasPermission name="dict:del">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</@shiro.hasPermission>-->
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="sex" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo">
</script>
<script>
    layui.laytpl.toDateString = function (d, format) {
        var date = new Date(d || new Date())
                , ymd = [
            this.digit(date.getFullYear(), 4)
            , this.digit(date.getMonth() + 1)
            , this.digit(date.getDate())
        ]
                , hms = [
            this.digit(date.getHours())
            , this.digit(date.getMinutes())
            , this.digit(date.getSeconds())
        ];
        format = format || 'yyyy-MM-dd HH:mm:ss';
        return format.replace(/yyyy/g, ymd[0])
                .replace(/MM/g, ymd[1])
                .replace(/dd/g, ymd[2])
                .replace(/HH/g, hms[0])
                .replace(/mm/g, hms[1])
                .replace(/ss/g, hms[2]);
    };
    //数字前置补零
    layui.laytpl.digit = function (num, length, end) {
        var str = '';
        num = String(num);
        length = length || 2;
        for (var i = num.length; i < length; i++) {
            str += '0';
        }
        return num < Math.pow(10, length) ? str + (num | 0) : num;
    };
    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which;
        if (code == 13) {
            $(".select .select-on").click();
        }
    }
    layui.use('table', function () {
        var table = layui.table;
        //方法级渲染
        var tableObj = table.render({
            id: 'dictList',
            elem: '#dictList',
            url: 'showDictList',
            cols: [[
                {checkbox: true, fixed: true, width: '5%'},
                {
                    field: 'typeName',
                    title: '类型名称',
                    width: '10%',
                    sort: true
                },
                {field: 'typeCode', title: '类型代码', width: '15%', sort: true},
                {field: 'typeStatusName', title: '状态', width: '20%'},
                {
                    field: 'createDate',
                    title: '创建时间',
                    width: '20%',
                    templet: '<div>{{ layui.laytpl.toDateString(d.createDate,"yyyy-MM-dd") }}</div>'
                },
                {field: 'createByName', title: '创建人', width: '10%'},
                {field: 'right', title: '操作', width: '20%', toolbar: "#barDemo"}
            ]]
            , page: true,
            height: 'full-83'
        });

        var $ = layui.$, active = {
            select: function () {
                var typeName = $('#typeName').val();
                var typeCode = $('#typeCode').val();
                tableObj.reload('dictList', {
                    where: {
                        typeName: typeName,
                        typeCode: typeCode
                    }
                });
            },
            reload: function () {
                $('#typeName').val('');
                $('#typeCode').val('');
                tableObj.reload('dictList', {
                    where: {
                        typeName: null,
                        typeCode: null
                    }
                });
            },
            add: function () {
                add('添加字典', 'showAddDict', 700, 450);
            },
            update: function () {
                var checkStatus = table.checkStatus('dictList')
                        , data = checkStatus.data;
                if (data.length != 1) {
                    layer.msg('请选择一行编辑,已选[' + data.length + ']行', {icon: 5});
                    return false;
                }
                update('编辑字典', 'updateDict?id=' + data[0].id, 700, 450);
            }
        };

        //监听表格复选框选择
        table.on('checkbox(dict)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(dict)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                detail('查询详情', 'viewDict?id=' + data.id, 700, 450);
            } else if (obj.event === 'del') {
                layer.confirm('确定删除字典[<label style="color: #00AA91;">' + data.typeName + '</label>]?', {
                    btn: ['逻辑删除', '物理删除']
                }, function () {
                    del(data.id, true);
                }, function () {
                    del(data.id, false);
                });
            } else if (obj.event === 'edit') {
                update('编辑字典', 'updateDict?id=' + data.id, 700, 450);
            }
        });

        $('.layui-col-md12 .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('.select .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });

    function del(id, flag) {
        $.ajax({
            url: "del",
            type: "post",
            data: {id: id, flag: flag}, async: false,
            success: function (d) {
                if (d.flag) {
                    window.top.layer.msg(d.msg, {icon: 6, offset: 'rb', area: ['120px', '80px'], anim: 2});
                    layui.table.reload('dictList');
                } else {
                    window.top.layer.msg(d.msg, {icon: 5, offset: 'rb', area: ['120px', '80px'], anim: 2});
                }
            }, error: function () {
                alert('error');
            }
        });
    }

    function detail(title, url, w, h) {
        var number = 1;
        if (title == null || title == '') {
            title = false;
        }
        ;
        if (url == null || url == '') {
            url = "error/404";
        }
        ;
        if (w == null || w == '') {
            w = ($(window).width() * 0.9);
        }
        ;
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        ;
        layer.open({
            id: 'dict-detail',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: true,
            shade: 0.4,
            title: title,
            content: url + '&detail=true',
            // btn:['关闭']
        });
    }

    /**
     * 更新用户
     */
    function update(title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        if (url == null || url == '') {
            url = "404.html";
        }
        if (w == null || w == '') {
            w = ($(window).width() * 0.9);
        }
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        layer.open({
            id: 'dict-update',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url + '&detail=false'
        });
    }

    /*弹出层*/
    /*
     参数解释：
     title   标题
     url     请求的url
     id      需要操作的数据id
     w       弹出层宽度（缺省调默认值）
     h       弹出层高度（缺省调默认值）
     */
    function add(title, url, w, h) {
        if (title == null || title == '') {
            title = false;
        }
        if (url == null || url == '') {
            url = "404.html";
        }
        if (w == null || w == '') {
            w = ($(window).width() * 0.9);
        }
        if (h == null || h == '') {
            h = ($(window).height() - 50);
        }
        layer.open({
            id: 'dict-add',
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false,
            maxmin: true,
            shadeClose: false,
            shade: 0.4,
            title: title,
            content: url
        });
    }
</script>
</body>

</html>
