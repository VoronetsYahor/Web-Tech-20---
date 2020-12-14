package app.servlets;

import app.entities.User;
import app.entities.UserDao;
import app.entities.UserDaoImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet (name = "Registration")
public class Registration extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("views/registration.jsp");
        dispatcher.forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String lastName = req.getParameter("lastName");
        String patronymic = req.getParameter("patronymic");
        String age = req.getParameter("age");
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        User user = new User(
                0,name,lastName,patronymic, Date.valueOf(age),email,password
        );
        UserDaoImplement userDao
                = new UserDaoImplement();
        try {
            userDao.add(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        req.setAttribute("name", name);
        doGet(req, resp);
    }
}
