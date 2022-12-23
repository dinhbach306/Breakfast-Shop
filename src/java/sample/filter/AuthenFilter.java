package sample.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDTO;

/**
 *
 * @author MagnusJS
 */
@WebFilter(filterName = "AuthenFilter", urlPatterns = {"/*"})
public class AuthenFilter implements Filter {
    
    private static List<String> USER_RESOURCE;
    private static List<String> ADMIN_RESOURCE;
    private static List<String> NON_AUTHEN_RESOURCE;
    
    private static final String ADMIN = "ADMIN";
    private static final String USER = "USER";
    private static final String LOGIN_PAGE = "login.jsp";
    
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public AuthenFilter() {
        USER_RESOURCE = new ArrayList<>();
        
        ADMIN_RESOURCE = new ArrayList<>();
        ADMIN_RESOURCE.add("search.jsp");
        
        NON_AUTHEN_RESOURCE = new ArrayList<>();
        NON_AUTHEN_RESOURCE.add("login.jsp");
        NON_AUTHEN_RESOURCE.add("index.jsp");
        NON_AUTHEN_RESOURCE.add("error.jsp");
        NON_AUTHEN_RESOURCE.add("MainController");
        NON_AUTHEN_RESOURCE.add("LoginController");
        NON_AUTHEN_RESOURCE.add("GoogleController");
        NON_AUTHEN_RESOURCE.add("register.jsp");
        NON_AUTHEN_RESOURCE.add("shopping.jsp");
        NON_AUTHEN_RESOURCE.add("checkout.jsp");
        NON_AUTHEN_RESOURCE.add("thankyou.html");
        NON_AUTHEN_RESOURCE.add("cart.jsp");
        NON_AUTHEN_RESOURCE.add(".png");
        NON_AUTHEN_RESOURCE.add(".svg");
        NON_AUTHEN_RESOURCE.add(".gif");
        NON_AUTHEN_RESOURCE.add(".jpg");
        NON_AUTHEN_RESOURCE.add(".css");
        NON_AUTHEN_RESOURCE.add(".js");
        NON_AUTHEN_RESOURCE.add(".woff2");
        NON_AUTHEN_RESOURCE.add(".woff");
        NON_AUTHEN_RESOURCE.add(".ttf");
    }

    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoBeforeProcessing");
        }
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse resp = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            boolean checkContain = false;
            
            for(String value : NON_AUTHEN_RESOURCE) {
                if(uri.contains(value)) {
                    checkContain = true;
                    break;
                } 
            }
            if (checkContain) {
                chain.doFilter(request, response);
            } else {
                HttpSession session =req.getSession();
                
//              Authentication in here
                if (session == null || session.getAttribute("LOGIN_USER") == null) {
                    resp.sendRedirect(LOGIN_PAGE);
                }else {
//               Authentirazor
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String roleID = loginUser.getRoleID();
                    if(ADMIN.equals(roleID) && ADMIN_RESOURCE.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if(USER.equals(roleID) && USER_RESOURCE.contains(resource)) {
                        chain.doFilter(request, response);
                    } else{
                        resp.sendRedirect(LOGIN_PAGE);
                    }
                }
            }
        } catch (Exception e) {
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AuthenFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
