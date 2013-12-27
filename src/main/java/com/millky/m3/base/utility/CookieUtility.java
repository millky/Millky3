package com.millky.m3.base.utility;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <pre>
 * 쿠키 유틸
 * CookieUtils cookieUtils = new CookieUtils(request, response);
 * 이렇게 생성해서 쓸 것
 * </pre>
 *
 * @author byuri
 * @since 2010. 3. 6.
 * @version 2010. 3. 6. byuri : create
 *
 */
// @Component
public class CookieUtility
{
    private Map<String, String> cookieMap = new HashMap<String, String>();
    private HttpServletResponse response;

    /**
     * @param request
     * @param response
     */
    public CookieUtility(HttpServletRequest request, HttpServletResponse response)
    {
        Cookie[] cookies = request.getCookies();
        this.response = response;

        if (cookies == null)
        {
            return;
        }

        for (Cookie cookie : cookies)
        {
            try
            {
                cookieMap.put(cookie.getName(), URLDecoder.decode(cookie.getValue(), "UTF-8"));
            }
            catch (UnsupportedEncodingException e)
            {
                e.printStackTrace();
            }
        }
    }

    /**
     * <pre>
     * 쿠키를 가지고 온다
     * </pre>
     *
     * @author byuri
     * @since 2010. 3. 6.
     *
     * @param name
     * @return
     */
    public String getCookie(String name)
    {
        if (cookieMap == null)
        {
            return null;
        }
        else
        {
            return cookieMap.get(name);
        }
    }


    /**
     * <pre>
     * 브라우저 종료시 삭제되는 쿠키를 생성한다.
     * Session Cookie
     * </pre>
     *
     * @author byuri
     * @since 2010. 3. 6.
     *
     * @param name
     * @param value
     */
    public void setCookie(String name, String value)
    {
        setCookie(name, value, -1);
    }

    /**
     * <pre>
     * 쿠키를 생성한다.
     * </pre>
     *
     * @author byuri
     * @since 2010. 3. 6.
     *
     * @param name
     * @param value
     * @param maxAge
     */
    public void setCookie(String name, String value, int maxAge)
    {
        Cookie cookie;
        try
        {
            cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));

            cookie.setMaxAge(maxAge);
            cookie.setPath("/");

            this.response.addCookie(cookie);
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
    }


    /**
     * <pre>
     * 쿠키를 제거한다
     * </pre>
     *
     * @author byuri
     * @since 2010. 10. 22.
     *
     * @param name
     */
    public void removeCookie(String name)
    {
        Cookie cookie;

        cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");

        this.response.addCookie(cookie);
    }
}
