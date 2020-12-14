<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
        $("#penaltyTicket").click
        (
            function()
            {
                $.ajax
                (
                    {
                        url:'/work',
                        data: {
                            "methodType": "failedWork",
                            "id": $("#failedWorkId").val(),
                            "Desc": $("#failedWorkDesc").val(),
                            "Type": $("#failedWorkType").val(),

                        },
                        type:'post',
                        cache:false,
                        success:function(){alert('Завершение работы');},
                        error:function(){alert('Ошибка');}
                    }
                );
            }
        );
    });
</script>
<div class="modal fade" id="penaltyTicketModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Оштрафовать пользователя</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="failedWorkId">ID Заявки</label>
                    <input type="text" class="form-control" id="failedWorkId" aria-describedby="emailHelp">
                </div>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="failedWorkType">Замечание</label>
                    <input type="text" class="form-control" id="failedWorkType" aria-describedby="emailHelp">
                </div>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="failedWorkDesc">Штраф в руб.</label>
                    <input type="text" class="form-control" id="failedWorkDesc" aria-describedby="emailHelp">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="finishedWork" type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>