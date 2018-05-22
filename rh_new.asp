<!-- #include file="top.asp" -->

<div class="spacer-medio"></div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="fbdata"></div>
			<div class="main-content">
				<div class="card">
					<div class="header">
					<h3>Lista de Cadastros <small>(Recursos Humanos)</small></h3>
					<p class="text-right">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();">Adicionar Cadastro</button><br /><br />
	+				</p>
					<hr>
					</div>
					<div class="content">
						<div id="response"></div>
						<table class="table table-bordered">
							<thead>
								<th>Id</th>
								<th>Nome</th>
								<th>Númeo de Ponto</th>
								<th>Apelido</th>
								<th>Setor </th>
								<th>Status </th>
								<th>Tipo</th>
								<th>Ações</th>
							</thead>
							<tbody class="tbody"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->

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
                        <label for="NomeCompleto">Nome</label>
                        <input type="text" class="form-control" id="NomeCompleto" placeholder="NomeCompleto"/>
                    </div>
                    <div class="form-group">
                        <label for="NumeroPonto">Numero de Ponto</label>
                        <input type="text" class="form-control" id="NumeroPonto" placeholder="NumeroPonto" />
                    </div>
                    <div class="form-group">
                        <label for="Apelido">Apelido</label>
                        <input type="text" class="form-control" id="Apelido" placeholder="Apelido"/>
                    </div>
					<div class="form-group" id="app2" >
						<label for="Setor">Setor</label>
						<select name="Setor" class="form-control text-uppercase" id="Setor">
							<option value="">Selecione o Setor</option>
							<option v-for="d in dados" v-bind:value="d.Nome" >{{ d.Nome }}</option>
						</select>
					</div>
                    <div class="form-group">
                        <label for="Tipo">Tipo</label>
                        <!-- <input type="text" class="form-control" id="Tipo" placeholder="Tipo"/> -->
						<select class="form-control text-uppercase" name="Tipo">
							<option value="">Selcione uma opção</option>
							<option value="Adminstrativo">Adminstrativo</option>
							<option value="Professor">Professor</option>
						</select>
                    </div>
                    <div class="form-group">
                    	<label for="Foto">Foto</label>
                    	<input type="file" class="form-control" id="Foto" placeholder="Foto"/>
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
// Load data from setores to use on new cadastro form
var app2 = new Vue({
el: '#app2',
data: {
    dados: []
},
created() {
    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/CadastrarPedidos/getSetores")
    .then(response => response.json())
    .then(json =>{
        	this.dados = json;
        })
    }
});


//Load Data in Table when documents is ready
$(document).ready(function () {
    loadData();
});

var path = "http://medicinapetropolis.com.br/ApiSisCracha"

function loadData() {
    $.ajax({
        url: path + "/api/ListarPedidosRH/Pendentes",
        type: "GET",
        // contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.Id + '</td>';
                html += '<td>' + item.NomeCompleto  + '</td>';
                html += '<td>' + item.NumeroPonto  + '</td>';
                html += '<td>' + item.Apelido + '</td>';
                html += '<td class="text-uppercase text-center">' + item.Setor + '</td>';
                html += '<td class="status-warning">' + item.Status + '</td>';
                html += '<td>' + item.Tipo + '</td>';

                html += '<td class="text-center text-uppercase"><a href="#" onclick="return getbyID(' + item.Id + ')" class="btn btn-info btn-xs">Editar</a>  <a href="#" onclick="Delele(' + item.Id + ')" class="btn btn-warning btn-xs">Remover</a></d>';
                html += '</tr>';
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


    var apiurl = "http://www.medicinapetropolis.com.br/apiSisCracha/api/CadastrarPedidos/rh";

    var data =
    {
        NumeroPonto: $("#NumeroPonto").val().trim(),
        NomeCompleto: $("#NomeCompleto").val().trim(),
        Apelido: $("#Apelido").val().trim(),
        Setor: $("#Setor").val().trim(),
        Tipo: $("#Tipo").val().trim(),
		Foto: $("#Foto").val().trim(),
    }

    $.ajax({
        url: apiurl,
        type: 'POST',
        dataType: 'json',
        data: data,
        success: function(d) {
            console.log(data);
            $("#response").html("<div class='alert alert-success text-center text-uppercase'>Cadastro realizado com sucesso!</div>");
            document.getElementById("formCadastro").reset();
            location.reload(true);
        },
        error: function() {
            console.log(data);
            $("#response").html("<div class='alert alert-danger text-center text-uppercase'>Erro ao salvar os dados!</div>");
            document.getElementById("formCadastro").reset();
        }
    });
}


//Function for getting the Data Based upon Employee ID
function getbyID(Id) {

    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/EditarPedido/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#Id').val(result.Id);
            $('#NomeCompleto').val(result.NomeCompleto);
            $('#NumeroPonto').val(result.NumeroPonto);
            $('#Apelido').val(result.Apelido);
            $('#Setor').val(result.Setor);

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


//Function for clearing the textboxes
function clearTextBox() {
    $('#Id').val("");
    $('#NomeCompleto').val("");
    $('#NumeroPonto').val("");
    $('#Apelido').val("");
    $('#Setor').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
}

//function for deleting records
function Delele(ID) {
    var ans = confirm("Tem certeza de que quer deletar este registro?");
    if (ans) {
        $.ajax({
            url: path + "/api/ExcluirRH/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
                $("#response").html("<div class='alert alert-success text-center text-uppercase'>Cadastro removido com sucesso! <button type='button' class='close' data-dismiss='alert'>×</button></div>");
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#NomeCompleto').val().trim() == "") {
        $('#NomeCompleto').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#NomeCompleto').css('border-color', 'lightgrey');
    }
    if ($('#NumeroPonto').val().trim() == "") {
        $('#NumeroPonto').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#NumeroPonto').css('border-color', 'lightgrey');
    }
    if ($('#Apelido').val().trim() == "") {
        $('#Apelido').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Apelido').css('border-color', 'lightgrey');
    }
    if ($('#Setor').val().trim() == "") {
        $('#Setor').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Setor').css('border-color', 'lightgrey');
    }
    if ($('#Foto').val().trim() == "") {
        $('#Foto').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Foto').css('border-color', 'lightgrey');
    }
    return isValid;
}

</script>

<!-- #include file="footer.asp" -->
