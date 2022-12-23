package sample.accessSocial;

import com.google.gson.Gson;

/**
 *
 * @author MagnusJS
 */
public class Constants {
    
  public static String GOOGLE_CLIENT_ID = "529467356302-thpbns5dau93ipa3vupft7tcoiqalcbs.apps.googleusercontent.com";
  public static String GOOGLE_CLIENT_SECRET = "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";
  public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/Assignment3W/GoogleController";
  public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
  public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
  public static String GOOGLE_GRANT_TYPE = "authorization_code";
  
  public static String accessToken;
  public Gson gson;
  
  public Constants() {
    gson = new Gson();
  }
      
    public static void setAccessToken(String accessToken) {
        Constants.accessToken = accessToken;
    }
}
