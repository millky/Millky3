<%--
  Created by IntelliJ IDEA.
  User: dklee
  Date: 2013. 12. 25.
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Millky.com</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="-1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="Memory of my life, Millky; 내 삶의 기억, 밀키"/>
    <meta name="keywords" content="Millky, Memory, Life, 밀키, 기억, 기록, 삶, 일상"/>
    <meta name="author" content="origoni">
    <meta name="title" content="Millky; 밀키"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="stylesheet" href="/res/css/bootstrap.min.css?${staticVer}"/>
    <link rel="stylesheet" href="//hackerwins.github.io/summernote/summernote.css"/>
    <link rel="stylesheet" href="/res/css/globalStyle.css?v=${staticVer}"/>
    <link rel="stylesheet" href="/res/css/main.css?v=${staticVer}"/>
</head>
<body>
<section id="baseFrame"></section>

<ul class="content_links">
    <li><a href="/t3">Content page 3</a></li>
    <li><a href="/t4">Content page 4</a></li>
</ul>
<div id="content">
    <p>Content within this box is replaced with content from supporting pages using javascript and AJAX.
</div>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
<!--<![endif]-->

<script>

    $(window).on("popstate", function (e) {

        var path = document.location.pathname;
        if (path == "/") {
            path = "/default/t1";
        }
        $('#content').load(path);
    });

    if ("pushState" in history) {
        $('a').click(function (evt) {

            var url = $(this).attr('href');

            if (url) {
                if (url.indexOf('javascript:;') == 0) {
                    return true;
                }
                evt.preventDefault();
                history.pushState(null, $(this).text(), url);
                $('#content').load(url);
            }
        });
    }
</script>

</body>
</html>
