<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/9
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    label{
        width: 300px;
    }
</style>
<script>
    $(function () {
        $.post("${pageContext.request.contextPath}/params/findParams",{"type":"credential"},function(data){
            $(data).each(function(i,n){
                $("#upd_credential").append("<option value='" +n+"'>" +n+ "</option>");
                $("#add_credential").append("<option value='" +n+"'>" +n+ "</option>");
            });
            $("#upd_credential option[value='${credential}']").prop("selected","selected");
        },"json");

        $.post("${pageContext.request.contextPath}/params/findTime",{},function(data){
            $(data).each(function(i,n){
                $("#startTime").append("<option value='" +n+"'>" +n+ "</option>");
                $("#endTime").append("<option value='" +n+"'>" +n+ "</option>");
                $("#add_startTime").append("<option value='" +n+"'>" +n+ "</option>");
                $("#add_endTime").append("<option value='" +n+"'>" +n+ "</option>");
            });
            $("#startTime option[value='${startTime}']").prop("selected","selected");
            $("#endTime option[value='${endTime}']").prop("selected","selected");
        },"json");
    })
</script>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm12 layui-col-md6" style="width: 100%;height: 30%">
            <div class="layui-card">
                <div class="layui-card-header">技能培训</div>
                <div class="layui-card-body"><button class="layui-btn" id="addTrain">
                    <i class="layui-icon">&#xe654;</i>添加</button></div>
                <div class="layui-card-body" style="min-height: 400px;">
                    <div id="main4" class="layui-col-sm12" style="height: 400px;">
                        <table class="layui-table layui-form" id="train" lay-filter="train"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    layui.use(['table','layer','upload'], function () {
        var table = layui.table;
        var layer=layui.layer;
        var $ = layui.jquery
            ,upload = layui.upload;
        var tableIns = table.render({
            elem: '#train'
            , height: 400
            , url: '${pageContext.request.contextPath}/train/selTrain' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 80,align: 'center'}
                ,{field: 'title', title: '培训项目名', width: 200,align: 'center'}
                ,{field: 'content', title: '培训内容', width: 150,align: 'center'}
                ,{field: 'length', title: '培训时长', width: 80,align: 'center'}
                ,{field: 'credential', title: '认证证书', width: 120,align: 'center'}
                ,{title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
            ]]
            ,done: function () {
                $("[data-field='id']").css('display','none');
            }
            , limit: 5
            , limits: [5, 6, 7]
        });
        table.on('tool(train)', function (obj) {
            id = obj.data.id;           //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var title=obj.data.title;
            if (layEvent === 'detail') {    //查看详情
                $.ajax({
                    url: "${pageContext.request.contextPath}/train/findTrainById",
                    type: "Post",
                    data: {"id":id},
                    dataType: "text",
                    success:function (data) {
                    var train=JSON.parse(data);
                    $("#title").text(train.title);
                    $("#startDate").text(train.startDate);
                    $("#endDate").text(train.endDate);
                    $("#time").text(train.startTime+" - "+train.endTime);
                    $("#content").text(train.content);
                    $("#count").text(train.count);
                    $("#length").text(train.length);
                    $("#credential").text(train.credential);
                    }
                });
                layer.open({
                    title:"培训详情",
                    type: 1,
                    area: 'auto',
                    content:$("#detail_div"),
                    btn:'查看培训内容',
                    btnAlign: 'c',
                    btn1:function () {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/train/playTrain",
                            type: "Post",
                            data: {},
                            dataType: "text",
                        });
                    }
                })
            }else if (layEvent === 'update'){
                $.ajax({
                    url: "${pageContext.request.contextPath}/train/findTrainById",
                    type: "Post",
                    data: {"id":id},
                    dataType: "text",
                    success:function (data) {
                        var train=JSON.parse(data);
                        $("#upd_title").val(train.title);
                        $("#upd_startDate").val(train.startDate);
                        $("#upd_endDate").val(train.endDate);
                        $("#startTime").val(train.startTime);
                        $("#endTime").val(train.endTime);
                        $("#upd_content").val(train.content);
                        $("#upd_count").val(train.count);
                        $("#upd_length").text(train.length);
                        $("#upd_credential").val(train.credential);
                    }
                });
                layer.open({
                    title:"培训修改",
                    type: 1,
                    area: 'auto',
                    content:$("#update_div"),
                    btn:'保存',
                    btnAlign: 'c',
                    btn1:function (index) {
                     var title=$("#upd_title").val();
                     var startDate=$("#upd_startDate").val();
                     var endDate=$("#upd_endDate").val();
                     var startTime=$("#startTime").val();
                     var endTime=$("#endTime").val();
                     var content=$("#upd_content").val();
                     var count=$("#upd_count").val();
                     var credential=$("#upd_credential").val();
                        $.ajax({
                            url: "${pageContext.request.contextPath}/train/updateTrain",
                            type: "Post",
                            data: {"id":id,"title":title,"startDate":startDate,"endDate":endDate,"startTime":startTime,"endTime":endTime,"content":content,"count":count,"credential":credential},
                            dataType: "text",
                            beforeSend:function () {
                                if (!/^(500|[1-4][0-9][0-9]|[1-9][0-9]|[1-9])$/.test(count)||count==""){
                                    layer.alert("请输入1-500的培训人数",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else if(title==""){
                                    layer.alert("请输入培训标题",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else if(startDate>endDate){
                                    layer.alert("结束日期必须大于开始日期",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else if(Number(startTime.split(":")[0])>Number(endTime.split(":")[0])){
                                    layer.alert("结束时间必须大于开始时间",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else if(content==""){
                                    layer.alert("培训内容不得为空",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else if(credential==""){
                                    layer.alert("培训证书不得为空",{icon:5,title:"提示",time:1500});
                                    return false;
                                }else {
                                   return confirm("确认修改培训计划？");
                                }
                            },
                            success:function (data) {
                                if (data==1){
                                layer.alert("修改成功",{time:2000});
                                layer.close(index);
                                table.reload('train',{
                                    url: '${pageContext.request.contextPath}/train/selTrain'
                                    ,height: 400
                                    ,page:{
                                        curr:1
                                    }
                                })
                            }else{
                                    layer.alert("修改失败",{title:"信息",time:2000});
                                }
                           },
                            error:function () {
                                layer.alert("网络繁忙",{icon:5,title:"提示",time:2000});
                            }
                        });
                    }
                })

            }else if(layEvent === 'delete'){
                $.ajax({
                    url: "${pageContext.request.contextPath}/train/delTrain",
                    type: "Post",
                    data: {"id":id},
                    dataType: "text",
                    beforeSend:function(){
                        return confirm("确认删除该培训计划？")
                    },
                    success:function (data) {
                        if(data==1){
                            layer.alert("删除成功",{title:"信息",time:2000});
                            table.reload('train',{
                                url: '${pageContext.request.contextPath}/train/selTrain'
                                ,height: 400
                                ,page:{
                                    curr:1
                                }
                            })
                        }else{
                            layer.alert("删除失败",{title:"信息",time:2000});
                        }
                    }
                });
            }
        });

        $("#addTrain").on('click',function () {
            layer.open({
                title:"新增培训",
                type: 1,
                area: 'auto',
                content:$("#add_div"),

            })
        })
        upload.render({
            elem: '#test8'
            ,url: '${pageContext.request.contextPath}/train/addTrain' //改成您自己的上传接口
            ,auto: false
            ,accept:"file"
            //,multiple: true
            ,before:function (obj) {
                // var title=$("#add_title").val();
                // var startDate=$("#add_startDate").val();
                // var endDate=$("#add_endDate").val();
                // var startTime=$("#add_startTime").val();
                // var endTime=$("#add_endTime").val();
                // var content=$("#add_content").val();
                // var count=$("#add_count").val();
                // var credential=$("#add_credential").val();
                // alert(id+title+startDate+endDate+startTime+endTime+content+count+credential);
                // if (!/^(500|[1-4][0-9][0-9]|[1-9][0-9]|[1-9])$/.test(count)||count==""){
                //     layer.alert("请输入1-500的培训人数",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else if(title==""){
                //     layer.alert("请输入培训标题",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else if(startDate>endDate){
                //     layer.alert("结束日期必须大于开始日期",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else if(Number(startTime.split(":")[0])>Number(endTime.split(":")[0])){
                //     layer.alert("结束时间必须大于开始时间",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else if(content==""){
                //     layer.alert("培训内容不得为空",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else if(credential==""){
                //     layer.alert("培训证书不得为空",{icon:5,title:"提示",time:1500});
                //     return false;
                // }else {
                //     return confirm("确认添加培训计划？");
                // }
                layer.load();
                this.data={"title":$("#add_title").val(),"startDate":$("#add_startDate").val(),"endDate":$("#add_endDate").val(),"startTime":$("#add_startTime").val(),"endTime":$("#add_endTime").val(),"content":$("#add_content").val(),"count":$("#add_count").val(),"credential":$("#add_credential").val()};
            }
            ,bindAction: '#test9'
            ,done: function(res){
                layer.msg(res);
                console.log(res)
            }
        });

    });


</script>
<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-normal" type="button" lay-event="detail">查看详情</button>
    <button class="layui-btn layui-btn-normal" type="button" lay-event="update">修改</button>
    <button class="layui-btn layui-btn-normal" type="button" lay-event="delete">删除</button>
</script>
</body>
<div id="detail_div" style="width: 350px;height: 350px;text-align: center;display: none">
    <table class="layui-table" lay-skin="line">
        <tr>
            <td>培训标题</td>
            <td id="title"></td>
        </tr>
        <tr>
            <td>培训开始时间</td>
            <td id="startDate"></td>
        </tr>
        <tr>
            <td>培训结束时间</td>
            <td id="endDate"></td>
        </tr>
        <tr>
            <td>培训时间段</td>
            <td id="time"></td>
        </tr>
        <tr>
            <td>培训内容</td>
            <td id="content"></td>
        </tr>
        <tr>
            <td>培训人数</td>
            <td id="count"></td>
        </tr>
        <tr>
            <td>培训时长</td>
            <td id="length"></td>
        </tr>
        <tr>
            <td>认证证书</td>
            <td id="credential"></td>
        </tr>
    </table>

</div>

<div id="update_div" style="width: 350px;height: 390px;text-align: center;display: none">
    <table class="layui-table" lay-skin="line">
        <tr>
            <td>培训标题</td>
            <td><input class="layui-input" id="upd_title"></td>
        </tr>
        <tr>
            <td>培训开始时间</td>
            <td><input class="layui-input" type="date"  id="upd_startDate"></td>
        </tr>
        <tr>
            <td>培训结束时间</td>
            <td><input class="layui-input" type="date"  id="upd_endDate"></td>
        </tr>
        <tr>
            <td>培训时间段</td>
            <td><select name="startTime" id="startTime" class="layui-select">
                <option></option></select>-
                <select name="endTime" id="endTime" class="layui-select">
                    <option></option></select>
            </td>
        </tr>
        <tr>
            <td>培训内容</td>
            <td><input class="layui-input"  id="upd_content"></td>
        </tr>
        <tr>
            <td>培训人数</td>
            <td><input class="layui-input"  id="upd_count"></td>
        </tr>
        <tr>
            <td>培训时长</td>
            <td id="upd_length"></td>
        </tr>
        <tr>
            <td>认证证书</td>
            <td><select name="upd_credential" id="upd_credential" class="layui-select">
                <option></option>
            </select></td>
        </tr>
    </table>

</div>

<div id="add_div" style="width: 350px;height: 520px;text-align: center;display: none">
    <table class="layui-table" lay-skin="line">
        <tr>
            <td>培训标题</td>
            <td><input class="layui-input" id="add_title"></td>
        </tr>
        <tr>
            <td>培训开始时间</td>
            <td><input class="layui-input" type="date"  id="add_startDate"></td>
        </tr>
        <tr>
            <td>培训结束时间</td>
            <td><input class="layui-input" type="date"  id="add_endDate"></td>
        </tr>
        <tr>
            <td>培训时间段</td>
            <td><select name="add_startTime" id="add_startTime" class="layui-select">
                <option></option></select>-
                <select name="add_endTime" id="add_endTime" class="layui-select">
                    <option></option></select>
            </td>
        </tr>
        <tr>
            <td>培训内容</td>
            <td><input class="layui-input"  id="add_content"></td>
        </tr>
        <tr>
            <td>培训人数</td>
            <td><input class="layui-input"  id="add_count"></td>
        </tr>
        <tr>
            <td>认证证书</td>
            <td><select name="add_credential" id="add_credential" class="layui-select">
                <option></option>
            </select></td>
        </tr>

        <tr>
            <td colspan="2" height="80px">
                <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
            </td>
        </tr>

        <tr>
            <td colspan="2" height="80px" style="text-align: center">
                <button type="button" class="layui-btn layui-btn-normal" id="test9">提交</button>
            </td>
        </tr>

    </table>

</div>

</html>
