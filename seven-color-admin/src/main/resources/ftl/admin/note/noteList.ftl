<#-- Created by IntelliJ IDEA.
 User: Administrator
 Date: 2017/12/6
 Time: 14:00
 To change this template use File | Settings | File Templates.
 用户管理-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>用户管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport"
        content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
  <link rel="stylesheet" href="${re.contextPath}/plugin/layui/css/layui.css">
  <link rel="stylesheet" href="${re.contextPath}/plugin/lenos/main.css">
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="${re.contextPath}/plugin/layui/layui.all.js"
          charset="utf-8"></script>

</head>

<body>
<div class="lenos-search">
  <div class="select">
    标题：
    <div class="layui-inline">
      <input class="layui-input" height="20px" id="noteTitle" autocomplete="off">
    </div>
    内容：
    <div class="layui-inline">
      <input class="layui-input" height="20px" id="noteContent" autocomplete="off">
    </div>
    <button class="select-on layui-btn layui-btn-sm" data-type="select"><i class="layui-icon"></i>
    </button>
    <button class="layui-btn layui-btn-sm icon-position-button" id="refresh" style="float: right;"
            data-type="reload">
      <i class="layui-icon">ဂ</i>
    </button>
  </div>

</div>
<div class="layui-col-md12" style="height:40px;margin-top:3px;">
  <div class="layui-btn-group">

  </div>
</div>
<table id="noteList" class="layui-hide" lay-filter="user"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="switchTpl">
  <input type="checkbox" name="sex" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo">
</script>
<script>
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
    table.render({
      id: 'noteList',
      elem: '#noteList'
      , url: 'noteListData'
      , cols: [[
        /*{checkbox: true, fixed: true, width: '5%'}
        , */{
          field: 'noteTitle',
          title: '标题',
          width: '20%',
          sort: true,
          style: 'background-color: #009688; color: #fff;'
        }
        , {field: 'noteContent', title: '内容', width: '32%'}
        , {field: 'noteType', title: '类型', width: '10%'}
        , {field: 'createTime', title: '创建时间', width: '13%'}
        , {field: 'userId', title: '创建人', width: '13%', template: '#switchTpl'}
        , {field: 'right', title: '操作', width: '10%', toolbar: "#barDemo"}
      ]]
      , page: true,
      height: 'full-83'
    });

    var $ = layui.$, active = {
      select: function () {
        var noteTitle = $('#noteTitle').val();
        var noteContent = $('#noteContent').val();
        table.reload('noteList', {
          where: {
            noteTitle: noteTitle,
            noteContent: noteContent
          }
        });
      },
      reload:function(){
        $('#noteTitle').val('');
       $('#noteContent').val('');
        table.reload('noteList', {
          where: {
            username: null,
            email: null
          }
        });
      }
    };

    //监听表格复选框选择
    table.on('checkbox(user)', function (obj) {
      console.log(obj)
    });
    //监听工具条
    table.on('tool(user)', function (obj) {
      var data = obj.data;
      if (obj.event === 'detail') {
        detail('编辑用户', 'updateUser?id=' + data.id, 700, 450);
      } else if (obj.event === 'del') {
        layer.confirm('确定删除帖子[<label style="color: #00AA91;">' + data.noteTitle + '</label>]?', {
          btn: ['删除']
        }, function (index) {
          del(data.noteId, false, index);
        });
      } else if (obj.event === 'edit') {
        update('编辑用户', 'updateUser?id=' + data.id, 700, 450);
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
  function rePwd(title,url,w,h){
    if (title == null || title == '') {
      title = false;
    };
    if (url == null || url == '') {
      url = "404.html";
    };
    if (w == null || w == '') {
      w = ($(window).width() * 0.9);
    };
    if (h == null || h == '') {
      h = ($(window).height() - 50);
    };
    layer.open({
      id: 'user-rePwd',
      type: 2,
      area: [w + 'px', h + 'px'],
      fix: false,
      maxmin: true,
      shadeClose: true,
      shade: 0.4,
      title: title,
      content: url,
    });
  }
  function del(id, flag, index) {
    $.ajax({
      url:"del",
      type:"post",
      data:{id:id,flag:flag}, async:false,
      success:function(d){
        if(d.flag){
          window.top.layer.msg(d.msg,{icon:6,offset: 'rb',area:['120px','80px'],anim:2});
          layui.table.reload('noteList');
        }else{
          window.top.layer.msg(d.msg,{icon:5,offset: 'rb',area:['120px','80px'],anim:2});
        }
          layer.close(index);
      },error:function(){
        alert('error');
            layer.close(index);
      }
    });
  }
  function detail(title, url, w, h) {
    var number = 1;
    if (title == null || title == '') {
      title = false;
    };
    if (url == null || url == '') {
      url = "error/404";
    };
    if (w == null || w == '') {
      w = ($(window).width() * 0.9);
    };
    if (h == null || h == '') {
      h = ($(window).height() - 50);
    };
    layer.open({
      id: 'user-detail',
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
      id: 'user-update',
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
    ;
    if (url == null || url == '') {
      url = "404.html";
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
      id: 'user-add',
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
