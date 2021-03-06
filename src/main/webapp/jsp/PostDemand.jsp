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
    <script src="../static/js/1.9.1jquery.min.js" charset="utf-8" type="text/javascript"></script>
    <link href="../static/css/tcommon.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="../static/css/common.css" />
    <link type="text/css" rel="stylesheet" href="../static/css/index.css" />
    <link type="text/css" rel="stylesheet" href="../static/css/swiper.css" />
    <link type="text/css" rel="stylesheet" href="../static/css/animate.css" />
    <script type="text/javascript" src="../static/js/1.9.1jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8" src="../static/js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/js/swiper.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/js/wow.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/js/tcommon-1.0.js"></script>
    <script src="../static/js/index.js" charset="utf-8" type="text/javascript"></script>
    <script src="../static/layui/layui.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/layui/css/layui.css"  media="all">
    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <script src="../static/js/postDemand.js"></script>
</head>
<body>
<!-- header -->
<div class="header">
    <div class="header-top">
        <div class="content">
            <p>欢迎来到XXXX网站！</p>
        </div>
    </div>
    <div class="header-center">
        <h1><a href="">XXXX智慧家政</a></h1>
        <h2><img src="../static/images/logo_text.png"></h2>
        <div class="search">
            <form>
                <input  id="titles" type="text" name="word" placeholder="家庭清洁">
                <button id="btn" type="button" >搜　索</button>
            </form>
        </div>
        <div class="phone">
            全国服务热线：<b>400-00-00000</b>
        </div>
    </div>
    <div class="header-nav">
        <div class="content" id="navBox">
            <ul>
                <li><a href="../jsp/Page_Main.jsp" target="_self">首页</a></li>

                <li mark='65' px='1'>
                    <a href="../jsp/jzfw.jsp" target="_self">家政服务</a>
                </li>

                <li mark='47' px='2'>
                    <a href="../jsp/jzfw_Hot.jsp" target="_self">热门服务</a>
                </li>

                <li mark='88' px='3'>
                    <a href="../jsp/PostDemand.jsp" target="_self">发布服务</a>
                </li>

                <li mark='89' px='4'>
                    <a href="../jsp/Main_lxpt.jsp" target="_self">联系平台</a>
                </li>

                <li mark='48' px='6'>
                    <a href="../jsp/Main_ruzhu.jsp" target="_self">品牌招商</a>
                </li>

                <li mark='52' px='5'>
                    <a href="../jsp/Main_gypt.jsp" target="_self">关于平台</a>
                </li>

                <li mark='71' px='7'>
                    <a href="../jsp/jzfw_news.jsp" target="_self">知识了解</a>
                </li>

            </ul>
        </div>
    </div>
</div>

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
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
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
<script type="text/javascript">
    window.onload = function(){
        var titles = document.getElementById("titles");
        var btn = document.getElementById("btn");
        btn.onclick = function(){
            if(titles.value == "家庭清洁"){
                url = "../jsp/jzfw_qj.jsp";
            }else if(titles.value == "企业清洁"){
                url = "../jsp/jzfw_qyqj.jsp";
            }else if(titles.value == "保姆"){
                url = "../jsp/jzfw_bm.jsp";
            }else if(titles.value == "月嫂"){
                url = "../jsp/jzfw_ys.jsp";
            }else if(titles.value == "育婴"){
                url = "../jsp/jzfw_yy.jsp";
            }else if(titles.value == "钟点工"){
                url = "../jsp/jzfw_zdg.jsp";
            }else if(titles.value == "医院陪护"){
                url = "../jsp/jzfw_yyph.jsp";
            }
            window.location.href = url;
        }
    }
</script>