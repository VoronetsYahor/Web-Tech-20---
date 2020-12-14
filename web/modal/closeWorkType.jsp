<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
        $("#closeTicket").click
        (
            function()
            {
                $.ajax
                (
                    {
                        url:'/work',
                        data: {
                            "methodType": "closeWork",
                            "id": $("#closeTicketId").val(),
                        },
                        type:'post',
                        cache:false,
                        success:function(){alert('Завершено');},
                        error:function(){alert('Ошибка');}
                    }
                );
            }
        );
    });
</script>
<div class="modal fade" id="closeTicketModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Закрыть тикет</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="workID">Id</label>
                    <input type="text" class="form-control" id="workID" aria-describedby="emailHelp">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="closeTicket" type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>