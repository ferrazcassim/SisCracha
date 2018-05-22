<!-- #include file="top.asp" -->

<!-- styles for the cropbox -->
<style media="screen">
.imageBox
{
	margin-top: -10px;
    position: relative;
    height:350px;
    width:350px;
    border:1px solid #aaa;
    background: #fff;
    overflow: hidden;
    background-repeat: no-repeat;
    cursor:move;
}

.imageBox .thumbBox
{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 200px;
    height: 200px;
    margin-top: -100px;
    margin-left: -100px;
    box-sizing: border-box;
    border: 1px solid rgb(102, 102, 102);
    box-shadow: 0 0 0 1000px rgba(0, 0, 0, 0.5);
    background: none repeat scroll 0% 0% transparent;
}

.imageBox .spinner
{
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
    line-height: 400px;
    background: rgba(0,0,0,0.7);
}
</style>
<!-- end of styles for the cropbox -->

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="spacer-min"></div>
            <div class="card">
                <div class="header">
                    <h4 class="text-uppercase">lista de pedidos <small>(recursos humanos)</small></h4>
                    <p class="text-right">
                    </p>
					<hr>
                </div>
                <div class="content">
					<form  action="#" method="post"  id="formCadastro" enctype="multipart/form-data">
		                    <div class="row">
		                        <div class="col-md-4">
		                            <p>
		                                <input type="text" name="NumeroPonto" id="NumeroPonto" class="form-control" placeholder="Número de Ponto" value="" maxlength="7">
		                            </p>
		                            <p>
		                                <input type="text" name="NomeCompleto" id="NomeCompleto" class="form-control" placeholder="Nome Completo" value="">
		                            </p>
		                            <p>
		                                <input type="text" name="Apelido" id="Apelido" class="form-control" placeholder="Apelido" value="">
		                            </p>
		                            <p id="app2" >
		                                <select name="Setor" class="form-control text-uppercase" id="Setor">
		                                    <option value="">Selecione o Setor</option>
		                                    <option v-for="d in dados" v-bind:value="d.Nome" >{{ d.Nome }}</option>
		                                </select>
		                            </p>
		                            <p>
		                                <select name="Tipo" id="Tipo" class="form-control text-uppercase">
		                                    <option value="">SELECIONE O TIPO</option>
		                                    <option value="Adminstrativo">Adminstrativo</option>
		                                    <option value="Professor">Professor</option>
		                                </select>
		                            </p>
		                        </div>
		                        <div class="col-md-4">
									<!-- <label for="Foto">Foto:</label> -->
									<!-- <input type="file" class="form-control" placeholder="Foto" onchange="encodeImagetoBase64(this)"/>
									<input type="hidden" name="Foto" class="link" value="" id="Foto">
									<input id="sample_input" type="hidden" name="test[image]"> -->
									<div class="imageBox">
										<div class="thumbBox"></div>
										<div class="spinner" style="display: none">
											<h4 style="color: #fff;">Foto</h4>
										</div>
									</div>
									<div class="spacer-min"></div>
									<div class="action">
										<input type="file" id="file" style="float:left; width: 230px">
										<input type="button" id="btnCrop" value="Recortar" style="float: right">
										<input type="button" id="btnZoomIn" value="+" style="float: right">
										<input type="button" id="btnZoomOut" value="-" style="float: right">
									</div>
		                        <p>
								</div>
								<div class="col-md-4">
									<div class="cropped" id="Foto"></div>
								</p>
								<div class="spacer-medio"></div>
								<p class="text-right">
									<input type="submit" value="Cadastrar" class="btn btn-info text-uppercase btn-send">
								</p>
								</div>
		                    </div>
		                <hr>
		            </form>
				</div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
// load base64 on image
function encodeImagetoBase64(element) {

	var file = element.files[0];
	var reader = new FileReader();
	reader.onloadend = function() {

        foto = reader.result;
        fotofinal = foto.replace('data:image/jpeg;base64,','');
		console.log(fotofinal);
        $(".link").attr("value",fotofinal);
        $(".link").text(reader.result);
        $(".valor").text(reader.result);
	}

	reader.readAsDataURL(file);
}

// loading setores data
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
        	// console.log("Dados= " + this.dados);
        })
    }
});

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
                // html += '<td>' + item.Apelido  + '</td>';
                html += '<td class="text-uppercase text-center">' + item.Setor + '</td>';
                html += '<td>' + item.NumeroPonto  + '</td>';
                html += '<td class="status-warning" style="text-transform: uppercase;">' + item.Status + '</td>';
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

// cadastrar pedido rh
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

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
    });
});


// Edit pedido
function getbyID(ID) {

    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/EditarPedido/" + ID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#Id').val(result.Id);
            $('#NomeCompleto').val(result.NomeCompleto);
            $('#NumeroPonto').val(result.NumeroPonto);
            $('#Setor').val(result.Setor);
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

// Deletando um pedido
function Delele(ID) {
    var ans = confirm("Tem certeza que deseja deletar esse registro?");
    if (ans) {
        $.ajax({
            url: "http://medicinapetropolis.com.br/ApiSisCracha/api/ExcluirRH/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
                // alert("Pedido removido com sucesso!");
            },
            error: function (errormessage) {
                alert("Ocorreu um erro" + errormessage.responseText);
            }
        });
    }
}

function alerta(){
    demo.initChartist();

    $.notify({
        message: "<h6>Pacote gerado com sucesso!</h6>"

    },
	{
        type: 'success',
        timer: 3000
    });
}

</script>


<!-- #include file="footer.asp" -->
