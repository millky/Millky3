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
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
<!--<![endif]-->

<script>

var browser = (function()
{
    var s = navigator.userAgent.toLowerCase();
    var match = /(webkit)[ \/](\w.]+)/.exec(s) || /(opera)(?:.*version)?[ \/](\w.]+)/.exec(s) || /(msie) ([\w.]+)/.exec(s) || !/compatible/.test(s) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(s) || [];
    return {
        name : match[1] || "",
        version : match[2] || "0"
    };
}());

//    jQuery(document).ready(function($)
//    {
//    //alert("s");
//    $(document).on("click", "a", function(e)
//    {
//        var url = $(this).attr('href');
//        alert(url+$.history);
//        $.history.load(url, false);
//    });
//    });

    (function($) {
        var locationWrapper = {
            put: function(hash, win) {

                alert("hash="+hash);
                //(win || window).location.hash = this.encoder(hash);


                $('#content').load(hash);
            },
            get: function(win) {
                alert("hawinsh="+win);
                var hash = ((win || window).location.hash).replace(/^#/, '');
                try {
                    return browser.mozilla ? hash : decodeURIComponent(hash);
                }
                catch (error) {
                    return hash;
                }
            },
            encoder: encodeURIComponent
        };


        function initObjects(options) {
            options = $.extend({
                unescape: false
            }, options || {});

            locationWrapper.encoder = encoder(options.unescape);

            function encoder(unescape_) {
                if(unescape_ === true) {
                    return function(hash){ return hash; };
                }
                if(typeof unescape_ == "string" &&
                        (unescape_ = partialDecoder(unescape_.split("")))
                        || typeof unescape_ == "function") {
                    return function(hash) { return unescape_(encodeURIComponent(hash)); };
                }
                return encodeURIComponent;
            }

            function partialDecoder(chars) {
                var re = new RegExp($.map(chars, encodeURIComponent).join("|"), "ig");
                return function(enc) { return enc.replace(re, decodeURIComponent); };
            }
        }

        var implementations = {};

        implementations.base = {
            callback: undefined,
            type: undefined,

            check: function() {},
            load:  function(hash) {},
            init:  function(callback, options) {
                initObjects(options);
                self.callback = callback;
                self._options = options;
                self._init();
            },

            _init: function() {},
            _options: {}
        };



        implementations.hashchangeEvent = {
            _init: function() {
                self.callback(locationWrapper.get());
                $(window).bind('hashchange', self.check);
            },
            check: function() {
                self.callback(locationWrapper.get());
            },
            load: function(hash) {
                locationWrapper.put(hash);
            }
        };

        var self = $.extend({}, implementations.base);

        if("onhashchange" in window) {
            self.type = 'hashchangeEvent';
        } else {
            alert("err2");
        }

        $.extend(self, implementations[self.type]);
        $.history = self;
    })(jQuery);





(function($){
    var origContent = "";

    function loadContent(hash) {
        if(hash != "") {
            if(origContent == "") {
                origContent = $('#content').html();
            }
            $('#content').load(hash +".html",
                    function(){ prettyPrint(); });
        } else if(origContent != "") {
            $('#content').html(origContent);
        }
    }

    $(document).ready(function() {
        $.history.init(loadContent);
        $(document).on("click", "a", function(e) {
            var url = $(this).attr('href');
            alert(url+$.history);
            url = url.replace(/^.*#/, '');
            $.history.load(url);
            return false;
        });
    });
})(jQuery);


</script>

</body>
</html>