package com.millky.m3.model.domain.entity.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

import com.millky.m3.base.Setting;

/**
 * <pre>
 * 그냥 User는 오라클에서 못만든다
 * </pre>
 *
 * @author byuri
 * @since 2010. 2. 13.
 *
 */
@Data
@Entity
@Table(name = Setting.DB_TABLE_USER_PREFIX_NAME + "USER")
public class User implements Serializable
{
    private static final long serialVersionUID = Setting.SERIAL_VERSION_UID;

    @Column(name = "ROLE")
    private String role = "ROLE_USER";

    @Column(name = "FIRST_NAME")
    private String firstName;

    @Column(name = "LAST_NAME")
    private String lastName;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "USER_IDX", nullable = false)
    private int userIdx;

    @Column(name = "USER_ID", length = 16, nullable = false)
    private String userId;

    @Column(name = "USER_NAME", length = 20, nullable = true)
    private String userName;

    // @Column(name = "USER_ENG_NAME", length = 20)
    // private String userEngName;

    @Column(name = "NICK_NAME", length = 16, nullable = false)
    private String nickName;

    @Column(name = "PASSWORD", length = 16, nullable = false)
    private String password;

    @Column(name = "USER_POINT", nullable = false)
    private int userPoint;

    @Column(name = "USER_LEVEL", nullable = false)
    private int userLevel; // 그냥 level은 "심각: ORA-00904: : 부적합한 식별자" 발생

    @Column(name = "NATION_CODE", length = 2)
    private String nationCode;

    @Column(name = "SEX_FLAG")
    private boolean sexFlag;
    @Column(name = "SEX_VIEW_CODE", length = 8)
    private String sexViewCode;

    @Column(name = "EMAIL")
    private String email;
    @Column(name = "EMAIL_VIEW_CODE", length = 8)
    private String emailViewCode;

    /**
     * EXT?
     */
    @Column(name = "EMAIL_RCV_FLAG")
    private boolean emailRcvFlag;

    @Column(name = "BLOOD_TYPE", length = 2)
    private String bloodType;

    /**
     * EXT?
     */
    @Column(name = "LAST_VISITED_DATE")
    private java.util.Date lastVisitedDate;

    /**
     * EXT?
     */
    @Column(name = "LAST_READ_DATE")
    private java.util.Date lastReadDate;

    /**
     * EXT?
     */
    @Column(name = "LOGIN_COUNT", nullable = false)
    private int loginCount;

    @Column(name = "BIRTH_DATE")
    private java.util.Date birthDate;
    @Column(name = "BIRTH_VIEW_CODE", length = 8)
    private String birthViewCode;

    @Column(name = "PROFILE_IMAGE_PATH", length = 255)
    private String profileImagePath;

    /**
     * EXT?
     */
    @Column(name = "MSG_RCV_CODE", length = 8)
    private String msgRcvCode;

    /**
     * EXT?
     */
    @Column(name = "REG_DATE")
    private java.util.Date regDate;

    @Column(name = "STATUS_CODE", length = 8)
    private String statusCode;
}
