<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Система управления Парком Горького</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <%
                    Cookie[] cookies = request.getCookies();
                    Cookie cookie = null;
                    if(cookies !=null) {
                        for(Cookie c: cookies) {
                            if("admin".equals(c.getName())) {
                                cookie = c;
                                break;
                            }
                        }
                        if(cookie!=null) {
                                out.println("<a class=\"nav-link\" href=\"/managerPage\">Мой аккаунт <span class=\"sr-only\">(current)</span></a>\n");
                        }
                        else
                        {
                            out.println("<a class=\"nav-link\" href=\"/userpage\">Мой аккаунт <span class=\"sr-only\">(current)</span></a>\n");

                        }
                    }
                %>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/plantList">Список высадок</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/exit">Выход</a>
            </li>
        </ul>
    </div>
</nav>