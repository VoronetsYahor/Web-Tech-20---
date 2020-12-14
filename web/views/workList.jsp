<%@ page import="java.util.List" %>
<%@ page import="app.entities.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
        out.print("<div id=\"userid\" value=\""+user.getId()+"\"></div>");
    }
    else
    {
        response.sendRedirect(request.getContextPath() + "/error");
    }
%>
<head>
    <title>Кабинет пользователя</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker-standalone.min.css" integrity="sha256-SMGbWcp5wJOVXYlZJyAXqoVWaE/vgFA5xfrH3i/jVw0=" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" integrity="sha256-5YmaxAwMjIpMrVlK84Y/+NjCpKnFYa8bWWBbUHSBGfU=" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../masterPage/authheader.jsp"/>
<script>
    $(document).ready(function(){
        $(function () {
            $('#dateFrom').datetimepicker();
        });
        $(function () {
            $('#dateTo').datetimepicker();
        });
$('#exampleModal').on('show.bs.modal', function (event) {
var button = $(event.relatedTarget) // Button that triggered the modal
var id = button.data('id')
var name = button.data('name')
var cost = button.data('cost')

    var modal = $(this)
modal.find('.modal-title').text('['+id+']'+'Аренда ' + name)
modal.find('.modal-body #id').val(id)
    modal.find('.modal-body #cost').val(cost)
    modal.find('.modal-body #name').val(name)

})

        $("#rentButton").click
        (
            function()
            {
                $.ajax
                (
                    {
                        url:'/work',
                        data: {
                            "methodType": "addWork",
                            "vehId": $("#id").val(),
                            "userId": <%out.print(user.getId());%>,
                            "dateTo": $("#dateTo").val(),
                            "type": $("#type").val(),

                            "dateTo": $("#dateTo").val(),
                            "dateFrom": $("#dateFrom").val(),
                        },
                        type:'post',
                        cache:false,
                        success:function(){alert('Добавлено');},
                        error:function(){alert('Ошибка');}
                    }
                );
            }
        );

    });
</script>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="id" class="col-form-label">id :</label>
                        <input type="text" class="form-control" readonly id="id">
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-form-label">Название:</label>
                        <input class="form-control" id="name" readonly></input>
                    </div>
                    <div class="form-group">
                        <label for="Cost" class="col-form-label">Цена за сутки:</label>
                        <input class="form-control" id="cost" readonly></input>
                    </div>

                    <div class="form-group">
                        <label for="Cost" class="col-form-label">Время начала аренды:</label>
                        <input type="text" class="form-control" id="dateFrom" ></input>
                    </div>
                    <div class="form-group">
                        <label for="Cost" class="col-form-label">Время окончания аренды:</label>
                        <input type="text" class="form-control" id="dateTo" ></input>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                <button type="button" id="rentButton" class="btn btn-primary">Арендовать</button>

            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Поиск авто">
                <div class="input-group-append">
                    <button class="btn btn-secondary" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>

            <h1 class="my-4">Приоритет работ</h1>
            <div class="list-group">
                <a href="#" class="list-group-item">Низкий приоритет</a>
                <a href="#" class="list-group-item">Средний приоритет</a>
                <a href="#" class="list-group-item">Высокий приоритет</a>
            </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" src="https://autokatalog.by/upload/information_system_25/5/6/7/group_567/group_567.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="https://autokatalog.by/upload/information_system_17/8/2/8/group_828/group_828.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" src="https://autocatalog.by/upload/information_system_17/3/2/5/group_325/group_325.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="row">
                <%
                   // https://aznur.by/upload/resize_cache/iblock/449/500_114_1/449bec720ed21d095bdad28dcada8aa3.jpg
                    List<Work> vehicleList = new VehicleDaoImplement().getVehicles();
                    for (Vehicle veh:
                         vehicleList) {
                    out.print("<div class=\"col-lg-4 col-md-6 mb-4\">" +
                    "                    <div class=\"card h-100\">\n" +
                    "                        <a href=\"#\"><img class=\"card-img-top\" src=\""+ veh.getImagePath() +"\" alt=\"\"></a>\n" +
                    "                        <div class=\"card-body\">\n" +
                    "                            <h4 class=\"card-title\">\n" +
                    "                                <a href=\"#\">"+ veh.getName()+"</a>\n" +
                    "                            </h4>\n" +
                    "                            <h5>от "+ veh.getDayCost() +" BYN / день</h5>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"card-footer\">\n" +
                            "<button type=\"button\" class=\"float-left ml-3 btn btn-primary\" data-toggle=\"modal\" data-id=\""+veh.getId()+"\" data-name=\""+veh.getName()+"\" data-cost=\""+veh.getDayCost()+"\" data-target=\"#exampleModal\">\n" +
                            "                                Арендовать\n" +
                            "                            </button>" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "</div>");
                    }

                %>



            </div>
            <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

</div>


</body>
</html>
