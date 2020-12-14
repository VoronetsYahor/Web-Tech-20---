<%@ page import="app.entities.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Кабинет администратор</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
    <body>
<jsp:include page="../masterPage/authheader.jsp"/>
<jsp:include page="../modal/addWork.jsp"/>
<jsp:include page="../modal/editWork.jsp"/>
<jsp:include page="../modal/removeWork.jsp"/>
<jsp:include page="../modal/closeWorkType.jsp"/>
<jsp:include page="../modal/failedWorkType.jsp"/>
    <%
    User user = new User();
    user.setId(0);
    Cookie[] cookies = request.getCookies();
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
        response.sendRedirect(request.getContextPath() + "/error");
    }
%>
<main>
    <div class="container">
        <div class="row my-2">
            <div class="col-lg-8 order-lg-2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Общая информация</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#messages" data-toggle="tab" class="nav-link">Активные работы</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#closing" data-toggle="tab" class="nav-link">Ожидают закрытия</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Все работы</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#works" data-toggle="tab" class="nav-link">Управление работами</a>
                    </li>
                </ul>
                <div class="tab-content py-4">
                    <div class="tab-pane active" id="profile">
                        <h5 class="mb-3">Основная информация</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <p>
                                    <%
                                        String money = String.valueOf(user.getCurrentMoney());
                                        if(money.equals("null"))
                                            money = "0";
                                        out.println("<p> Ваш ID " + user.getId() + "</p>" +
                                                "<p>Фамилия:"+user.getLastName()+" </p>" +
                                                "<p>Имя:"+user.getName()+" </p>" +
                                                "<p>Отчество:"+user.getPatronymic()+"</p>" +
                                                "<p>Возраст: "+user.getAge()+"</p>" +
                                                "<p>Е-мейл:"+user.getEmail()+"</p>" +
                                                "<p>Текущее состояние счёта парка: "+ money +"</p>");
                                    %>

                                </p>
                            </div>
                            <div class="col-md-6">
                                <span class="badge badge-primary"><i class="fa fa-user"></i>Работ за всё время - <%
                                    List<Works> tickets = null;
                                    try {
                                        tickets = new TicketDaoImplement().getTickets();
                                    } catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                    if(tickets != null)
                                   out.println(tickets.size());
                                   else
                                       out.print("0");
                                %></span>
                                <span class="badge badge-primary"><i class="fa fa-user"></i>Активных заявок - <%
                                    if(tickets != null) {
                                        int activec =0 ;
                                        for (Ticket t:
                                             tickets){
                                                if(t.getStatus()==1)
                                                    activec++;
                                        }
                                        out.print(String.valueOf(activec));
                                    }
                                    else
                                        out.print("0");
                                %></span>
                                <span class="badge badge-primary"><i class="fa fa-user"></i>Невыполнено работ - <%
                                    List<PenaltyTicket> penaltyTickets = null;
                                    try {
                                        penaltyTickets = new PenaltyTicketImplement().getPenaltyTickets();
                                    } catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                    if(penaltyTickets != null)
                                out.println(penaltyTickets.size());
                                else
                                    out.print("0");
                                %></span>
                                <span class="badge badge-success"><i class="fa fa-cog"></i>Закончено работ за сегодня - <%
                                    LocalDateTime now = LocalDateTime.now();
                                    if(tickets != null) {
                                        int countToday = 0;
                                        for (Ticket t:
                                             tickets) {
                                            Timestamp ticketDate = t.getDateTo();
                                            if(ticketDate.getYear() == now.getYear()
                                            &&ticketDate.getMonth() == now.getMonthValue()
                                            && ticketDate.getDate() == now.getDayOfMonth()
                                            && t.getStatus() == 3)
                                                countToday++;

                                        }
                                        out.println(countToday);
                                    }
                                        else
                                        out.print("0");
                                %></span>
                                <span class="badge badge-danger"><i class="fa fa-eye"></i>Ожидают завершения - <%
                                    if(tickets != null) {
                                        int pendingEnding = 0;
                                        for (Ticket t :
                                                tickets) {
                                            if(t.getStatus() == 2)
                                                pendingEnding++;
                                        }
                                        out.println(pendingEnding);
                                    }
                                    else
                                        out.print("0");
                                %></span>
                            </div>
                            <div class="col-md-12">
                                <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Последние выполненые работы</h5>
                                <table class="table table-sm table-hover table-striped">
                                    <tbody>
                                            <%
                                                for (int i =0; i< tickets.size() && i <15;i++) {
                                                    try {
                                                        out.println("<tr><td><strong>[USER "+tickets.get(i).getUser_id()+"]</strong> " +
                                                                "<strong>" +
                                                               new VehicleDaoImplement().getVehicle(tickets.get(i).getVehicle_id()).getName() +
                                                                "</strong> " +
                                                                "<br>Время выполнения С: " +
                                                                "" +
                                                                tickets.get(i).getDateFrom().toString() +
                                                                "<br>Время выполнения до: " +
                                                                tickets.get(i).getDateTo().toString() +
                                                                "<strong> " +
                                                                "<br>Тип работ: " +
                                                                tickets.get(i).getCost() +
                                                                "</strong></td></tr>");
                                                    } catch (SQLException throwables) {
                                                        throwables.printStackTrace();
                                                    }
                                                }
                                            %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="tab-pane" id="messages">
                        <table class="table table-hover table-striped">
                            <tbody>
                            <%
                                for (Ticket ticket : tickets) {
                                    if (ticket.getStatus() == 1) {
                                        try {
                                            out.println("<tr><td><strong>[USER " + ticket.getUser_id() + "]</strong>" +
                                                    "<strong>" +
                                                    new VehicleDaoImplement().getVehicle(ticket.getVehicle_id()).getName() +
                                                    "</strong> " +
                                                    "<br>Время выполнения С: " +
                                                    "" +
                                                    ticket.getDateFrom().toString() +
                                                    "<br>Время выполнения ПО: " +
                                                    ticket.getDateTo().toString() +
                                                    "<strong> " +
                                                    "<br>Тип работ: " +
                                                    ticket.getCost() +
                                                    "</strong></td></tr>");
                                        } catch (SQLException throwables) {
                                            throwables.printStackTrace();
                                        }
                                    } else {
                                        out.println("<tr><td></td></tr>");
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="closing">
                        <table class="table table-hover table-striped">
                            <tbody>
                            <button type="button" class="float-left ml-3 btn btn-primary" data-toggle="modal" data-target="#penaltyTicketModal">
                                Оштрафовать по ID
                            </button>
                            <button type="button" class="float-left ml-3 btn btn-primary" data-toggle="modal" data-target="#closeTicketModal">
                                Завершить по ID
                            </button>
                            <%
                                for (int i =0; i< tickets.size();i++) {
                                    if (tickets.get(i).getStatus() == 2) {
                                        try {
                                            out.println("<tr><td>[USER " + tickets.get(i).getUser_id() + "]</strong> " +
                                                    "<strong" +
                                                    new VehicleDaoImplement().getVehicle(tickets.get(i).getVehicle_id()).getName() +
                                                    "</strong> " +
                                                    "<br>Время выполнения С: " +
                                                    "" +
                                                    tickets.get(i).getDateFrom().toString() +
                                                    "<br>Время выполнения ПО: " +
                                                    tickets.get(i).getDateTo().toString() +
                                                    "<strong> " +
                                                    "<br>Тип работ: " +
                                                    tickets.get(i).getCost() +
                                                    "</strong></td></tr>");
                                        } catch (SQLException throwables) {
                                            throwables.printStackTrace();
                                        }
                                    }
                                    else
                                    {
                                        out.println("<tr><td></td></tr>");
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="edit">
                        <table class="table table-hover table-striped">
                            <tbody>
                            <%
                                for (int i =0; i< tickets.size();i++) {
                                    String status = "";
                                    if(tickets.get(i).getStatus()==1)
                                    {
                                        status = "В процессе";
                                    }
                                    else if (tickets.get(i).getStatus()==2)
                                    {
                                        status = "Ожидание подтверждения";
                                    }
                                    else
                                    {
                                        status = "Успешно";
                                    }
                                    try {
                                        out.println("<tr><td><span class=float-right font-weight-bold>" + status + " </span><strong>[USER "+tickets.get(i).getUser_id()+"]</strong> " +
                                                "<strong>" +
                                                new VehicleDaoImplement().getVehicle(tickets.get(i).getVehicle_id()).getName() +
                                                "</strong> " +
                                                "<br>Время выполнения С: " +
                                                "" +
                                                tickets.get(i).getDateFrom().toString() +
                                                "<br>Время выполнения ПО: " +
                                                tickets.get(i).getDateTo().toString() +
                                                "<strong> " +
                                                "<br>Тип работ: " +
                                                tickets.get(i).getCost() +
                                                "</strong></td></tr>");
                                    } catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="vehicle">
                        <table class="table table-hover table-striped">
                            <tbody>
                            <button type="button" class="float-right btn btn-primary" data-toggle="modal" data-target="#removeWorkType">
                                Удалить по ID
                            </button>
                            <button type="button" class="float-left ml-3 btn btn-primary" data-toggle="modal" data-target="#addWorkType">
                                Добавить
                            </button>
                            <%
                                List<Works> vehicles = null;
                                try {
                                    vehicles = new VehicleDaoImplement().getVehicles();
                                } catch (SQLException throwables) {
                                    throwables.printStackTrace();
                                }
                                for (Vehicle v:
                                        vehicles) {
                                    out.println("<tr><td>" +
                                            "" +
                                            "["+v.getId()+"]" +
                                            v.getName() +
                                            "<br>Тип/сут " +
                                            v.getDayCost() +
                                            "" +
                                            "" +
                                            "</td></tr>");

                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

</body>
</html>
