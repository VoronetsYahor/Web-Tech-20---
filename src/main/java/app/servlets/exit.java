package app.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="Exit")
public class exit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        Cookie cookie = null;
        int id = 0;
        if(cookies !=null) {
            for(Cookie c: cookies) {
               c.setMaxAge(0);
               resp.addCookie(c);
            }
        }
        resp.sendRedirect(req.getContextPath()+"/auth");
    }
}
