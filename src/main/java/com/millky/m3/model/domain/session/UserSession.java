/*
 * Copyright 2001 - 2010 Byuri.net, All right reserved.
 *
 *     http://byuri.net
 *
 * And if you have a question, call : 82-11-410-1511
 */
package com.millky.m3.model.domain.session;

import lombok.Data;

/**
 * <pre>
 * 사용자 세션 정보를 저장합니다.
 * </pre>
 *
 * @author byuri
 * @since 2010. 4. 23.
 * @version 2010. 4. 23. byuri : create
 *
 */
@Data
public class UserSession
{
    private boolean logged;
    private java.util.Date loginDate;

    private int userIdx;
    private int homeIdx;

    private String userId;

    private String userName;
    private String nickName;
    private int userPoint;
    private int userLevel;

    private String profileImagePath;
    private String userIp;
}
