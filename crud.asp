<!-- #include file="top.asp" -->

<div class="container">
    <div class="spacer-medio"></div>
        <h2>Lista de Cadastros</h2>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();">Adicionar Cadastro</button><br /><br />
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Nome
                    </th>
                    <th>
                        Matricula
                    </th>
                    <th>
                        Curso
                    </th>
                    <th>
                        Data de Nascimento
                    </th>
                    <th>
                        Ações
                    </th>
                </tr>
            </thead>
            <tbody class="tbody">
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title" id="myModalLabel">Pedido</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="Id">ID</label>
                            <input type="text" class="form-control" id="Id" placeholder="Id" disabled="disabled"/>
                        </div>
                        <div class="form-group">
                            <label for="Nome">Nome</label>
                            <input type="text" class="form-control" id="Nome" placeholder="Nome"/>
                        </div>
                        <div class="form-group">
                            <label for="Matricula">Matricula</label>
                            <input type="text" class="form-control" id="Matricula" placeholder="Matricula" />
                        </div>
                        <div class="form-group">
                            <label for="Curso">Curso</label>
                            <input type="text" class="form-control" id="Curso" placeholder="Curso"/>
                        </div>
                        <div class="form-group">
                            <label for="DataNascimento">Data de Nascimento</label>
                            <input type="date" class="form-control" id="DataNascimento" placeholder="Data de Nascimento"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAdd" onclick="return Add();">Adicionar</button>
                    <button type="button" class="btn btn-primary" id="btnUpdate" style="display:none;" onclick="Update();">Atualizar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>       
    </div>




<script>
//Load Data in Table when documents is ready
$(document).ready(function () {
    loadData();
});


var path = "http://medicinapetropolis.com.br/ApiSisCracha"

//Load Data function
function loadData() {
    $.ajax({
        url: path + "/api/ListarPedidos/Pendentes",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.Id + '</td>';
                html += '<td>' + item.Nome + '</td>';
                html += '<td>' + item.Matricula + '</td>';
                html += '<td>' + item.Curso + '</td>';
                html += '<td>' + item.DataNascimento + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.Id + ')">Edit</a> | <a href="#" onclick="Delele(' + item.Id + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Add Data Function
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        Id: $('#Id').val(),
        Nome: $('#Nome').val(),
        Matricula: $('#Matricula').val(),
        Curso: $('#Curso').val(),
        DataNascimento: $('#DataNascimento').val()
    };
    $.ajax({
        url: path + "/api/cadastrarPedido",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Function for getting the Data Based upon Employee ID
function getbyID(ID) {
    $('#Nome').css('border-color', 'lightgrey');
    $('#Matricula').css('border-color', 'lightgrey');
    $('#Curso').css('border-color', 'lightgrey');
    $('#DataNascimento').css('border-color', 'lightgrey');
    $.ajax({
        url: path + "/api/EditarPedido/" + ID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#Id').val(result.Id);
            $('#Nome').val(result.Nome);
            $('#Matricula').val(result.Matricula);
            $('#Curso').val(result.Curso);
            $('#DataNascimento').val(result.DataNascimento);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}
//function for updating employee's record
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        Id: $('#Id').val(),
        Nome: $('#Nome').val(),
        Matricula: $('#Matricula').val(),
        Curso: $('#Curso').val(),
        DataNascimento: $('#DataNascimento').val(),
    };
    $.ajax({
        url: path + "/api/EditarPedido/",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#Id').val("");
            $('#Nome').val("");
            $('#Matricula').val("");
            $('#Curso').val("");
            $('#DataNascimento').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//function for deleting employee's record
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: path + "/api/Excluir/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
//Function for clearing the textboxes
function clearTextBox() {
    $('#Id').val("");
    $('#Nome').val("");
    $('#Matricula').val("");
    $('#Curso').val("");
    $('#DataNascimento').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#Nome').css('border-color', 'lightgrey');
    $('#Matricula').css('border-color', 'lightgrey');
    $('#Curso').css('border-color', 'lightgrey');
    $('#DataNascimento').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#Nome').val().trim() == "") {
        $('#Nome').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Nome').css('border-color', 'lightgrey');
    }
    if ($('#Matricula').val().trim() == "") {
        $('#Matricula').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Matricula').css('border-color', 'lightgrey');
    }
    if ($('#Curso').val().trim() == "") {
        $('#Curso').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Curso').css('border-color', 'lightgrey');
    }
    if ($('#DataNascimento').val().trim() == "") {
        $('#DataNascimento').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#DataNascimento').css('border-color', 'lightgrey');
    }
    return isValid;
}  
</script>

<!-- #include file="footer.asp" -->