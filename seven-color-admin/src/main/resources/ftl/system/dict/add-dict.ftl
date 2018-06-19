<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加字典</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${re.contextPath}/plugin/x-admin/css/xadmin.css">
    <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">

</head>

<body>
<div>
    <form id="dictForm" class="layui-form layui-form-pane" style="margin-left: 20px;">
        <div style="width:100%;height:400px;overflow: auto;">
            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
                    <legend style="font-size:16px;">字典类型信息</legend>
                </fieldset>
            </div>
            <div class="layui-form-item">
                <label for="typeName" class="layui-form-label">
                    <span class="x-red">*</span>类型名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="typeName" name="typeName" lay-verify="typeName" autocomplete="off" class="layui-input">
                </div>
                <div id="ms" class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span><span id="ums">类型名称必填</span>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label for="typeCode" class="layui-form-label">
                        <span class="x-red">*</span>类型编码
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="typeCode" name="typeCode" lay-verify="typeCode" autocomplete="off"  class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label for="typeStatus" class="layui-form-label">
                        <span class="x-red">*</span>状态
                    </label>
                    <div class="layui-input-inline">
                        <input type="radio" name="typeStatus" value="1" title="有效" checked><input type="radio" name="typeStatus" value="2" title="无效">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
                    <legend style="font-size:16px;">字典项信息</legend>
                </fieldset>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-sm layui-btn-warm" id="addItem" type="button">
                    <i class="layui-icon">&#xe608;</i>
                </button>
                <table id="itemTable" class="layui-table">
                    <thead>
                        <tr>
                            <th style="width: 25%">字典项</th>
                            <th style="width: 25%">编码</th>
                            <th style="width: 35%">状态</th>
                            <th style="width: 15%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div style="height: 60px"></div>
        </div>
        <div style="width: 100%;height: 55px;background-color: white;border-top:1px solid #e6e6e6;position: fixed;bottom: 1px;margin-left:-20px;">
            <div class="layui-form-item" style=" float: right;margin-right: 30px;margin-top: 8px">
                <button class="layui-btn layui-btn-normal" id="submitButton" lay-filter="add" lay-submit>
                    增加
                </button>
                <button class="layui-btn layui-btn-primary" id="closeButton" type="button">
                    取消
                </button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${re.contextPath}/plugin/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer', 'table'], function () {
        $ = layui.jquery;
        var form = layui.form
                , layer = layui.layer;
        var index = 0;
        $('#addItem').click(function () {
            var tr = "<tr>"
                            +"<td><input type=\"text\" name=\"itemName["+index+"]\" style=\"width:100%;height: 25px;\"></td>"
                            +"<td><input type=\"text\" name=\"itemCode["+index+"]\" style=\"width:100%;height: 25px;\"></td>"
                            +"<td><input type=\"radio\" name=\"itemStatus["+index+"]\" value=\"1\" title=\"有效\" checked><input type=\"radio\" name=\"itemStatus["+index+"]\" value=\"2\" title=\"无效\"></td>"
                            +"<td><a class=\"layui-btn layui-btn-danger layui-btn-xs\" type=\"button\" onclick='del(this)'>删除</a></td>"
                        +"</tr>";
            index++;
            $('#itemTable').append(tr);
            form.render();
        });

        //自定义验证规则
        form.verify({
            typeName: function (value) {
                if (value.trim() == "") {
                    return "类型名称不能为空";
                }
            }
        });

        $('#closeButton').click(function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });

        //监听提交
        form.on('submit(add)', function (data) {

            console.log(data.field);

            $.ajax({
                url: 'addDict',
                type: 'post',
                data: data.field,
                async: false, traditional: true,
                success: function (d) {
                    if (d.flag) {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        window.parent.layui.table.reload('dictList');
                        window.top.layer.msg(d.msg, {icon: 6, offset: 'rb', area: ['120px', '80px'], anim: 2});
                    } else {
                        layer.msg(d.msg, {icon: 5, offset: 'rb', area: ['120px', '80px'], anim: 2});
                    }

                }, error: function () {
                    layer.alert("请求失败", {icon: 6}, function () {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    });
                }
            });
            return false;
        });
    });

    function del(obj){
        $(obj).parent().parent().remove(); // 删除当前行
    }

</script>
</body>

</html>
