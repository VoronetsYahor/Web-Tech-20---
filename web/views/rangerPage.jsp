<%@ page import="app.entities.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Кабинет лесника</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
        function endTicket(id){
            $.ajax
            (
                {
                    url:'/vehicle',
                    data: {
                        "methodType": "doneTicket",
                        "id": id,
                    },
                    type:'post',
                    cache:false,
                    success:function(){alert('Закончено ' + id);},
                    error:function(){alert('Ошибка');}
                }
            );
        }
    </script>
    <script>
        $(document).ready(function(){
            $("#saveButton").click
            (
                function()
                {
                    $.ajax
                    (
                        {
                            url:'/vehicle',
                            data: {
                                "methodType": "saveProfile",
                                "saveName": $("#saveName").val(),
                                "saveEmail": $("#saveEmail").val(),
                                "saveLastName": $("#saveLastName").val(),
                                "savePass1": $("#savePass1").val(),
                                "savePass2": $("#savePass2").val(),
                                "savePatron": $("#savePatron").val(),
                            },
                            type:'post',
                            cache:false,
                            success:function(){alert('Сохранено');},
                            error:function(){alert('Ошибка');}
                        }
                    );
                }
            );
        });
    </script>
</head>
<body>
<jsp:include page="../masterPage/authheader.jsp"/>
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
         user = new UserDaoImplement().getUser(id);
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
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Профиль</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#messages" data-toggle="tab" class="nav-link">Активные заявки</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Личная информация</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <h5 class="mb-3">Ваш профиль</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Основная информация</h6>
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
                                            "<p>Текущее состояние счёта: "+ money +"</p>");
                              %>

                            </p>
                        </div>
                        <div class="col-md-6">
                            <span class="badge badge-primary"><i class="fa fa-user"></i>Всего поездок - <%
                                List<Ticket> tickets = null;
                                int ticketUserCount= 0;

                                try {
                                     tickets = new TicketDaoImplement().getTickets();
                                } catch (SQLException throwables) {
                                    throwables.printStackTrace();
                                }
                                for (Ticket ticket:
                                     tickets) {
                                    if(ticket.getUser_id() == user.getId())
                                        ticketUserCount++;
                                }
                                out.println(ticketUserCount);
                            %></span>
                            <span class="badge badge-success"><i class="fa fa-cog"></i>Закончено поездок - <%
                                int endedTickets = 0;
                                for (Ticket ticket:
                                     tickets) {
                                    if(ticket.getStatus()==3 && ticket.getUser_id() == user.getId())
                                        endedTickets++;
                                }
                            out.println(endedTickets);
                            %></span>
                            <span class="badge badge-danger"><i class="fa fa-eye"></i>Штрафы - <%
                                BigDecimal countPenalty = new BigDecimal(0);
                                List<PenaltyTicket> penaltyTickets = new PenaltyTicketImplement().getPenaltyTickets();
                                if(penaltyTickets!=null)
                                {

                                for (PenaltyTicket penaltyTicket:
                                     penaltyTickets) {
                                    if(penaltyTicket.getUser_id() == user.getId())
                                    countPenalty.add(penaltyTicket.getCost());
                                }
                                }
                                out.println(countPenalty);
                            %>p</span>
                        </div>
                        <div class="col-md-12">
                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Последние поездки</h5>
                            <table class="table table-sm table-hover table-striped">
                                <tbody>
                                <%
                                    for (Ticket ticket:
                                         tickets) {
                                        if(ticket.getUser_id() == user.getId())
                                        {
                                            out.println("<tr><td>" +
                                                    "<strong>" +
                                                    new VehicleDaoImplement().getVehicle(ticket.getVehicle_id()).getName() +
                                                    "</strong> " +
                                                    "Время поездки: " +
                                                    "С: "
                                                    + ticket.getDateFrom().toString() +
                                                    " ПО: " +
                                                    ticket.getDateTo().toString() +
                                                    "<strong>" +
                                                    "<br>К оплате: " +
                                                    ticket.getCost()+
                                                    "руб</strong>" +
                                                    "</td></tr>");
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
                            for (Ticket ticket:
                                 tickets) {
                                if(ticket.getStatus()==1 && ticket.getUser_id()==user.getId())
                                {
                                    try {
                                        out.println("<tr><td>" +
                                                "<button onclick=\"endTicket("+ticket.getId()+");\" class=\"float-right font-weight-bold\">" +
                                                "Завершить" +
                                                "</button>" +
                                               new VehicleDaoImplement().getVehicle(ticket.getVehicle_id()).getName() +
                                                "" +
                                                "</td></tr>");
                                    } catch (SQLException throwables) {
                                        throwables.printStackTrace();
                                    }
                                }
                            }

                        %>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="edit">
                    <form role="form">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Имя</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="saveName"type="text" value="<%out.println(user.getName());%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Фамилия</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="saveLastName" type="text" value="<%out.println(user.getLastName());%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Отчество</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="savePatron" type="text" value="<%out.println(user.getPatronymic());%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="saveEmail" type="email" value="<%out.println(user.getEmail());%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Пароль</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="savePass1" type="password" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Подтверждение пароля</label>
                            <div class="col-lg-9">
                                <input class="form-control" id="savePass2" type="password" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="button" id="saveProfile" class="btn btn-primary" value="Сохранить изменения">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</main>

</body>
</html>
