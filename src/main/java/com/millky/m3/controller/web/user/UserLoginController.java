package com.millky.m3.controller.web.user;

import com.millky.m3.base.utility.CookieUtility;
import com.millky.m3.model.domain.command.UserLoginCommand;
import com.millky.m3.model.domain.session.UserSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* Created by dklee on 2013. 12. 28..
*/
@Slf4j
@Controller
public class UserLoginController {

    /**
     * <pre>
     * 로그인 폼
     * </pre>
     *
     * @author byuri
     * @since 2011. 5. 19.
     *
     * @return
     */
    @RequestMapping(value = { "/user/login" }, method = RequestMethod.GET)
    public String showLoginFormMo(HttpServletRequest request, HttpServletResponse response, Model model, UserSession userSession)
    {
        // ////////////////////////////////////////////////////////
        String referrer = request.getHeader("referer");
        System.out.println("showLoginFormMo : referrer=" + referrer);

        CookieUtility cookie = new CookieUtility(request, response);
        String preUrl = cookie.getCookie("preUrl");
        System.out.println("preUrl=" + preUrl);
        if (preUrl != null && !preUrl.isEmpty() && !preUrl.equals("#/user/join") && !preUrl.equals("#/user/login"))
        {
            cookie.setCookie("returnUrl", preUrl.substring(1));
            model.addAttribute("preUrl", preUrl.substring(1));
        }
        // ////////////////////////////////////////////////////////

        log.info("userSession.isLogged()={}", userSession.isLogged());

        String error = ServletRequestUtils.getStringParameter(request, "param.error", "");

        log.info("error=" + error);

        model.addAttribute("param.error", error);
        model.addAttribute("error", error);

        return "user/loginForm";
    }


//    /**
//     * <pre>
//     * 로그인
//     * </pre>
//     *
//     * @author byuri
//     * @since 2011. 5. 19.
//     *
//     * @param request
//     * @param response
//     * @param userLoginCommand
//     * @return
//     */
//    @RequestMapping(value = { "/user/login" }, method = RequestMethod.POST)
//    public String login(NativeWebRequest request, HttpServletResponse response, UserLoginCommand userLoginCommand)
//    {
//        String userId = userLoginCommand.getUserId();
//        String password = userLoginCommand.getPassword();
//        com.millky.m3.model.domain.entity.user.User user = userDao.getUserDataByUserIdAndPassword(userId, password);
//
//        if (user == null)
//        {
//            return "redirect:/user/login?param.error=bad_credentials";
//        }
//
//        SignInUtils.signin(userLoginCommand.getUserId());
//        ProviderSignInUtils.handlePostSignUp(userLoginCommand.getUserId(), request);
//
//        loginHistoryService.insertLoginHistory(request, user.getUserIdx());
//
//
//        String url = userLoginCommand.getUrl();
//        // URL 정보가 있는지 확인한다. 없을 경우 리퍼러로 대체
//        if (url == null || url == "")
//        {
//            HttpServletRequest request2 = (HttpServletRequest) request.getNativeRequest();
//            CookieUtility cookie = new CookieUtility(request2, response);
//            url = cookie.getCookie("preUrl");
//
//            System.out.println("returnUrl=" + url);
//            // url = request.getHeader("REFERER");
//        }
//        return "redirect:" + url;
//    }


}
