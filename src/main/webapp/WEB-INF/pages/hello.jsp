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
        //var State = History.getState(true,true);

//        History.log('initial:', State.data, State.title, State.url);

        History.Adapter.bind(window,'statechange',function(){
            var State = History.getState();
  //          History.log('statechange:', State.data, State.title, State.url);
            $('#content').load(State.url);
        });

            $('a').click(function(evt) {
                evt.preventDefault();
                History.pushState(null, $(this).text(), $(this).attr('href'));
                $('#content').load($(this).attr('href'));
            });

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