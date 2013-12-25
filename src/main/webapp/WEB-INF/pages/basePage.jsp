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
    <li><a href="/t3">Content page 6</a></li>
    <li><a href="/t4">Content page 7</a></li>
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


<%--
<script>
   // alert("1");
//    (function(window){


//    $(window).on("popstate", function(e) {
//        //handlePopstate(e);
//        console.log('popstate fired!'+e);
//    });

    //if ("pushState" in history) {
        //$(document).on("click", "a", function(evt){

//    $('a').click(function (evt) {
           // console.log(evt+'click fired!'+this.href);
           // history.pushState(null, this.textContent, this.href);
           // $('#content').load(this.href);
           // return false;
       // });​
    //}
//    })(window);

   // (function(window){
        $(window).on("popstate", function(e) {
            //handlePopstate(e);
            //console.log('popstate fired!'+e);
            alert("5"+ e.state+document.location.pathname);
            $('#content').load(document.location.pathname);
        });
   // })(window);


  // if ("pushState" in history) {
   $(document).on("click", "a", function(evt){

    //$('a').click(function (evt) {
        //alert("2"+evt);
        alert("3"+this.href);
        //alert("4"+history);
        var url = $(this).attr('href');
//       // console.log(evt+'click fired!'+this.href);
//
//        if (url) {
//            if (url.indexOf('javascript:;') == 0) {
//                return true;
//            }

       evt.preventDefault();
            history.pushState(null, $(this).text(), url);
           $('#content').load(url);
//
//        }
    });
  // }

</script>



<script src="//browserstate.github.io/history.js/scripts/bundled/html5/jquery.history.js"></script>

<script>
    (function (window) {

        var History = window.History;

        History.Adapter.bind(window, 'statechange', function () {
            var State = History.getState();
            $('#content').load(State.url);
        });

        $('a').click(function (evt) {
            var url = $(this).attr('href');

            if (url) {
                if (url.indexOf('javascript:;') == 0) {
                    return true;
                }
                evt.preventDefault();
                History.pushState(null, $(this).text(), url);
                $('#content').load(url);
            }
        });
    })(window);
</script>

--%>



<script>

    (function(window){
    $(window).on("popstate", function(e) {
        //handlePopstate(e);
        //console.log('popstate fired!'+e);
        alert("5"+ e.state+document.location.pathname);
//        var path = window.location.href.replace(window.location.origin,"");
        $('#content').load(document.location.pathname);
    });
    })(window);

//        history.Adapter.bind(window, 'statechange', function () {
//            var State = history.getState();
//            $('#content').load(State.url);
//        });
    if ("pushState" in history) {
        $('a').click(function (evt) {

            var url = $(this).attr('href');

            alert("3"+this.href);

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
