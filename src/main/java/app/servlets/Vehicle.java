package app.servlets;

import app.entities.*;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;


@WebServlet(name = "Vehicle")
public class Vehicle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        String methodType = req.getParameter("methodType");

        if(methodType.equals("add")) {
            String name = req.getParameter("name");
            String dayCost = req.getParameter("dayCost");
            String description = req.getParameter("description");
            String imagePath = req.getParameter("imagePath");
            String vClass = req.getParameter("class");

            app.entities.Vehicle vehicle = new app.entities.Vehicle();
            vehicle.setName(name);
            vehicle.setDayCost(new BigDecimal(dayCost));
            vehicle.setDescription(description);
            vehicle.setImagePath(imagePath);
            vehicle.setVehClass(Short.parseShort(vClass));
            try {
                new VehicleDaoImplement().add(vehicle);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else if(methodType.equals("remove"))
        {
            String vid = req.getParameter("id");
            app.entities.Vehicle vehicle = new app.entities.Vehicle();
            vehicle.setId(Integer.parseInt(vid));
            try {
                new VehicleDaoImplement().delete(vehicle.getId());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else if(methodType.equals("doneTicket"))
        {
            String ticketid = req.getParameter("id");
            try {
               Ticket ticket =  new TicketDaoImplement().getTicket(Integer.parseInt(ticketid));
                ticket.setStatus((short)3);
                new TicketDaoImplement().update(ticket);
            } catch (SQLException throwables) {
            }
        }
        else if(methodType.equals("rentCar"))
        {
            String vid = req.getParameter("vehId");
            String uid = req.getParameter("userId");
            String dateTo = RemoveLastChar(req.getParameter("dateTo"));
            String cost = req.getParameter("cost");
            String dateFrom = RemoveLastChar(req.getParameter("dateFrom"));

            Ticket ticket = new Ticket();
            ticket.setUser_id(Integer.parseInt(uid));
            ticket.setVehicle_id(Integer.parseInt(vid));
            ticket.setManager_id(0);
            ticket.setCost(new BigDecimal(cost));
            ticket.setDescription("Null");

            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm");
            Date parsedDate1 = null;
            Date parsedDate2 = null;
            try {
                parsedDate1 = dateFormat.parse(dateFrom);
                parsedDate2 = dateFormat.parse(dateTo);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Timestamp timestamp1 = new java.sql.Timestamp(parsedDate1.getTime());
            Timestamp timestamp2 = new java.sql.Timestamp(parsedDate2.getTime());

            ticket.setDateFrom(timestamp1);
            ticket.setDateTo(timestamp2);
            ticket.setStatus((short)1);
            try {
                new TicketDaoImplement().add(ticket);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        }
        else if(methodType.equals("saveProfile"))
        {
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
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
            else
            {
              return;
            }

            String saveName = req.getParameter("saveName");
            String saveEmail = req.getParameter("saveEmail");
            String saveLastName = req.getParameter("saveLastName");
            String savePass1 = req.getParameter("savePass1");
            String savePass2 = req.getParameter("savePass2");
            String savePatron = req.getParameter("savePatron");

            if(savePass1.equals(savePass2))
            {
               user.setName(saveName);
               user.setEmail(saveEmail);
               user.setLastName(saveLastName);
               user.setPassword(DigestUtils.sha256Hex(savePass1));
               user.setPatronymic(savePatron);
                try {
                    new UserDaoImplement().update(user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        else if(methodType.equals("CloseTicket"))
        {
            String vid = req.getParameter("id");
            app.entities.Ticket ticket = new app.entities.Ticket();
            try {
                ticket = new TicketDaoImplement().getTicket(Integer.parseInt(vid));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ticket.setStatus((short) 3);
                new TicketDaoImplement().update(ticket);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else if(methodType.equals("penaltyTicket"))
        {

            String penaltyAdminId = req.getParameter("penaltyAdminId");
            String Id = req.getParameter("penaltyTicketId");
            String Desc = req.getParameter("penaltyTicketDesc");
            String Cost = req.getParameter("penaltyTicketCost");
            Ticket ticket = null;
            try {
              ticket = new TicketDaoImplement().getTicket(Integer.parseInt(Id));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            PenaltyTicket penTicket = new PenaltyTicket();
            penTicket.setUser_id(ticket.getUser_id());
            penTicket.setVehicle_id(ticket.getVehicle_id());
            penTicket.setTicket_id(ticket.getId());
            penTicket.setDescription(Desc);
            penTicket.setCost(new BigDecimal(Cost));
            penTicket.setAdmin_id(Integer.parseInt(penaltyAdminId));
            try {
                new PenaltyTicketImplement().add(penTicket);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            ticket.setStatus((short)3);
            try {
                new TicketDaoImplement().update(ticket);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
    }

    private String RemoveLastChar(String s) {
            return (s == null || s.length() == 0)
                    ? null
                    : (s.substring(0, s.length() - 3));
    }
}
