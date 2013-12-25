<!DOCTYPE html>
<html>
<head>
    <title>Millky.com</title>
    <meta charset="UTF-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Memory of my life, Millky; 내 삶의 기억, 밀키" />
    <meta name="keywords" content="Millky, Memory, Life, 밀키, 기억, 기록, 삶, 일상" />
    <meta name="author" content="origoni">
    <meta name="title" content="Millky; 밀키" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
    <link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>
<h1>${message}</h1>

<p>test</p>


<!-- Textarea for Logging -->
<textarea id="log" style="width:100%;height:400px"></textarea>

<!-- Note -->
<p>Click through the buttons in order and you'll get the results demonstrated in the <a href="../README.md">README.md</a> file.</p>

<!-- Buttons -->
<ul id="buttons">
</ul>


<ul class="content_links">
    <li><a href="/historyapi/pages/content_page_1.html">Content page 1</a></li>
    <li><a href="/historyapi/pages/content_page_2.html">Content page 2</a></li>
    <li><a href="/historyapi/pages/content_page_3.html">Content page 3</a></li>
    <li><a href="/historyapi/pages/content_page_4.html">Content page 4</a></li>
    <li><a href="/historyapi/pages/content_page_5.html">Content page 5</a></li>
    <li><a href="/t3">Content page 6</a></li>
    <li><a href="/t4">Content page 7</a></li>
</ul>
<div id="content">
    <p>Content within this box is replaced with content from supporting pages using javascript and AJAX.
</div>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="//oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
<!--<![endif]-->

<script src="//browserstate.github.io/history.js/scripts/bundled/html5/jquery.history.js"></script>
<script>
    (function(window){

        var History = window.History;

        History.Adapter.bind(window,'statechange',function(){
            var State = History.getState();
  //          History.log('statechange:', State.data, State.title, State.url);
            $('#content').load(State.url);
        });

            $('a').click(function(evt) {
        //$(document).on("click", "a", function(evt){
                var url = $(this).attr('href');

                if (url)
                {
                    if (url.indexOf('javascript:;') == 0)
                    {
                        return true;
                    }



                    evt.preventDefault();
                    History.pushState(null, $(this).text(), url);
                    $('#content').load(url);
                }
            });


//        $(document).on("click", "a", function(e)
//        {
//            var url = $(this).attr('href');
//            // preUrl = window.location.hash;
//            // alert(1 +" "+ uriEncode(window.location.hash));
//
//            document.cookie = "preUrl=" + uriEncode(window.location.hash) + "; expires=-1; path=/";
//
//            if (url)
//            {
//                if (url.indexOf('javascript:;') == 0)
//                {
//                    return true;
//                }
//
//                if (url.indexOf('#') == 0)
//                {
//                    // http://www.paulund.co.uk/smooth-scroll-to-internal-links-with-jquery
//                    e.preventDefault();
//                    $('#baseLoading').css('filter', 'alpha(opacity=90)').fadeIn('fast');
//                    var target = this.hash, $target = $(target);
//                    if ($target.offset() == undefined)
//                    {
//                        $target = $('#baseFrame');
//                    }
//
//                    $('html, body').stop().animate({
//                        'scrollTop' : $target.offset().top - 50
//                    }, 500, 'swing', function()
//                    {
//                        $('#baseLoading').fadeOut('slow');
//                    });
//                    return false;
//                }
//
//                var onclickEvent = $(this).prop('onclick'); // 없으면 null반환
//                var relTarget = $(this).prop('target'); // 없으면 ''반환
//                $('#baseLoading').css('filter', 'alpha(opacity=70)').fadeIn();
//                // 물음표(?)로 시작하는것이 있으면 지금 주소에다가 뒤의것을 붙여준다.
//                if (url.indexOf('?') == 0)
//                {
//                    var hash = window.location.hash.replace(/^#/, '');
//                    var hashIdx = hash.indexOf('?');
//                    if (hashIdx > -1)
//                    {
//                        // 이전에 이미 다른 파라미터가 있을경우 병합 해 줘야 한다.
//                        var hashUrl = hash.substring(0, hashIdx);
//                        var hashQuery = hash.substring(hashIdx + 1);
//
//                        var urlQuery = url.substring(1);
//                        var queryString = (hashQuery + "&" + urlQuery).split("&");
//
//                        var queryMap = new Object();
//                        for (var iParam = 0; iParam < queryString.length; iParam++)
//                        {
//                            var aParam = queryString[iParam].split("=");
//                            queryMap[aParam[0]] = aParam[1];
//                        }
//
//                        var newQueryString = "";
//
//                        for ( var prop in queryMap)
//                        {
//                            newQueryString = newQueryString + "&" + prop + "=" + queryMap[prop];
//                        }
//
//                        newQueryString = newQueryString.substring(1);
//
//                        $.history.load(hashUrl + "?" + newQueryString, false);
//                    } else
//                    {
//                        $.history.load(hash + url, false);
//                    }
//
//                    if (url.indexOf('language=') >= 0)
//                    {
//                        setTimeout("$.post('/base/global/footer', {}, function(data) { $('#footerFrame').html(data); });", 1000);
//                        setTimeout("$.post('/base/global/navigation', {}, function(data) { $('#headerFrame').html(data); });", 2000);
//                    }
//
//                    return false;
//                }
//                // 로컬 호스트와 같으면 잘라버리는건 어떨까?
//                // 시작 URL이 7 이하면? 그것은!!! 내부것!!!
//                if (browser.msie && (browser.version < 8 || document.documentMode < 8))
//                {
//                    if (url.indexOf(window.location.host) > 5)
//                    {
//                        url = url.replace('http://', '');
//
//                        var i = 0;
//                        if (url.indexOf('#') > -1)
//                        {
//                            i = 1;
//                        }
//
//                        url = url.substring((url.indexOf('/')) + i, url.length);
//                    }
//                }
//                if (url.indexOf('://') > 2 && url.indexOf('://') < 10)
//                {
//                    window.open(url);
//                    $('#baseLoading').fadeOut('slow');
//                    return false;
//                }
//                if (onclickEvent == null && relTarget == '')
//                {
//                    // Google Analytics
//                    // millky, myhome등 전면 화면 이동시
//                    _gaq.push([ '_trackPageview', url ]);
//
//                    $.history.load(url, false);
//                    $('html, body').animate({
//                        scrollTop : 0
//                    }, 333);
//                    return false;
//                }
//
//                if (onclickEvent == null && relTarget != '')
//                {
//                    if (relTarget == '_brank')
//                    {
//                        window.open(url);
//                        $('#baseLoading').fadeOut('slow');
//                        return false;
//                    }
//
//                    if (relTarget == '_self' || relTarget == '_parent' || relTarget == '_top')
//                    {
//                        location.href = url;
//                        return false;
//                    }
//
//                    if (relTarget.indexOf('#') == 0)
//                    {
//                        $.post(url, {}, function(data)
//                        {
//                            // Google Analytics
//                            // inner 같은 페이지에서 작은 부분 변경시
//                            _gaq.push([ '_trackPageview', url ]);
//                            $(relTarget).html(data);
//                            $('html, body').animate({
//                                scrollTop : 0
//                            }, 333);
//                            $('#baseLoading').fadeOut('slow');
//                        });
//
//                        $.history.load(url, true);
//
//                        return false;
//                    } else
//                    {
//                        $('#baseLoading').fadeOut('slow');
//                        // #이 안붙은것에 대한 처리를 고민하자.
//                    }
//                } else
//                {
//                    $('#baseLoading').fadeOut('slow');
//                    // rel이 없는것은 단순 자바스크립트다. 원하는걸 실행해주면 됨
//                }
//            }
//            // url이 없는것은 단순 자바스크립트다. 원하는걸 실행해주면 됨
//        });





    })(window);


//alert("s");
//    $(function() {
//
//        // Prepare
//        var History = window.History; // Note: We are using a capital H instead of a lower h
//        if ( !History.enabenabled ) {
//            // History.js is disabled for this browser.
//            // This is because we can optionally choose to support HTML4 browsers or not.
//            alert("f");
//            return false;
//        }
//        alert("t");
//
//        // Bind to StateChange Event
//        History.Adapter.bind(window,'statechange',function() { // Note: We are using statechange instead of popstate
//            var State = History.getState();
//            $('#content').load(State.url);
//            /* Instead of the line above, you could run the code below if the url returns the whole page instead of just the content (assuming it has a `#content`):
//             $.get(State.url, function(response) {
//             $('#content').html($(response).find('#content').html()); });
//             });
//             */
//
//            // Capture all the links to push their url to the history stack and trigger the StateChange Event
//            $('a').click(function(evt) {
//                evt.preventDefault();
//                History.pushState(null, $(this).text(), $(this).attr('href'));
//            });
//        });
//    });
</script>

</body>
</html>