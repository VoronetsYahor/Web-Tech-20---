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

@WebServlet(name = "UserPage")
public class UserPage extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("views/rangerPage.jsp");
        dispatcher.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     //   req.setCharacterEncoding("UTF-8");
    //    Cookie[] cookies = req.getCookies();
    //    String cookieName = "user";
     //   Cookie cookie = null;
     //   if(cookies !=null) {
      //      for(Cookie c: cookies) {
      //          if(cookieName.equals(c.getName())) {
       //             cookie = c;
       //             req.setAttribute("cookie", cookie.getValue());
      //              break;
       //         }
      //      }
      //  }
      //  resp.sendRedirect(req.getContextPath() + "/userpage");
       // RequestDispatcher dispatcher = req.getRequestDispatcher("views/rangerPage.jsp");
       // dispatcher.forward(req, resp);
    }

}
