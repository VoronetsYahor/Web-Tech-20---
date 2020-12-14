<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="editVehicleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Редактирование ТС</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                    <label for="exampleFormControlSelect1">ID</label>
                    <select class="form-control" id="exampleFormControlSelect1">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                    </div>
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
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                        <label class="form-check-label" for="exampleRadios1">
                            Низкий приоритет
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                        <label class="form-check-label" for="exampleRadios2">
                            Стандартный приоритет
                        </label>
                    </div>
                    <div class="form-check ">
                        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                        <label class="form-check-label" for="exampleRadios3">
                            Высокий приоритет
                        </label>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
    </div>
    </div>
</div>