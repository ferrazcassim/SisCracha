<!-- #include file="top.asp" -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
						Pedidos de crachá <small>(aluno)</small>
						</h4>
						<button type="button" class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();">
                            <span class="pe-7s-add-user"></span>
                            Novo Pedido
                        </button>
						<hr>
					</div>
					<div class="content">
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
                                        Identidade
                                    </th>
                                    <th>
                                        Data de Nascimento
                                    </th>
                                    <th>
										Validade
									</th>
                                    <th>
                                        Status
                                    </th>
									<th width="160px" class="text-center">
										Ações
									</th>
								</tr>
							</thead>
							<tbody class="tbody">

							</tbody>
						</table>
                        <div id="app2"></div>
					</div>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
                                        <i class="pe-7s-close"></i>
                                    </button>
									<h4 class="modal-title text-center text-uppercase" id="myModalLabel">Cadastro</h4>
								</div>
								<div class="modal-body">
									<form enctype="multipart/form-data">
                                        <!--
										<div class="form-group">
											<label for="EmployeeId">ID</label>
											<input type="text" class="form-control" id="Id" placeholder="Id" disabled="disabled"/>
										</div>
                                        -->
										<div class="form-group">
											<label for="Nome">Nome</label>
											<input type="text" class="form-control" id="Nome" placeholder="Nome"/>
										</div>
										<div class="form-group">
											<label for="Matricula">Matricula</label>
											<input type="text" class="form-control" id="Matricula" placeholder="Matricula" />
										</div>
                                        <div class="form-group">
                                            <label for="Identidade">Identidade</label>
                                            <input type="text" class="form-control" id="Identidade" placeholder="Identidade"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="Expeditor">Orgão Expeditor</label>
                                            <input type="text" class="form-control" id="Expeditor" placeholder="Expeditor"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="Validade">Validade</label>
                                            <input type="text" class="form-control" id="Validade" placeholder="Validade"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="Foto">Foto</label>
                                            <input type="text" class="form-control" id="Foto" placeholder="Foto"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="DataNascimento">Data de Nascimento</label>
                                            <input type="date" class="form-control" id="DataNascimento" placeholder="DataNascimento"/>
                                        </div>
										<div class="form-group" id="app">
											<label for="Curso">Curso</label>
											<!-- <input type="text" class="form-control" id="Curso" placeholder="Curso"/> -->
                                            <select class="form-control" name="Curso" id="Curso">
                                                <option value="" selected>SELECIONAR CURSO</option>
                                                <option v-for="c in categorias" v-bind:value="c.Nome">{{ c.Nome }}</option>
                                            </select>
										</div>

									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="btnAdd" onclick="return Add();">Adicionar</button>
									<button type="button" class="btn btn-primary" id="btnUpdate" style="display:none;" onclick="Update();">Editar</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
//Load Data in Table when documents is ready
$(document).ready(function () {
    loadData();
});

// load records
var app = new Vue({
el: '#app',
data: {
    categorias: []
},
created() {
    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/cadastrarPedido")
    .then(response => response.json())
    .then(json =>{
        this.categorias = json;
        })
    }
});


//Load Data function
function loadData() {
    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes",
        type: "GET",
        // contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.Id + '</td>';
                html += '<td>' + item.Nome + '</td>';
                html += '<td>' + item.Matricula + '</td>';
                html += '<td>' + item.Curso + '</td>';
                html += '<td>' + item.Identidade + '</td>';
                html += '<td>' + item.DataNascimento + '</td>';
                html += '<td>' + item.ValidadeCracha + '</td>';
                html += '<td>' + item.Status + '</td>';

                html += '<td class="text-center text-uppercase"><a href="#" onclick="return getbyID(' + item.Id + ')" class="btn btn-info btn-xs">Editar</a>  <a href="#" onclick="Delele(' + item.Id + ')" class="btn btn-warning btn-xs">Remover</a></d>';
                html += '</tr>';
                console.log(item.ValidadeCracha);
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Ocorreu um erro" + errormessage.responseText);
        }
    });
}

//Add Data Function
function Add() {
    // var res = validate();
    // if (res == false) {
    //     return false;
    // }
    var pedido = {
		Nome: $("#Nome").val(),
		Matricula: $("#Matricula").val(),
		Identidade: $("#Identidade").val(),
		Expeditor: $("#Expeditor").val(),
		DataNascimento: $("#DataNascimento").val(),
		ValidadeCracha: $("#ValidadeCracha").val(),
		Foto: $("#Foto").val(),
		Curso: $("#Curso").val(),
		Status: $("#Status").val()
    };
    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/cadastrarPedido",
        data: JSON.stringify(pedido),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            alert("Dados inseridos com sucesso!");
        },
        error: function (errormessage) {
            alert("Ocorreu um erro: " + errormessage.responseText);
        }
    });
}

//Function for getting the Data Based upon Employee ID
function getbyID(EmpID) {

    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/EditarPedido/" + EmpID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#Nome').val(result.Nome);
            $('#Matricula').val(result.Matricula);
            $('#Curso').val(result.Curso);
            $('#Identidade').val(result.Identidade);
            $('#Expeditor').val(result.Expeditor);
            $('#DataNascimento').val(result.DataNascimento);
            $('#ValidadeCracha').val(result.ValidadeCracha);
            $('#Foto').val(result.Foto);
            $('#Status').val(result.Status);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert("Ocorreu um erro" + errormessage.responseText);
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
        Identidade: $('#Identidade').val(),
        DataNascimento: $('#DataNascimento').val(),
        ValidadeCracha: $('#ValidadeCracha').val(),
        Foto: $('#Foto').val(),
        Status: $('#Status').val(),
    };
    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/EditarPedido/",
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
            $('#Identidade').val("");
            $('#DataNascimento').val("");
            $('#ValidadeCracha').val("");
            $('#Foto').val("");
            $('#Status').val("");
        },
        error: function (errormessage) {
            alert("Ocorreu um erro" + errormessage.responseText);
        }
    });
}

//function for deleting employee's record
function Delele(ID) {
    var ans = confirm("Tem certeza que deseja deletar esse registro?");
    if (ans) {
        $.ajax({
            url: "http://medicinapetropolis.com.br/ApiSisCracha/api/Excluir/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert("Ocorreu um erro" + errormessage.responseText);
            }
        });
    }
}

//Function for clearing the textboxes
function clearTextBox() {
    $('#Id').val("");
    $('#Nome').val("");
    $('#Matricula').val("");
    $('#Identidade').val("");
    $('#Expeditor').val("");
    $('#Curso').val("");
    $('#DataNascimento').val("");
    $('#ValidadeCracha').val("");
    $('#Foto').val("");
    $('#Status').val("");

    $('#btnUpdate').hide();
    $('#btnAdd').show();
    // $('#Nome').css('border-color', 'lightgrey');
    // $('#Matricula').css('border-color', 'lightgrey');
    // $('#Curso').css('border-color', 'lightgrey');
    // $('#Country').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validate() {
    // var isValid = true;
    var isValid = true;
    // if ($('#Nome').val().trim() == "") {
    //     $('#Nome').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Nome').css('border-color', 'lightgrey');
    // }
    // if ($('#Matricula').val().trim() == "") {
    //     $('#Matricula').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Matricula').css('border-color', 'lightgrey');
    // }
    // if ($('#Curso').val().trim() == "") {
    //     $('#Curso').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Curso').css('border-color', 'lightgrey');
    // }
    // if ($('#Identidade').val().trim() == "") {
    //     $('#Identidade').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Identidade').css('border-color', 'lightgrey');
    // }
    // if ($('#DataNascimento').val().trim() == "") {
    //     $('#DataNascimento').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#DataNascimento').css('border-color', 'lightgrey');
    // }
    // if ($('#Validade').val().trim() == "") {
    //     $('#Validade').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Validade').css('border-color', 'lightgrey');
    // }
    // if ($('#Foto').val().trim() == "") {
    //     $('#Foto').css('border-color', 'Red');
    //     isValid = false;
    // }
    // else {
    //     $('#Foto').css('border-color', 'lightgrey');
    // }
    // return isValid;
}
</script>

<!-- #include file="footer.asp" -->
