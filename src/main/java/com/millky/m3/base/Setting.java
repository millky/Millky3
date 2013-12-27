package com.millky.m3.base;


public class Setting
{
    public final static int BASE_BOARD_IDX = 1;

    public final static int BASE_COMMENT_PAGE_SIZE = 10;

    public final static String VIEW_AUTH_CODE_PUBLIC = "VIAUTH00";
    public final static String VIEW_AUTH_CODE_PRIVATE = "VIAUTH10";

    public final static String CONTENT_STATUS_CODE_NORMAL = "CONTST00";
    public final static String CONTENT_STATUS_CODE_DELETE = "CONTST10";

    public final static String ES_SERVER_IP = "127.0.0.1";

    public final static String ES_INDEX = "m2";


    /**
     * 3000 = 3sec
     */
    public final static int ARTICLE_READ_COUNT_UPDATE_DELAY = 3000;

    /**
     * 3600000 = 1hour
     */
    public final static int ARTICLE_READ_IP_CLEAR_DELAY = 3600000;

    // //////////////////////////////////////////////

    public final static int BASE_NAVIGATION_SIZE = 10;
    public final static int BASE_PAGE_SIZE = 15;

    public static final long SERIAL_VERSION_UID = 20130127022223L;

    /**
     * DB접두어
     */
    public final static String DB_TABLE_BASE_PREFIX_NAME = "B_"; // DB접두어
    public final static String DB_TABLE_CONTENTS_PREFIX_NAME = "C_"; // DB접두어
    public final static String DB_TABLE_HISTORY_PREFIX_NAME = "H_"; // DB접두어
    public final static String DB_TABLE_META_PREFIX_NAME = "M_"; // DB접두어
    public final static String DB_TABLE_SPACE_PREFIX_NAME = "S_"; // DB접두어
    public final static String DB_TABLE_USER_PREFIX_NAME = "U_"; // DB접두어

    public static String SERVER_URL;

    public void setServerUrl(String serverUrl)
    {
        Setting.SERVER_URL = serverUrl;
    }

    public static String SERVER_PORT;

    public void setServerPort(String serverPort)
    {
        Setting.SERVER_PORT = serverPort;
    }

    public static String FILE_ROOT_DIR;

    public void setFileRootDir(String fileRootDir)
    {
        Setting.FILE_ROOT_DIR = fileRootDir;
    }

    public final static int MAX_TAG_COUNT = 20;
    public final static int MAX_TAG_LEN = 30;

    /**
     * 글 제목 길이 제한
     */
    public static final int MAX_POST_SUBJECT_LENGTH = 63;
    public static final int MAX_POST_SUBJECT_LENGTH_DB = 127;

    public static final int POST_WRITE_WAIT_TIME = 0;

    public static final int TAG_CONTENT_WEIGHT = 1;

    /**
     * 글 요약 길이 제한
     */
    public static final int MAX_POST_SUMMARY_LENGTH = 255;
    public static final int MAX_POST_SUMMARY_LENGTH_DB = 512;

    /**
     * 닉네임 길이 제한
     */
    public static final int MAX_NICK_NAME_LENGTH = 16;

}