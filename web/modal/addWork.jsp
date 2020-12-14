<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
        $("#addButton").click
        (
            function()
            {
                $.ajax
                (
                    {
                        url:'/work',
                        data: {
                            "methodType": "add",
                            "name": $("#workName").val(),
                            "workType": $("#workType").val(),
                            "description": $("#workDescription").val(),
                            "imagePath": $("#workImagePath").val(),
                            "class": $("#workClass").children(":selected").attr("id"),
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

<div class="modal fade" id="addWorkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Добавление ТС</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="workName">Название</label>
                    <input type="text" class="form-control" id="workName" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <label for="workType">Тип работ</label>
                    <input type="text" class="form-control" id="workType" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <label for="workDescription">Описание</label>
                    <input type="text" class="form-control" id="workDescription" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <label for="workImagePath">Путь к Image</label>
                    <input type="text" class="form-control" id="workImagePath" aria-describedby="emailHelp">
                </div>
                <select class="form-control" id="workPriority">
                    <option id="1">Низкий приоритет</option>
                    <option id="2">Обычный приоритет</option>
                    <option id="3">Высокий приоритет</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="addButton" type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>