<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook"%>
<%@ page session="false"%>
<%--
<jsp:include page="/WEB-INF/view/web/base/baseFrameHead.jsp">
    <jsp:param value="welcome.title" name="titleMessageCode" />
</jsp:include>
--%>

<link rel="stylesheet" href="/res/css/user.css?2013" type="text/css" media="screen, projection" />

<div class="container" style="margin-top: 60px;">
    <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Info</strong> ${user}[${owner.firstName} ] ${user} ${currentDevice } ${currentDevice == 'normal'} ${currentDevice == 'NORMAL'} ${currentDevice.normal} ${currentDevice.mobile} ${currentDevice.tablet} [${param.error}] [${error}]
    </div>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-1"></div>
                <div class="col-xs-12 col-lg-4 well">
                    <p>
                        Or you can <a href="/user/join">가입</a> with a new account.
                    </p>

                    <h3>Sign in via a provider:</h3>
                    <p>(Uses SocialAuthenticationFilter)</p>

                    <!-- TWITTER SIGNIN -->
                    <p>
                        <a target="_self" href="/auth/twitter"><img src="/res/image/social/twitter/sign-in-with-twitter-d.png" border="0" /></a>
                    </p>

                    <!-- FACEBOOK SIGNIN -->
                    <p>
                        <a target="_self" href="/auth/facebook"><img src="/res/image/social/facebook/sign-in-with-facebook.png" border="0" /></a><br />
                    </p>
                </div>
                <div class="col-xs-12 col-lg-1"></div>
                <div class="col-xs-12 col-lg-5 well">

                    <div class="formInfo">
                        <c:if test="${error eq 'bad_credentials'}">
                            <div class="error">
                                Your sign in information was incorrect. Please try again or <a href="/user/join">가입</a>.
                            </div>
                        </c:if>
                        <c:if test="${param.error eq 'multiple_users'}">
                            <div class="error">Multiple local accounts are connected to the provider account. Try again with a different provider or with your username and password.</div>
                        </c:if>
                    </div>

                    <form class="form-signin" action="/user/login" method="post">
                        ${param.error}
                        <h2 class="form-signin-heading">Please sign in</h2>
                        <input id="url" name="url" type="hidden" maxlength="16" value="${preUrl}" tabindex="1" /> <input type="text" name="userId" class="input-block-level" placeholder="id" <c:if test="${not empty signinErrorMessage}">value="${SPRING_SECURITY_LAST_USERNAME}"</c:if>> <input type="password" name="password" class="input-block-level" placeholder="Password"> <label class="checkbox"> <input type="checkbox" value="remember-me"> Remember me
                    </label>
                        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
                    </form>
                </div>
                <div class="col-xs-12 col-lg-1"></div>
            </div>
        </div>
    </section>




    <c:if test="${_USER.logged == true}">
        이미 로그인 되어 있습니다.
    </c:if>


</div>
<!-- /container -->
<script type="text/javascript">
    //document.cookie = "returnUrl=" + window.location.hash + "; expires=-1; path=/";


</script>