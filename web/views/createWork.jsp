<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Кабинет лесничего</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../masterPage/authheader.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-lg-8 mb-5">
            <form action="#" method="post">
                <div class="form-group row">
                    <div class="col-md-6 mb-4 mb-lg-0">
                        <input type="text" class="form-control" placeholder="First name">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <input type="text" class="form-control" placeholder="Email address">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <textarea name="" id="" class="form-control" placeholder="Write your message." cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-6 mr-auto">
                        <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Message">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 ml-auto">
            <div class="bg-white p-3 p-md-5">
                <h3 class="text-black mb-4">Contact Info</h3>
                <ul class="list-unstyled footer-link">
                    <li class="d-block mb-3">
                        <span class="d-block text-black">Address:</span>
                        <span>34 Street Name, City Name Here, United States</span></li>
                    <li class="d-block mb-3"><span class="d-block text-black">Phone:</span><span>+1 242 4942 290</span></li>
                    <li class="d-block mb-3"><span class="d-block text-black">Email:</span><span>voronets@egor.com</span></li>
                </ul>
            </div>
        </div>
        </div>
    </div>
</div>
</body>
</html>