<%--
  Created by IntelliJ IDEA.
  User: ZhangZeMing
  Date: 2020/9/8
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
    %>
    <title>发布需求</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${pageContext.request.contextPath}/static/js/1.9.1jquery.min.js" charset="utf-8" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"  media="all">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/js/postDemand.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>需求信息</legend>
</fieldset>

<form class="layui-form">
    <input id="userId" name="userId" value="" style="display: none"  type="text">
    <div class="layui-form-item">
        <label class="layui-form-label">详细地址：</label>
        <div class="layui-input-block">
            <input type="text" name="address" id="address" required  lay-verify="required" placeholder="请填写详细的服务地址" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">服务类别：</label>
        <div class="layui-input-block">
            <select name="classService" id="classService" lay-verify="required">
                <option value=""></option>
                <option value="品类保洁">品类保洁</option>
                <option value="月嫂">月嫂</option>
                <option value="保姆">保姆</option>
                <option value="家教">家教</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">服务频次：</label>
        <div class="layui-input-block">
            <select name="serviceCount" id="serviceCount" lay-verify="required">
                <option value=""></option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="title" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">要求描述：</label>
        <div class="layui-input-block">
            <textarea name="described" id="described" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">联系方式：</label>
        <div class="layui-input-block">
            <input type="text" name="phone" id="phone" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" onclick="postDemand(this)">提交</button>
            <button class="layui-btn" type="button" onclick="guanbi()">取消</button>
        </div>
    </div>
</form>

</body>

<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>
</html>
