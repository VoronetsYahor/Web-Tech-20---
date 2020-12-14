package app.servlets;

import app.entities.User;
import app.entities.UserDaoImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Auth")
public class Auth extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = new User();
        user.setId(0);
        Cookie[] cookies = req.getCookies();
        Cookie cookie = null;
        int id = 0;
        if(cookies !=null) {
            for(Cookie c: cookies) {
                if("id".equals(c.getName())) {
                    cookie = c;
                    id = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
        }
        if(id!=0)
        {
            try {
                user = new UserDaoImplement().getUser(id);
                if(user!=null) {
                    if (user.getAdmin()) {
                        resp.addCookie(new Cookie("user", user.getEmail()));
                        resp.addCookie(new Cookie("id", Integer.toString(user.getId())));
                        resp.addCookie(new Cookie("admin", Boolean.toString(user.getAdmin())));
                        resp.sendRedirect(req.getContextPath() + "/managerPage");
                    }
                    else
                    {
                        resp.addCookie(new Cookie("user", user.getEmail()));
                        resp.addCookie(new Cookie("id", Integer.toString(user.getId())));
                        resp.addCookie(new Cookie("admin", Boolean.toString(user.getAdmin())));
                        resp.sendRedirect(req.getContextPath()+"/userpage");
                    }
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else {

            RequestDispatcher dispatcher = req.getRequestDispatcher("views/auth.jsp");
            dispatcher.forward(req, resp);
        }
        }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        User user = new User(email, password);
        UserDaoImplement userDao
                = new UserDaoImplement();
        try {
           user = userDao.getAuth(user);
        } catch (
                SQLException throwables) {
            throwables.printStackTrace();
        }

        if(user == null) {
            req.setAttribute("status", "bad");
            doGet(req, resp);
        }
        else if(user.getAdmin()==true)
        {
            resp.addCookie(new Cookie("user", user.getEmail()));
            resp.addCookie(new Cookie("id", Integer.toString(user.getId())));
            resp.addCookie(new Cookie("admin", Boolean.toString(user.getAdmin())));
            resp.sendRedirect(req.getContextPath()+"/managerPage");
        }
        else
        {
            resp.addCookie(new Cookie("user", user.getEmail()));
            resp.addCookie(new Cookie("id", Integer.toString(user.getId())));
            //req.setAttribute("userinfo",user);

            resp.sendRedirect(req.getContextPath() + "/userpage");
           // ServletContext servletContext = getServletContext();
           // RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/userpage");
           // requestDispatcher.forward(req, resp);
          //  doGet()
        }
    }
}