<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
        $("#removeButton").click
        (
            function()
            {
                $.ajax
                (
                    {
                        url:'/vehicle',
                        data: {
                            "methodType": "remove",
                            "id": $("#workRemoveId").val(),
                        },
                        type:'post',
                        cache:false,
                        success:function(){alert('Удалено');},
                        error:function(){alert('Ошибка');}
                    }
                );
            }
        );
    });
</script>
<div class="modal fade" id="removeVehicleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Удалить ТС</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="workRemoveId">Id</label>
                    <input type="text" class="form-control" id="workRemoveId" aria-describedby="emailHelp">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="removeButton" type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>